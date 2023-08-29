/*
This query generates a table that mirrors the Subscriber Retention chart. It
uses three intermediate tables:

  1. subs - a table grouped by first subscription purchase date
  2. retention - a table that counts the number of active subscriptions in each 
     date cohort
  3. pending_retention - a table that counts the number of subscriptions that 
     are expected to renew

The three tables are combined in full_table to show a table that looks like
this:

+-------------------------+---------------+-------------+---------+
| date                    | period_number | period_name | actives |
+-------------------------+---------------+-------------+---------+
| 2023-01-01 00:00:00.000 | 1             | Month 1     | 500     |
+-------------------------+---------------+-------------+---------+
| 2023-01-01 00:00:00.000 | 2             | Month 2     | 600     |
+-------------------------+---------------+-------------+---------+
| 2023-01-01 00:00:00.000 | 3             | Month 3     | 550     |
+-------------------------+---------------+-------------+---------+
| 2023-02-01 00:00:00.000 | 1             | Month 1     | 400     |
+-------------------------+---------------+-------------+---------+
| 2023-02-01 00:00:00.000 | 2             | Month 2     | 300     |
+-------------------------+---------------+-------------+---------+

In the query you will see place holders that look like this:

  start_time >= /* desired date range */

Fill in each placeholder by following the instructions in each one.

*/
  
WITH 
  -- subs is an intermediate table that maps subscribers to their earliest 
  -- subscription start date. The first subscription start date will be used to 
  -- group billing cycles by cohort.
  subs AS (
    SELECT
      -- app user ID will be used to group billing cycles by user
      ETL.app_user_id AS id,
      -- first purchase date will be used to group billing cycles by cohort.
      DATE(MIN(start_time)) AS first_start_time
    FROM ETL
    WHERE start_time >= /* desired date range */
      -- count subscriptions only
      AND end_time IS NOT NULL
      -- remove any sandbox transactions
      AND is_sandbox <> 'true'
      -- remove any trial billing cycles
      AND is_trial_period = 'false'
      -- remove any intro offer billing cycles
      AND is_in_intro_offer_period = 'false'
      -- remove any subscriptions that were acquired through Family Sharing
      AND (ownership_type IS NULL OR ownership_type != 'FAMILY_SHARED')
      AND product_identifier = /* targeted product(s) */
    GROUP BY ETL.app_user_id
  ),
  
  -- retention is an intermediate table that counts the number of active
  -- subscriptions in each cohort and billing cycle.
  retention AS (
    SELECT
      -- cohorting subscriptions by their first start dates
      subs.first_start_time,
      -- every billing cycle is labeled by its number. 30 is used here to filter
      -- for monthly subscriptions. Change this to filter for different product
      -- durations, e.g. 365 for yearly. So if a user subscribes in January,
      -- unsubscribes so that they don't have an active subscription in
      -- February, and resubscribes in March, they would be in the January
      -- cohort and counted as retained for Month 2 (skipping February, which is
      -- Month 1).
      CAST(ROUND(DATEDIFF(day, subs.first_start_time, start_time) / CAST(30 AS NUMERIC)) AS INTEGER) AS period_number,
      -- count the number of active subscriptions in each cohort and billing
      -- cycle
      count(1) AS actives
    FROM ETL
    INNER JOIN subs ON subs.id = ETL.app_user_id
    WHERE start_time >= /* desired date range */
      -- count subscriptions only
      AND end_time IS NOT NULL
      -- remove any sandbox transactions
      AND is_sandbox <> 'true'
      -- remove any trial billing cycles
      AND is_trial_period = 'false'
      -- remove any intro offer billing cycles
      AND is_in_intro_offer_period = 'false'
      -- remove any subscriptions that were acquired through Family Sharing
      AND (ownership_type IS NULL OR ownership_type != 'FAMILY_SHARED')
    AND product_identifier = /* targeted product(s) */
    GROUP BY 1, 2
  ),
  
  -- pending_retention is an intermediate table that is identical to retention,
  -- with the exception that it counts subscriptions that are expected to renew
  -- in the future. Pending retention can change over time as users change their
  -- auto-renewal status. It can be interpreted as a measure of future
  -- retention.
  pending_retention AS (
    SELECT
      subs.first_start_time,
      -- This billing cycle calculation is similar to the one made in the
      -- retention table, with the only difference being it calculates the next
      -- billing cycle in the future.
      CAST(ROUND(DATEDIFF(day, subs.first_start_time, start_time) / CAST(30 AS NUMERIC)) AS INTEGER) + 1 AS period_number,
      count(1) AS actives
    FROM ETL
    INNER JOIN subs ON subs.id = ETL.app_user_id
    WHERE
      -- count only subscriptions that are expected to renew
      is_auto_renewing = 'true'
      -- count only the latest billing cycle of a subscription
      AND DATEADD(month, 1, start_time) > GETDATE()
      AND start_time >= /* desired date range */
      AND end_time IS NOT NULL
      AND is_sandbox <> 'true'
      AND is_trial_period = 'false'
      AND is_in_intro_offer_period = 'false'
      AND (ownership_type IS NULL OR ownership_type != 'FAMILY_SHARED')
    AND product_identifier = /* targeted product(s) */
    GROUP BY 1, 2
  ),
  
  -- full_table combines retention and pending_retention into the final
  -- subscriber retention table. If you're not interested in pending
  -- subscriptions, you can remove pending_retention from this below query. For
  -- example:
  --   COALESCE(retention.first_start_time, pending_retention.first_start_time) AS first_start_time,
  -- should be changed into:
  --   retention.first_start_time AS first_start_time,
  -- if pending retention is not needed.
  full_table AS (
    SELECT
      COALESCE(retention.first_start_time, pending_retention.first_start_time) AS first_start_time,
      COALESCE(retention.period_number, pending_retention.period_number) AS period_number,
      COALESCE(retention.actives, 0) + COALESCE(pending_retention.actives, 0) AS actives
    FROM retention
    FULL OUTER JOIN pending_retention ON
      pending_retention.first_start_time = retention.first_start_time AND
      pending_retention.period_number = retention.period_number
  )
  
  -- the final subscription retention table
  SELECT
    first_start_time as date,
    period_number,
    CONCAT('Month ', period_number) AS period_name,
    actives
  FROM full_table
  ORDER BY date, period_number
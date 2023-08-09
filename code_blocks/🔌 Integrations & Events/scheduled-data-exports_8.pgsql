-- Subscriber Retention
/*
This query generates a table using three sub-tables:
  1. subs - a table grouped by first subscription purchase date
  2. retention - a table that counts the number of active subscriptions in each 
     date cohort
  3. pending_retention - a table that counts the number of subscriptions that 
     are expected to renew
The three tables are combined in full_table.
*/
  
WITH 
  -- subs is an intermediate table that maps subscribers to their earliest 
  -- subscription start date. The first subscription start date will be used to 
  -- group billing cycles by cohort
  subs AS (
    SELECT
      -- app user ID will be used to group billing cycles by user
      ETL.app_user_id AS id,
      -- first purchase date will be used to group billing cycles by cohort.
      DATE(MIN(start_time)) AS first_start_time
    FROM ETL
    WHERE start_time >= /* desired date range */
      AND end_time IS NOT NULL  -- count subscriptions only
      AND is_sandbox <> 'true'  -- remove any sandbox transactions
      AND is_trial_period = 'false' -- remove any trial billing cycles
      AND is_in_intro_offer_period = 'false' -- remove any intro offer billing cycles
      AND (ownership_type IS NULL OR ownership_type != 'FAMILY_SHARED') -- remove any subscriptions that were acquired through Family Sharing
      AND product_identifier = /* targeted product(s) */
    GROUP BY ETL.app_user_id
  ),
  
  -- retention is an intermediate table that counts the number of active subscriptions in each cohort and billing cycle
  retention AS (
    SELECT
      subs.first_start_time, -- cohorting subscriptions by their first start dates
      CAST(ROUND(DATEDIFF(day, subs.first_start_time, start_time) / CAST(30 AS NUMERIC)) AS INTEGER) AS period_number,  -- every billing cycle is labeled by its number. 30 is used here to filter for monthly subscriptions. Change this to filter for different product durations, e.g. 365 for yearly. So if a user subscribes in January, unsubscribes so that they don't have an active subscription in February, and resubscribes in March, they would be in the January cohort and counted as retained for Month 2 (skipping February, which is Month 1).
      count(1) AS actives -- count the number of active subscriptions in each cohort and billing cycle
    FROM ETL
    INNER JOIN subs ON subs.id = ETL.app_user_id
    WHERE start_time >= /* desired date range */
      AND end_time IS NOT NULL -- count subscriptions only
      AND is_sandbox <> 'true' -- remove any sandbox transactions
      AND is_trial_period = 'false' -- remove any trial billing cycles
      AND is_in_intro_offer_period = 'false' -- remove any intro offer billing cycles
      AND (ownership_type IS NULL OR ownership_type != 'FAMILY_SHARED') -- remove any subscriptions that were acquired through Family Sharing
    AND product_identifier = /* targeted product(s) */
    GROUP BY 1, 2
  ),
  
  -- pending_retention is an intermediate table that is identical to retention, with the exception that it counts subscriptions that are expected to renew in the future. Pending retention can change over time as users change their auto-renewal status. It can be interpreted as a measure of future retention.
  pending_retention AS (
    SELECT
      subs.first_start_time,
      CAST(ROUND(DATEDIFF(day, subs.first_start_time, start_time) / CAST(30 AS NUMERIC)) AS INTEGER) + 1 AS period_number,
      count(1) AS actives
    FROM ETL
    INNER JOIN subs ON subs.id = ETL.app_user_id
    WHERE
      is_auto_renewing = 'true'
      AND DATEADD(month, 1, start_time) > GETDATE() -- count only the latest billing cycle of a subscription
      AND start_time >= /* desired date range */
      AND end_time IS NOT NULL
      AND is_sandbox <> 'true'
      AND is_trial_period = 'false'
      AND is_in_intro_offer_period = 'false'
      AND (ownership_type IS NULL OR ownership_type != 'FAMILY_SHARED')
    AND product_identifier = /* targeted product(s) */
    GROUP BY 1, 2
  ),
  
  -- full_table combines retention and pending_retention into a single table
  -- if you're not interested in pending subscriptions, you can remove pending_retention from this below query
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
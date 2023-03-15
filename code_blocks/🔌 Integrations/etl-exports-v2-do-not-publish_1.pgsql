-- Revenue generated on [targeted_date]
SELECT
  SUM(price) as revenue,
  (SUM(price) * (1 - tax_percentage - commission_percentage)) as proceeds
FROM
  [your_table_name]
WHERE date(start_time) = [targeted_date]
  AND is_trial_period = 'false'
  AND purchase_date BETWEEN '2008-07-10' AND [targeted_date]
  AND (end_date IS NULL OR DATE_DIFF('s', start_date, end_date)::float > 0)
  AND (ownership_type IS NULL OR ownership_type != 'FAMILY_SHARED')
  AND store != 'promotional'
  AND is_sandbox <> 'true'

-- Transactions which are refunded can be identified through the refunded_at field.
-- Once refunded, price will be set to $0, so revenue will always be net of refunds.
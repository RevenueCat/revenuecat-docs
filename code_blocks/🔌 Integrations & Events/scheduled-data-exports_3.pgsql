-- Revenue generated on [targeted_date]

SELECT
  SUM(purchase_price_in_usd) as total_revenue,
  SUM(price_in_usd) as total_revenue_net_of_refunds,
  SUM(price_in_usd * (1 - (tax_percentage - commission_percentage))) as proceeds
FROM
  [revenuecat_data_table]
WHERE date(start_time) = [targeted_date]
  AND is_trial_period = 'false'
  AND ownership_type != 'FAMILY_SHARED'
  AND store != 'promotional'
  AND is_sandbox != 'true'

-- Transactions which are refunded can be identified through the refunded_at field.
-- Once refunded, price_in_usd will be set to $0, so revenue will always be net of refunds.

-- What is my Realized LTV per Paying Customer cohorted by Original Purchase Date?
  
WITH first_purchase_dates AS
  (SELECT
    rc_original_app_user_id,
    MIN(start_time) as first_purchase_date
  FROM [revenuecat_data_table] rc
  WHERE is_trial_period = 'false'
    AND was_refunded = 'false'
    AND ownership_type = 'PURCHASED'
    AND is_sandbox <> 'true'
    AND store <> 'promotional'
    AND price > 0
  GROUP BY 1)

SELECT
  DATE(fpd.first_purchase_date) AS date,
  COUNT(DISTINCT rc_original_app_user_id) AS paying_customers,
  SUM(CASE WHEN DATEADD(day, 7, date) > start_time THEN price_in_usd ELSE 0 END)::DECIMAL(18,2) AS total_ltv_7_days,
  SUM(CASE WHEN DATEADD(day, 14, date) > start_time THEN price_in_usd ELSE 0 END)::DECIMAL(18,2) AS total_ltv_14_days,
  SUM(CASE WHEN DATEADD(day, 30, date) > start_time THEN price_in_usd ELSE 0 END)::DECIMAL(18,2) AS total_ltv_30_days,
  SUM(CASE WHEN DATEADD(month, 3, date) > start_time THEN price_in_usd ELSE 0 END)::DECIMAL(18,2) AS total_ltv_3_months,
  SUM(CASE WHEN DATEADD(month, 6, date) > start_time THEN price_in_usd ELSE 0 END)::DECIMAL(18,2) AS total_ltv_6_months,
  SUM(CASE WHEN DATEADD(month, 12, date) > start_time THEN price_in_usd ELSE 0 END)::DECIMAL(18,2) AS total_ltv_12_months,
  SUM(CASE WHEN DATEADD(month, 18, date) > start_time THEN price_in_usd ELSE 0 END)::DECIMAL(18,2) AS total_ltv_18_months,
  SUM(CASE WHEN DATEADD(month, 24, date) > start_time THEN price_in_usd ELSE 0 END)::DECIMAL(18,2) AS total_ltv_24_months,
  SUM(price_in_usd) AS ltv_unbounded,
  (total_ltv_7_days / paying_customers)::DECIMAL(18,2) AS avg_ltv_7_days,
  (total_ltv_30_days / paying_customers)::DECIMAL(18,2) AS avg_ltv_30_days,
  (total_ltv_6_months / paying_customers)::DECIMAL(18,2) AS avg_ltv_6_months,
  (total_ltv_12_months / paying_customers)::DECIMAL(18,2) AS avg_ltv_12_months,
  (total_ltv_24_months / paying_customers)::DECIMAL(18,2) AS avg_ltv_24_months
  
FROM [revenuecat_data_table] rc

LEFT JOIN first_purchase_dates fpd ON fpd.rc_original_app_user_id = rc.rc_original_app_user_id

WHERE is_trial_period = 'false'
  AND was_refunded = 'false'
  AND ownership_type = 'PURCHASED'
  AND is_sandbox <> 'true'
  AND store <> 'promotional'
  AND price > 0

GROUP BY 1

-- How many Active Subscriptions do I have with a given custom attribute value?
  
SELECT
  you.custom_attribute_key, COUNT(*)
FROM
  [revenuecat_data_table] rc
  
LEFT JOIN [your_data_table] you 
    ON you.rc_original_app_user_id = rc.rc_original_app_user_id
  
WHERE date(rc.effective_end_time) > [targeted_date]
  AND date(rc.start_time) <= [targeted_date]
  AND rc.is_trial_period = 'false'
  AND (rc.effective_end_time IS NULL OR DATE_DIFF('s', rc.start_time, rc.effective_end_time)::float > 0)
  AND rc.ownership_type != 'FAMILY_SHARED'
  AND rc.store != 'promotional'
  AND rc.is_sandbox <> 'true'
  GROUP BY you.custom_attribute_key
---
title: Scheduled Data Exports
slug: scheduled-data-exports
excerpt: Data deliveries of all of your apps' transaction data (formerly ETL Exports)
hidden: false
createdAt: '2023-03-14T15:53:17.647Z'
updatedAt: '2023-03-20T16:19:22.595Z'
category: 646582c240e8b0000a4f35e6
---
[block:callout]
{
  "type": "success",
  "body": "The Scheduled Data Export integration is available on the [Pro](https://www.revenuecat.com/pricing) plan."
}
[/block]
RevenueCat can automatically send data deliveries of all of your apps' transaction data to various cloud storage providers. These are in the form of [gzip compressed](https://en.wikipedia.org/wiki/Gzip) .csv files delivered daily.

# Setup Instructions

* [Amazon S3 Setup :fa-arrow-right:](doc:scheduled-data-exports-s3)
* [Google Cloud Storage Setup :fa-arrow-right:](doc:scheduled-data-exports-gcp)

# Transaction Format
[block:callout]
{
  "type": "info",
  "body": "All dates and times are in UTC."
}
[/block]

[block:parameters]
{
  "data": {
    "h-0": "Header",
    "h-1": "Can be null",
    "h-2": "Comments",
    "0-0": "`rc_original_app_user_id`",
    "1-0": "`rc_last_seen_app_user_id_alias`",
    "3-0": "`product_identifier`",
    "4-0": "`start_time`",
    "5-0": "`end_time`",
    "8-0": "`store`",
    "9-0": "`is_auto_renewable`",
    "10-0": "`is_trial_period`",
    "11-0": "`is_in_intro_offer_period`",
    "12-0": "`is_sandbox`",
    "13-0": "`price_in_usd`",
    "14-0": "`takehome_percentage`",
    "17-0": "`store_transaction_id`",
    "18-0": "`original_store_transaction_id`",
    "19-0": "`refunded_at`",
    "20-0": "`unsubscribe_detected_at`",
    "21-0": "`billing_issues_detected_at`",
    "22-0": "`purchased_currency`",
    "23-0": "`price_in_purchased_currency`",
    "24-0": "`entitlement_identifiers`",
    "25-0": "`renewal_number`",
    "26-0": "`is_trial_conversion`",
    "24-1": "✅",
    "23-1": "✅",
    "22-1": "✅",
    "21-1": "✅",
    "20-1": "✅",
    "19-1": "✅",
    "13-1": "✅",
    "5-1": "✅",
    "0-2": "Can be used as a unique user identifier to find all of a user's transactions.",
    "1-2": "Can be used together with `rc_original_app_user_id` to match transactions with user identifiers in your systems.",
    "3-2": "The product identifier that was purchased.",
    "4-2": "Purchase time of transaction.",
    "5-2": "Expected expiration time of subscription. Null when `is_auto_renewable = false`\nFor Google Play, `end_time` can be before `start_time` to indicate an invalid transaction (e.g. billing issue).",
    "8-2": "The source of the transaction. Can be `app_store`, `play_store`, `stripe`, or [`promotional`](doc:promotionals).",
    "9-2": "`true` for auto-renewable subscriptions, `false` otherwise.",
    "10-2": "`true` if the transaction was a trial.",
    "11-2": "`true` if the transaction is in an introductory offer period.",
    "12-2": "`true` for transactions made in a [sandbox environment](doc:sandbox).",
    "13-2": "The gross revenue generated from the transaction. All prices are converted to USD. Can be null if product prices haven't been collected from the user's device.",
    "14-2": "DEPRECATED: The estimated percentage of the transaction price that will be paid out to developers after commissions, but before VAT and DST taxes are taken into account. (will be either 0.7 or 0.85)\n\nWe recommend using `tax_percentage` and `commission_percentage` to calculate proceeds instead. [Learn more here](https://www.revenuecat.com/docs/taxes-and-commissions).",
    "17-2": "orderId or transaction_identifier. **​Can be used as unique id**.",
    "18-2": "orderId of first purchase or `original_transaction_id`. Can be used to find all related transactions for a single subscription.",
    "19-2": "When a refund was detected, `null` if none was detected. Can be checked for existence to indicate transactions which have been refunded.",
    "20-2": "When we detected an unsubscribe (opt-out of auto renew).",
    "21-2": "When we detected billing issues, `null` if none was detected.",
    "22-2": "The currency that was used for the transaction.",
    "23-2": "The product's price in the currency that was used for the transaction.",
    "24-2": "An array of entitlements that the transaction unlocked or `null` if it didn't unlock any entitlements.",
    "25-2": "Always starts at 1. Trial conversions are counted as renewals. `is_trial_conversion` is used to signify whether a transaction was a trial conversion.",
    "26-2": "If `true`, this transaction is a trial conversion.",
    "2-0": "`country`",
    "2-2": "Last seen country of the subscriber.",
    "27-0": "`presented_offering`",
    "27-2": "The offering presented to users. Can be used to filter [Experiment](doc:experiments-overview) transactions.",
    "29-0": "`reserved_subscriber_attributes`",
    "31-0": "`platform`",
    "31-2": "Last seen platform of the subscriber.",
    "29-1": "✅",
    "27-1": "✅",
    "30-0": "`custom_subscriber_attributes`",
    "2-1": "✅",
    "30-1": "✅",
    "31-1": "✅",
    "29-2": "The [reserved subscriber attributes](doc:subscriber-attributes#reserved-attributes) set for the subscriber. Keys begin with `$`.",
    "30-2": "The custom attributes set for the subscriber.",
    "6-0": "`grace_period_end_time`*",
    "6-1": "✅",
    "6-2": "Expiration time of a grace period (if applicable) for a subscription. Will remain set while a subscription is in its grace period, or if it exited its grace period without renewing. Null when a subscription is not in a grace period or expiration was not due to a grace period.",
    "7-0": "`effective_end_time`*",
    "7-1": "✅",
    "7-2": "Single reference point of a subscriber’s expiration and entitlement revocation; inclusive of each store’s logic for cancellations, grace periods, etc.",
    "15-0": "`tax_percentage`*",
    "15-2": "The portion of a transaction’s price that will be deducted by the store for taxes. VAT & Digital Services Taxes may be withheld by stores depending on the store and country. To learn more about how RevenueCat estimates taxes, [click here](https://www.revenuecat.com/docs/taxes-and-commissions).",
    "16-0": "`commission_percentage`*",
    "16-2": "The portion of a transaction’s price that will be detected by the store for commission. In stores where taxes are deducted before commission, this value will not equal the published commission from a store, because that commission is calculated on the post-tax revenue.",
    "28-0": "`ownership_type`*",
    "28-1": "✅",
    "28-2": "Will be `PURCHASED` when a recorded transaction results from the subscriber’s direct purchase of it, or `FAMILY_SHARED` when a recorded transaction results from the subscriber having received it through Family Sharing.\n\nNOTE: The `FAMILY_SHARED` designation is only supported on App Store transactions."
  },
  "cols": 3,
  "rows": 32
}
[/block]
*Available only on our most recent export version
[block:callout]
{
  "type": "info",
  "title": "Re-enable integration to update to latest version",
  "body": "If your exports don't contain all of the columns above, you may be on an older export version. To update to the latest version just delete, and re-add the integration from the RevenueCat dashboard."
}
[/block]
## A note on transaction data
All transaction data is based on the store receipts that RevenueCat has received. Receipts often have inconsistencies and quirks which may need to be considered. For example:
- The expiration date of a purchase can be before the purchase date. This is Google's way of invalidating a transaction, for example when Google is unable to bill a user some time after a subscription renews. This doesn’t occur on iOS.
- If you migrated to RevenueCat, Google subscriptions that were expired for more then 60 days before being migrated will not have transaction histories in export files.
- Apple and Google do not provide the transaction price directly, so we must rely on historical data for the products that we have. This isn’t 100% accurate in cases where the prices were changed or receipts were imported.
- Renewal numbers start at 1, even for trials. Trial conversions increase the renewal number.
- Data is pulled from a snapshot of the current receipt state, this means that the same transaction can be different from one delivery to another if something changed, e.g.refunds, and billing issues. You should recompute metrics for past time periods periodically to take these changes into account.

We try to normalize or at least annotate these quirks as much as possible, but by and large we consider receipts as the sources of truth, so any inconsistencies in the transaction data can always be traced back to the receipt

# Sample queries for RevenueCat measures

You can use the following sample queries (written in Postgresql) as starting points for reproducing common RevenueCat measures.
[block:code]
{
  "codes": [
    {
      "code": "-- Active Trials as of your [targeted_date]\n\nSELECT\n  COUNT(*)\nFROM\n  [revenuecat_data_table]\nWHERE date(effective_end_time) > [targeted_date]\n  AND date(start_time) <= [targeted_date]\n  AND is_trial_period = 'true'\n  AND (effective_end_time IS NULL OR DATE_DIFF('s', start_time, effective_end_time)::float > 0)\n  AND ownership_type != 'FAMILY_SHARED'\n  AND store != 'promotional'\n  AND is_sandbox != 'true'\n\n-- The RevenueCat Active Trials chart excludes\n-- promotional transactions and transactions resulting from family sharing\n-- since they do not reflect auto-renewing future payments.",
      "language": "pgsql",
      "name": "Active Trials"
    },
    {
      "code": "-- Active Subscriptions as of your [targeted_date]\n\nSELECT\n  COUNT(*)\nFROM\n  [revenuecat_data_table]\nWHERE date(effective_end_time) > [targeted_date]\n  AND date(start_time) <= [targeted_date]\n  AND is_trial_period = 'false'\n  AND (effective_end_time IS NULL OR DATE_DIFF('s', start_time, effective_end_time)::float > 0)\n  AND ownership_type != 'FAMILY_SHARED'\n  AND store != 'promotional'\n  AND is_sandbox != 'true'\n\n-- The RevenueCat Active Subscriptions chart excludes trials,\n-- promotional transactions, and transactions resulting from family sharing\n-- since they do not reflect auto-renewing future payments.",
      "language": "pgsql",
      "name": "Active Subscriptions"
    },
    {
      "code": "-- Revenue generated on [targeted_date]\n\nSELECT\n  SUM(price_in_usd) as revenue\nFROM\n  [revenuecat_data_table]\nWHERE date(start_time) = [targeted_date]\n  AND is_trial_period = 'false'\n  AND (effective_end_time IS NULL OR DATE_DIFF('s', start_time, effective_end_time)::float > 0)\n  AND ownership_type != 'FAMILY_SHARED'\n  AND store != 'promotional'\n  AND is_sandbox != 'true'\n\n-- Transactions which are refunded can be identified through the refunded_at field.\n-- Once refunded, price_in_usd will be set to $0, so revenue will always be net of refunds.",
      "language": "pgsql",
      "name": "Revenue"
    }
  ]
}
[/block]
# Sample queries for customized measures

Scheduled Data Exports are a powerful way to add your own customizations on top of the core measures provided by RevenueCat. Check out the following sample queries (written in Postgresql) for some ideas.
[block:code]
{
  "codes": [
    {
      "code": "-- How many Active Subscriptions do I have with a given custom attribute value?\n  \nSELECT\n  you.custom_attribute_key, COUNT(*)\nFROM\n  [revenuecat_data_table] rc\n  \nLEFT JOIN [your_data_table] you \n    ON you.rc_original_app_user_id = rc.rc_original_app_user_id\n  \nWHERE date(rc.effective_end_time) > [targeted_date]\n  AND date(rc.start_time) <= [targeted_date]\n  AND rc.is_trial_period = 'false'\n  AND (rc.effective_end_time IS NULL OR DATE_DIFF('s', rc.start_time, rc.effective_end_time)::float > 0)\n  AND rc.ownership_type != 'FAMILY_SHARED'\n  AND rc.store != 'promotional'\n  AND rc.is_sandbox <> 'true'\n  GROUP BY you.custom_attribute_key",
      "language": "pgsql",
      "name": "Active Subs by Custom Attribute"
    },
    {
      "code": "-- What is my weekly revenue, where Monday is set as the start day of the week?\n\nSELECT\n  date_trunc('week', start_time) as week,\n  SUM(price_in_usd) as revenue\nFROM\n  [revenuecat_data_table]\nWHERE date(start_time) BETWEEN [targeted_period_start_date] AND [targeted_period_end_date]\n  AND is_trial_period = 'false'\n  AND (effective_end_time IS NULL OR DATE_DIFF('s', start_time, effective_end_time)::float > 0)\n  AND ownership_type != 'FAMILY_SHARED'\n  AND store != 'promotional'\n  AND is_sandbox != 'true'\n  GROUP BY week",
      "language": "pgsql",
      "name": "Weekly Revenue (starting Monday)"
    },
    {
      "code": "-- What is my Realized LTV of each monthly subscription cohort, segmented by whether they were offered a trial?\n  \nWITH \n(SELECT\n  MIN(start_time) as subscription_start_time,\n  original_store_transaction_id,\n  MAX(is_trial_period) as had_a_trial,\n  SUM(price_in_usd) as realized_ltv\nFROM\n  [revenuecat_data_table]\nWHERE date(start_time) > [targeted_period_start_date]\n  AND ownership_type != 'FAMILY_SHARED'\n  AND store != 'promotional'\n  AND is_sandbox != 'true'\n  GROUP BY original_store_transaction_id) as subscriptions\n  \nSELECT\n  to_char(first_start_time, 'YYYY-MM') as subscription_start_month,\n  had_a_trial,\n  COUNT() as subscriptions,\n  SUM(realized_ltv) as realized_ltv,\n  SUM(realized_ltv) / COUNT() as realized_ltv_per_subscription\nFROM\n  subscriptions",
      "language": "pgsql",
      "name": "Realized LTV Segments"
    },
    {
      "code": "-- What portion of my Active Trials are in a grace period?\n  \nSELECT\n  CASE\n    WHEN grace_period_end_time IS NOT NULL THEN 'in_grace_period'\n    ELSE 'in_trial_period'\n    end_as period_type,\n  COUNT(*) as active_trials\nFROM\n  [revenuecat_data_table]\nWHERE date(effective_end_time) > [targeted_date]\n  AND date(start_time) <= [targeted_date]\n  AND is_trial_period = 'true'\n  AND (effective_end_time IS NULL OR DATE_DIFF('s', start_time, effective_end_time)::float > 0)\n  AND ownership_type != 'FAMILY_SHARED'\n  AND store != 'promotional'\n  AND is_sandbox != 'true'\n  GROUP BY period_type",
      "language": "pgsql",
      "name": "Active Trials by Grace Period Status"
    }
  ]
}
[/block]
---
title: ETL Exports
slug: etl-exports-legacy
excerpt: Data deliveries of all of your apps' transaction data
hidden: true
metadata:
  title: ETL Exports – RevenueCat
  description: RevenueCat can automatically send data deliveries of all of your apps'
    transaction data to various cloud storage providers. These are in the form of
    .csv files delivered daily.
  image:
    0: https://files.readme.io/d919a50-RevenueCat_Docs_OG.png
    1: RevenueCat Docs OG.png
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: '2020-10-02T02:46:37.589Z'
---
[block:callout]
{
  "type": "success",
  "body": "The ETL Export integration is available on the [Pro](https://www.revenuecat.com/pricing) plan."
}
[/block]
RevenueCat can automatically send data deliveries of all of your apps' transaction data to various cloud storage providers. These are in the form of [gzip compressed](https://en.wikipedia.org/wiki/Gzip) .csv files delivered daily.

# Setup Instructions

* [Amazon S3 Setup :fa-arrow-right:](doc:etl-s3)
* [Google Cloud Storage Setup :fa-arrow-right:](doc:etl-gcp)

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
    "6-0": "`store`",
    "7-0": "`is_auto_renewable`",
    "8-0": "`is_trial_period`",
    "9-0": "`is_in_intro_offer_period`",
    "10-0": "`is_sandbox`",
    "11-0": "`price_in_usd`",
    "12-0": "`takehome_percentage`",
    "13-0": "`store_transaction_id`",
    "14-0": "`original_store_transaction_id`",
    "15-0": "`refunded_at`",
    "16-0": "`unsubscribe_detected_at`",
    "17-0": "`billing_issues_detected_at`",
    "18-0": "`purchased_currency`",
    "19-0": "`price_in_purchased_currency`",
    "20-0": "`entitlement_identifiers`",
    "21-0": "`renewal_number`",
    "22-0": "`is_trial_conversion`",
    "20-1": "✅",
    "19-1": "✅",
    "18-1": "✅",
    "17-1": "✅",
    "16-1": "✅",
    "15-1": "✅",
    "11-1": "✅",
    "5-1": "✅",
    "0-2": "Can be used as a unique user identifier to find all of a user's transactions.",
    "1-2": "Can be used together with `rc_original_app_user_id` to match transactions with user identifiers in your systems.",
    "3-2": "The product identifier that was purchased.",
    "4-2": "Purchase time of transaction.",
    "5-2": "Expiration time of subscription. Null when `is_auto_renewable = false`\nFor Google Play, `end_time` can be before `start_time` to indicate an invalid transaction (e.g. billing issue).",
    "6-2": "The source of the transaction. Can be `app_store`, `play_store`, `stripe`, or [`promotional`](doc:promotionals).",
    "7-2": "`true` for auto-renewable subscriptions, `false` otherwise.",
    "8-2": "`true` if the transaction was a trial.",
    "9-2": "`true` if the transaction is in an introductory offer period.",
    "10-2": "`true` for transactions made in a [sandbox environment](doc:sandbox).",
    "11-2": "The gross revenue generated from the transaction. All prices are converted to USD. Can be null if product prices haven't been collected from the user's device.",
    "12-2": "0.7 or 0.85. Use this to calculate the proceeds of a transaction.",
    "13-2": "orderId or transaction_identifier. **​Can be used as unique id**.",
    "14-2": "orderId of first purchase or `original_transaction_id`. Can be used to find all related transactions for a single subscription.",
    "15-2": "When a refund was detected, `null` if none was detected. Can be checked for existence to indicate transactions which have been refunded.",
    "16-2": "When we detected an unsubscribe (opt-out of auto renew).",
    "17-2": "When we detected billing issues, `null` if none was detected.",
    "18-2": "The currency that was used for the transaction.",
    "19-2": "The product's price in the currency that was used for the transaction.",
    "20-2": "An array of entitlements that the transaction unlocked or `null` if it didn't unlock any entitlements.",
    "21-2": "Always starts at 1. Trial conversions are counted as renewals. `is_trial_conversion` is used to signify whether a transaction was a trial conversion.",
    "22-2": "If `true`, this transaction is a trial conversion.",
    "2-0": "`country`",
    "2-2": "Last seen country of the subscriber.",
    "23-0": "`presented_offering`",
    "23-2": "The offering presented to users. Can be used to filter [Experiment](doc:experiments-overview) transactions.",
    "24-0": "`reserved_subscriber_attributes`",
    "26-0": "`platform`",
    "26-2": "Last seen platform of the subscriber.",
    "24-1": "✅",
    "23-1": "✅",
    "25-0": "`custom_subscriber_attributes`",
    "2-1": "✅",
    "25-1": "✅",
    "26-1": "✅",
    "24-2": "The [reserved subscriber attributes](doc:subscriber-attributes#reserved-attributes) set for the subscriber. Keys begin with `$`.",
    "25-2": "The custom attributes set for the subscriber."
  },
  "cols": 3,
  "rows": 27
}
[/block]

[block:callout]
{
  "type": "info",
  "title": "Re-enable integration to update to latest version",
  "body": "If your exports don't contain all of the columns above, you may be on an older export version. To update to the latest version disconnect, and re-connect the integration from the RevenueCat dashboard."
}
[/block]
## A note on transaction data
All transaction data is based on the store receipts that RevenueCat has received. Receipts often have inconsistencies and quirks which may need to be considered. For example:
- The expiration date of a purchase can be before the purchase date. This is Google's way of invalidating a transaction, for example when Google is unable to bill a user some time after a subscription renews. This doesn’t occur on iOS.
- If you migrated to RevenueCat, Google subscriptions that were expired for more then 60 days before being migrated will not have transaction histories in ETL files.
- Apple and Google do not provide the transaction price directly, so we must rely on historical data for the products that we have. This isn’t 100% accurate in cases where the prices were changed or receipts were imported.
- Renewal numbers start at 1, even for trials. Trial conversions increase the renewal number.
- Data is pulled from a snapshot of the current receipt state, this means that the same transaction can be different from one delivery to another if something changed, e.g.refunds, and billing issues. You should recompute metrics for past time periods periodically to take these changes into account.

We try to normalize or at least annotate these quirks as much as possible, but by and large we consider receipts as the sources of truth, so any inconsistencies in the transaction data can always be traced back to the receipt

# Sample Queries

The following sample queries are in Postgresql.
[block:file]
{"language":"sql","name":"Active Trials","file":"code_blocks/🔌 Integrations & Events/etl-exports-legacy_1.sql"}
[/block]
[block:file]
{"language":"sql","name":"Active Subscriptions","file":"code_blocks/🔌 Integrations & Events/etl-exports-legacy_2.sql"}
[/block]
[block:file]
{"language":"sql","name":"Revenue","file":"code_blocks/🔌 Integrations & Events/etl-exports-legacy_3.sql"}
[/block]

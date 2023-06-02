---
title: Export Version 4 [DRAFT]
slug: data-export-version-4
hidden: true
metadata:
createdAt: '2023-05-19T16:00:00.905Z'
updatedAt: '2023-06-01T14:26:12.864Z'
---
> 👍 
> 
> The Scheduled Data Export integration is available on the [Pro](https://www.revenuecat.com/pricing) plan.

# Version 4 Change Log

## Data format improvements

> 🚧 
> 
> Please ensure that your data ingestion pipeline is setup to handle these format changes before updating to Version 4.

- Boolean fields such as `is_trial_conversion` have previously been provided with the strings `t` and `f` to represent true and false, but they will now be delivered as true boolean fields with `true` or `false`  as the set values.
- Fields containing JSON objects such as `reserved_subscriber_attributes` will have the values within each key/value pair enclosed in quotes to prevent issues when ingesting the data.

## New available data

### Measuring gross revenue

When a transaction is refunded, the current `price_in_usd` and `price_in_purchased_currency` fields will be set to `0` while `refunded_at` is set to mark the time of the refund.

To instead equip you to measure gross revenue before refunds, we've introduced new `purchase_price_in_usd` and `purchase_price_in_purchased_currency` fields which will remain set at the original purchase price even after a refund.

By sourcing your analysis' with these fields, you'll be able to measure gross revenue before refunds, or measure gross revenue by checking if `refunded_at` is null.

### Country fields

`country` has been updated to equal the store country of a given transaction when it is known, and to fall back to an IP-based estimated country when it is not known.

- The store country of a transaction is the most accurate way to group a subscription by country because it dictates the price of the subscription, the available offers, how price changes will be handled, etc.
- Update to iOS SDK version \_\_\_\_ to ensure store country can be captured by RevenueCat.

`country_source` has been added to distinguish between `country` values that represent the store country of a transaction (`from_sdk`), and those that have been set through an IP-based estimate (`estimated`).

### Product dimensions

`product_duration` represents the standard duration of a subscription product, set using ISO 8601 values (e.g. `P1M` for a 1 month subscription, `P1Y` for a 1 year subscription, etc).

- Trial period or introductory period lengths are not reported through this field. Therefore, when either `is_trial_period` or `is_in_intro_offer_period` are `true`, the `product_duration` does not represent the duration of that specific transaction. It represents the standard duration of the underlying product that has been subscribed to.
- There may be products where RevenueCat does not authoritatively know the standard duration, such as Stripe products which may have multiple prices (and therefore durations) associated with them. In these cases, `product_duration` will be null.
  - In our data features, we handle these cases by estimating product duration.

`product_display_name` represents the display name that may be set for a product in the RevenueCat Dashboard.

- Setting a display name may be especially useful for products on stores like Stripe where the `product_identifier` is not easily interpretable.

### Experiment fields

`experiment_id` represents the UUID of a RevenueCat Experiment that the associated App User ID was enrolled in.

`experiment_variant` represents the variant of the experiment that the associated App User ID was assigned to.

> 👍 
> 
> Experiments is available on the [Pro](https://www.revenuecat.com/pricing) plan. Get started with Experiments [here](https://www.revenuecat.com/docs/experiments-v1).

### Change tracking

`updated_at` represents the last time an attribute of the transaction was modified (e.g. after a subscriber disables their auto-renewal and a `cancellation_date` is set). This can be used to more easily capture changes to individual transactions between exports.

# Full export format

> 📘 
> 
> All dates and times are provided in UTC.

[block:parameters]
{
  "data": {
    "h-0": "Header",
    "h-1": "Can be null",
    "h-2": "Comments",
    "0-0": "`rc_original_app_user_id`",
    "0-1": "",
    "0-2": "Can be used as a unique user identifier to find all of a user's transactions.",
    "1-0": "`rc_last_seen_app_user_id_alias`",
    "1-1": "",
    "1-2": "Can be used together with `rc_original_app_user_id` to match transactions with user identifiers in your systems.",
    "2-0": "`country`",
    "2-1": "✅",
    "2-2": "Store country of a transaction when known, or an IP-based estimate of a subscriber's country when not known.",
    "3-0": "`country_source`\\*",
    "3-1": "✅",
    "3-2": "`from_sdk` when the store country of a transaction is known, or `estimated` when `country` is sourced from an IP-based estimate.",
    "4-0": "`product_identifier`",
    "4-1": "",
    "4-2": "The product identifier that was purchased.",
    "5-0": "`product_display_name`\\*",
    "5-1": "✅",
    "5-2": "The display name of the product identifier if one has been set",
    "6-0": "`product_duration`\\*",
    "6-1": "✅",
    "6-2": "The standard duration of the product if one is known by RevenueCat. May be null if RevenueCat does not know the authoritative duration.  \n  \n`product_duration` does not represent the trial or introductory period length of a transaction, it only represents the standard duration of the product that's been subscribed to.",
    "7-0": "`start_time`",
    "7-1": "",
    "7-2": "Purchase time of transaction.",
    "8-0": "`end_time`",
    "8-1": "✅",
    "8-2": "Expected expiration time of subscription. Null when `is_auto_renewable = false`  \nFor Google Play, `end_time` can be before `start_time` to indicate an invalid transaction (e.g. billing issue).",
    "9-0": "`grace_period_end_time`",
    "9-1": "✅",
    "9-2": "Expiration time of a grace period (if applicable) for a subscription. Will remain set while a subscription is in its grace period, or if it exited its grace period without renewing. Null when a subscription is not in a grace period or expiration was not due to a grace period.",
    "10-0": "`effective_end_time`",
    "10-1": "✅",
    "10-2": "Single reference point of a subscriber’s expiration and entitlement revocation; inclusive of each store’s logic for cancellations, grace periods, etc.",
    "11-0": "`store`",
    "11-1": "",
    "11-2": "The source of the transaction. Can be `app_store`, `play_store`, `stripe`, or [`promotional`](doc:promotionals).",
    "12-0": "`is_auto_renewable`",
    "12-1": "",
    "12-2": "`true` for auto-renewable subscriptions, `false` otherwise.",
    "13-0": "`is_trial_period`",
    "13-1": "",
    "13-2": "`true` if the transaction was a trial.",
    "14-0": "`is_in_intro_offer_period`",
    "14-1": "",
    "14-2": "`true` if the transaction is in an introductory offer period.",
    "15-0": "`is_sandbox`",
    "15-1": "",
    "15-2": "`true` for transactions made in a [sandbox environment](doc:sandbox).",
    "16-0": "`price_in_usd`",
    "16-1": "✅",
    "16-2": "The revenue (converted to USD) generated from the transaction after accounting for refunds. Can be null if product prices haven't been collected from the user's device. ",
    "17-0": "`purchase_price_in_usd`\\*",
    "17-1": "✅",
    "17-2": "The gross revenue (converted to USD) generated from the transaction. Remains set for refunded transactions. Refer to `refunded_at` to determine refund state. Can be null if product prices haven't been collected from the user's device.",
    "18-0": "`takehome_percentage`",
    "18-1": "",
    "18-2": "[OUTDATED] The estimated percentage of the transaction price that will be paid out to developers after commissions, but before VAT and DST taxes are taken into account. (will be either 0.7 or 0.85)  \n  \nWe recommend using `tax_percentage` and `commission_percentage` to calculate proceeds instead. [Learn more here](https://www.revenuecat.com/docs/taxes-and-commissions).",
    "19-0": "`tax_percentage`",
    "19-1": "",
    "19-2": "The portion of a transaction’s price that will be deducted by the store for taxes. VAT & Digital Services Taxes may be withheld by stores depending on the store and country. To learn more about how RevenueCat estimates taxes, [click here](https://www.revenuecat.com/docs/taxes-and-commissions).",
    "20-0": "`commission_percentage`",
    "20-1": "",
    "20-2": "The portion of a transaction’s price that will be detected by the store for commission. In stores where taxes are deducted before commission, this value will not equal the published commission from a store, because that commission is calculated on the post-tax revenue.",
    "21-0": "`store_transaction_id`",
    "21-1": "",
    "21-2": "orderId or transaction_identifier. **​Can be used as unique id**.",
    "22-0": "`original_store_transaction_id`",
    "22-1": "",
    "22-2": "orderId of first purchase or `original_transaction_id`. Can be used to find all related transactions for a single subscription.",
    "23-0": "`refunded_at`",
    "23-1": "✅",
    "23-2": "When a refund was detected, `null` if none was detected. Can be checked for existence to indicate transactions which have been refunded.",
    "24-0": "`unsubscribe_detected_at`",
    "24-1": "✅",
    "24-2": "When we detected an unsubscribe (opt-out of auto renew).",
    "25-0": "`billing_issues_detected_at`",
    "25-1": "✅",
    "25-2": "When we detected billing issues, `null` if none was detected.",
    "26-0": "`purchased_currency`",
    "26-1": "✅",
    "26-2": "The currency that was used for the transaction.",
    "27-0": "`price_in_purchased_currency`",
    "27-1": "✅",
    "27-2": "The revenue (in the purchased currency) generated from the transaction after accounting for refunds. Can be null if product prices haven't been collected from the user's device.",
    "28-0": "`purchase_price_in_purchased_currency`\\*",
    "28-1": "✅",
    "28-2": "The gross revenue (in the purchased currency) generated from the transaction. Remains set for refunded transactions. Refer to `refunded_at` to determine refund state. Can be null if product prices haven't been collected from the user's device.",
    "29-0": "`entitlement_identifiers`",
    "29-1": "✅",
    "29-2": "An array of entitlements that the transaction unlocked or `null` if it didn't unlock any entitlements.",
    "30-0": "`renewal_number`",
    "30-1": "",
    "30-2": "Always starts at 1. Trial conversions are counted as renewals. `is_trial_conversion` is used to signify whether a transaction was a trial conversion.",
    "31-0": "`is_trial_conversion`",
    "31-1": "",
    "31-2": "If `true`, this transaction is a trial conversion.",
    "32-0": "`presented_offering`",
    "32-1": "✅",
    "32-2": "The offering presented to users. Can be used to filter [Experiment](doc:experiments-overview) transactions.",
    "33-0": "`ownership_type`",
    "33-1": "✅",
    "33-2": "Will be `PURCHASED` when a recorded transaction results from the subscriber’s direct purchase of it, or `FAMILY_SHARED` when a recorded transaction results from the subscriber having received it through Family Sharing.  \n  \nNOTE: The `FAMILY_SHARED` designation is only supported on App Store transactions.",
    "34-0": "`reserved_subscriber_attributes`",
    "34-1": "✅",
    "34-2": "The [reserved subscriber attributes](doc:subscriber-attributes#reserved-attributes) set for the subscriber. Keys begin with `$`.",
    "35-0": "`custom_subscriber_attributes`",
    "35-1": "✅",
    "35-2": "The custom attributes set for the subscriber.",
    "36-0": "`platform`",
    "36-1": "✅",
    "36-2": "Last seen platform of the subscriber.",
    "37-0": "`experiment_id`\\*",
    "37-1": "✅",
    "37-2": "The unique ID of the Experiment that the subscriber is or was enrolled in. Will be null if the subscriber has not been enrolled in an experiment.  \n  \nLearn more about Experiments [here](https://www.revenuecat.com/docs/experiments-v1).",
    "38-0": "`experiment_variant`\\*",
    "38-1": "✅",
    "38-2": "The value of the Experiment variant that the subscriber is or was enrolled in. `a` represents the Control, and `b` represents the Treatment. Will be null if the subscriber has not been enrolled in an experiment.  \n  \nLearn more about Experiments [here](https://www.revenuecat.com/docs/experiments-v1).",
    "39-0": "`updated_at`",
    "39-1": "",
    "39-2": "The last time an attribute of the transaction was modified."
  },
  "cols": 3,
  "rows": 40,
  "align": [
    "left",
    "left",
    "left"
  ]
}
[/block]

\*Newly added fields for Version 4

To learn more about how to use our transaction data, or get started with sample queries, [click here](https://www.revenuecat.com/docs/scheduled-data-exports).
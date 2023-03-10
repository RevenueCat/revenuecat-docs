---
title: "Create a Purchase"
slug: "receipts"
excerpt: "Records a purchase for a user from iOS, Android, or Stripe and will create a user if they don't already exist."
hidden: false
createdAt: "2018-05-08T17:27:35.964Z"
updatedAt: "2023-02-17T01:30:24.763Z"
---
# Parameter Reference
This is a complete reference of every parameter you can pass to this endpoint.
[block:parameters]
{
  "data": {
    "0-0": "`app_user_id`",
    "h-0": "Parameter",
    "h-1": "Description",
    "h-2": "Data Type",
    "h-3": "iOS/macOS",
    "h-4": "Google",
    "h-5": "Amazon",
    "h-6": "Stripe",
    "0-1": "App User ID of the user the receipt is associated with.",
    "0-2": "String",
    "0-3": "Required ✅",
    "0-4": "Required ✅",
    "0-5": "Required ✅",
    "0-6": "Required ✅",
    "1-0": "`fetch_token`",
    "1-1": "The raw receipt or fetch token.",
    "1-2": "String",
    "1-3": "Required ✅\nSend the base64 encoded receipt file.",
    "1-4": "Required ✅\nSend the fetch token. Its format is abcdefghijklmnopqrstuvwx.AO-J1OxxnCDwK...",
    "1-5": "Required ✅\nSend the fetch token. Its format is aBCdefgHi-x-AsdFghjKlQw34erTyUioPzxCvbnm1As=:2:10",
    "1-6": "Required ✅\nSend the subscription ID (sub_abcdefg) or the Stripe Checkout Session (cs_abcdefg)",
    "2-0": "`attributes`",
    "2-1": "Mapping of key names to subscriber attribute objects. See the [attributes object](ref:subscribers#the-subscriber-attribute-object).",
    "2-2": "Object",
    "2-3": "Optional 🆗",
    "2-4": "Optional 🆗",
    "2-5": "Optional 🆗",
    "2-6": "Optional 🆗",
    "3-0": "`product_id`",
    "3-1": "The Apple, Google, or Amazon product identifier or SKU.",
    "3-2": "String",
    "3-3": "Optional 🆗",
    "3-5": "Optional 🆗",
    "3-4": "Required ✅",
    "3-6": "Not compatible ❌",
    "4-0": "`price`",
    "4-1": "The price of the product. **Required if you provide a currency.** ",
    "4-2": "Float",
    "4-3": "Optional 🆗",
    "4-4": "Optional 🆗",
    "4-5": "Optional 🆗",
    "4-6": "Not compatible ❌",
    "5-0": "`currency`",
    "5-1": "The currency of the product. The currency must be in [ISO 4217 format](https://en.wikipedia.org/wiki/ISO_4217). **Required if you provide a price.** ",
    "5-2": "String",
    "5-3": "Optional 🆗",
    "5-4": "Optional 🆗",
    "5-5": "Optional 🆗",
    "5-6": "Not compatible ❌",
    "6-0": "`is_restore`",
    "6-1": "If true, the fetch token will trigger your configured [restore behavior](https://www.revenuecat.com/docs/restoring-purchases#restore-behavior) for any other users sharing the same fetch token.",
    "6-2": "Boolean",
    "6-3": "Optional 🆗",
    "6-4": "Optional 🆗",
    "6-5": "Optional 🆗",
    "6-6": "Optional 🆗",
    "7-0": "`payment_mode`",
    "7-1": "Communicates the iOS introductory pricing period of the product. This parameter can be:\n• 0 (pay_as_you_go)\n• 1 (pay_up_front)\n• 2 (free_trial)\n\nDefaults to 2 (free trial) if an introductory period is detected in the receipt but this value is not provided.",
    "7-2": "Integer (0, 1, or 2)",
    "7-3": "Optional 🆗",
    "7-4": "Not compatible ❌",
    "7-5": "Not compatible ❌",
    "7-6": "Not compatible ❌",
    "8-0": "`create_events`",
    "8-1": "If false, will not create [events](https://www.revenuecat.com/docs/webhooks) for any purchases detected in the receipt. This can be set to false when importing old receipts into RevenueCat in order to not get any webhook or integration events for old users.\n\nDefaults to **true** if not provided.",
    "8-2": "Boolean",
    "8-3": "Optional 🆗",
    "8-4": "Optional 🆗",
    "8-5": "Optional 🆗",
    "8-6": "Optional 🆗",
    "9-0": "`should_update_last_seen_fields`",
    "9-1": "If false, will not update the user's \"last seen\" metrics. This should be set to false when importing old receipts into RevenueCat.\n\nDefaults to **true** if not provided.",
    "9-2": "Boolean",
    "9-3": "Optional 🆗",
    "9-4": "Optional 🆗",
    "9-5": "Optional 🆗",
    "9-6": "Optional 🆗",
    "10-0": "`subscription_group_id`",
    "10-1": "The [iOS subscription group](https://developer.apple.com/documentation/appstorereceipts/responsebody/latest_receipt_info) that the product belongs to.",
    "10-2": "String",
    "10-3": "Optional 🆗",
    "10-4": "Not compatible ❌",
    "10-5": "Not compatible ❌",
    "10-6": "Not compatible ❌",
    "11-0": "`store_user_id`",
    "11-1": "The Amazon user ID.",
    "11-2": "String",
    "11-3": "Not compatible ❌",
    "11-4": "Not compatible ❌",
    "11-6": "Not compatible ❌",
    "11-5": "Required ✅",
    "12-0": "`presented_offering_identifier`",
    "12-1": "The offering that was presented to the user at the time of purchase.\n\nThis will be attached to any new transactions in this fetch token and will be available in ETL exports and webhooks. This is mostly useful if you're sending fetch tokens from your backend.",
    "12-2": "String",
    "12-3": "Optional 🆗",
    "12-4": "Optional 🆗",
    "12-5": "Optional 🆗",
    "12-6": "Optional 🆗",
    "13-0": "`observer_mode`",
    "13-1": "Set this to true only if you are using observer mode.\n\nDefaults to **false** if not provided.",
    "13-2": "Boolean",
    "13-3": "Optional 🆗",
    "13-4": "Optional 🆗",
    "13-5": "Not compatible ❌",
    "13-6": "Optional 🆗",
    "14-0": "`attributes`",
    "14-1": "Any subscriber attributes that you want to add to this app user ID.",
    "14-2": "Object",
    "14-3": "Optional 🆗",
    "14-4": "Optional 🆗",
    "14-5": "Optional 🆗",
    "14-6": "Optional 🆗",
    "15-0": "`introductory_price`",
    "15-2": "Float",
    "15-1": "The price of the introductory period.",
    "15-3": "Optional 🆗",
    "15-4": "Not compatible ❌",
    "15-5": "Not compatible ❌",
    "15-6": "Not compatible ❌",
    "16-0": "`normal_duration`",
    "17-0": "`intro_duration`",
    "18-0": "`trial_duration`",
    "19-0": "`store_country`",
    "20-0": "`ip_address`",
    "19-1": "The [ISO alpha 2 country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) of the store where the purchase was made. Currently only used iOS. This can help with estimating the correct currency (for example, when two countries use the same currency but different prices, this lets RevenueCat know which country's price to use.)",
    "19-2": "String",
    "19-3": "Optional 🆗",
    "19-4": "Not compatible ❌",
    "19-5": "Not compatible ❌",
    "19-6": "Not compatible ❌",
    "20-1": "The IP address of the device that made this purchase. If store_country, currency, or price are not provided, RevenueCat can try to infer it from the IP address provided. If both `store_country` and `ip_address` are provided, `store_country` always takes precedence over `ip_address`.",
    "20-2": "String",
    "20-3": "Optional 🆗",
    "20-4": "Not compatible ❌",
    "20-5": "Not compatible ❌",
    "20-6": "Not compatible ❌",
    "16-1": "The [ISO 8601 duration](https://en.wikipedia.org/wiki/ISO_8601) of the subscription. RevenueCat will estimate this for you if you don't provide it.",
    "16-2": "String",
    "16-3": "Optional 🆗",
    "16-4": "Not compatible ❌",
    "16-5": "Not compatible ❌",
    "16-6": "Not compatible ❌",
    "17-1": "The [ISO 8601 duration](https://en.wikipedia.org/wiki/ISO_8601) of the introductory period of the subscription. RevenueCat will estimate this for you if you don't provide it.",
    "18-1": "The [ISO 8601 duration](https://en.wikipedia.org/wiki/ISO_8601) of the free trial period of the subscription. RevenueCat will estimate this for you if you don't provide it.",
    "17-2": "String",
    "18-2": "String",
    "17-3": "Optional 🆗",
    "18-3": "Optional 🆗",
    "17-4": "Not compatible ❌",
    "18-4": "Not compatible ❌",
    "17-5": "Not compatible ❌",
    "18-5": "Not compatible ❌",
    "17-6": "Not compatible ❌",
    "18-6": "Not compatible ❌"
  },
  "cols": 7,
  "rows": 21
}
[/block]

[block:api-header]
{
  "title": "Response"
}
[/block]
If the response is successful, it will contain the updated [Subscriber object](ref:subscribers#the-subscriber-object).


[block:callout]
{
  "type": "warning",
  "title": "Public API Key required",
  "body": "This endpoint requires the [public SDK key](doc:authentication) to be used. Since validation is performed securely with the store using the provided `fetch_token`, this is safe. \n\nThe restriction exists to prevent developers from embedding a secret key in their app."
}
[/block]
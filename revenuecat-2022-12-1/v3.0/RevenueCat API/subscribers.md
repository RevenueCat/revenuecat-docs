---
title: "Get or Create Subscriber"
slug: "subscribers"
excerpt: "Gets the latest subscriber info or creates one if it doesn't exist."
hidden: false
createdAt: "2018-05-08T17:13:32.048Z"
updatedAt: "2020-03-10T02:39:28.352Z"
---
[block:callout]
{
  "type": "info",
  "body": "If the provided `app_user_id` doesn't exists, **a new subscriber will be created with the App User Id**.",
  "title": "Get OR create a subscriber"
}
[/block]

[block:api-header]
{
  "title": "Response"
}
[/block]
If the provided `app_user_id` exists, the response will contain the latest purchase information for that user. 
[block:parameters]
{
  "data": {
    "h-0": "Attribute",
    "h-1": "Description",
    "0-0": "`request_date`",
    "0-1": "The ISO 8601 datetime of the request.",
    "1-0": "`request_date_ms`",
    "1-1": "The Unix timestamp of the request.",
    "2-0": "`subscriber`",
    "2-1": "A [Subscriber object](https://docs.revenuecat.com/reference#section-the-subscriber-object)"
  },
  "cols": 2,
  "rows": 3
}
[/block]
## The Subscriber object:
[block:parameters]
{
  "data": {
    "0-0": "`original_app_user_id`",
    "0-1": "The first App User Id that was registered for this user.",
    "6-0": "`non_subscriptions`",
    "6-1": "A mapping of [Non-Subscription object](https://docs.revenuecat.com/reference#section-the-non-subscription-object) arrays keyed by product ID.",
    "1-1": "**Only available on iOS**. This will be `null` until an iOS receipt is sent for the user. After a receipt has been sent, it will indicate the first App Store version of your app that user installed.",
    "1-0": "`original_application_version`",
    "h-0": "Attribute",
    "h-1": "Description",
    "2-0": "`first_seen`",
    "2-1": "The ISO 8601 datetime string corresponding to  when this user was first seen in RevenueCat .",
    "4-0": "`entitlements`",
    "4-1": "A mapping of [Entitlement objects](https://docs.revenuecat.com/reference#section-the-entitlement-object) keyed by entitlement ID.",
    "5-0": "`subscriptions`",
    "5-1": "A mapping of [Subscription objects](https://docs.revenuecat.com/reference#section-the-subscription-object) keyed by product ID.",
    "7-0": "`other_purchases`",
    "7-1": "Deprecated. See `non_subscriptions`",
    "3-0": "`last_seen`",
    "3-1": "The ISO 8601 datetime string corresponding to when this user was last seen in RevenueCat.",
    "8-0": "`subscriber_attributes`",
    "8-1": "A dictionary of subscriber attribute keys to [Subscriber Attribute objects](https://docs.revenuecat.com/reference#section-the-subscriber-attribute-object). **Only included in requests made with secret keys.**\n\nFor more details on subscriber attributes, see our [subscriber attributes guide](https://docs.revenuecat.com/docs/subscriber-attributes)."
  },
  "cols": 2,
  "rows": 9
}
[/block]
## The Entitlement object:
[block:parameters]
{
  "data": {
    "h-0": "Attribute",
    "h-1": "Description",
    "0-0": "`expires_date`",
    "0-1": "The ISO 8601 datetime this entitlement is set to expire (may be in the past).",
    "1-0": "`purchase_date`",
    "1-1": "The ISO 8601 datetime of the latest purchase or renewal.",
    "2-0": "`product_identifier`",
    "2-1": "The product identifier that unlocked this entitlement."
  },
  "cols": 2,
  "rows": 3
}
[/block]
## The Subscription object:
[block:parameters]
{
  "data": {
    "h-0": "Attribute",
    "h-1": "Description",
    "0-1": "The ISO 8601 datetime of the latest known expiration date.",
    "0-0": "`expires_date`",
    "1-0": "`purchase_date`",
    "1-1": "The ISO 8601 datetime of the latest purchase or renewal.",
    "3-0": "`period_type`",
    "3-1": "Possible values for `period_type`:\n- `normal`: The product is in it's normal period (default)\n- `trial`: The product is in a free trial period\n- `intro`: The product is in an introductory pricing period",
    "2-0": "`original_purchase_date`",
    "2-1": "The ISO 8601 datetime of the first recorded purchase of this product.",
    "4-0": "`store`",
    "4-1": "Possible values for `store`:\n- `app_store`: The product was purchased through Apple App Store.\n- `mac_app_store`: The product was purchased through the Mac App Store.\n- `play_store`: The product was purchased through the Google Play Store.\n- `stripe`: The product was purchased through Stripe.\n- `promotional`: The product was [granted via RevenueCat](doc:customers#section-granting-promotional-subscriptions).",
    "6-0": "`unsubscribe_detected_at`",
    "6-1": "The ISO 8601 datetime that an unsubscribe was detected. Will be null if previously unsubscribed user has resubscribed. Note the subscription may still be active, check the `expires_date` attribute.",
    "7-0": "`billing_issues_detected_at`",
    "7-1": "The ISO 8601 datetime that billing issues were detected. Will be null if previous billing issues were resolved. Note the subscription may still be active, check the `expires_date` attribute.",
    "5-0": "`is_sandbox`",
    "5-1": "Boolean indicating whether the subscription was purchased in sandbox or production environment."
  },
  "cols": 2,
  "rows": 8
}
[/block]
## The Non-Subscription object:
[block:parameters]
{
  "data": {
    "h-0": "Attribute",
    "h-1": "Description",
    "0-0": "`id`",
    "0-1": "A unique identifier for the transaction. You can use this to ensure you track consumption of all consumable products.",
    "1-0": "`purchase_date`",
    "1-1": "The ISO 8601 datetime that the purchase happened.",
    "2-0": "`store`",
    "3-0": "`is_sandbox`",
    "2-1": "Possible values for `store`:\n- `app_store`: The product was purchased through Apple App Store.\n- `mac_app_store`: The product was purchased through the Mac App Store.\n- `play_store`: The product was purchased through the Google Play Store.\n- `stripe`: The product was purchased through Stripe.",
    "3-1": "Boolean indicating whether the subscription was purchased in sandbox or production environment."
  },
  "cols": 2,
  "rows": 4
}
[/block]
## The Subscriber Attribute object:
[block:parameters]
{
  "data": {
    "h-0": "Attribute",
    "h-1": "Description",
    "0-0": "`value`",
    "0-1": "The string value of the attribute.",
    "1-0": "`updated_at_ms`",
    "1-1": "The Unix timestamp of when the attribute was last updated."
  },
  "cols": 3,
  "rows": 2
}
[/block]

[block:callout]
{
  "type": "warning",
  "title": "Secret API Key Required For Subscriber Attributes",
  "body": "The Subscriber Attribute object will only be included in requests made with a [secret API key](doc:authentication)."
}
[/block]
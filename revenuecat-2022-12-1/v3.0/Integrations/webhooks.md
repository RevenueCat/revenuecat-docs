---
title: "Webhooks"
slug: "webhooks"
excerpt: "Enhanced server-to-server notifications from webhooks"
hidden: false
metadata: 
  title: "Webhooks | RevenueCat"
  description: "RevenueCat can send you notifications any time an event happens in your app. This is useful for subscription and purchase events, which will allow you to monitor state changes for your subscribers and react accordingly."
  image: 
    0: "https://files.readme.io/56a9fc4-Reddit__E.jpg"
    1: "Reddit – E.jpg"
    2: 1200
    3: 630
    4: "#fbabaf"
createdAt: {}
updatedAt: "2020-09-09T19:09:04.903Z"
---
[block:callout]
{
  "type": "success",
  "body": "Webhooks are only available on [paid](https://www.revenuecat.com/pricing) plans."
}
[/block]
RevenueCat can send you notifications any time an event happens in your app. This is useful for subscription and purchase events, which will allow you to monitor state changes for your subscribers and react accordingly. 

For example, you might want to remind subscribers of the benefits of your app when they decide to unsubscribe, or let them know when there are billing issues. 
[block:api-header]
{
  "title": "Registering your webhook URL"
}
[/block]
To start receiving webhook events, register your server URL for your app using [RevenueCat's dashboard](http://app.revenuecat.com). 
[block:callout]
{
  "type": "info",
  "title": "One webhook per app",
  "body": "Each of your apps has a webhook URL field you can set. This way you can decide which of your apps need server side notifications, and where they should be sent."
}
[/block]
RevenueCat will send `POST` requests to your server, in which the body will be a JSON representation of the notification. Your server should return a **200 status code**. Any other status code will be considered a failure by our backend. RevenueCat will retry later (up to 5 times) with an increasing delay (5, 10, 20, 40, and 80 minutes). After 5 retries, we will stop sending notifications.

If you're receiving a webhook it's important to respond quickly so you don't accidentally run over a timeout limit. We recommend that apps defer processing until after the response has been sent.
[block:callout]
{
  "type": "info",
  "title": "Best Practices: Webhook authorization",
  "body": "We recommended setting an authorization header value via the RevenueCat dashboard. When set, RevenueCat will send this header in every request. Your server can use this to authenticate the  webhooks from RevenueCat."
}
[/block]

[block:api-header]
{
  "title": "Event types"
}
[/block]

[block:parameters]
{
  "data": {
    "h-0": "Webhook Event Type",
    "h-1": "Description",
    "0-0": "`TEST`",
    "0-1": "Test event issued through the RevenueCat dashboard.",
    "3-0": "`RENEWAL`",
    "3-1": "An existing subscription has been renewed. This may occur at the end of the current billing period or later if a lapsed user re-subscribes.",
    "4-0": "`PRODUCT_CHANGE`",
    "4-1": "A **subscriber** has changed the product of their subscription.",
    "5-0": "`CANCELLATION`",
    "5-1": "A subscription has been cancelled.",
    "7-0": "`BILLING_ISSUE`",
    "7-1": "There has been a problem trying to charge the subscriber. This does not mean the subscription has expired.",
    "h-2": "App Store",
    "h-3": "Play Store",
    "0-2": "✅",
    "3-2": "✅",
    "4-2": "✅",
    "5-2": "✅",
    "7-2": "✅",
    "7-3": "✅",
    "5-3": "✅",
    "4-3": "✅",
    "3-3": "✅",
    "0-3": "✅",
    "1-0": "`INITIAL_PURCHASE`",
    "1-1": "A new subscription has been purchased.",
    "1-2": "✅",
    "1-3": "✅",
    "8-0": "`SUBSCRIBER_ALIAS`",
    "8-1": "**Deprecated**. A new `app_user_id` has been registered for an existing subscriber.",
    "8-2": "",
    "8-3": "",
    "2-0": "`NON_RENEWING_PURCHASE`",
    "2-2": "✅",
    "2-3": "✅",
    "2-1": "A customer has made a purchase that will not auto-renew.",
    "h-4": "Web",
    "2-4": "❌",
    "5-4": "✅",
    "0-4": "❌",
    "1-4": "✅",
    "3-4": "✅",
    "4-4": "✅",
    "7-4": "❌",
    "8-4": "",
    "0-5": "❌",
    "1-5": "❌",
    "2-5": "✅",
    "3-5": "❌",
    "4-5": "❌",
    "7-5": "❌",
    "8-5": "",
    "5-5": "✅",
    "h-5": "Promo",
    "6-0": "`UNCANCELLATION`",
    "6-1": "Auto-renew status has been re-enabled for a subscription.",
    "6-2": "✅",
    "6-3": "✅",
    "6-4": "❌",
    "6-5": "❌"
  },
  "cols": 6,
  "rows": 9
}
[/block]

[block:api-header]
{
  "title": "Events Format"
}
[/block]
Webhook events are serialized in JSON. The body of a `POST` request to your server will contain the serialized event, as well as the API version. 
[block:code]
{
  "codes": [
    {
      "code": "{\n  \"event\": {\n    \"type\": \"INITIAL_PURCHASE\",\n    \"id\": \"CD489E0E-5D52-4E03-966B-A7F17788E432\",\n    \"app_user_id\": \"00005A1C-6091-4F81-BE77-F0A83A271AB6\",\n    \"original_app_user_id\" : \"4BEDB450-8EF2-11E9-B475-0800200C9A66\",\n    \"aliases\": [\"00005A1C-6091-4F81-BE77-F0A83A271AB6\", \"4BEDB450-8EF2-11E9-B475-0800200C9A66\"],\n    \"product_id\": \"onemonth_free_trial\",\n    \"price\": 5.99,\n    \"currency\": \"USD\",\n    \"price_in_purchased_currency\": 5.99,\n    \"takehome_percentage\": 0.7,\n    \"period_type\": \"TRIAL\",\n    \"purchased_at_ms\": 1530648507000,\n    \"expiration_at_ms\": 1533326907000,\n    \"event_timestamp_ms\": 1530648573000,\n    \"store\": \"PLAY_STORE\",\n    \"environment\": \"SANDBOX\",\n    \"transaction_id\" : \"GPA.1234-5678-7129-39586\",\n    \"original_transaction_id\" : \"GPA.1234-5678-7129-39586\"\n  },\n  \"api_version\": \"1.0\"\n}",
      "language": "json"
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "Common fields"
}
[/block]

[block:parameters]
{
  "data": {
    "h-0": "Field",
    "h-1": "Type",
    "h-2": "Description",
    "h-3": "Possible Values",
    "0-0": "`type`",
    "1-0": "`id`",
    "3-0": "`app_user_id`",
    "0-1": "String",
    "1-1": "String",
    "3-1": "String",
    "0-2": "[Type of the event](doc:webhooks#section-event-types).",
    "1-2": "Unique identifier of the event.",
    "3-2": "Last seen app user id of the subscriber.",
    "0-3": "`TEST`\n\n`INITIAL_PURCHASE`\n\n`NON_RENEWING_PURCHASE`\n\n `RENEWAL`\n\n `PRODUCT_CHANGE`\n\n `CANCELLATION`\n\n `BILLING_ISSUE`\n\n`SUBSCRIBER_ALIAS`",
    "5-0": "`aliases`",
    "5-1": "[String]",
    "5-2": "All app user ids ever used by the subscriber.",
    "2-0": "`event_timestamp_ms`",
    "2-1": "Integer",
    "4-0": "`original_app_user_id`",
    "4-1": "String",
    "4-2": "The first app user id used by the subscriber.",
    "2-2": "The time that the event was generated. Does not necessarily coincide with when the action that triggered the event occurred (purchased, cancelled, etc)."
  },
  "cols": 4,
  "rows": 6
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "When looking up users from the webhook in your systems, make sure to search both the `original_app_user_id` and the `aliases` array."
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "If we have to retry a webhook for any reason, the retry will have the same `id` and `event_timestamp_ms` of the first attempt.",
  "title": ""
}
[/block]

[block:api-header]
{
  "title": "Subscription lifecycle events fields"
}
[/block]

[block:parameters]
{
  "data": {
    "h-0": "Field",
    "h-1": "Type",
    "h-2": "Description",
    "h-3": "Possible Values",
    "0-0": "`product_id`",
    "3-0": "`period_type`",
    "4-0": "`purchased_at_ms`",
    "5-0": "`expiration_at_ms`",
    "6-0": "`store`",
    "9-0": "`cancel_reason`",
    "10-0": "`new_product_id`",
    "0-1": "String",
    "3-1": "String",
    "6-1": "String",
    "9-1": "String",
    "10-1": "String",
    "4-1": "Integer",
    "5-1": "Integer",
    "0-2": "Product identifier of the subscription.",
    "3-2": "Period type of the transaction.",
    "4-2": "Time when the transaction was purchased. Measured in milliseconds since Unix epoch",
    "5-2": "Expiration of the transaction. Measured in milliseconds since Unix epoch. Use this field to determine if a subscription is still active.",
    "6-2": "Store the subscription belongs to.",
    "9-2": "**Only available for** `CANCELLATION` **events**.\n\nSee [Cancellation Reasons](https://docs.revenuecat.com/docs/webhooks#section-cancellation-reasons).",
    "10-2": "Product identifier of the new product the subscriber has switched to. **Only available for App Store subscriptions and** `PRODUCT_CHANGE` **events**.",
    "3-3": "`TRIAL`, for free trials.\n\n `INTRO`, for introductory pricing.\n\n `NORMAL`, standard subscription.\n\n`PROMOTIONAL`, for subscriptions granted through RevenueCat.",
    "6-3": "`PLAY_STORE`\n\n `APP_STORE`\n\n`STRIPE`\n\n`MAC_APP_STORE`\n\n`PROMOTIONAL`",
    "9-3": "`UNSUBSCRIBE`\n\n `BILLING_ERROR`\n\n`DEVELOPER_INITIATED`\n\n`PRICE_INCREASE`\n\n`CUSTOMER_SUPPORT`\n\n`UNKNOWN`",
    "7-0": "`environment`",
    "7-1": "String",
    "7-2": "Store environment.",
    "7-3": "`SANDBOX`\n\n`PRODUCTION`",
    "8-0": "`is_trial_conversion`",
    "8-1": "Boolean",
    "8-2": "**Only available for** `RENEWAL` **events**. \n\nWhether the previous transaction was a free trial or not.",
    "8-3": "`true` or `false`",
    "1-0": "`entitlement_ids`",
    "1-1": "[String]",
    "1-2": "Entitlement identifiers of the subscription.",
    "1-3": "It can be `NULL` if  the `product_id` is not mapped to any entitlements.",
    "5-3": "It can be `NULL` for non-subscription purchases.",
    "11-0": "`presented_offering_id`",
    "11-1": "String",
    "11-2": "**Not available for apps using legacy entitlements.**\n\nThe identifier for the offering that was presented to the user during their initial purchase.",
    "2-0": "`entitlement_id`",
    "2-1": "String",
    "2-2": "Deprecated. See `entitlement_ids`.",
    "2-3": "Deprecated. See `entitlement_ids`.",
    "16-0": "`subscriber_attributes`",
    "16-1": "Map of attribute names to attribute objects.\n\nFor more details see the [subscriber attributes guide](https://docs.revenuecat.com/docs/subscriber-attributes).",
    "16-3": "",
    "12-0": "`price`",
    "12-1": "Double",
    "12-2": "The USD price of the transaction.",
    "12-3": "Can be `NULL` if the price is unknown, and `0` for free trials.\n\nCan be negative for refunds.",
    "13-0": "`currency`",
    "13-1": "String",
    "13-3": "`USD`, `CAD`, etc.\n\nCan be `NULL` if the currency is unknown.",
    "13-2": "The ISO 4217 currency code that the product was purchased in.",
    "14-0": "`price_in_purchased_currency`",
    "14-1": "Double",
    "14-2": "The price of the transaction in the currency the product was purchased in.",
    "14-3": "Can be `NULL` if the price is unknown, and `0` for free trials.\n\nCan be negative for refunds.",
    "15-0": "`takehome_percentage`",
    "15-1": "Double",
    "15-3": "`0.7` or `0.85`",
    "15-2": "The estimated percentage of the transaction price that will be paid out to developers after the Apple/Google platform fee.",
    "17-0": "`transaction_id`",
    "18-0": "`original_transaction_id`",
    "17-1": "String",
    "18-1": "String",
    "17-2": "Transaction identifier from Apple/Google.",
    "18-2": "`transaction_id` of the original transaction in the subscription from Apple/Google."
  },
  "cols": 4,
  "rows": 19
}
[/block]

[block:api-header]
{
  "title": "Cancellation Reasons"
}
[/block]

[block:parameters]
{
  "data": {
    "h-0": "Reason",
    "h-1": "Description",
    "h-2": "App Store",
    "h-3": "Play Store",
    "0-2": "✅",
    "0-3": "✅",
    "0-0": "`UNSUBSCRIBE`",
    "1-0": "`BILLING_ERROR`",
    "2-0": "`DEVELOPER_INITIATED`",
    "3-0": "`PRICE_INCREASE`",
    "5-0": "`UNKNOWN`",
    "1-2": "✅",
    "2-3": "✅",
    "3-2": "✅",
    "5-2": "✅",
    "2-2": "❌",
    "3-3": "❌",
    "5-3": "❌",
    "1-3": "✅",
    "0-1": "Subscriber cancelled voluntarily. **This event fires when a user unsubscribes, not when the subscription expires.**",
    "1-1": "Apple or Google could not charge the subscriber using their payment method.",
    "2-1": "Developer cancelled the subscription.",
    "3-1": "Subscriber did not agree to a price increase.",
    "5-1": "Apple did not provide the reason of the cancellation.",
    "4-0": "`CUSTOMER_SUPPORT`",
    "4-2": "✅",
    "4-3": "✅",
    "4-1": "Customer cancelled through Apple support and received a refund, or a Google subscription was refunded through RevenueCat.",
    "h-4": "Web",
    "2-4": "❌",
    "0-4": "✅",
    "1-4": "❌",
    "3-4": "❌",
    "4-4": "❌",
    "5-4": "❌",
    "0-5": "❌",
    "1-5": "❌",
    "3-5": "❌",
    "4-5": "❌",
    "5-5": "❌",
    "2-5": "✅",
    "h-5": "Promo"
  },
  "cols": 6,
  "rows": 6
}
[/block]

[block:api-header]
{
  "title": "Testing"
}
[/block]
You can test your server side implementation by purchasing [sandbox subscriptions](doc:sandbox) or by issuing test webhook events through [RevenueCat's dashboard](http://app.revenuecat.com).
[block:callout]
{
  "type": "info",
  "title": "Sandbox notifications",
  "body": "Keep in mind that **not all the events are guaranteed to be sent for sandbox subscriptions**. This is due to limitations in the sandbox testing environments."
}
[/block]

[block:api-header]
{
  "title": "Security and best practices"
}
[/block]
### Tracking Subscription Status
Webhooks are commonly used to keep a subscribers status in sync with RevenueCat across multiple systems. The best way to keep a subscription status up-to-date is by updating your system with the `entitlement_ids` and `expiration_at_ms` from every webhook event. By simplifying your logic to rely on just these attributes the event type no longer matters.

### Authorization
You can configure the authorization header used for webhook requests via the [dashboard](https://app.revenuecat.com/). Your server should verify the validity of the authorization header for every notification.

### Response Duration
If your server doesn't finish the response in 60s, RevenueCat will disconnect. We then retry up to 5 times. We recommend that apps respond quickly and defer processing until after the response has been sent.

### Delivery Delays
Most webhooks are usually delivered within 5 to 60 seconds of the event occurring - cancellation events usually are delivered within 2hrs of the user cancelling their subscription. You should be aware of these delivery times when designing your app.

### Future Proofing
You should be able to handle webhooks that include additional fields to what's shown here, including new event types. We may add new fields or event types in the future without changing the API version. We *won't* remove fields or events without proper API versioning and deprecation.
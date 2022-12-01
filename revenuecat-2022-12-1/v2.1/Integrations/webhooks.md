---
title: "Webhooks"
slug: "webhooks"
excerpt: "Enhanced server-to-server notifications from webhooks"
hidden: false
createdAt: "2018-07-03T16:50:02.280Z"
updatedAt: "2019-04-10T19:44:46.356Z"
---
[block:callout]
{
  "type": "success",
  "body": "Webhooks are only available on [paid](https://www.revenuecat.com/pricing) plans."
}
[/block]
RevenueCat can send you notifications any time an event happens in your app. This is useful for subscription and purchase events, which will allow you to monitor state changes for your subscribers and react accordingly. For example, you might want to remind your subscribers of the benefits of your app when they decide to unsubscribe, or let them know when there are billing issues. 
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
RevenueCat will send `POST` requests to your server, in which the body will be a JSON representation of the notification. Your server should return a **200 status code**. Any other status code will be considered a failure by our backend. RevenueCat will retry later (up to 5 times) with an increasing delay. After 5 retries, we will stop sending notifications.

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
    "h-0": "Event Type",
    "h-1": "Description",
    "0-0": "`TEST`",
    "0-1": "Test event issued through the RevenueCat dashboard.",
    "3-0": "`RENEWAL`",
    "3-1": "An existing purchase has been renewed.",
    "4-0": "`PRODUCT_CHANGE`",
    "4-1": "A **subscriber** has changed the product of their subscription.",
    "5-0": "`CANCELLATION`",
    "5-1": "A subscription has been cancelled.",
    "6-0": "`BILLING_ISSUE`",
    "6-1": "There has been a problem trying to charge the subscriber.",
    "h-2": "App Store",
    "h-3": "Play Store",
    "0-2": "✅",
    "3-2": "✅",
    "4-2": "✅",
    "5-2": "✅",
    "6-2": "✅",
    "6-3": "✅",
    "5-3": "✅",
    "4-3": "✅",
    "3-3": "✅",
    "0-3": "✅",
    "1-0": "`INITIAL_PURCHASE`",
    "1-1": "A new subscription has been purchased.",
    "1-2": "✅",
    "1-3": "✅",
    "7-0": "`SUBSCRIBER_ALIAS`",
    "7-1": "A new `app_user_id` has been registered for an existing **subscriber**.",
    "7-2": "✅",
    "7-3": "✅",
    "2-0": "`NON_RENEWING_PURCHASE`",
    "2-2": "✅",
    "2-3": "✅",
    "2-1": "A customer has made a purchase that will not auto-renew.",
    "h-4": "Promotional",
    "2-4": "✅",
    "5-4": "✅",
    "0-4": "❌",
    "1-4": "❌",
    "3-4": "❌",
    "4-4": "❌",
    "6-4": "❌",
    "7-4": "❌"
  },
  "cols": 5,
  "rows": 8
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
      "code": "{\n  \"event\": {\n    \"type\": \"INITIAL_PURCHASE\",\n    \"id\": \"CD489E0E-5D52-4E03-966B-A7F17788E432\",\n    \"app_user_id\": \"00005A1C-6091-4F81-BE77-F0A83A271AB6\",\n    \"aliases\": [\"00005A1C-6091-4F81-BE77-F0A83A271AB6\"],\n    \"product_id\": \"onemonth_free_trial\",\n    \"period_type\": \"TRIAL\",\n    \"purchased_at_ms\": 1530648507000,\n    \"expiration_at_ms\": 1533326907000,\n    \"event_timestamp_ms\": 1530648573000,\n    \"store\": \"PLAY_STORE\",\n    \"environment\": \"SANDBOX\"\n  },\n  \"api_version\": \"1.0\"\n}",
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
    "3-2": "App user id of the subscriber.",
    "0-3": "`TEST`\n\n`INITIAL_PURCHASE`\n\n`NON_RENEWING_PURCHASE`\n\n `RENEWAL`\n\n `PRODUCT_CHANGE`\n\n `CANCELLATION`\n\n `BILLING_ISSUE`\n\n`SUBSCRIBER_ALIAS`",
    "4-0": "`aliases`",
    "4-1": "[String]",
    "4-2": "All app user ids ever used by the subscriber.",
    "2-0": "`event_timestamp_ms`",
    "2-1": "Integer"
  },
  "cols": 4,
  "rows": 5
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
    "2-0": "`period_type`",
    "3-0": "`purchased_at_ms`",
    "4-0": "`expiration_at_ms`",
    "5-0": "`store`",
    "8-0": "`cancel_reason`",
    "9-0": "`new_product_id`",
    "0-1": "String",
    "2-1": "String",
    "5-1": "String",
    "8-1": "String",
    "9-1": "String",
    "3-1": "Integer",
    "4-1": "Integer",
    "0-2": "Product identifier of the subscription.",
    "2-2": "Period type of the transaction.",
    "3-2": "Time when the transaction was purchased. Measured in milliseconds since Unix epoch",
    "4-2": "Expiration of the transaction. Measured in milliseconds since Unix epoch. Use this field to determine if a subscription is still active.",
    "5-2": "Store the subscription belongs to.",
    "8-2": "**Only available for** `CANCELLATION` **events**.\n\nSee [Cancellation Reasons](https://docs.revenuecat.com/docs/webhooks#section-cancellation-reasons).",
    "9-2": "Product identifier of the new product the subscriber has switched to. **Only available for App Store subscriptions and** `PRODUCT_CHANGE` **events**.",
    "2-3": "`TRIAL`, for free trials.\n\n `INTRO`, for introductory pricing.\n\n `NORMAL`, standard subscription.\n\n`PROMOTIONAL`, for subscriptions granted through RevenueCat.",
    "5-3": "`PLAY_STORE`\n\n `APP_STORE`",
    "8-3": "`UNSUBSCRIBE`\n\n `BILLING_ERROR`\n\n`DEVELOPER_INITIATED`\n\n`PRICE_INCREASE`\n\n`CUSTOMER_SUPPORT`\n\n`UNKNOWN`",
    "6-0": "`environment`",
    "6-1": "String",
    "6-2": "Store environment.",
    "6-3": "`SANDBOX`\n\n`PRODUCTION`",
    "7-0": "`is_trial_conversion`",
    "7-1": "Boolean",
    "7-2": "**Only available for** `RENEWAL` **events**. \n\nWhether the previous transaction was a free trial or not.",
    "7-3": "`true` or `false`",
    "1-0": "`entitlement_id`",
    "1-1": "String",
    "1-2": "Entitlement identifier of the subscription.",
    "1-3": "It can be `NULL` if  the `product_id` is not mapped to an entitlement.",
    "4-3": "It can be `NULL` for non-subscription purchases."
  },
  "cols": 4,
  "rows": 10
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
    "4-3": "❌",
    "4-1": "Customer cancelled through Apple support and received a refund.",
    "h-4": "Promotional",
    "2-4": "✅",
    "0-4": "❌",
    "1-4": "❌",
    "3-4": "❌",
    "4-4": "❌",
    "5-4": "❌"
  },
  "cols": 5,
  "rows": 6
}
[/block]

[block:api-header]
{
  "title": "Testing"
}
[/block]
You can test your server side implementation by purchasing [sandbox subscriptions](doc:testing-purchases) or by issuing test webhook events through [RevenueCat's dashboard](http://app.revenuecat.com).
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
### Authorization
You can configure the authorization header used for webhook requests via the [dashboard](https://app.revenuecat.com/). Your server should verify the validity of the authorization header for every notification.

### Response Duration
If your server doesn't finish the response in 60s, RevenueCat will disconnect. We then retry up to 5 times. We recommend that apps respond quickly and defer processing until after the response has been sent.

### Future Proofing
You should be able to handle webhooks that include additional fields to what's shown here, including new event types. We may add new fields or event types in the future without changing the API version. We *won't* remove fields or events without proper API versioning and deprecation.
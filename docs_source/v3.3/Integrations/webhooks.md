---
title: "Webhooks"
slug: "webhooks"
excerpt: "Enhanced server-to-server notifications from webhooks"
hidden: false
metadata: 
  title: "In-App Purchase Webhooks – RevenueCat"
  description: "RevenueCat can send you notifications any time an event happens in your app. This is useful for subscription and purchase events, which will allow you to monitor state changes for your subscribers and react accordingly."
  image: 
    0: "https://files.readme.io/0e2e512-60993e3c40039b67596bcc8c_slack-preview.png"
    1: "60993e3c40039b67596bcc8c_slack-preview.png"
    2: 1200
    3: 627
    4: "#f45476"
createdAt: {}
updatedAt: "2022-02-25T15:44:27.112Z"
---
[block:callout]
{
  "type": "success",
  "body": "Webhooks are available on the [Starter](https://www.revenuecat.com/pricing) plan or greater."
}
[/block]
RevenueCat can send you notifications any time an event happens in your app. This is useful for subscription and purchase events, which will allow you to monitor state changes for your subscribers and react accordingly. 

For example, you might want to remind subscribers of the benefits of your app when they decide to unsubscribe, or let them know when there are billing issues. 

# Registering Your Webhook URL
[block:callout]
{
  "type": "info",
  "title": "One webhook per project in RevenueCat",
  "body": "Each of your projects has a webhook URL field you can set. This way you can decide which of your projects need server-side notifications, and where they should be sent."
}
[/block]
1. Navigate to your project in the RevenueCat dashboard and find the *Integrations* card in the left menu. Select **+ New** 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/bc289d9-Screen_Shot_2021-12-01_at_12.23.10_PM.png",
        "Screen Shot 2021-12-01 at 12.23.10 PM.png",
        332,
        410,
        "#f5f6f5"
      ]
    }
  ]
}
[/block]
2. Choose 'Webhooks' from the Integrations menu
3. Enter the HTTPS URL of the endpoint that you want to receive your webhooks
4. (Optional) Set authorization header that will be sent with each POST request


[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/dad025e-Screen_Shot_2021-12-03_at_11.04.44_AM.png",
        "Screen Shot 2021-12-03 at 11.04.44 AM.png",
        938,
        320,
        "#f9fafa"
      ]
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "title": "Best Practices: Webhook authorization",
  "body": "We recommended setting an authorization header value via the RevenueCat dashboard. When set, RevenueCat will send this header in every request. Your server can use this to authenticate the  webhooks from RevenueCat."
}
[/block]
RevenueCat will send `POST` requests to your server, in which the body will be a JSON representation of the notification. Your server should return a **200 status code**. Any other status code will be considered a failure by our backend. RevenueCat will retry later (up to 5 times) with an increasing delay (5, 10, 20, 40, and 80 minutes). After 5 retries, we will stop sending notifications.

If you're receiving a webhook it's important to respond quickly so you don't accidentally run over a timeout limit. We recommend that apps defer processing until after the response has been sent.

# Webhook Events
## Event Types
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
    "5-1": "A subscription or non-renewing purchase has been cancelled. See [cancellation reasons](doc:webhooks#cancellation-reasons) for more details.",
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
    "h-4": "Amazon",
    "2-4": "✅",
    "5-4": "✅",
    "0-4": "❌",
    "1-4": "✅",
    "3-4": "✅",
    "4-4": "❌",
    "7-4": "✅",
    "8-4": "",
    "0-5": "❌",
    "1-5": "✅",
    "2-5": "✅",
    "3-5": "✅",
    "4-5": "✅",
    "7-5": "✅",
    "8-5": "",
    "5-5": "✅",
    "h-5": "Web",
    "6-0": "`UNCANCELLATION`",
    "6-1": "Auto-renew status has been re-enabled for a subscription.",
    "6-2": "✅",
    "6-3": "✅",
    "6-4": "✅",
    "6-5": "❌",
    "9-0": "`SUBSCRIPTION_PAUSED`",
    "9-1": "A subscription has been paused.",
    "9-3": "✅",
    "9-2": "❌",
    "9-4": "❌",
    "9-5": "❌",
    "10-0": "`TRANSFER`",
    "10-1": "A transfer of transactions and entitlements was initiated between one App User ID(s) to another.",
    "10-2": "✅",
    "10-3": "✅",
    "10-4": "✅",
    "10-5": "✅",
    "11-0": "`EXPIRATION`",
    "11-1": "A subscription has expired and access should be removed.\n\nIf you have [Platform Server Notifications](doc:server-notifications) configured, this event will occur as soon as we are notified (within seconds to minutes) of the expiration.\n\nIf you do not have notifications configured, delays may be approximately 1 hour.",
    "11-2": "✅",
    "11-3": "✅",
    "11-4": "✅",
    "11-5": "✅",
    "h-6": "Promo",
    "0-6": "❌",
    "1-6": "❌",
    "3-6": "❌",
    "4-6": "❌",
    "6-6": "❌",
    "7-6": "❌",
    "9-6": "❌",
    "10-6": "❌",
    "2-6": "✅",
    "5-6": "✅",
    "11-6": "✅"
  },
  "cols": 7,
  "rows": 12
}
[/block]
## Events Format

Webhook events are serialized in JSON. The body of a `POST` request to your server will contain the serialized event, as well as the API version. 
[block:code]
{
  "codes": [
    {
      "code": "{\n  \"api_version\": \"1.0\",\n  \"event\": {\n    \"aliases\": [\n      \"yourCustomerAliasedID\",\n      \"yourCustomerAliasedID\"\n    ],\n    \"app_id\": \"yourAppID\",\n    \"app_user_id\": \"yourCustomerAppUserID\",\n    \"country_code\": \"US\",\n    \"currency\": \"USD\",\n    \"entitlement_id\": \"pro_cat\",\n    \"entitlement_ids\": [\n      \"pro_cat\"\n    ],\n    \"environment\": \"PRODUCTION\",\n    \"event_timestamp_ms\": 1591121855319,\n    \"expiration_at_ms\": 1591726653000,\n    \"id\": \"UniqueIdentifierOfEvent\",\n    \"is_family_share\": false,\n    \"offer_code\": \"free_month\",\n    \"original_app_user_id\": \"OriginalAppUserID\",\n    \"original_transaction_id\": \"1530648507000\",\n    \"period_type\": \"NORMAL\",\n    \"presented_offering_id\": \"OfferingID\",\n    \"price\": 2.49,\n    \"price_in_purchased_currency\": 2.49,\n    \"product_id\": \"onemonth_no_trial\",\n    \"purchased_at_ms\": 1591121853000,\n    \"store\": \"APP_STORE\",\n    \"subscriber_attributes\": {\n      \"$Favorite Cat\": {\n        \"updated_at_ms\": 1581121853000,\n        \"value\": \"Garfield\"\n      }\n    },\n    \"takehome_percentage\": 0.7,\n    \"transaction_id\": \"170000869511114\",\n    \"type\": \"INITIAL_PURCHASE\"\n  }\n}",
      "language": "json"
    }
  ]
}
[/block]
## Common Fields
[block:parameters]
{
  "data": {
    "h-0": "Field",
    "h-1": "Type",
    "h-2": "Description",
    "h-3": "Possible Values",
    "0-0": "`type`",
    "1-0": "`id`",
    "4-0": "`app_user_id`",
    "0-1": "String",
    "1-1": "String",
    "4-1": "String",
    "0-2": "[Type of the event](doc:webhooks#section-event-types).",
    "1-2": "Unique identifier of the event.",
    "4-2": "Last seen app user id of the subscriber.",
    "0-3": "`TEST`\n\n`INITIAL_PURCHASE`\n\n`NON_RENEWING_PURCHASE`\n\n `RENEWAL`\n\n `PRODUCT_CHANGE`\n\n `CANCELLATION`\n\n `BILLING_ISSUE`\n\n`SUBSCRIBER_ALIAS`\n\n`SUBSCRIPTION_PAUSED`\n\n`TRANSFER`",
    "6-0": "`aliases`",
    "6-1": "[String]",
    "6-2": "All app user ids ever used by the subscriber.",
    "3-0": "`event_timestamp_ms`",
    "3-1": "Integer",
    "5-0": "`original_app_user_id`",
    "5-1": "String",
    "5-2": "The first app user id used by the subscriber.",
    "3-2": "The time that the event was generated. Does not necessarily coincide with when the action that triggered the event occurred (purchased, cancelled, etc).",
    "2-0": "`app_id`",
    "2-1": "String",
    "2-2": "Unique identifier of the app the event is associated with. Corresponds to an app within a project.\n\nThis value will soon be visible in the app's configuration page in project settings."
  },
  "cols": 4,
  "rows": 7
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
## Subscription Lifecycle Events Fields
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
    "6-0": "`expiration_at_ms`",
    "8-0": "`store`",
    "11-0": "`cancel_reason`",
    "13-0": "`new_product_id`",
    "0-1": "String",
    "3-1": "String",
    "8-1": "String",
    "11-1": "String",
    "13-1": "String",
    "4-1": "Integer",
    "6-1": "Integer",
    "0-2": "Product identifier of the subscription.",
    "3-2": "Period type of the transaction.",
    "4-2": "Time when the transaction was purchased. Measured in milliseconds since Unix epoch",
    "6-2": "Expiration of the transaction. Measured in milliseconds since Unix epoch. Use this field to determine if a subscription is still active.",
    "8-2": "Store the subscription belongs to.",
    "11-2": "**Only available for** `CANCELLATION` **events**.\n\nSee [Cancellation and Expiration Reasons](https://docs.revenuecat.com/docs/webhooks#cancellation-and-expiration-reasons).",
    "13-2": "Product identifier of the new product the subscriber has switched to. **Only available for App Store subscriptions and** `PRODUCT_CHANGE` **events**.",
    "3-3": "`TRIAL`, for free trials.\n\n `INTRO`, for introductory pricing.\n\n `NORMAL`, standard subscription.\n\n`PROMOTIONAL`, for subscriptions granted through RevenueCat.",
    "8-3": "`AMAZON`\n\n`APP_STORE`\n\n`MAC_APP_STORE`\n\n`PLAY_STORE`\n\n`PROMOTIONAL`\n\n`STRIPE`",
    "11-3": "`UNSUBSCRIBE`\n\n `BILLING_ERROR`\n\n`DEVELOPER_INITIATED`\n\n`PRICE_INCREASE`\n\n`CUSTOMER_SUPPORT`\n\n`UNKNOWN`",
    "9-0": "`environment`",
    "9-1": "String",
    "9-2": "Store environment.",
    "9-3": "`SANDBOX`\n\n`PRODUCTION`",
    "10-0": "`is_trial_conversion`",
    "10-1": "Boolean",
    "10-2": "**Only available for** `RENEWAL` **events**. \n\nWhether the previous transaction was a free trial or not.",
    "10-3": "`true` or `false`",
    "1-0": "`entitlement_ids`",
    "1-1": "[String]",
    "1-2": "Entitlement identifiers of the subscription.",
    "1-3": "It can be `NULL` if  the `product_id` is not mapped to any entitlements.",
    "6-3": "It can be `NULL` for non-subscription purchases.",
    "14-0": "`presented_offering_id`",
    "14-1": "String",
    "14-2": "**Not available for apps using legacy entitlements.**\n\nThe identifier for the offering that was presented to the user during their initial purchase.",
    "2-0": "`entitlement_id`",
    "2-1": "String",
    "2-2": "Deprecated. See `entitlement_ids`.",
    "2-3": "Deprecated. See `entitlement_ids`.",
    "19-0": "`subscriber_attributes`",
    "19-1": "Map of attribute names to attribute objects.\n\nFor more details see the [subscriber attributes guide](https://docs.revenuecat.com/docs/subscriber-attributes).",
    "19-3": "",
    "15-0": "`price`",
    "15-1": "Double",
    "15-2": "The USD price of the transaction.",
    "15-3": "Can be `NULL` if the price is unknown, and `0` for free trials.\n\nCan be negative for refunds.",
    "16-0": "`currency`",
    "16-1": "String",
    "16-3": "`USD`, `CAD`, etc.\n\nCan be `NULL` if the currency is unknown.",
    "16-2": "The ISO 4217 currency code that the product was purchased in.",
    "17-0": "`price_in_purchased_currency`",
    "17-1": "Double",
    "17-2": "The price of the transaction in the currency the product was purchased in.",
    "17-3": "Can be `NULL` if the price is unknown, and `0` for free trials.\n\nCan be negative for refunds.",
    "18-0": "`takehome_percentage`",
    "18-1": "Double",
    "18-3": "`0.7` or `0.85`",
    "18-2": "The estimated percentage of the transaction price that will be paid out to developers after the Apple/Amazon/Google platform fee.",
    "20-0": "`transaction_id`",
    "21-0": "`original_transaction_id`",
    "20-1": "String",
    "21-1": "String",
    "20-2": "Transaction identifier from Apple/Amazon/Google/Stripe.",
    "21-2": "`transaction_id` of the original transaction in the subscription from Apple/Amazon/Google/Stripe.",
    "5-0": "`grace_period_expiration_at_ms`",
    "5-1": "Integer",
    "5-2": "**Only available for** `BILLING_ISSUE` **events.** \n\nThe time that the grace period for the subscription would expire. Measured in milliseconds since Unix epoch. Use this field to determine if the user is currently in a grace period.",
    "5-3": "It can be `NULL` if subscription does not have a grace period.",
    "7-0": "`auto_resume_at_ms`",
    "7-1": "Integer",
    "7-2": "The time when an Android subscription would resume after being paused. Measured in milliseconds since Unix epoch.\n\n** Only available for Play Store subscriptions and** `SUBSCRIPTION_PAUSED` **events.**",
    "7-3": "",
    "22-0": "`is_family_share`",
    "22-1": "Boolean",
    "22-3": "`true` or `false`\n\nAlways false for non-Apple purchases.",
    "22-2": "Indicates if the user made this purchase or if it was shared to them via [Family Sharing](https://help.apple.com/app-store-connect/#/dev45b03fab9).",
    "23-0": "`transferred_from`",
    "24-0": "`transferred_to`",
    "23-1": "[String]",
    "24-1": "[String]",
    "23-2": "**This fields is only available when `type` is set to `TRANSFER`.**\n\nApp User ID(s) that transactions and entitlements are being taken from, and granted to `transferred_to`.",
    "24-2": "**This field is only available when `type` is set to `TRANSFER`.**\n\nApp User ID(s) that are receiving the transactions and entitlements taken from `transferred_from`.",
    "25-0": "`country_code`",
    "25-1": "String",
    "25-2": "The ISO 3166 country code that the product was purchased in.\n\nThe two-letter country code (e.g., US, GB, CA) of the app user's location (this country code is derived from the last seen request from the SDK for the subscriber.)",
    "25-3": "`US`, `CA`, etc.",
    "12-0": "`expiration_reason`",
    "12-1": "String",
    "12-2": "**Only available for** `EXPIRATION` **events**.\n\nSee [Cancellation and Expiration Reasons](https://docs.revenuecat.com/docs/webhooks#cancellation-and-expiration-reasons).",
    "12-3": "`UNSUBSCRIBE`\n\n `BILLING_ERROR`\n\n`DEVELOPER_INITIATED`\n\n`PRICE_INCREASE`\n\n`CUSTOMER_SUPPORT`\n\n`UNKNOWN`",
    "26-0": "`offer_code`",
    "26-1": "String",
    "26-2": "**This field is not available when `type` is set to `SUBSCRIBER_ALIAS` or `TRANSFER`.**\n\nThe offer code that the customer used to redeem the transaction.\n\nAvailable for App Store and Play Store. For App Store this property corresponds to the [`offer_code_ref_name`](https://developer.apple.com/documentation/appstorereceipts/offer_code_ref_name). For Play Store this corresponds to the [`promotionCode`](https://developers.google.com/android-publisher/api-ref/rest/v3/purchases.subscriptions).",
    "26-3": "Can be null if no offer code was used for this product."
  },
  "cols": 4,
  "rows": 27
}
[/block]
## Cancellation and Expiration Reasons
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
    "2-2": "✅",
    "3-3": "❌",
    "5-3": "❌",
    "1-3": "✅",
    "0-1": "Subscriber cancelled voluntarily. **This event fires when a user unsubscribes, not when the subscription expires.**",
    "1-1": "Apple, Amazon, orGoogle could not charge the subscriber using their payment method.\n\nThe `CANCELLATION` event with cancellation reason `BILLING_ERROR` is fired as soon as the billing issue has been detected. The `EXPIRATION` event with expiration reason `BILLING_ERROR` is fired if the grace period (if set up) has ended without recovering the payment, and the customer should lose access to the subscription.",
    "2-1": "Developer cancelled the subscription.",
    "3-1": "Subscriber did not agree to a price increase.",
    "5-1": "Apple did not provide the reason of the cancellation.",
    "4-0": "`CUSTOMER_SUPPORT`",
    "4-2": "✅",
    "4-3": "✅",
    "4-1": "Customer cancelled through Apple support and received a refund, a Play Store subscription was refunded through RevenueCat, an Amazon subscription was refunded through Amazon support, or a web subscription was refunded.",
    "h-4": "Amazon",
    "2-4": "❌",
    "0-4": "✅",
    "1-4": "✅",
    "3-4": "❌",
    "4-4": "✅",
    "5-4": "❌",
    "0-5": "✅",
    "1-5": "❌",
    "3-5": "❌",
    "4-5": "✅",
    "5-5": "❌",
    "2-5": "❌",
    "h-5": "Web",
    "6-0": "`SUBSCRIPTION_PAUSED`",
    "6-1": "The subscription expired because it was paused (only `EXPIRATION` event)",
    "6-2": "❌",
    "6-3": "✅",
    "6-4": "❌",
    "6-5": "❌",
    "h-6": "Promo",
    "0-6": "❌",
    "4-6": "❌",
    "1-6": "❌",
    "2-6": "✅",
    "3-6": "❌",
    "5-6": "❌",
    "6-6": "❌"
  },
  "cols": 7,
  "rows": 7
}
[/block]
# Testing

You can test your server side implementation by purchasing [sandbox subscriptions](doc:sandbox) or by issuing test webhook events through [RevenueCat's dashboard](http://app.revenuecat.com).

When testing with sandbox purchases, the `environment` value will be `SANDBOX`. RevenueCat itself does not have sandbox and production environments, so this value is only determined by the type of transaction received from the store. The same customer in RevenueCat can have both sandbox and production transactions associated with their account. 

# Syncing Subscription Status
Webhooks are commonly used to keep a subscribers status in sync with RevenueCat across multiple systems. To simplify the logic of handling different webhook types, we recommend creating a polling system using the `GET /subscribers` [REST API](https://docs.revenuecat.com/reference#subscribers) to sync the subscription status of the customer from RevenueCat to your database. Then, each webhook event can simply be a trigger to call this sync function. This approach has a few benefits and can make your system more robust and scalable. 

# Security and Best Practices

## Authorization
You can configure the authorization header used for webhook requests via the [dashboard](https://app.revenuecat.com/). Your server should verify the validity of the authorization header for every notification.

## Response Duration
If your server doesn't finish the response in 60s, RevenueCat will disconnect. We then retry up to 5 times. We recommend that apps respond quickly and defer processing until after the response has been sent.

## Delivery Delays
Most webhooks are usually delivered within 5 to 60 seconds of the event occurring - cancellation events usually are delivered within 2hrs of the user cancelling their subscription. You should be aware of these delivery times when designing your app.

## Future Proofing
You should be able to handle webhooks that include additional fields to what's shown here, including new event types. We may add new fields or event types in the future without changing the API version. We *won't* remove fields or events without proper API versioning and deprecation.

# Sample Webhook Events

These are some representative samples of webhooks you might receive from RevenueCat. Keep in mind that webhooks can include additional fields to what's shown here.
[block:code]
{
  "codes": [
    {
      "code": "{\n  \"event\" : {\n    \"event_timestamp_ms\" : 1601337615995,\n    \"product_id\" : \"com.revenuecat.myapp.monthly\",\n    \"period_type\" : \"NORMAL\",\n    \"purchased_at_ms\" : 1601258901000,\n    \"expiration_at_ms\" : 1601336705000,\n    \"environment\" : \"PRODUCTION\",\n    \"entitlement_id\" : \"pro\",\n    \"entitlement_ids\" : [\n      \"pro\"\n    ],\n    \"presented_offering_id\" : \"defaultoffering\",\n    \"transaction_id\" : \"100000000000000\",\n    \"original_transaction_id\" : \"100000000000000\",\n    \"app_user_id\" : \"$RCAnonymousID:12345678-1234-ABCD-1234-123456789123\",\n    \"aliases\" : [\n      \"$RCAnonymousID:12345678-1234-1234-1234-123456789123\",\n      \"user_1234\"\n    ],\n    \"offer_code\": null,\n    \"original_app_user_id\" : \"$RCAnonymousID:12345678-1234-1234-1234-123456789123\",\n    \"cancel_reason\" : \"CUSTOMER_SUPPORT\",\n    \"currency\" : \"USD\",\n    \"price\" : -9.99,\n    \"price_in_purchased_currency\" : -9.99,\n    \"subscriber_attributes\" : {\n      \"$idfa\" : {\n        \"value\" : \"12345678-1234-1234-1234-12345678912x\",\n        \"updated_at_ms\" : 1578018408238\n      },\n      \"$appsflyerId\" : {\n        \"value\" : \"1234567891234-1234567\",\n        \"updated_at_ms\" : 1578018408238\n      }\n    },\n    \"store\" : \"APP_STORE\",\n    \"takehome_percentage\" : 0.7,\n    \"type\" : \"CANCELLATION\",\n    \"id\" : \"12345678-1234-1234-1234-12345678912\"\n  },\n  \"api_version\" : \"1.0\"\n}",
      "language": "json",
      "name": "Refund"
    },
    {
      "code": "{\n  \"event\" : {\n    \"event_timestamp_ms\" : 1601337601013,\n    \"product_id\" : \"com.revenuecat.myapp.monthly\",\n    \"period_type\" : \"NORMAL\",\n    \"purchased_at_ms\" : 1598640647000,\n    \"expiration_at_ms\" : 1601319047000,\n    \"environment\" : \"PRODUCTION\",\n    \"entitlement_id\" : \"pro\",\n    \"entitlement_ids\" : [\n      \"pro\"\n    ],\n    \"presented_offering_id\" : \"defaultoffering\",\n    \"transaction_id\" : \"100000000000002\",\n    \"original_transaction_id\" : \"100000000000000\",\n    \"app_user_id\" : \"$RCAnonymousID:12345678-1234-1234-1234-123456789123\",\n    \"aliases\" : [\n      \"$RCAnonymousID:12345678-1234-1234-1234-123456789123\"\n    ],\n    \"offer_code\": \"summer_special\",\n    \"original_app_user_id\" : \"$RCAnonymousID:12345678-1234-1234-1234-123456789123\",\n    \"currency\" : \"USD\",\n    \"price\" : 0,\n    \"price_in_purchased_currency\" : 0,\n    \"subscriber_attributes\" : {\n      \"$idfa\" : {\n        \"value\" : \"12345678-1234-1234-1234-12345678912x\",\n        \"updated_at_ms\" : 1578018408238\n      },\n      \"$appsflyerId\" : {\n        \"value\" : \"1234567891234-1234567\",\n        \"updated_at_ms\" : 1578018408238\n      }\n    },\n    \"store\" : \"APP_STORE\",\n    \"takehome_percentage\" : 0.7,\n    \"type\" : \"BILLING_ISSUE\",\n    \"id\" : \"12345678-1234-1234-1234-12345678912\"\n  },\n  \"api_version\" : \"1.0\"\n}",
      "language": "json",
      "name": "Billing Issue"
    },
    {
      "code": "{\n  \"event\" : {\n    \"event_timestamp_ms\" : 1601338594769,\n    \"product_id\" : \"com.revenuecat.myapp.monthly\",\n    \"period_type\" : \"NORMAL\",\n    \"purchased_at_ms\" : 1601304429682,\n    \"expiration_at_ms\" : 1601311606660,\n    \"environment\" : \"PRODUCTION\",\n    \"entitlement_id\" : \"subscription\",\n    \"entitlement_ids\" : [\n      \"subscription\"\n    ],\n    \"presented_offering_id\" : \"defaultoffering\",\n    \"transaction_id\" : \"GPA.1234-1234-1234-12345\",\n    \"original_transaction_id\" : \"GPA.1234-1234-1234-12345\",\n    \"app_user_id\" : \"$RCAnonymousID:12345678-1234-1234-1234-123456789123\",\n    \"aliases\" : [\n      \"$RCAnonymousID:12345678-1234-1234-1234-123456789123\"\n    ],\n    \"offer_code\": null,\n    \"original_app_user_id\" : \"$RCAnonymousID:12345678-1234-1234-1234-123456789123\",\n    \"new_product_id\" : \"com.revenuecat.myapp.yearly\",\n    \"currency\" : \"USD\",\n    \"price\" : 0,\n    \"price_in_purchased_currency\" : 0,\n    \"subscriber_attributes\" : {},\n    \"store\" : \"PLAY_STORE\",\n    \"takehome_percentage\" : 0.70,\n    \"type\" : \"PRODUCT_CHANGE\",\n    \"id\" : \"12345678-1234-1234-1234-12345678912\"\n  },\n  \"api_version\" : \"1.0\"\n}",
      "language": "json",
      "name": "Product change"
    },
    {
      "code": "{\n  \"event\": {\n    \"event_timestamp_ms\": 1601337615995,\n    \"product_id\": \"com.revenuecat.myapp.weekly\",\n    \"period_type\": \"NORMAL\",\n    \"purchased_at_ms\": 1601417766000,\n    \"expiration_at_ms\": 1602022566000,\n    \"environment\": \"PRODUCTION\",\n    \"entitlement_id\": \"pro\",\n    \"entitlement_ids\": [\n      \"pro\"\n    ],\n    \"presented_offering_id\": \"defaultoffering\",\n    \"transaction_id\": \"100000000000002\",\n    \"original_transaction_id\": \"100000000000000\",\n    \"app_user_id\": \"$RCAnonymousID:12345678-1234-1234-1234-123456789123\",\n    \"aliases\": [\n      \"$RCAnonymousID:12345678-1234-ABCD-1234-123456789123\",\n      \"user_1234\"\n    ],\n    \"offer_code\": \"free_month\",\n    \"original_app_user_id\": \"$RCAnonymousID:12345678-1234-ABCD-1234-123456789123\",\n    \"cancel_reason\": \"UNSUBSCRIBE\",\n    \"currency\": \"USD\",\n    \"price\": 0.0,\n    \"price_in_purchased_currency\": 0.0,\n    \"subscriber_attributes\": {\n      \"$idfa\": {\n        \"value\": \"12345678-1234-1234-1234-12345678912x\",\n        \"updated_at_ms\": 1578018408238\n      },\n      \"$appsflyerId\": {\n        \"value\": \"1234567891234-1234567\",\n        \"updated_at_ms\": 1578018408238\n      },\n      \"favorite_food\": {\n        \"value\": \"pizza\",\n        \"updated_at_ms\": 1578018408238\n      }\n    },\n    \"store\": \"APP_STORE\",\n    \"takehome_percentage\": 0.7,\n    \"type\": \"CANCELLATION\",\n    \"id\": \"12345678-ABCD-1234-ABCD-12345678912\"\n  },\n  \"api_version\": \"1.0\"\n}",
      "language": "json",
      "name": "Unsubscribe"
    },
    {
      "code": "{\n \"event\": {\n     \"type\": \"TRANSFER\",\n     \"id\": \"CD489E0E-5D52-4E03-966B-A7F17788E432\",\n     \"store\": \"APP_STORE\",\n     \"transferred_from\": [\"00005A1C-6091-4F81-BE77-F0A83A271AB6\"],\n     \"transferred_to\": [\"4BEDB450-8EF2-11E9-B475-0800200C9A66\"],\n     \"event_timestamp_ms\": 78789789798798\n },\n \"api_version\": \"1.0\"\n}",
      "language": "json",
      "name": "Transfer"
    }
  ]
}
[/block]
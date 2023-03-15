---
title: Amplitude
slug: amplitude
excerpt: Integrate in-app subscription events from RevenueCat with Amplitude
hidden: false
metadata:
  title: Amplitude Integration – RevenueCat
  description: 'RevenueCat can automatically send subscription revenue events into
    Amplitude. This is useful for seeing all events and revenue that occur for your
    app even if it''s not active for a period of time. The Amplitude integration tracks
    the following events:'
  image:
    0: https://files.readme.io/2b7bab7-RevenueCat_Docs_OG.png
    1: RevenueCat Docs OG.png
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: '2023-01-03T22:47:50.789Z'
updatedAt: '2023-01-03T22:47:50.789Z'
category: 640a7bf1c7bae2004235517b
---
[block:callout]
{
  "type": "success",
  "body": "The Amplitude integration is available on the [Pro](https://www.revenuecat.com/pricing) plan."
}
[/block]
Amplitude can be a useful integration tool for seeing all events and revenue that occur for your app even if it’s not active for a period of time. You can use Amplitude’s product analytics to find patterns in customer behavior and inform marketing strategies.

With our Amplitude integration, you can:
- Create a behavioral cohort of customers based on specific actions, such as watching a specific episode of a show after subscribing.  Follow a cohort throughout their lifecycle to realize overarching trends.
- Measure the path of a user from marketing material to the purchase of a subscription. 

With accurate and up-to-date subscription data in Amplitude, you'll be set to turbocharge your product analytics ⚡️

# Events

The Amplitude integration tracks the following events:
[block:parameters]
{
  "data": {
    "h-0": "Event",
    "h-1": "Description",
    "0-0": "Initial Purchase",
    "1-0": "Trial Started",
    "2-0": "Trial Converted",
    "3-0": "Trial Cancelled",
    "4-0": "Renewal",
    "5-0": "Cancellation",
    "7-0": "Non Subscription Purchase",
    "0-1": "A new subscription has been purchased or a lapsed user has resubscribed.",
    "1-1": "The start of an auto-renewing subscription product free trial.",
    "2-1": "When an auto-renewing subscription product converts from a free trial to normal paid period.",
    "3-1": "When a user turns off renewals for an auto-renewing subscription product during a free trial period.",
    "4-1": "An existing subscription has been renewed.",
    "5-1": "When a user turns off renewals for an auto-renewing subscription product during the normal paid period.",
    "7-1": "The purchase of any product that's not an auto-renewing subscription.",
    "6-0": "Uncancellation",
    "6-1": "When a user re-enables the auto-renew status for a subscription.",
    "9-0": "Expiration",
    "9-1": "A subscription has expired and access should be removed.",
    "10-0": "Billing Issues",
    "10-1": "There has been a problem trying to charge the subscriber. \n\nThis does not mean the subscription has expired (in the case of a grace period enabled).",
    "8-0": "Subscription paused",
    "8-1": "A subscription has been paused.",
    "11-0": "Product Change",
    "11-1": "When user has changed the product of their subscription.\n\nThis does not mean the new subscription is in effect immediately. See [Managing Subscriptions](doc:managing-subscriptions) for more details on updates, downgrades, and crossgrades."
  },
  "cols": 2,
  "rows": 12
}
[/block]

For events that have revenue, such as trial conversions and renewals, RevenueCat will automatically record this amount along with the event in Amplitude.

# Setup

## 1. Set Amplitude User Identity

If you're using the Amplitude SDK, you can set the User Id to match the RevenueCat App User Id. This way, events sent from the Amplitude SDK and events sent from RevenueCat can be synced to the same user.

Configure the Amplitude SDK with the same App User Id as RevenueCat or use the `.setUserId()` method on the Amplitude SDK.
```swift
// Configure Purchases SDK
Purchases.configure(withAPIKey: "public_sdk_key", appUserID: "my_app_user_id")

// Configure Amplitude SDK
Amplitude.instance()?.initializeApiKey("amplitude_api_key", userId: "my_app_user_id")

// Optional User Alias Object attributes
Purchases.shared.attribution.setAttributes(["$amplitudeDeviceId" : <AMPLITUDE_DEVICE_ID>])
```
```objectivec
// Configure Purchases SDK
[RCPurchases configureWithAPIKey:@"public_sdk_key" appUserID:@"my_app_user_id"];

// Configure Amplitude SDK
[[Amplitude] instance] initializeApiKey:@"amplitude_api_key" userId:@"my_app_user_id"];
```
```java
// Configure Purchases SDK
Purchases.configure(this, "public_sdk_key", "my_app_user_id");

// Configure Amplitude SDK
Amplitude.getInstance().initialize(this, "amplitude_api_key", "my_app_user_id");
```

## (Optional) Send Amplitude User Identifiers to RevenueCat

If your App User ID in RevenueCat is different than the User ID in Amplitude, you can use the Amplitude User ID and/or Amplitude Device ID to identify events by adding a key in [Subscriber Attributes](doc:subscriber-attributes).
[block:parameters]
{
  "data": {
    "h-0": "Key",
    "h-1": "Description",
    "h-2": "Required",
    "0-0": "`$amplitudeDeviceId`",
    "0-1": "The Amplitude [Device ID](https://developers.amplitude.com/docs/http-api-deprecated#keys-for-the-event-argument)",
    "1-0": "`$amplitudeUserId`",
    "1-1": "The Amplitude [User ID] (https://developers.amplitude.com/docs/http-api-deprecated#keys-for-the-event-argument)"
  },
  "cols": 2,
  "rows": 2
}
[/block]
If both keys are present, RevenueCat will send both the User ID and Device ID to identify events into Amplitude. If only one of the keys are present, RevenueCat will only send the available key. If no keys are present, RevenueCat will send the current RevenueCat App User ID. This property can be set and removed manually, like any other [Subscriber Attribute](doc:subscriber-attributes). For more information how Amplitude tracks unique users, view their docs [here](https://help.amplitude.com/hc/en-us/articles/115003135607-Tracking-unique-users).

## 2. Send RevenueCat Events to Amplitude
[block:callout]
{
  "type": "info",
  "title": "Amplitude EU Data Centre",
  "body": "[Contact RevenueCat support](https://app.revenuecat.com/settings/support) to have RevenueCat send data to Amplitude's EU data centre if your Amplitude account is hosted on EU servers."
}
[/block]
After you've set up the *Purchases SDK* and Amplitude SDK to have the same user identity, you can "turn on" the integration and configure the event names from the RevenueCat dashboard.

1. Navigate to your project in the RevenueCat dashboard and find the *Integrations* card in the left menu. Select **+ New** 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/a786ada-Screen_Shot_2021-12-01_at_12.23.10_PM.png",
        "Screen Shot 2021-12-01 at 12.23.10 PM.png",
        332,
        410,
        "#f5f6f5"
      ]
    }
  ]
}
[/block]
2. Choose **Amplitude** from the Integrations menu
3. Add your Amplitude API key
4. Enter the event names that RevenueCat will send or choose the default event names
5. Select whether you want sales reported as gross revenue (before app store commission), or after store commission and/or estimated taxes.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/1c43a25-Amplitude.png",
        "Amplitude.png",
        1811,
        3405,
        "#fbfcfc"
      ],
      "caption": "Amplitude configuration page"
    }
  ]
}
[/block]
# Sample Event
Below are sample JSONs that are delivered to Amplitude for each event type.
```json
{
    "api_key": "yourAmplitudeAPIKey",
    "event": {
        "event_type": "Uncancellation",
        "partner_id": "revenuecat",
        "insert_id": "a12bc3d4-e5fg-678h-91i0-j23klmn45678",
        "time": 1663779027932,
        "platform": "iOS",
        "revenue": 0.0,
        "productId": "rc_subscription_monthly",
        "event_properties": {
            "subscriber_attributes": {
                "$attConsentStatus": "denied", 
                "$amplitudeDeviceId": "123a4b56-7890-12cd-345e-67f90gh1ij1k"
            },
            "period_type": "NORMAL",
            "purchased_at": "2022-08-24T23:10:10Z",
            "expiration_at": "2023-08-24T23:10:10Z",
            "environment": "PRODUCTION",
            "entitlement_id": "pro",
            "entitlement_ids": [
                "pro"
            ],
            "presented_offering_id": "Subscription",
            "transaction_id": "123456789012345",
            "original_transaction_id": "011223344556677",
            "aliases": [
                "$RCAnonymousID: 121abc123a4abc123123abc123abc1230"
            ],
            "original_app_user_id": "$RCAnonymousID: 1234567890ab1cd1234a55b6c78910a3",
            "store": "APP_STORE",
            "app_user_id": "$RCAnonymousID: 1234567890ab1cd1234a55b6c78910a3",
            "product_id": "rc_subscription_monthly",
            "currency": "EUR",
            "revenue": 0.0,
            "app_id": "app1234567890"
        },
    "user_id": "$RCAnonymousID: 1234567890ab1cd1234a55b6c78910a3"
    }
}
```

```json
{
    "api_key": "yourAmplitudeAPIKey",
    "event": {
        "event_type": "Subscription Product Changed",
        "partner_id": "revenuecat",
        "insert_id": "a12bc3d4-e5fg-678h-91i0-j23klmn45678",
        "time": 1663786694542,
        "platform": "iOS",
        "revenue": 0.0,
        "productId": "rc_subscription_monthly",
        "event_properties": {
            "subscriber_attributes": {
                "$attConsentStatus": "denied", 
                "$amplitudeDeviceId": "123a4b56-7890-12cd-345e-67f90gh1ij1k"
            },
            "period_type": "NORMAL",
            "purchased_at": "2020-09-03T15:44:46Z",
            "expiration_at": "2021-09-03T15:44:46Z",
            "environment": "PRODUCTION",
            "entitlement_id": "all-access",
            "entitlement_ids": [
                "all-access"
            ],
            "presented_offering_id": "Subscription",
            "transaction_id": "123456789012345",
            "original_transaction_id": "011223344556677",
            "aliases": [
                "$RCAnonymousID: 121abc123a4abc123123abc123abc1230"
            ],
            "original_app_user_id": "$RCAnonymousID: 1234567890ab1cd1234a55b6c78910a3",
            "store": "APP_STORE",
            "app_user_id": "$RCAnonymousID: 1234567890ab1cd1234a55b6c78910a3",
            "product_id": "rc_subscription_monthly",
            "currency": "USD",
            "revenue": 0.0,
            "new_product_id": "rc_subscription_yearly",
            "app_id": "app1234567890"
        },
    "user_id": "$RCAnonymousID:1234567890ab1cd1234a55b6c78910a3"
    }
}
```
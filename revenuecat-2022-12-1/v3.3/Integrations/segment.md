---
title: "Segment"
slug: "segment"
excerpt: "Integrate in-app subscription events from RevenueCat with Segment"
hidden: false
metadata: 
  title: "Segment Integration – RevenueCat"
  description: "RevenueCat can automatically send subscription events into Segment. From there, you pass these events on to any of the hundreds of other integrations on their platform. This is useful for tracking all events and revenue that occur for your app even if it's not active for a period of time."
  image: 
    0: "https://files.readme.io/27173ae-60993e3c40039b67596bcc8c_slack-preview.png"
    1: "60993e3c40039b67596bcc8c_slack-preview.png"
    2: 1200
    3: 627
    4: "#f45476"
createdAt: {}
updatedAt: "2021-12-03T03:49:14.623Z"
---
[block:callout]
{
  "type": "success",
  "body": "The Segment integration is available on the [Pro](https://www.revenuecat.com/pricing) plan."
}
[/block]
RevenueCat can automatically send subscription events into Segment. From there, you pass these events on to any of the hundreds of other integrations on their platform. This is useful for tracking all events and revenue that occur for your app even if it's not active for a period of time.

# Events

The Segment integration tracks the following events:
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
    "0-1": "The first purchase of an auto-renewing subscription product that does not contain a free trial.",
    "1-1": "The start of an auto-renewing subscription product free trial.",
    "2-1": "When an auto-renewing subscription product converts from a free trial to normal paid period.",
    "3-1": "When a user turns off renewals for an auto-renewing subscription product during a free trial period.",
    "4-1": "When an auto-renewing subscription product renews OR a user repurchases the auto-renewing subscription product after a lapse in their subscription.",
    "5-1": "When a user turns off renewals for an auto-renewing subscription product during the normal paid period.",
    "7-1": "The purchase of any product that's not an auto-renewing subscription.",
    "6-0": "Uncancellation",
    "6-1": "When a user re-enables the auto-renew status for a subscription.",
    "8-0": "Subscription paused",
    "8-1": "A subscription has been paused.",
    "9-0": "Expiration",
    "9-1": "A subscription has expired and access should be removed.",
    "10-0": "Billing Issues",
    "10-1": "There has been a problem trying to charge the subscriber. \n \nThis does not mean the subscription has expired (in the case of a grace period enabled)."
  },
  "cols": 2,
  "rows": 11
}
[/block]
For events that have revenue, such as trial conversions and renewals, RevenueCat will automatically record this amount along with the event in Segment.

# Setup

## 1. Set Segment User Identity

If you're using the Segment SDK, you can set the User ID to match the RevenueCat App User Id. This way, events sent from the Segment SDK and events sent from RevenueCat can be synced to the same user.

Use the `.identify()` method on the Segment SDK to set the same App User Id that is set in RevenueCat.
[block:code]
{
  "codes": [
    {
      "code": "// Configure Purchases SDK\nPurchases.configure(withAPIKey: \"public_sdk_key\", appUserID: \"my_app_user_id\")\n\n// Set App User Id in Segment\nSEGAnalytics.sharedAnalytics().identify(\"my_app_user_id\")",
      "language": "swift"
    },
    {
      "code": "// Configure Purchases SDK\n[RCPurchases configureWithAPIKey:@\"public_sdk_key\" appUserID:@\"my_app_user_id\"];\n\n// Set App User Id in Segment\n[[SEGAnalytics sharedAnalytics] identify:@\"my_app_user_id\"];",
      "language": "objectivec"
    },
    {
      "code": "// Configure Purchases SDK\nPurchases.configure(this, \"public_sdk_key\", \"my_app_user_id\");\n\n// Set App User Id in Segment\nAnalytics.with(context).identify(\"my_app_user_id\", null, null);",
      "language": "java"
    }
  ]
}
[/block]
## 2. Generate a Segment Write Key

In Segment, add a HTTP API as a source and copy the Write Key.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/4ae883d-Screen_Shot_2019-04-19_at_12.22.24_PM.png",
        "Screen Shot 2019-04-19 at 12.22.24 PM.png",
        1282,
        647,
        "#f5f7f8"
      ]
    }
  ]
}
[/block]

## 3. Send RevenueCat events to Segment

After you've set up the *Purchases SDK* and Segment SDK to have the same user identity, you can "turn on" the integration and configure the event names from the RevenueCat dashboard.

1. Navigate to your project in the RevenueCat dashboard and find the *Integrations* card in the left menu. Select **+ New**  
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/0ec7506-Screen_Shot_2021-12-01_at_12.23.10_PM.png",
        "Screen Shot 2021-12-01 at 12.23.10 PM.png",
        332,
        410,
        "#f5f6f5"
      ]
    }
  ]
}
[/block]
2. Choose **Segment** from the integrations menu
3. Add your **Segment Write Key** from step 2
4. Enter the event names that RevenueCat will send or choose the default event names
5. Select whether you want RevenueCat to report proceeds (after app store cut) or revenue (gross sales)
6. Select whether you want RevenueCat to send sandbox events into Segment or not. You can check the `environment` key in the `context` property of the event to determine if it was triggered in a sandbox or production environment.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/87fa20a-Screen_Shot_2021-11-16_at_2.54.30_PM.png",
        "Screen Shot 2021-11-16 at 2.54.30 PM.png",
        566,
        1076,
        "#f8f9f9"
      ],
      "caption": "Segment configuration screen"
    }
  ]
}
[/block]
# Sample Event
Below is sample JSON that is delivered to Segment for a renewal event.
[block:code]
{
  "codes": [
    {
      "code": "{\n  \"identify\": {\n    \"context\": {\n      \"environment\": \"production\",\n      \"library\": {\n        \"name\": \"RevenueCat Segment events\",\n        \"version\": \"1.0\"\n      }\n    },\n    \"timestamp\": \"2021-03-20T00:00:02\",\n    \"traits\": {\n      \"aliases\": [\n        \"$RCAnonymousID:0123456789abcdefghij0123456789ab\",\n        \"myCustomAppUserId\"\n      ],\n      \"last_seen_app_user_id\": \"myCustomAppUserId\"\n    },\n    \"userId\": \"$RCAnonymousID:0123456789abcdefghij0123456789ab\"\n  },\n  \"track_event\": {\n    \"context\": {\n      \"environment\": \"production\",\n      \"library\": {\n        \"name\": \"RevenueCat Segment events\",\n        \"version\": \"1.0\"\n      }\n    },\n    \"event\": \"renewal_event\",\n    \"properties\": {\n      \"app_user_id\": \"myCustomAppUserId\",\n      \"currency\": \"USD\",\n      \"entitlements\": [\n        \"your_entitlement_id\"\n      ],\n      \"entitlement\": \"your_entitlement_id\",\n      \"expires_at\": 1647734402,\n      \"original_app_user_id\": \"$RCAnonymousID:0123456789abcdefghij0123456789ab\",\n      \"product_id\": \"your_product_id\",\n      \"revenue\": 9.99,\n      \"store\": \"APP_STORE\",\n      \"purchased_at\": 1616198402,\n      \"subscriber_attributes\": {\n        \"$ip\": \"000.00.00.000\",\n        \"$idfa\": \"12345678-1234-1234-1234-123456789abc\",\n        \"$idfv\": \"12345678-1234-1234-1234-123456789abc\",\n        \"$email\": \"name@gmail.com\",\n        \"$fbAnonId\": \"12345678-1234-1234-1234-123456789abc\",\n        \"$apnsTokens\": \"fY1kOQ0bMl8:APA91bG_rM-ub0xg:DNjP553d8O8gTYs9iNWsYxZMLyzv46IhB--2qz810LRUhCIXTJE4_Umx-irs-FD6ET_qMCXyNeny7B6xn2-X0v69Be014Qa4BHv2XSTwrmF5PZ2L_LPxw4sL2_s1\",\n        \"$appsflyerId\": \"0123456789012-0123456\",\n        \"favorite_food\": \"pizza\"\n      },\n      \"period_type\": \"NORMAL\",\n      \"environment\": \"PRODUCTION\",\n      \"presented_offering_id\": \"default\",\n      \"transaction_id\": \"012345678912345\",\n      \"original_transaction_id\": \"987654321098765\",\n      \"aliases\": [\n        \"$RCAnonymousID:0123456789abcdefghij0123456789ab\",\n        \"myCustomAppUserId\"\n      ]\n    },\n    \"timestamp\": \"2021-03-20T00:00:02\",\n    \"userId\": \"$RCAnonymousID:0123456789abcdefghij0123456789ab\"\n    }\n}",
      "language": "json"
    }
  ]
}
[/block]
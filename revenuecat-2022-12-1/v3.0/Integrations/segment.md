---
title: "Segment"
slug: "segment"
excerpt: "Integrate in-app subscription events from RevenueCat with Segment"
hidden: false
metadata: 
  title: "Segment Revenue Events | RevenueCat"
  description: "RevenueCat can automatically send subscription events into Segment. From there, you pass these events on to any of the hundreds of other integrations on their platform. This is useful for tracking all events and revenue that occur for your app even if it's not active for a period of time."
  image: 
    0: "https://files.readme.io/70b1f9a-Reddit__E.jpg"
    1: "Reddit – E.jpg"
    2: 1200
    3: 630
    4: "#fbabaf"
createdAt: {}
updatedAt: "2020-05-14T14:40:09.590Z"
---
[block:callout]
{
  "type": "success",
  "body": "The Segment integration is only available on [paid](https://www.revenuecat.com/pricing) plans."
}
[/block]
RevenueCat can automatically send subscription events into Segment. From there, you pass these events on to any of the hundreds of other integrations on their platform. This is useful for tracking all events and revenue that occur for your app even if it's not active for a period of time.

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
    "6-1": "When a user re-enables the auto-renew status for a subscription."
  },
  "cols": 2,
  "rows": 8
}
[/block]
For events that have revenue, such as trial conversions and renewals, RevenueCat will automatically record this amount along with the event in Segment.
[block:api-header]
{
  "title": "1. Set Segment user identity"
}
[/block]
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

[block:api-header]
{
  "title": "2. Generate a Segment Write Key"
}
[/block]
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

[block:api-header]
{
  "title": "3. Send RevenueCat events to Segment"
}
[/block]
After you've set up the *Purchase* SDK and Segment SDK to have the same user identity, you can "turn on" the integration and configure the event names from the RevenueCat dashboard.

1. Navigate to your app in the RevenueCat dashboard and choose 'Segment' from the integrations menu
2. Add your Segment Write Key from step 2
3. Enter the event names that RevenueCat will send or choose the default event names
4. Select whether you want RevenueCat to report proceeds (after app store cut) or revenue (gross sales)
5. Select whether you want RevenueCat to send sandbox events into Segment or not. You can check the `environment` key in the `context` property of the event to determine if it was triggered in a sandbox or production environment.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/f130c3c-segment.png",
        "segment.png",
        842,
        1169,
        "#f7f7f8"
      ],
      "caption": "Segment configuration screen"
    }
  ]
}
[/block]
##Sample Event
Below is sample JSON that is delivered to Segment for a trial conversion event.
[block:code]
{
  "codes": [
    {
      "code": "{\n  \"identify\": {\n    \"context\": {\n      \"environment\": \"production\",\n      \"library\": {\n        \"name\": \"RevenueCat Segment events\",\n        \"version\": \"1.0\"\n      }\n    },\n    \"timestamp\": 1567511348,\n    \"traits\": {\n      \"aliases\": [\n        \"$rc_abcdefg12345\",\n        \"myCustomAppUserId\"\n      ],\n      \"last_seen_app_user_id\": \"myCustomAppUserId\"\n    },\n    \"userId\": \"myCustomAppUserId\"\n  },\n  \"track_event\": {\n    \"context\": {\n      \"environment\": \"production\",\n      \"library\": {\n        \"name\": \"RevenueCat Segment events\",\n        \"version\": \"1.0\"\n      }\n    },\n    \"event\": \"trial_converted_event\",\n    \"properties\": {\n      \"app_user_id\": \"myCustomAppUserId\",\n      \"currency\": \"USD\",\n      \"entitlement\": \"your_entitlement_id\",\n      \"expires_at\": 1570103348,\n      \"original_app_user_id\": \"$rc_abcdefg12345\",\n      \"product_id\": \"your_product_id\",\n      \"revenue\": 9.99,\n      \"store\": \"APP_STORE\"\n    },\n    \"timestamp\": \"2019-09-03T11:49:08\",\n    \"userId\": \"myCustomAppUserId\"\n  }\n}",
      "language": "json"
    }
  ]
}
[/block]
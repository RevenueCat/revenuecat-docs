---
title: "Mixpanel"
slug: "mixpanel"
excerpt: "Integrate in-app subscription events from RevenueCat with Mixpanel"
hidden: false
metadata: 
  title: "Mixpanel | RevenueCat"
  description: "RevenueCat can automatically send subscription events into Mixpanel. This is useful for seeing all events and revenue that occur for your app even if it's not active for a period of time."
  image: 
    0: "https://files.readme.io/c80faa5-Reddit__E.jpg"
    1: "Reddit – E.jpg"
    2: 1200
    3: 630
    4: "#fbabaf"
createdAt: {}
updatedAt: "2020-05-15T00:44:34.506Z"
---
[block:callout]
{
  "type": "success",
  "body": "Integrations are only available on [paid](https://www.revenuecat.com/pricing) plans."
}
[/block]
RevenueCat can automatically send subscription events into Mixpanel. This is useful for seeing all events and revenue that occur for your app even if it's not active for a period of time.

The Mixpanel integration tracks the following events:
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
    "6-0": "Non Subscription Purchase",
    "0-1": "The first purchase of an auto-renewing subscription product that does not contain a free trial.",
    "1-1": "The start of an auto-renewing subscription product free trial.",
    "2-1": "When an auto-renewing subscription product converts from a free trial to normal paid period.",
    "3-1": "When a user turns off renewals for an auto-renewing subscription product during a free trial period.",
    "4-1": "When an auto-renewing subscription product renews OR a user repurchases the auto-renewing subscription product after a lapse in their subscription.",
    "5-1": "When a user turns off renewals for an auto-renewing subscription product during the normal paid period.",
    "6-1": "The purchase of any product that's not an auto-renewing subscription."
  },
  "cols": 2,
  "rows": 7
}
[/block]

For events that have revenue, such as trial conversions and renewals, RevenueCat will automatically record this amount along with the event in Mixpanel.
[block:api-header]
{
  "title": "1. Set Mixpanel user identity"
}
[/block]
If you're using the Mixpanel SDK, you can set the Distinct Id to match the RevenueCat App User Id. This way, events sent from the Mixpanel SDK and events sent from RevenueCat can be synced to the same user.

Use the `.identify()` method on the Mixpanel SDK to set the same App User Id that is set in RevenueCat.
[block:code]
{
  "codes": [
    {
      "code": "// Configure Purchases SDK\nPurchases.configure(withAPIKey: \"public_sdk_key\", appUserID: \"my_app_user_id\")\n\n// Set App User Id in Mixpanel\nMixpanel.mainInstance().identify(distinctId: \"my_app_user_id\")",
      "language": "swift"
    },
    {
      "code": "// Configure Purchases SDK\n[RCPurchases configureWithAPIKey:@\"public_sdk_key\" appUserID:@\"my_app_user_id\"];\n\n// Set App User Id in Mixpanel\n[[Mixpanel sharedInstance] identify:@\"my_app_user_id\"];",
      "language": "objectivec"
    },
    {
      "code": "// Configure Purchases SDK\nPurchases.configure(this, \"public_sdk_key\", \"my_app_user_id\");\n\n// Set App User Id in Mixpanel\nMixpanelAPI mixpanel =\n    MixpanelAPI.getInstance(context, MIXPANEL_TOKEN);\n\nmixpanel.identify(\"my_app_user_id\");",
      "language": "java"
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "2. Send RevenueCat events to Mixpanel"
}
[/block]
After you've set up the *Purchase* SDK and Mixpanel SDK to have the same user identity, you can "turn on" the integration and configure the event names from the RevenueCat dashboard.

1. Navigate to your app in the RevenueCat dashboard and choose 'Mixpanel' from the integrations menu
2. Add your Mixpanel token
3. Enter the event names that RevenueCat will send or choose the default event names
4. Select whether you want RevenueCat to report proceeds (after app store cut) or revenue (gross sales)
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/16fe9fd-mixpanel.png",
        "mixpanel.png",
        1404,
        2262,
        "#f7f8f8"
      ],
      "caption": "Mixpanel configuration screen"
    }
  ]
}
[/block]
##Sample Event
Below is the sample JSON that is delivered to Mixpanel for a renewal event.
[block:code]
{
  "codes": [
    {
      "code": "[\n  {\n    \"$append\": {\n      \"$transactions\": {\n        \"$amount\": 9.99,\n        \"$time\": \"2019-07-26T20:48:56\",\n        \"product_id\": \"your_product_id\",\n        \"store\": \"PLAY_STORE\"\n      }\n    },\n    \"$distinct_id\": \"myCustomAppUserId\",\n    \"$token\": \"abcdefghijklmnopqrstuvwxyz\"\n  },\n  {\n    \"$add\": {\n      \"Total Tracked Revenue\": 9.99\n    },\n    \"$distinct_id\": \"myCustomAppUserId\",\n    \"$token\": \"abcdefghijklmnopqrstuvwxyz\"\n  }\n]",
      "language": "json"
    }
  ]
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "{\n  \"event\": \"Renewal Event\",\n  \"properties\": {\n    \"$insert_id\": \"23456789\",\n    \"distinct_id\": \"myCustomAppUserId\",\n    \"product_id\": \"your_product_id\",\n    \"revenue\": 9.99,\n    \"store\": \"PLAY_STORE\",\n    \"subscriber_attributes\": {},\n    \"time\": 1581674623,\n    \"token\": \"123456789abcdefghijk\"\n  }\n}",
      "language": "json"
    }
  ]
}
[/block]
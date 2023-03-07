---
title: "Mixpanel"
slug: "mixpanel"
excerpt: "Integrate RevenueCat data with Mixpanel"
hidden: false
createdAt: "2019-03-12T20:41:27.271Z"
updatedAt: "2019-09-09T23:59:39.495Z"
---
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
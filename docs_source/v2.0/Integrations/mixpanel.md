---
title: "Mixpanel"
slug: "mixpanel"
excerpt: "Integrate RevenueCat data with Mixpanel"
hidden: false
createdAt: "2019-03-12T20:41:27.271Z"
updatedAt: "2019-03-27T19:36:18.348Z"
---
RevenueCat can automatically send subscription events into Mixpanel. This is useful for seeing all events and revenue that occur for your app even if it's not active for a period of time.

The Mixpanel integration tracks the following events:
- Initial Purchase
- Trial Started
- Trial Converted
- Trial Cancelled
- Renewal
- Cancellation 

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
      "code": "// Configure Purchases SDK\nPurchases.configure(withAPIKey: \"my_api_key\", appUserID: \"my_app_user_id\")\n\n// Set App User Id in Mixpanel\nMixpanel.mainInstance().identify(distinctId: \"my_app_user_id\")",
      "language": "swift"
    },
    {
      "code": "// Configure Purchases SDK\n[RCPurchases configureWithAPIKey:@\"my_api_key\" appUserID:@\"my_app_user_id\"];\n\n// Set App User Id in Mixpanel\n[[Mixpanel sharedInstance] identify:@\"my_app_user_id\"];",
      "language": "objectivec"
    },
    {
      "code": "// Configure Purchases SDK\nPurchases.configure(this, \"my_api_key\", \"my_app_user_id\");\n\n// Set App User Id in Mixpanel\nMixpanelAPI mixpanel =\n    MixpanelAPI.getInstance(context, MIXPANEL_TOKEN);\n\nmixpanel.identify(\"my_app_user_id\");",
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
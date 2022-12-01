---
title: "Amplitude"
slug: "amplitude"
excerpt: "Integrate RevenueCat data with Amplitude"
hidden: false
createdAt: "2019-03-12T22:08:56.954Z"
updatedAt: "2019-09-09T23:59:20.382Z"
---
RevenueCat can automatically send subscription events into Amplitude. This is useful for seeing all events and revenue that occur for your app even if it's not active for a period of time.

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

For events that have revenue, such as trial conversions and renewals, RevenueCat will automatically record this amount along with the event in Amplitude.
[block:api-header]
{
  "title": "1. Set Amplitude user identity"
}
[/block]
If you're using the Amplitude SDK, you can set the User Id to match the RevenueCat App User Id. This way, events sent from the Amplitude SDK and events sent from RevenueCat can be synced to the same user.

Configure the Amplitude SDK with the same App User Id as RevenueCat or use the `.setUserId()` method on the Amplitude SDK.
[block:code]
{
  "codes": [
    {
      "code": "// Configure Purchases SDK\nPurchases.configure(withAPIKey: \"public_sdk_key\", appUserID: \"my_app_user_id\")\n\n// Configure Amplitude SDK\nAmplitude.instance()?.initializeApiKey(\"amplitude_api_key\", userId: \"my_app_user_id\")",
      "language": "swift"
    },
    {
      "code": "// Configure Purchases SDK\n[RCPurchases configureWithAPIKey:@\"public_sdk_key\" appUserID:@\"my_app_user_id\"];\n\n// Configure Amplitude SDK\n[[Amplitude] instance] initializeApiKey:@\"amplitude_api_key\" userId:@\"my_app_user_id\"];",
      "language": "objectivec"
    },
    {
      "code": "// Configure Purchases SDK\nPurchases.configure(this, \"public_sdk_key\", \"my_app_user_id\");\n\n// Configure Amplitude SDK\nAmplitude.getInstance().initialize(this, \"amplitude_api_key\", \"my_app_user_id\");",
      "language": "java"
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "2. Send RevenueCat events to Amplitude"
}
[/block]
After you've set up the *Purchase* SDK and Amplitude SDK to have the same user identity, you can "turn on" the integration and configure the event names from the RevenueCat dashboard.

1. Navigate to your app in the RevenueCat dashboard and choose 'Amplitude' from the integrations menu
2. Add your Amplitude api key
3. Enter the event names that RevenueCat will send or choose the default event names
4. Select whether you want RevenueCat to report proceeds (after app store cut) or revenue (gross sales)
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/c1dc9a9-amplitude.png",
        "amplitude.png",
        1409,
        2240,
        "#f7f8f8"
      ],
      "caption": "Amplitude configuration page"
    }
  ]
}
[/block]
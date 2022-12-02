---
title: "Braze"
slug: "braze"
excerpt: "Integrate in-app subscription events from RevenueCat with Braze"
hidden: false
metadata: 
  title: "Braze Revenue Events | RevenueCat"
  description: "RevenueCat can automatically send subscription revenue events to Braze. This can be helpful in understanding what stage a customer is in to react accordingly. With accurate and up-to-date subscription data in Braze, you'll be set to turbocharge your campaigns."
  image: 
    0: "https://files.readme.io/3e1c975-Reddit__E.jpg"
    1: "Reddit – E.jpg"
    2: 1200
    3: 630
    4: "#fbabaf"
createdAt: {}
updatedAt: "2020-05-11T15:54:53.579Z"
---
[block:callout]
{
  "type": "success",
  "body": "Integrations are only available on [paid](https://www.revenuecat.com/pricing) plans."
}
[/block]
RevenueCat can automatically send subscription events to Braze. This can be helpful in understanding what stage a customer is in to react accordingly. For example, you might want to:
- Send an onboarding campaign to a user in a free trial
- Allow customer support grant a [promotional subscription](doc:customers#section-granting-promotional-subscriptions) to a loyal user that experienced issues
- Send campaigns to users that cancelled free trials

With accurate and up-to-date subscription data in Braze, you'll be set to turbocharge your campaigns ⚡️
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

For events that have revenue, such as trial conversions and renewals, RevenueCat will automatically record this amount along with the event in Braze.
[block:api-header]
{
  "title": "1. Set Braze user identity"
}
[/block]
If you're using the Braze SDK, you can set the User Id to match the RevenueCat App User Id. This way, events sent from the Braze SDK and events sent from RevenueCat can be synced to the same user.

Configure the Braze SDK with the same App User Id as RevenueCat or use the `.changeUser()` method on the Braze SDK.
[block:code]
{
  "codes": [
    {
      "code": "// Configure Purchases SDK\nPurchases.configure(withAPIKey: \"public_sdk_key\", appUserID: \"my_app_user_id\")\n\n// Configure Braze SDK\nAppboy.sharedInstance()?.changeUser(\"my_app_user_id\")",
      "language": "swift"
    },
    {
      "code": "// Configure Purchases SDK\n[RCPurchases configureWithAPIKey:@\"public_sdk_key\" appUserID:@\"my_app_user_id\"];\n\n// Configure Amplitude SDK\n[[Appboy sharedInstance] changeUser:@\"my_app_user_id\"];",
      "language": "objectivec"
    },
    {
      "code": "// Configure Purchases SDK\nPurchases.configure(this, \"public_sdk_key\", \"my_app_user_id\");\n\n// Configure Amplitude SDK\nAppboy.getInstance(YOUR_ACTIVITY.this).changeUser(my_app_user_id);",
      "language": "java"
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "2. Send RevenueCat events to Braze"
}
[/block]
After you've set up the *Purchase* SDK and Braze SDK to have the same user identity, you can "turn on" the integration and configure the event names from the RevenueCat dashboard.

1. Navigate to your app in the RevenueCat dashboard and choose 'Braze' from the integrations menu
2. Add your Braze instance and api key
3. Enter the event names that RevenueCat will send or choose the default event names
4. Select whether you want RevenueCat to report proceeds (after app store cut) or revenue (gross sales)
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/1e36c3f-braze.png",
        "braze.png",
        1423,
        3037,
        "#f8f8f9"
      ],
      "caption": "Braze configuration page"
    }
  ]
}
[/block]
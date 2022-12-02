---
title: "Segment"
slug: "segment"
excerpt: "Integrate RevenueCat data with Segment"
hidden: false
createdAt: "2019-04-18T21:40:10.193Z"
updatedAt: "2019-04-23T18:07:08.144Z"
---
RevenueCat can automatically send subscription events into Segment. From there, you pass these events on to any of the hundreds of other integrations on their platform. This is useful for tracking all events and revenue that occur for your app even if it's not active for a period of time.

The Segment integration tracks the following events:
- Initial Purchase
- Trial Started
- Trial Converted
- Trial Cancelled
- Renewal
- Cancellation 

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
      "code": "// Configure Purchases SDK\nPurchases.configure(withAPIKey: \"my_api_key\", appUserID: \"my_app_user_id\")\n\n// Set App User Id in Segment\nSEGAnalytics.sharedAnalytics().identify(\"my_app_user_id\")",
      "language": "swift"
    },
    {
      "code": "// Configure Purchases SDK\n[RCPurchases configureWithAPIKey:@\"my_api_key\" appUserID:@\"my_app_user_id\"];\n\n// Set App User Id in Segment\n[[SEGAnalytics sharedAnalytics] identify:@\"my_app_user_id\"];",
      "language": "objectivec"
    },
    {
      "code": "// Configure Purchases SDK\nPurchases.configure(this, \"my_api_key\", \"my_app_user_id\");\n\n// Set App User Id in Segment\nAnalytics.with(context).identify(\"my_app_user_id\", null, null);",
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
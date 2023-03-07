---
title: "OneSignal"
slug: "onesignal"
excerpt: "Integrate RevenueCat subscription status with OneSignal"
hidden: false
createdAt: "2020-08-26T17:22:44.480Z"
updatedAt: "2020-08-31T23:02:28.619Z"
---
[block:callout]
{
  "type": "success",
  "body": "Integrations are only available on [paid](https://www.revenuecat.com/pricing) plans."
}
[/block]
RevenueCat can automatically update user tags in OneSignal with their latest subscription status. This can be helpful in understanding what stage a customer is in to react accordingly. For example, you might want to:
- Send an onboarding campaign to a user in a free trial
- Send a push notification to churned users and [offer them a discount](doc:ios-subscription-offers) 

With accurate and up-to-date subscription data in OneSignal, you'll be set to turbo charge your campaigns.

For every auto-renewing subscription event in RevenueCat, the following tags get added or updated on the user in OneSignal. By leaving the tag blank in the RevenueCat dashboard, you can choose to not send any value for specific tag(s).
[block:parameters]
{
  "data": {
    "h-0": "Tag",
    "h-1": "Description",
    "0-0": "`app_user_id`",
    "1-0": "`period_type`",
    "2-0": "`purchased_at`",
    "0-1": "The RevenueCat App User Id that triggered the event",
    "2-1": "epoch time in seconds of the latest subscription purchase or renewal",
    "3-0": "`expiration_at`",
    "3-1": "epoch time in seconds of the latest subscription expiration date",
    "4-0": "`store`",
    "4-1": "Either `APP_STORE `, `PLAY_STORE`, or `STRIPE`",
    "5-0": "`environment`",
    "5-1": "Either `SANDBOX` or `PRODUCTION`",
    "6-0": "`last_event_type`",
    "7-0": "`product_id`",
    "8-0": "`entitlement_ids`",
    "8-1": "Comma separated string of RevenueCat Entitlement identifiers that the user unlocked",
    "7-1": "The latest subscription product identifier that the user has purchased or renewed",
    "1-1": "The latest period type for the purchase or renewal. Either:\n- `TRIAL` (for free trials) \n- `INTRO` (or introductory pricing)\n- `NORMAL` (standard subscription)",
    "6-1": "The latest event type from the user. Either:\n- `INITIAL_PURCHASE`\n- `TRIAL_STARTED`\n- `TRIAL_CONVERTED`\n- `TRIAL_CANCELLED`\n- `RENEWAL`\n- `CANCELLATION `"
  },
  "cols": 2,
  "rows": 9
}
[/block]

[block:callout]
{
  "type": "info",
  "title": "Auto-renewing subscriptions only",
  "body": "RevenueCat only updates data tags in OneSignal in response to auto-renewing subscription events."
}
[/block]

[block:api-header]
{
  "title": "1. Send device data to RevenueCat"
}
[/block]
The OneSignal integration requires some device-specific data. RevenueCat will only update users in OneSignal if the below data has been added as [Subscriber Attributes](doc:subscriber-attributes) for the user.
[block:parameters]
{
  "data": {
    "h-0": "Key",
    "h-1": "Description",
    "h-2": "Required",
    "0-2": "✅",
    "0-0": "`$onesignalId`",
    "0-1": "The [OneSignal Player Id](https://documentation.onesignal.com/docs/users#player-id) for the user."
  },
  "cols": 3,
  "rows": 1
}
[/block]
This data should be sent to RevenueCat through reserved [Subscriber Attributes](doc:subscriber-attributes) keys. You can listen for changes to the OneSignal Id through their SDK, and send the value to RevenueCat. If you already have OneSignal set up, you should make sure that you're also sending the OneSignal Id for users that are updating to the latest version of your app.
[block:code]
{
  "codes": [
    {
      "code": "class AppDelegate: UIResponder, UIApplicationDelegate, OSSubscriptionObserver {\n\n    var window: UIWindow?\n\n    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {\n            \n        Purchases.configure(withAPIKey: \"<revenuecat_api_key>\", appUserID: nil)\n        \n        OneSignal.initWithLaunchOptions(launchOptions, appId: \"<onesignal_app_id>\")\n        OneSignal.add(self as OSSubscriptionObserver)\n        \n        // If you've already set up OneSignal, then users should already have\n        // a OneSignal Id. We can check if it's available and send it to RevenueCat\n        if let onesignalId = OneSignal.getUserDevice()?.getUserId() {\n            Purchases.shared.setAttributes([\"$onesignalId\" : onesignalId])\n        }\n        \n        return true\n    }\n\n    // Add this method to update the $onesignalId in RevenueCat whenever it changes\n    // This code should be sufficient to capture all new users if you're setting\n    // up OneSignal for the first time.\n    func onOSSubscriptionChanged(_ stateChanges: OSSubscriptionStateChanges!) {\n        if !stateChanges.from.subscribed && stateChanges.to.subscribed {\n            // The user is subscribed\n            // Either the user subscribed for the first time\n            Purchases.shared.setAttributes([\"$onesignalId\" : stateChanges.to.userId])\n        }\n    }\n}",
      "language": "swift"
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "2. Send RevenueCat events into OneSignal"
}
[/block]
After you've set up the *Purchase* SDK to send device data to RevenueCat, you can "turn on" the integration and configure the tag names from the RevenueCat dashboard.

1. Navigate to your app in the RevenueCat dashboard and choose 'OneSignal' from the integrations menu.
2. Add your OneSignal App Id and OneSignal API key.
3. Enter the tag names that RevenueCat should use, or choose the default tag names.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/df18672-app.revenuecat.com_apps_a4b20cba_integrations_onesignal.png",
        "app.revenuecat.com_apps_a4b20cba_integrations_onesignal.png",
        1691,
        3234,
        "#fafbfb"
      ],
      "caption": "OneSignal configuration screen"
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "3. Testing the OneSignal integration"
}
[/block]
You can test the OneSignal integration end-to-end before going live. It's recommended that you test the integration is working properly for new users, and any existing users that may update their app to a new version.

### Make a sandbox purchase with a new user
Simulate a new user installing your app, and go through your app flow to complete a sandbox purchase.

### Check that the OneSignal event delivered successfully
While still on the Customer View, click into the test purchase event in the [Customer History](doc:customer-history) and make sure that the OneSignal integration event exists and was delivered successfully. 
[block:callout]
{
  "type": "success",
  "title": "You've done it!",
  "body": "You should start seeing subscription data from RevenueCat appear on users in OneSignal"
}
[/block]
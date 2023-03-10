---
title: "OneSignal"
slug: "onesignal"
excerpt: "Integrate RevenueCat subscription status with OneSignal"
hidden: false
metadata: 
  title: "OneSignal Integration – RevenueCat"
  description: "RevenueCat can automatically update user tags in OneSignal with their latest subscription status. This can be helpful in understanding what stage a customer is in to react accordingly."
  image: 
    0: "https://files.readme.io/fee9db9-OG_image.png"
    1: "OG image.png"
    2: 1200
    3: 627
    4: "#e9acb0"
createdAt: "2020-08-26T17:22:44.480Z"
updatedAt: "2021-11-16T23:53:43.828Z"
---
[block:callout]
{
  "type": "success",
  "body": "The OneSignal integration is available on the [Pro](https://www.revenuecat.com/pricing) plan."
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
    "6-1": "The latest event type from the user. Either:\n- `INITIAL_PURCHASE`\n- `TRIAL_STARTED`\n- `TRIAL_CONVERTED`\n- `TRIAL_CANCELLED`\n- `RENEWAL`\n- `CANCELLATION `",
    "9-0": "`active_subscription`",
    "10-0": "`grace_period_expiration_at`",
    "9-1": "The value will be set to `true` on any purchase/renewal event, and `false` on `EXPIRATION`",
    "10-1": "If a billing issue occurs we will send the date of the grace period expiration."
  },
  "cols": 2,
  "rows": 11
}
[/block]

[block:callout]
{
  "type": "info",
  "title": "Auto-renewing subscriptions only",
  "body": "RevenueCat only updates data tags in OneSignal in response to auto-renewing subscription events."
}
[/block]
# 1. Send device data to RevenueCat

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
This property can be set manually, like any other [Subscriber Attributes](doc:subscriber-attributes), or through the helper method `setOnesignalID()`. 

You can listen for changes to the OneSignal Id through their SDK, and send the value to RevenueCat. If you already have OneSignal set up, you should make sure that you're also sending the OneSignal Id for users that are updating to the latest version of your app.
[block:code]
{
  "codes": [
    {
      "code": "class AppDelegate: UIResponder, UIApplicationDelegate, OSSubscriptionObserver {\n\n    var window: UIWindow?\n\n    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {\n            \n        Purchases.configure(withAPIKey: \"<revenuecat_api_key>\", appUserID: nil)\n        \n        OneSignal.initWithLaunchOptions(launchOptions, appId: \"<onesignal_app_id>\")\n        OneSignal.add(self as OSSubscriptionObserver)\n        \n        // If you've already set up OneSignal, then users should already have\n        // a OneSignal Id. We can check if it's available and send it to RevenueCat\n        if let onesignalId = OneSignal.getUserDevice()?.getUserId() {\n            Purchases.shared.setOnesignalID(onesignalId)\n        }\n        \n        return true\n    }\n\n    // Add this method to update the $onesignalId in RevenueCat whenever it changes\n    // This code should be sufficient to capture all new users if you're setting\n    // up OneSignal for the first time.\n    func onOSSubscriptionChanged(_ stateChanges: OSSubscriptionStateChanges!) {\n        if !stateChanges.from.subscribed && stateChanges.to.subscribed {\n            // The user is subscribed\n            // Either the user subscribed for the first time\n            Purchases.shared.setOnesignalID(stateChanges.to.userId)\n        }\n    }\n}",
      "language": "swift"
    }
  ]
}
[/block]
# 2. Send RevenueCat events into OneSignal

After you've set up the *Purchase* SDK to send device data to RevenueCat, you can "turn on" the integration and configure the tag names from the RevenueCat dashboard.

1. Navigate to your app in the RevenueCat dashboard and choose 'OneSignal' from the integrations menu.
2. Add your OneSignal App Id and OneSignal API key.
3. Enter the tag names that RevenueCat should use, or choose the default tag names.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/d62184b-Screen_Shot_2021-11-16_at_3.47.23_PM.png",
        "Screen Shot 2021-11-16 at 3.47.23 PM.png",
        564,
        1024,
        "#f9fafa"
      ],
      "caption": "OneSignal configuration screen"
    }
  ]
}
[/block]
# 3. Testing the OneSignal integration

You can test the OneSignal integration end-to-end before going live. It's recommended that you test the integration is working properly for new users, and any existing users that may update their app to a new version.

## Make a sandbox purchase with a new user
Simulate a new user installing your app, and go through your app flow to complete a sandbox purchase.

## Check that the required device data is collected
Navigate the the [Customer View](doc:customers) for the test user that just made a purchase. Make sure that all of the required data from step 1 above is listed as attributes for the user.

## Check that the OneSignal event delivered successfully
While still on the Customer View, click into the test purchase event in the [Customer History](doc:customer-history) and make sure that the OneSignal integration event exists and was delivered successfully. 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/44eb037-Screen_Shot_2020-09-14_at_7.53.17_PM.png",
        "Screen Shot 2020-09-14 at 7.53.17 PM.png",
        702,
        224,
        "#f7f2f1"
      ]
    }
  ]
}
[/block]

[block:callout]
{
  "type": "warning",
  "title": "Why are tags not working?",
  "body": "If your tags aren't working and RevenueCat is sending events successfully with 200 codes, check out [OneSignal's troubleshooting guide](https://documentation.onesignal.com/docs/add-user-data-tags#why-are-tags-not-working)."
}
[/block]

[block:callout]
{
  "type": "success",
  "title": "You've done it!",
  "body": "You should start seeing subscription data from RevenueCat appear on users in OneSignal"
}
[/block]
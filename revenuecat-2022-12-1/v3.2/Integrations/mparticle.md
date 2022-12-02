---
title: "mParticle"
slug: "mparticle"
excerpt: "Integrate in-app subscription events from RevenueCat with mParticle"
hidden: false
metadata: 
  title: "mParticle Integration – RevenueCat"
  description: "RevenueCat can automatically send subscription events into mParticle. From there, you pass these events on to any of the hundreds of other integrations on their platform."
  image: 
    0: "https://files.readme.io/df5dd13-OG_image.png"
    1: "OG image.png"
    2: 1200
    3: 627
    4: "#e9acb0"
createdAt: "2020-06-17T19:13:08.598Z"
updatedAt: "2021-11-16T23:33:50.537Z"
---
[block:callout]
{
  "type": "success",
  "body": "The mParticle integration is available on the [Pro](https://www.revenuecat.com/pricing) plan."
}
[/block]
RevenueCat can automatically send subscription events into mParticle. From there, you pass these events on to any of the hundreds of other integrations on their platform. This is useful for tracking all events and revenue that occur for your app even if it's not active for a period of time.

# Events

The mParticle integration tracks the following events:
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
    "8-0": "Non Subscription Purchase",
    "0-1": "The first purchase of an auto-renewing subscription product that does not contain a free trial.",
    "1-1": "The start of an auto-renewing subscription product free trial.",
    "2-1": "When an auto-renewing subscription product converts from a free trial to normal paid period.",
    "3-1": "When a user turns off renewals for an auto-renewing subscription product during a free trial period.",
    "4-1": "When an auto-renewing subscription product renews OR a user repurchases the auto-renewing subscription product after a lapse in their subscription.",
    "5-1": "When a user turns off renewals for an auto-renewing subscription product during the normal paid period.",
    "8-1": "The purchase of any product that's not an auto-renewing subscription.",
    "7-0": "Uncancellation",
    "7-1": "When a user re-enables the auto-renew status for a subscription.",
    "6-0": "Refund",
    "6-1": "When a user canceled their subscription via customer support",
    "9-0": "Expiration",
    "9-1": "A subscription has expired and access should be removed.",
    "10-0": "Billing Issues",
    "10-1": "There has been a problem trying to charge the subscriber. \n \nThis does not mean the subscription has expired (in the case of a grace period enabled)."
  },
  "cols": 2,
  "rows": 11
}
[/block]
For events that have revenue, such as trial conversions and renewals, RevenueCat will automatically record this amount along with the event in mParticle.

# Setup

## 1. Set mParticle User Identity and Send Device Data to RevenueCat

If you're using the mParticle SDK, you can set the User ID to match the RevenueCat App User Id. This way, events sent from the mParticle SDK and events sent from RevenueCat can be synced to the same user.

The mParticle integration also requires some device-specific data. RevenueCat will only send events into mParticle if the below [Subscriber Attributes](doc:subscriber-attributes) keys have been set for the device.
[block:parameters]
{
  "data": {
    "h-0": "Key",
    "h-1": "Description",
    "h-2": "Required",
    "0-0": "`$mparticleId`",
    "2-0": "`$idfv`",
    "3-0": "`$gpsAdId`",
    "4-0": "`$androidId`",
    "0-2": "✅ (recommended)",
    "2-2": "❌ (optional)",
    "3-2": "❌ (optional)",
    "4-2": "❌ (optional)",
    "5-2": "❌ (optional)",
    "5-0": "`$ip`",
    "0-1": "The unique mParticle user identifier (mpid).",
    "2-1": "iOS [vender identifier](https://developer.apple.com/documentation/uikit/uidevice/1620059-identifierforvendor) UUID",
    "3-1": "Google [advertising identifier](https://developers.google.com/android/reference/com/google/android/gms/ads/identifier/AdvertisingIdClient.Info)",
    "5-1": "The IP address of the device",
    "4-1": "Android [device identifier](https://developer.android.com/reference/android/provider/Settings.Secure#ANDROID_ID)",
    "1-1": "iOS [advertising identifier](https://developer.apple.com/documentation/adsupport/asidentifiermanager/1614151-advertisingidentifier) UUID",
    "1-2": "❌ (optional)",
    "1-0": "`$idfa`"
  },
  "cols": 3,
  "rows": 6
}
[/block]
These properties can be set manually, like any other [Subscriber Attributes](doc:subscriber-attributes), or through the helper methods `collectDeviceIdentifiers()` and `setMparticleId()`. 

Create an `identityRequest` and add it to the `MParticleOptions` that you pass to the `start()` method on the mParticle SDK to set the same App User Id that is set in RevenueCat.
[block:code]
{
  "codes": [
    {
      "code": "// Configure Purchases SDK\nPurchases.configure(withAPIKey: \"public_sdk_key\", appUserID: \"my_app_user_id\")\n\n\n// Set App User Id in mParticle\nlet options = MParticleOptions(key: \"mParticle_app_key\",\n                               secret: \"mParticle_app_secret\")\nlet identityRequest = MPIdentityApiRequest.withEmptyUser()\nidentityRequest.email = \"user@example.com\"\nidentityRequest.customerId = \"123456\"\noptions.identifyRequest = identityRequest\noptions.onIdentifyComplete =  { (result: MPIdentityApiResult?, error: Error?) in\n    guard error == nil else {\n        // handle error\n        return\n    }\n    guard let result = result else {\n        // handle empty result\n        return\n    }\n    \n    // IMPORTANT: user identified successfully, get the mPID and send to RevenueCat\n    let mPid = result.user.userId\n    Purchases.shared.collectDeviceIdentifiers()\n    Purchases.shared.setMparticleID(mPid.stringValue)\n}\n\n// Start mParticle\nMParticle.sharedInstance().start(with: options)",
      "language": "swift"
    },
    {
      "code": "// Configure Purchases SDK\n[RCPurchases configureWithAPIKey:@\"public_sdk_key\" appUserID:@\"my_app_user_id\"];\n\n\n// Set App User Id in mParticle\nMParticleOptions *options = [MParticleOptions optionsWithKey:@\"mParticle_app_key\"\n                             secret:@\"mParticle_app_secret\"];\nMPIdentityApiRequest *identityRequest = [MPIdentityApiRequest requestWithEmptyUser];\nidentityRequest.email = @\"user@example.com\";\nidentityRequest.customerId = @\"123456\";\noptions.identifyRequest = identityRequest;\noptions.onIdentifyComplete = ^(MPIdentityApiResult *_Nullable apiResult, NSError *_Nullable error) {\n    if (error) {\n        // handle error\n        return;\n    }\n    if (apiResult == nil) {\n        // handle empty result\n        return;\n    }\n    // user identified successfully, get the mPID and send to RevenueCat\n    NSNumber *mPid = [apiResult.user userId];\n    [[RCPurchases sharedPurchases] collectDeviceIdentifiers];\n    [[RCPurchases sharedPurchases] setMparticleID:mPid.stringValue];\n};\n\n\n// Start mParticle\n[[MParticle sharedInstance] startWithOptions:options];",
      "language": "objectivec"
    },
    {
      "code": "// Configure Purchases SDK\nPurchases.configure(this, \"my_api_key\", \"my_app_user_id\");\n\n\n// Set App User Id in mParticle\nIdentityApiRequest identityRequest = IdentityApiRequest.withEmptyUser()\n    .email(\"user@example.com\")\n    .customerId(\"123456\")\n    .build();\n\nBaseIdentityTask identifyTask = new BaseIdentityTask()\n    .addFailureListener(new TaskFailureListener() {\n      @Override\n      public void onFailure(IdentityHttpResponse identityHttpResponse) {\n        // handle failure\n      }\n    }).addSuccessListener(new TaskSuccessListener() {\n      @Override\n      public void onSuccess(IdentityApiResult identityApiResult) {\n        // user identified successfully, get the mPID and send to RevenueCat\n        long mPid = identityApiResult.getUser().getId();\n        Purchases.getSharedInstance().collectDeviceIdentifiers();\n        Purchases.getSharedInstance().setMparticleID(String.valueOf(mPid));\n      }\n    });\n\nMParticleOptions options = MParticleOptions.builder(this)\n    .credentials(\"mParticle_app_key\", \"mParticle_app_secret\")\n    .identify(identityRequest)\n    .identifyTask(identifyTask)\n    .build();\n\n\n// Start mParticle\nMParticle.start(options);",
      "language": "java"
    }
  ]
}
[/block]
mParticle also allows you to log a user in after starting the SDK and log a user out; you should handle both of these cases:
[block:code]
{
  "codes": [
    {
      "code": "// handle logging out\nMParticle.sharedInstance().identity.logout(completion: { (result: MPIdentityAPIResult?, error: Error?) in\n    Purchases.shared().reset()\n})",
      "language": "swift"
    },
    {
      "code": "// handle logging out\n[[[MParticle sharedInstance] identity] logoutWithCompletion:^(MPIdentityApiResult *_Nullable apiResult, NSError *_Nullable error) {\n    [[RCPurchases sharedPurchases] reset];\n}];",
      "language": "objectivec"
    },
    {
      "code": "// handle logging out\nMParticle.getInstance().Identity().logout(identityRequest)\n    .addFailureListener(new TaskFailureListener() {\n        @Override\n        public void onFailure(IdentityHttpResponse identityHttpResponse) {\n            // handle error\n        }\n    })\n    .addSuccessListener(new TaskSuccessListener() {\n        @Override\n        public void onSuccess(IdentityApiResult identityApiResult) {\n          Purchases.getSharedInstance().reset();\n        }\n    });",
      "language": "java"
    }
  ]
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "// handle logging in\nMParticle.sharedInstance().identity.login(identityRequest, completion: { (result: MPIdentityAPIResult?, error: Error?) in \n    guard error == nil else {\n        // handle error\n        return\n    }\n    guard let result = result else {\n        // handle empty result\n        return\n    }\n    // user identified successfully, get the mPID and send to RevenueCat\n    let mPid = result.user.userId\n    Purchases.shared.collectDeviceIdentifiers()\n    Purchases.shared.setMparticleID(mPid.stringValue)\n})",
      "language": "swift"
    },
    {
      "code": "// handle logging in\n[[[MParticle sharedInstance] identity] login:identityRequest\n                                  completion:^(MPIdentityApiResult *_Nullable apiResult, NSError *_Nullable error) {\n    if (error) {\n        // handle error\n        return;\n    }\n    if (apiResult == nil) {\n        // handle empty result\n        return;\n    }\n    // user identified successfully, get the mPID and send to RevenueCat\n    NSNumber *mPid = [apiResult.user userId];\n    [RCPurchases shared] collectDeviceIdentifiers];\n    [RCPurchases shared] setMparticleID: [mPid stringValue]];\n}];",
      "language": "objectivec"
    },
    {
      "code": "// handle logging in\nMParticle.getInstance().Identity().login(identityRequest)\n    .addFailureListener(new TaskFailureListener() {\n        @Override\n        public void onFailure(IdentityHttpResponse identityHttpResponse) {\n            // handle error\n        }\n    })\n    .addSuccessListener(new TaskSuccessListener() {\n        @Override\n        public void onSuccess(IdentityApiResult identityApiResult) {\n          // user identified successfully, get the mPID and send to RevenueCat\n        \tlong mPid = identityApiResult.getUser().getId();\n        \tPurchases.getSharedInstance().collectDeviceIdentifiers();\n          Purchases.getSharedInstance().setMparticleID(String.valueOf(mPid));\n        }\n    });",
      "language": "java"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "danger",
  "title": "Device identifiers with iOS App Tracking Transparency (iOS 14.5+)",
  "body": "If you are requesting the App Tracking permission through ATT to access the IDFA, you can call `.collectDeviceIdentifiers()` *again* if the customer accepts the permission to update the `$idfa` attribute in RevenueCat."
}
[/block]
## 2. Add RevenueCat Feed Inputs in mParticle

In mParticle, add the RevenueCat feed input and create two feeds: one for the Android platform and one for the iOS platform. Copy each feed's Server to Server Key and Server to Server Secret for setup on RevenueCat. Refer to [mParticle's documentation](https://docs.mparticle.com/guides/feeds/) to learn more about feeds.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/adc36bb-2020-06-17_22.04.49_app.mparticle.com_a4031d73e6bc.png",
        "2020-06-17 22.04.49 app.mparticle.com a4031d73e6bc.png",
        1152,
        1300,
        "#e7ebeb"
      ]
    }
  ]
}
[/block]

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/2ae3b6d-Screen_Shot_2020-06-26_at_8.12.11_AM.png",
        "Screen Shot 2020-06-26 at 8.12.11 AM.png",
        1846,
        1258,
        "#f0f4f4"
      ]
    }
  ]
}
[/block]
## 3. Send RevenueCat events to mParticle

After you've set up the *Purchase* SDK and mParticle SDK to have the same user identity, you can "turn on" the integration and configure the event names from the RevenueCat dashboard.

1. Navigate to your app in the RevenueCat dashboard and choose 'mParticle' from the integrations menu
2. Add your Server to Server Keys and Server to Server Secrets for each platform from step 2
3. Enter the event names that RevenueCat will send or choose the default event names
4. Select whether you want RevenueCat to report proceeds (after app store cut) or revenue (gross sales)

## 4. Testing the mParticle integration

You can test the mParticle integration end-to-end before going live. It's recommended that you test the integration is working properly for new users, and any existing users that may update their app to a new version.

### Make a sandbox purchase with a new user
Simulate a new user installing your app, and go through your app flow to complete a sandbox purchase.

### Check that the required device data is collected
Navigate the the [Customer View](doc:customers) for the test user that just made a purchase. Make sure that all of the required data from step 1 above is listed as attributes for the user.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/a74e628-Screen_Shot_2020-07-29_at_5.31.46_PM.png",
        "Screen Shot 2020-07-29 at 5.31.46 PM.png",
        366,
        342,
        "#f7f4f3"
      ]
    }
  ]
}
[/block]
### Check that the mParticle event delivered successfully
While still on the Customer View, click into the test purchase event in the [Customer History](doc:customer-history) and make sure that the mParticle integration event exists and was delivered successfully. 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/cba3350-Screen_Shot_2020-09-15_at_5.17.49_PM.png",
        "Screen Shot 2020-09-15 at 5.17.49 PM.png",
        698,
        223,
        "#f7f2f1"
      ]
    }
  ]
}
[/block]

[block:callout]
{
  "type": "success",
  "title": "You've done it!",
  "body": "You should start seeing events from RevenueCat appear in mParticle"
}
[/block]
# Sample Event
Below is sample JSON that is delivered to mParticle for a trial conversion event.
[block:code]
{
  "codes": [
    {
      "code": "{\n  \"events\": [\n    {\n      \"data\": {\n        \"source_message_id\": \"df8bb4e6-148c-4bad-ac91-d4acdfe6a44b\",\n        \"timestamp_unixtime_ms\": 1592479792179,\n        \"custom_attributes\": {\n          \"revenuecat_product_id\": \"com.phillips-baldwin.dunn.elliott.monthly\",\n          \"revenuecat_event\": \"renewal\"\n        },\n        \"product_action\": {\n          \"action\": \"purchase\",\n          \"transaction_id\": null,\n          \"total_amount\": 29.995,\n          \"products\": [\n            {\n              \"id\": \"com.phillips-baldwin.dunn.elliott.monthly\",\n              \"price\": 29.995,\n              \"quantity\": 1,\n              \"total_product_amount\": 29.995\n            }\n          ]\n        },\n        \"currency_code\": \"USD\",\n        \"is_non_interactive\": true\n      },\n      \"event_type\": \"commerce_event\"\n    }\n  ],\n  \"source_request_id\": \"d28919c3-8243-46b6-9eed-3ef0723d3717\",\n  \"user_attributes\": {\n    \"revenuecat_color\": \"blue\",\n    \"revenuecat_size\": \"medium\",\n    \"$mobile\": \"+34666666666\",\n    \"$country\": \"ES\",\n    \"revenuecat_aliases\": [\n      \"alias1\",\n      \"alias2\"\n    ],\n    \"revenuecat_app_user_id\": \"user_vkEeY\",\n    \"revenuecat_original_app_user_id\": \"user_vkEeY\"\n  },\n  \"device_info\": {\n    \"platform\": \"iOS\",\n    \"ios_advertising_id\": \"EA555CD-A666-77BC-B888-99ECB9B99999\",\n    \"ios_idfv\": \"C555F5DB-66FC-777F-B8C8-BC99E9B999D9\"\n  },\n  \"application_info\": {\n    \"application_name\": \"Rivera-Chambers\",\n    \"package\": \"com.phillips-baldwin.dunn.elliott\"\n  },\n  \"user_identities\": {\n    \"email\": \"subscriber@example.com\"\n  },\n  \"schema_version\": 2,\n  \"environment\": \"development\",\n  \"mpid\": \"000000000000000000\"\n}",
      "language": "json"
    }
  ]
}
[/block]
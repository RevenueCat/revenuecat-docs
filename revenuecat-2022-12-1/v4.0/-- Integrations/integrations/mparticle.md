---
title: "mParticle"
slug: "mparticle"
excerpt: "Integrate in-app subscription events from RevenueCat with mParticle"
hidden: false
metadata: 
  title: "mParticle Integration – RevenueCat"
  description: "RevenueCat can automatically send subscription events into mParticle. From there, you pass these events on to any of the hundreds of other integrations on their platform."
  image: 
    0: "https://files.readme.io/650ba44-RevenueCat_Docs_OG.png"
    1: "RevenueCat Docs OG.png"
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: "2020-06-17T19:13:08.598Z"
updatedAt: "2023-02-21T15:00:54.545Z"
---
[block:callout]
{
  "type": "success",
  "body": "The mParticle integration is available on the [Pro](https://www.revenuecat.com/pricing) plan."
}
[/block]
mParticle can be a useful integration tool for seeing all events and revenue that occur for your app even if it’s not active for a period of time. You can use mParticle to clean up your data infrastructure and collect new customer data, which can then be connected with other tools through mParticle’s powerful API.

With our mParticle integration, you can:
- Use the API to identify users who are at risk of churning and begin a campaign to win them back.
- Set up push notifications and emails to users who have subscribed to your product but do not engage very much.

With accurate and up-to-date subscription data in Mixpanel, you'll be set to turbocharge your campaigns ⚡️

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
    "0-1": "A new subscription has been purchased or a lapsed user has resubscribed.",
    "1-1": "The start of an auto-renewing subscription product free trial.",
    "2-1": "When an auto-renewing subscription product converts from a free trial to normal paid period.",
    "3-1": "When a user turns off renewals for an auto-renewing subscription product during a free trial period.",
    "4-1": "An existing subscription has been renewed.",
    "5-1": "When a user turns off renewals for an auto-renewing subscription product during the normal paid period.",
    "8-1": "The purchase of any product that's not an auto-renewing subscription.",
    "7-0": "Uncancellation",
    "7-1": "When a user re-enables the auto-renew status for a subscription.",
    "6-0": "Refund",
    "6-1": "When a user canceled their subscription via customer support",
    "9-0": "Expiration",
    "9-1": "A subscription has expired and access should be removed.",
    "10-0": "Billing Issues",
    "10-1": "There has been a problem trying to charge the subscriber. \n \nThis does not mean the subscription has expired (in the case of a grace period enabled).",
    "11-0": "Product Change",
    "11-1": "When user has changed the product of their subscription.\n\nThis does not mean the new subscription is in effect immediately. See [Managing Subscriptions](doc:managing-subscriptions) for more details on updates, downgrades, and crossgrades."
  },
  "cols": 2,
  "rows": 12
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
      "code": "// Configure Purchases SDK\nPurchases.configure(withAPIKey: \"public_sdk_key\", appUserID: \"my_app_user_id\")\n\n\n// Set App User Id in mParticle\nlet options = MParticleOptions(key: \"mParticle_app_key\",\n                               secret: \"mParticle_app_secret\")\nlet identityRequest = MPIdentityApiRequest.withEmptyUser()\nidentityRequest.email = \"user@example.com\"\nidentityRequest.customerId = \"123456\"\noptions.identifyRequest = identityRequest\noptions.onIdentifyComplete =  { (result: MPIdentityApiResult?, error: Error?) in\n    guard error == nil else {\n        // handle error\n        return\n    }\n    guard let result = result else {\n        // handle empty result\n        return\n    }\n    \n    // IMPORTANT: user identified successfully, get the mPID and send to RevenueCat\n    let mPid = result.user.userId\n    Purchases.shared.attribution.collectDeviceIdentifiers()\n    Purchases.shared.attribution.setMparticleID(mPid.stringValue)\n}\n\n// Start mParticle\nMParticle.sharedInstance().start(with: options)",
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
      "code": "// handle logging in\nMParticle.sharedInstance().identity.login(identityRequest, completion: { (result: MPIdentityAPIResult?, error: Error?) in \n    guard error == nil else {\n        // handle error\n        return\n    }\n    guard let result = result else {\n        // handle empty result\n        return\n    }\n    // user identified successfully, get the mPID and send to RevenueCat\n    let mPid = result.user.userId\n    Purchases.shared.attribution.collectDeviceIdentifiers()\n    Purchases.shared.attribution.setMparticleID(mPid.stringValue)\n})",
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
        "https://files.readme.io/595280f-mParticle.png",
        "mParticle.png",
        1819,
        1009,
        "#fbfbfb"
      ]
    }
  ]
}
[/block]
## 3. Send RevenueCat events to mParticle

After you've set up the *Purchases SDK* and mParticle SDK to have the same user identity, you can "turn on" the integration and configure the event names from the RevenueCat dashboard.

1. Navigate to your project in the RevenueCat dashboard and find the *Integrations* card in the left menu. Select **+ New** 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/9e35ec7-Screen_Shot_2021-12-01_at_12.23.10_PM.png",
        "Screen Shot 2021-12-01 at 12.23.10 PM.png",
        332,
        410,
        "#f5f6f5"
      ]
    }
  ]
}
[/block]
2. Choose **mParticle** from the Integrations menu
3. Add your **Server to Server Keys** and **Server to Server Secrets** for each platform from step 2
4. Enter the event names that RevenueCat will send or choose the default event names
5. Select whether you want sales reported as gross revenue (before app store commission), or after store commission and/or estimated taxes.

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
# Sample Events
Below are sample JSONs that are delivered to mParticle for the different event types.
[block:code]
{
  "codes": [
    {
      "code": "{\n    \"events\": [\n        {\n            \"data\": {\n                \"source_message_id\": \"12345678-1234-1234-1234-123456789012\",\n                \"timestamp_unixtime_ms\": 1640653937777,\n                \"custom_attributes\": {\n                    \"revenuecat_product_id\": \"weekly_sub\",\n                    \"revenuecat_event\": \"initial_purchase\"\n                },\n                \"product_action\": {\n                    \"action\": \"purchase\",\n                    \"transaction_id\": \"GPA.1234-5678-9012-34567\",\n                    \"total_amount\": 5.99,\n                    \"products\": [\n                        {\n                            \"id\": \"weekly_sub\",\n                            \"price\": 5.99,\n                            \"quantity\": 1,\n                            \"total_product_amount\": 5.99\n                        }\n                    ]\n                },\n                \"currency_code\": \"USD\",\n                \"is_non_interactive\": false\n            },\n            \"event_type\": \"commerce_event\"\n        }\n    ],\n    \"source_request_id\": \"12345678-1234-1234-1234-123456789012\",\n    \"user_attributes\": {\n        \"$country\": \"GB\",\n        \"revenuecat_$ip\": \"123.45.67.89\",\n        \"revenuecat_$appsflyerId\": \"1234567890123-1234567890123456789\",   \n        \"revenuecat_$onesignalId\": \"1234567890123-1234567890123456789\",   \n        \"revenuecat_aliases\": [\n            \"12abc345d67e890fgh12j3lm456n7890\"\n        ],\n        \"revenuecat_app_user_id\": \"123456789\",\n        \"revenuecat_original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\"\n    },\n    \"device_info\": {\n        \"platform\": \"Android\",\n        \"android_advertising_id\": \"12345678-1234-1234-1234-123456789012\"\n    },\n    \"application_info\": {\n        \"application_name\": \"App_Name\",\n        \"package\": \"co.appname\",\n        \"os\": \"Android\"\n    },\n    \"user_identities\": {},\n    \"schema_version\": 2,\n    \"environment\": \"production\",\n    \"mpid\": \"12345678\"\n}",
      "language": "json",
      "name": "Initial Purchase"
    },
    {
      "code": "{\n    \"events\": [\n        {\n            \"data\": {\n                \"event_name\": \"trial_started\",\n                \"custom_event_type\": \"transaction\",\n                \"source_message_id\": \"12345678-1234-1234-1234-123456789012\",\n                \"timestamp_unixtime_ms\": 1593506190000,\n                \"custom_attributes\": {\n                    \"revenuecat_product_id\": \"weekly_sub\",\n                    \"revenuecat_event\": \"trial_started\"\n                }\n            },\n            \"event_type\": \"custom_event\"\n        }\n    ],\n    \"source_request_id\": \"12345678-1234-1234-1234-123456789012\",\n    \"user_attributes\": {\n        \"$country\": \"MD\",\n        \"revenuecat_aliases\": [\n            \"12abc345d67e890fgh12j3lm456n7890\"\n        ],\n        \"revenuecat_app_user_id\": \"123456789\",\n        \"revenuecat_original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\"\n    },\n    \"device_info\": {\n        \"platform\": \"iOS\",\n        \"ios_advertising_id\": \"12345678-1234-1234-1234-123456789012\",\n    },\n    \"application_info\": {\n        \"application_name\": \"App_Name\",\n        \"package\": \"co.appname\",\n    },\n    \"user_identities\": {},\n    \"schema_version\": 2,\n    \"environment\": \"production\",\n    \"mpid\": \"12345678\"\n}",
      "language": "json",
      "name": "Trial Started"
    },
    {
      "code": "{\n    \"events\": [\n        {\n            \"data\": {\n                \"source_message_id\": \"12345678-1234-1234-1234-123456789012\",\n                \"timestamp_unixtime_ms\": 1593505191000,\n                \"custom_attributes\": {\n                    \"revenuecat_product_id\": \"weekly_sub\",\n                    \"revenuecat_event\": \"trial_converted\"\n                },\n                \"product_action\": {\n                    \"action\": \"purchase\",\n                    \"transaction_id\": \"123456789012345\",\n                    \"total_amount\": 5.99,\n                    \"products\": [\n                        {\n                            \"id\": \"weekly_sub\",\n                            \"price\": 5.99,\n                            \"quantity\": 1,\n                            \"total_product_amount\": 5.99\n                        }\n                    ]\n                },\n                \"currency_code\": \"USD\",\n                \"is_non_interactive\": true\n            },\n            \"event_type\": \"commerce_event\"\n        }\n    ],\n    \"source_request_id\": \"12345678-1234-1234-1234-123456789012\",\n    \"user_attributes\": {\n        \"$country\": \"DE\",\n        \"revenuecat_aliases\": [\n            \"12abc345d67e890fgh12j3lm456n7890\"\n        ],\n        \"revenuecat_app_user_id\": \"123456789\",\n        \"revenuecat_original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\"\n    },\n    \"device_info\": {\n        \"platform\": \"iOS\",\n        \"ios_advertising_id\": \"12345678-1234-1234-1234-123456789012\"\n    },\n    \"application_info\": {\n        \"application_name\": \"App_Name\",\n        \"package\": \"co.appname\",\n    },\n    \"user_identities\": {},\n    \"schema_version\": 2,\n    \"environment\": \"production\",\n    \"mpid\": \"12345678\"\n}",
      "language": "json",
      "name": "Trial Converted"
    },
    {
      "code": "{\n    \"events\": [\n        {\n            \"data\": {\n                \"event_name\": \"trial_cancelled\",\n                \"custom_event_type\": \"transaction\",\n                \"source_message_id\": \"12345678-1234-1234-1234-123456789012\",\n                \"timestamp_unixtime_ms\": 1593505162390,\n                \"custom_attributes\": {\n                    \"revenuecat_product_id\": \"weekly_sub\",\n                    \"revenuecat_event\": \"trial_cancelled\"\n                }\n            },\n            \"event_type\": \"custom_event\"\n        }\n    ],\n    \"source_request_id\": \"12345678-1234-1234-1234-123456789012\",\n    \"user_attributes\": {\n        \"$country\": \"GB\",\n        \"revenuecat_aliases\": [\n            \"12abc345d67e890fgh12j3lm456n7890\"\n        ],\n        \"revenuecat_app_user_id\": \"123456789\",\n        \"revenuecat_original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\"\n    },\n    \"device_info\": {\n        \"platform\": \"iOS\",\n        \"ios_advertising_id\": \"12345678-1234-1234-1234-123456789012\"\n    },\n    \"application_info\": {\n        \"application_name\": \"App_Name\",\n        \"package\": \"co.appname\",\n    },\n    \"user_identities\": {},\n    \"schema_version\": 2,\n    \"environment\": \"production\",\n    \"mpid\": \"12345678\"\n}",
      "language": "json",
      "name": "Trial Cancelled"
    },
    {
      "code": "{\n    \"events\": [\n        {\n            \"data\": {\n                \"source_message_id\": \"12345678-1234-1234-1234-123456789012\",\n                \"timestamp_unixtime_ms\": 1593514136000,\n                \"custom_attributes\": {\n                    \"revenuecat_product_id\": \"weekly_sub\",\n                    \"revenuecat_event\": \"renewal\"\n                },\n                \"product_action\": {\n                    \"action\": \"purchase\",\n                    \"transaction_id\": \"123456789012345\",\n                    \"total_amount\": 5.99,\n                    \"products\": [\n                        {\n                            \"id\": \"weekly_sub\",\n                            \"price\": 5.99,\n                            \"quantity\": 1,\n                            \"total_product_amount\": 5.99\n                        }\n                    ]\n                },\n                \"currency_code\": \"USD\",\n                \"is_non_interactive\": true\n            },\n            \"event_type\": \"commerce_event\"\n        }\n    ],\n    \"source_request_id\": \"12345678-1234-1234-1234-123456789012\",\n    \"user_attributes\": {\n        \"$country\": \"FR\",\n        \"revenuecat_aliases\": [\n            \"12abc345d67e890fgh12j3lm456n7890\"\n        ],\n        \"revenuecat_app_user_id\": \"123456789\",\n        \"revenuecat_original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\"\n    },\n    \"device_info\": {\n        \"platform\": \"iOS\",\n        \"ios_advertising_id\": \"12345678-1234-1234-1234-123456789012\"\n    },\n    \"application_info\": {\n        \"application_name\": \"App_Name\",\n        \"package\": \"co.appname\",\n    },\n    \"user_identities\": {},\n    \"schema_version\": 2,\n    \"environment\": \"production\",\n    \"mpid\": \"12345678\"\n}",
      "language": "json",
      "name": "Renewal"
    },
    {
      "code": "{\n    \"events\": [\n        {\n            \"data\": {\n                \"event_name\": \"cancellation\",\n                \"custom_event_type\": \"transaction\",\n                \"source_message_id\": \"12345678-1234-1234-1234-123456789012\",\n                \"timestamp_unixtime_ms\": 1593507675551,\n                \"custom_attributes\": {\n                    \"revenuecat_product_id\": \"weekly_sub\",\n                    \"revenuecat_event\": \"cancellation\"\n                }\n            },\n            \"event_type\": \"custom_event\"\n        }\n    ],\n    \"source_request_id\": \"12345678-1234-1234-1234-123456789012\",\n    \"user_attributes\": {\n        \"$country\": \"RU\",\n        \"revenuecat_aliases\": [\n            \"12abc345d67e890fgh12j3lm456n7890\"\n        ],\n        \"revenuecat_app_user_id\": \"123456789\",\n        \"revenuecat_original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\"\n    },\n    \"device_info\": {\n        \"platform\": \"iOS\",\n        \"ios_advertising_id\": \"12345678-1234-1234-1234-123456789012\"\n    },\n    \"application_info\": {\n        \"application_name\": \"App_Name\",\n        \"package\": \"co.appname\",\n    },\n    \"user_identities\": {},\n    \"schema_version\": 2,\n    \"environment\": \"production\",\n    \"mpid\": \"12345678\"\n}",
      "language": "json",
      "name": "Cancellation"
    },
    {
      "code": "{\n    \"events\": [\n        {\n            \"data\": {\n                \"event_name\": \"uncancellation\",\n                \"custom_event_type\": \"transaction\",\n                \"source_message_id\": \"12345678-1234-1234-1234-123456789012\",\n                \"timestamp_unixtime_ms\": 1657090180007,\n                \"custom_attributes\": {\n                    \"revenuecat_product_id\": \"weekly_sub\",\n                    \"revenuecat_event\": \"uncancellation\"\n                }\n            },\n            \"event_type\": \"custom_event\"\n        }\n    ],\n    \"source_request_id\": \"12345678-1234-1234-1234-123456789012\",\n    \"user_attributes\": {\n        \"$country\": \"US\",\n        \"revenuecat_$ip\": \"123.45.67.89\",\n        \"revenuecat_$appsflyerId\": \"1234567890123-1234567890123456789\",   \n        \"revenuecat_$onesignalId\": \"1234567890123-1234567890123456789\",   \n        \"revenuecat_aliases\": [\n            \"12abc345d67e890fgh12j3lm456n7890\"\n        ],\n        \"revenuecat_app_user_id\": \"123456789\",\n        \"revenuecat_original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\"\n    },\n    \"device_info\": {\n        \"platform\": \"iOS\",\n        \"ios_advertising_id\": \"12345678-1234-1234-1234-123456789012\"\n    },\n    \"application_info\": {\n        \"application_name\": \"App_Name\",\n        \"package\": \"co.appname\",\n        \"os\": \"IOS\"\n    },\n    \"user_identities\": {},\n    \"schema_version\": 2,\n    \"environment\": \"production\",\n    \"mpid\": \"12345678\"\n}",
      "language": "json",
      "name": "Uncancellation"
    }
  ]
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "{\n    \"events\": [\n        {\n            \"data\": {\n                \"event_name\": \"expiration\",\n                \"custom_event_type\": \"transaction\",\n                \"source_message_id\": \"12345678-1234-1234-1234-123456789012\",\n                \"timestamp_unixtime_ms\": 1643111704000,\n                \"custom_attributes\": {\n                    \"revenuecat_expiration_reason\": \"UNSUBSCRIBE\",\n                    \"revenuecat_product_id\": \"weekly_sub\",\n                    \"revenuecat_event\": \"expiration\"\n                }\n            },\n            \"event_type\": \"custom_event\"\n        }\n    ],\n    \"source_request_id\": \"12345678-1234-1234-1234-123456789012\",\n    \"user_attributes\": {\n        \"$country\": \"AU\",\n        \"revenuecat_$ip\": \"123.45.67.89\",\n        \"revenuecat_$appsflyerId\": \"1234567890123-1234567890123456789\",   \n        \"revenuecat_$onesignalId\": \"1234567890123-1234567890123456789\",   \n        \"revenuecat_aliases\": [\n            \"12abc345d67e890fgh12j3lm456n7890\"\n        ],\n        \"revenuecat_app_user_id\": \"123456789\",\n        \"revenuecat_original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\"\n    },\n    \"device_info\": {\n        \"platform\": \"iOS\",\n        \"ios_advertising_id\": \"12345678-1234-1234-1234-123456789012\"\n    },\n    \"application_info\": {\n        \"application_name\": \"App_Name\",\n        \"package\": \"co.appname\",\n        \"os\": \"iOS\"\n    },\n    \"user_identities\": {},\n    \"schema_version\": 2,\n    \"environment\": \"production\",\n    \"mpid\": \"12345678\"\n}",
      "language": "json",
      "name": "Expiration"
    },
    {
      "code": "{\n    \"events\": [\n        {\n            \"data\": {\n                \"event_name\": \"billing_issue\",\n                \"custom_event_type\": \"transaction\",\n                \"source_message_id\": \"12345678-1234-1234-1234-123456789012\",\n                \"timestamp_unixtime_ms\": 1643386961344,\n                \"custom_attributes\": {\n                    \"revenuecat_product_id\": \"weekly_sub\",\n                    \"revenuecat_event\": \"billing_issue\"\n                }\n            },\n            \"event_type\": \"custom_event\"\n        }\n    ],\n    \"source_request_id\": \"12345678-1234-1234-1234-123456789012\",\n    \"user_attributes\": {\n        \"$country\": \"US\",\n        \"revenuecat_$ip\": \"123.45.67.89\",\n        \"revenuecat_$appsflyerId\": \"1234567890123-1234567890123456789\",   \n        \"revenuecat_$onesignalId\": \"1234567890123-1234567890123456789\",   \n        \"revenuecat_aliases\": [\n            \"12abc345d67e890fgh12j3lm456n7890\"\n        ],\n        \"revenuecat_app_user_id\": \"123456789\",\n        \"revenuecat_original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\"\n    },\n    \"device_info\": {\n        \"platform\": \"iOS\",\n        \"ios_advertising_id\": \"12345678-1234-1234-1234-123456789012\"\n    },\n    \"application_info\": {\n        \"application_name\": \"App_Name\",\n        \"package\": \"co.appname\",\n        \"os\": \"iOS\"\n    },\n    \"user_identities\": {},\n    \"schema_version\": 2,\n    \"environment\": \"production\",\n    \"mpid\": \"12345678\"\n}",
      "language": "json",
      "name": "Billing Issue"
    },
    {
      "code": "{\n    \"events\": [\n        {\n            \"data\": {\n                \"event_name\": \"product_change\",\n                \"custom_event_type\": \"transaction\",\n                \"source_message_id\": \"12345678-1234-1234-1234-123456789012\",\n                \"timestamp_unixtime_ms\": 1642376571000,\n                \"custom_attributes\": {\n                    \"revenuecat_new_product_id\": \"weekly_sub\",\n                    \"revenuecat_product_id\": \"monthly_sub\",\n                    \"revenuecat_event\": \"product_change\"\n                }\n            },\n            \"event_type\": \"custom_event\"\n        }\n    ],\n    \"source_request_id\": \"12345678-1234-1234-1234-123456789012\",\n    \"user_attributes\": {\n        \"$country\": \"US\",\n        \"revenuecat_$ip\": \"123.45.67.89\",\n        \"revenuecat_$appsflyerId\": \"1234567890123-1234567890123456789\",   \n        \"revenuecat_$onesignalId\": \"1234567890123-1234567890123456789\",   \n        \"revenuecat_aliases\": [\n            \"12abc345d67e890fgh12j3lm456n7890\"\n        ],\n        \"revenuecat_app_user_id\": \"123456789\",\n        \"revenuecat_original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\"\n    },\n    \"device_info\": {\n        \"platform\": \"iOS\",\n        \"ios_advertising_id\": \"12345678-1234-1234-1234-123456789012\"\n    },\n    \"application_info\": {\n        \"application_name\": \"App_Name\",\n        \"package\": \"co.appname\",\n        \"os\": \"iOS\"\n    },\n    \"user_identities\": {},\n    \"schema_version\": 2,\n    \"environment\": \"production\",\n    \"mpid\": \"12345678\"\n}",
      "language": "json",
      "name": "Product Change"
    }
  ]
}
[/block]
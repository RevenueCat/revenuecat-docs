---
title: "mParticle"
slug: "mparticle"
excerpt: "Integrate in-app subscription events from RevenueCat with mParticle"
hidden: false
createdAt: "2020-06-17T19:13:08.598Z"
updatedAt: "2020-06-26T15:14:53.207Z"
---
[block:callout]
{
  "type": "success",
  "body": "The mParticle integration is only available on [paid](https://www.revenuecat.com/pricing) plans."
}
[/block]
RevenueCat can automatically send subscription events into mParticle. From there, you pass these events on to any of the hundreds of other integrations on their platform. This is useful for tracking all events and revenue that occur for your app even if it's not active for a period of time.

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
    "6-1": "When a user canceled their subscription via customer support"
  },
  "cols": 2,
  "rows": 9
}
[/block]
For events that have revenue, such as trial conversions and renewals, RevenueCat will automatically record this amount along with the event in mParticle.
[block:api-header]
{
  "title": "1. Set mParticle user identity"
}
[/block]
If you're using the mParticle SDK, you can set the User ID to match the RevenueCat App User Id. This way, events sent from the mParticle SDK and events sent from RevenueCat can be synced to the same user.


Create an `identityRequest` and add it to the `MParticleOptions` that you pass to the `start()` method on the mParticle SDK to set the same App User Id that is set in RevenueCat.
[block:code]
{
  "codes": [
    {
      "code": "// Configure Purchases SDK\nPurchases.configure(withAPIKey: \"public_sdk_key\", appUserID: \"my_app_user_id\")\n\n\n// Set App User Id in mParticle\nlet options = MParticleOptions(key: \"mParticle_app_key\",\n                               secret: \"mParticle_app_secret\")\nlet identityRequest = MPIdentityApiRequest.withEmptyUser()\nidentityRequest.email = \"user@example.com\"\nidentityRequest.customerId = \"123456\"\noptions.identifyRequest = identityRequest\noptions.onIdentifyComplete =  { (result: MPIdentityApiResult?, error: Error?) in\n    guard error == nil else {\n        // handle error\n        return\n    }\n    guard let result = result else {\n        // handle empty result\n        return\n    }\n    \n    // user identified successfully, get the mPID and send to RevenueCat\n    let mPid = result.user.userId\n    Purchases.addAttributionData([:], from: .mParticle, forNetworkUserId: mPid.stringValue)\n}\n\n// Start mParticle\nMParticle.sharedInstance().start(with: options)",
      "language": "swift"
    },
    {
      "code": "// Configure Purchases SDK\n[RCPurchases configureWithAPIKey:@\"public_sdk_key\" appUserID:@\"my_app_user_id\"];\n\n\n// Set App User Id in mParticle\nMParticleOptions *options = [MParticleOptions optionsWithKey:@\"mParticle_app_key\"\n                             secret:@\"mParticle_app_secret\"];\nMPIdentityApiRequest *identityRequest = [MPIdentityApiRequest requestWithEmptyUser];\nidentityRequest.email = @\"user@example.com\";\nidentityRequest.customerId = @\"123456\";\noptions.identifyRequest = identityRequest;\noptions.onIdentifyComplete = ^(MPIdentityApiResult *_Nullable apiResult, NSError *_Nullable error) {\n    if (error) {\n        // handle error\n        return;\n    }\n    if (apiResult == nil) {\n        // handle empty result\n        return;\n    }\n    // user identified successfully, get the mPID and send to RevenueCat\n    NSNumber *mPid = [apiResult.user userId];\n    [RCPurchases addAttributionData:@{}.mutableCopy,\n                        fromNetwork:RCAttributionNetworkAdjust,\n                   forNetworkUserId:[mPid stringValue]];\n};\n\n\n// Start mParticle\n[[MParticle sharedInstance] startWithOptions:options];",
      "language": "objectivec"
    },
    {
      "code": "// Configure Purchases SDK\nPurchases.configure(this, \"my_api_key\", \"my_app_user_id\");\n\n\n// Set App User Id in mParticle\nIdentityApiRequest identityRequest = IdentityApiRequest.withEmptyUser()\n    .email(\"user@example.com\")\n    .customerId(\"123456\")\n    .build();\n\nBaseIdentityTask identifyTask = new BaseIdentityTask()\n    .addFailureListener(new TaskFailureListener() {\n      @Override\n      public void onFailure(IdentityHttpResponse identityHttpResponse) {\n        // handle failure\n      }\n    }).addSuccessListener(new TaskSuccessListener() {\n      @Override\n      public void onSuccess(IdentityApiResult identityApiResult) {\n        // user identified successfully, get the mPID and send to RevenueCat\n        long mPid = identityApiResult.getUser().getId();\n        Purchases.addAttributionData(new HashMap<>(), Purchases.AttributionNetwork.MPARTICLE, String.valueOf(mPid));\n      }\n    });\n\nMParticleOptions options = MParticleOptions.builder(this)\n    .credentials(\"mParticle_app_key\", \"mParticle_app_secret\")\n    .identify(identityRequest)\n    .identifyTask(identifyTask)\n    .build();\n\n\n// Start mParticle\nMParticle.start(options);",
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
      "code": "// handle logging in\nMParticle.sharedInstance().identity.login(identityRequest, completion: { (result: MPIdentityAPIResult?, error: Error?) in \n    guard error == nil else {\n        // handle error\n        return\n    }\n    guard let result = result else {\n        // handle empty result\n        return\n    }\n    // user identified successfully, get the mPID and send to RevenueCat\n    let mPid = result.user.userId\n    Purchases.addAttributionData([:], from: .mParticle, forNetworkUserId: mPid.stringValue)\n})",
      "language": "swift"
    },
    {
      "code": "// handle logging in\n[[[MParticle sharedInstance] identity] login:identityRequest\n                                  completion:^(MPIdentityApiResult *_Nullable apiResult, NSError *_Nullable error) {\n    if (error) {\n        // handle error\n        return;\n    }\n    if (apiResult == nil) {\n        // handle empty result\n        return;\n    }\n    // user identified successfully, get the mPID and send to RevenueCat\n    NSNumber *mPid = [apiResult.user userId];\n    [RCPurchases addAttributionData:@{}.mutableCopy,\n                        fromNetwork:RCAttributionNetworkAdjust,\n                   forNetworkUserId:[mPid stringValue]];\n}];",
      "language": "objectivec"
    },
    {
      "code": "// handle logging in\nMParticle.getInstance().Identity().login(identityRequest)\n    .addFailureListener(new TaskFailureListener() {\n        @Override\n        public void onFailure(IdentityHttpResponse identityHttpResponse) {\n            // handle error\n        }\n    })\n    .addSuccessListener(new TaskSuccessListener() {\n        @Override\n        public void onSuccess(IdentityApiResult identityApiResult) {\n          // user identified successfully, get the mPID and send to RevenueCat\n        \tlong mPid = identityApiResult.getUser().getId();\n        \tPurchases.addAttributionData(new HashMap<>(), Purchases.AttributionNetwork.MPARTICLE, String.valueOf(mPid));\n        }\n    });",
      "language": "java"
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "2. Add RevenueCat Feed Inputs in mParticle"
}
[/block]
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

[block:api-header]
{
  "title": "3. Send RevenueCat events to mParticle"
}
[/block]
After you've set up the *Purchase* SDK and mParticle SDK to have the same user identity, you can "turn on" the integration and configure the event names from the RevenueCat dashboard.

1. Navigate to your app in the RevenueCat dashboard and choose 'mParticle' from the integrations menu
2. Add your Server to Server Keys and Server to Server Secrets for each platform from step 2
3. Enter the event names that RevenueCat will send or choose the default event names
4. Select whether you want RevenueCat to report proceeds (after app store cut) or revenue (gross sales)

##Sample Event
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
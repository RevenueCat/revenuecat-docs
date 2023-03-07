---
title: "Observer Mode"
slug: "observer-mode"
excerpt: "Using RevenueCat without changing existing purchase code"
hidden: false
metadata: 
  title: "Observer Mode | RevenueCat"
  description: "In some cases, if you have already built a functioning subscription system, it may not be possible or feasible to use the Purchases SDK to make purchases. However, you can still use the SDK to get access to the advanced charting, webhooks, and attribution that RevenueCat can provide."
  image: 
    0: "https://files.readme.io/37631db-Reddit__E.jpg"
    1: "Reddit – E.jpg"
    2: 1200
    3: 630
    4: "#fbabaf"
createdAt: {}
updatedAt: "2020-07-30T21:35:40.343Z"
---
In some cases, if you have already built a functioning subscription system, it may not be possible or feasible to use the Purchases SDK to make purchases. However, you can still use the SDK to get access to the advanced charting, webhooks, and attribution that RevenueCat can provide.

By simply setting up and instantiating an instance of *Purchases* in "Observer Mode", receipts can be recorded and stored in the RevenueCat backend without interfering with any of your existing code. On iOS, receipts can be recorded automatically, on Android, use `syncPurchases` after purchases and restores to record receipts in RevenueCat.
[block:api-header]
{
  "title": "Requirements"
}
[/block]
Google Play Billing Library: 2.0+ (Android only)
[block:callout]
{
  "type": "info",
  "body": "Older versions of Google Play Billing Library are supported in [version 2.4.1](https://docs.revenuecat.com/v2.3/docs/android) or the Android SDK"
}
[/block]

[block:api-header]
{
  "title": "1. Configure Purchases SDK in Observer Mode"
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "Purchases.configure(\n            withAPIKey: \"my_api_key\",\n            appUserID: \"my_app_user_id\",\n            observerMode: true)",
      "language": "swift"
    },
    {
      "code": "[RCPurchases \n\tconfigureWithAPIKey:@\"my_api_key\" \n\tappUserID:@\"my_app_user_id\"\n\tobserverMode: YES];",
      "language": "objectivec"
    },
    {
      "code": "Purchases.configure(this, \"my_api_key\", \"my_app_user_id\", true)",
      "language": "kotlin"
    },
    {
      "code": "Purchases.configure(this, \"my_api_key\", \"my_app_user_id\", true);\n",
      "language": "java"
    },
    {
      "code": "await Purchases.setup(\"my_api_key\", observerMode: true);",
      "language": "javascript",
      "name": "Flutter"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "danger",
  "body": "On Android, RevenueCat won't consume or acknowledge any purchase in Observer Mode so be sure your app is handling that. **Failure to do so will result in your purchases being refunded after 3 days.**",
  "title": "Important (Android only)"
}
[/block]
## Enable Observer Mode in Unity configuration (Unity Only)
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/399c9ad-Screen_Shot_2019-05-31_at_12.07.34_PM.png",
        "Screen Shot 2019-05-31 at 12.07.34 PM.png",
        482,
        388,
        "#b9b9b9"
      ]
    }
  ]
}
[/block]

[block:callout]
{
  "type": "danger",
  "title": "Important note regarding InAppBillingService (Android Unity only)",
  "body": "If using RevenueCat alongside Unity IAP or other plugin that includes the Android InAppBillingService class, follow [this instructions :fa-arrow-right:](doc:unity#installation-with-unity-iap-side-by-side)"
}
[/block]

[block:api-header]
{
  "title": "2. Sync purchases with RevenueCat (Android only)"
}
[/block]
On Android (or cross-platform SDKs), any time a purchase or restore occurs in your app you should call the `syncPurchases` method to record it in RevenueCat. 
[block:code]
{
  "codes": [
    {
      "code": "// Called any time a purchase or restore \n// is successful in your existing code\nPurchases.sharedInstance.syncPurchases()\n  ",
      "language": "kotlin"
    },
    {
      "code": "// Called any time a purchase or restore \n// is successful in your existing code\nPurchases.getSharedInstance().syncPurchases();\n",
      "language": "java"
    },
    {
      "code": "// Called any time a purchase or restore \n// is successful in your existing code\nPurchases.syncPurchases();",
      "language": "javascript",
      "name": "React Native"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "warning",
  "title": "Important",
  "body": "Failing to call `syncPurchases` after purchases and restores in Observer Mode will prevent any transactions from being recorded."
}
[/block]

[block:callout]
{
  "type": "success",
  "title": "You've done it!",
  "body": "That's all there is to it to enable RevenueCat in your app! There are certain features, like [entitlements](doc:entitlements), that can only be enabled with a deeper SDK integration. When the that time comes, head back to our [Quickstart guide](doc:getting-started-1) to get set up."
}
[/block]
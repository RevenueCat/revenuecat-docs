---
title: "Migrating Subscriptions"
slug: "migrating-existing-subscriptions"
excerpt: "How to migrate subscriptions from your existing setup"
hidden: false
createdAt: "2018-07-07T00:12:45.821Z"
updatedAt: "2019-06-25T20:38:42.587Z"
---
If you already have an existing app that is using subscriptions, it's easy to migrate them over to RevenueCat. You can use the Purchases SDK to replace all of your in-app-purchase code, or you can just use it along side your current stack to track in-app-purchases and benefit from our charting, webhooks, and other integrations.
[block:api-header]
{
  "title": "Client Side Migration"
}
[/block]

[block:callout]
{
  "type": "success",
  "body": "This section assumes you've followed our [Quickstart](doc:getting-started-1) section of our Getting Started guide to install and configure our SDK."
}
[/block]
The Purchases SDK automatically detects new transactions and sends them to RevenueCat. However, when migrating from an older system, you need to tell *Purchases* to sync to ensure we are tracking your subscribers correctly.

The way to do this is: if your existing subscription code knows you have a subscription, but RevenueCat does not, then restore transactions. 

See the following pseudo example.
[block:code]
{
  "codes": [
    {
      "code": "const isSubscribedInOldSystem = oldTracking.isSubscribed();\nconst isSubscribedInRevenueCat = purchaserInfo.hasActiveEntitlement(\"my_entitlement_identifier\");\n\n// If the old system says we have a subscription, but RevenueCat does not\nif (isSubscribedInOldSystem && !isSubscribedInRevenueCat) \n{\n  // Tell Purchases to restoreTransactions. \n  // This will sync the user's receipt with RevenueCat.\n  Purchases.shared.restoreTransactions { (purchaserInfo, error) in }\n}",
      "language": "javascript",
      "name": "Example"
    }
  ]
}
[/block]
When a subscriber launches with the first version containing *Purchases* it will trigger a restore. Once the restore is complete, it won't be triggered again.
[block:api-header]
{
  "title": "Use RevenueCat Backend Only (Observer Mode)"
}
[/block]
In some cases, if you have already built a functioning subscription system, it may not be possible or feasible to use the Purchases SDK to make purchases. However, you can still use the SDK to get access to the advanced charting, webhooks, and attribution that RevenueCat can provide.

By simply setting up and instantiating an instance of *Purchases* in "Observer Mode", receipts can be recorded and stored in the RevenueCat backend without interfering with any of your existing code. On iOS, receipts can be recorded automatically, on Android, use `syncPurchases` after purchases and restores to record receipts in RevenueCat.

## 1. Configure *Purchases SDK* in Observer Mode
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
      "code": "Purchases.setup(\"my_api_key\", \"my_app_user_id\", true);",
      "language": "javascript",
      "name": "React Native"
    },
    {
      "code": "Purchases.setup(\"my_api_key\", \"my_app_user_id\", true);",
      "language": "javascript",
      "name": "Cordova"
    },
    {
      "code": "\n// Set the observer mode on in the Unity editor as shown below",
      "language": "csharp",
      "name": "Unity"
    },
    {
      "code": "await Purchases.setup(\"my_api_key\", \"my_app_user_id\", true);",
      "language": "javascript",
      "name": "Flutter"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "warning",
  "title": "Unity Only",
  "body": "Make sure Observer Mode is enabled in Unity"
}
[/block]

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
## 2. Sync transactions with RevenueCat (Android only)
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
    },
    {
      "code": "// Called any time a purchase or restore \n// is successful in your existing code\nPurchases.syncPurchases();",
      "language": "javascript",
      "name": "Cordova"
    },
    {
      "code": "purchases.SyncPurchases();",
      "language": "csharp",
      "name": "Unity"
    },
    {
      "code": "// Called any time a purchase or restore \n// is successful in your existing code\nPurchases.syncPurchases();",
      "language": "javascript",
      "name": "Flutter"
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

[block:api-header]
{
  "title": "Capturing Old Data"
}
[/block]
If you wish import historical data from users who no longer use your app you can send us a bulk receipt file for import. [Email us](mailto:support@revenuecat.com) for details.
[block:api-header]
{
  "title": "Next Steps"
}
[/block]
* If you want to use your own user identifiers, read about [setting app user ids :fa-arrow-right:](doc:user-ids)
* Once you're ready to test your integration, you can follow our guides on [testing and debugging :fa-arrow-right:](doc:debugging)
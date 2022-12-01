---
title: "Migrating Existing Subscriptions"
slug: "migrating-existing-subscriptions"
excerpt: "How to migrate an subscriptions from your existing setup."
hidden: false
createdAt: "2018-07-07T00:12:45.821Z"
---
[block:api-header]
{
  "title": "Client Side Migration"
}
[/block]
The Purchases SDK automatically detects new transactions and sends them to RevenueCat. However, when migrating from an older system, you need to tell Purchases to sync to ensure we are tracking your subscribers correctly.

The way to do this is: if your existing subscription code knows you have a subscription, but RevenueCat does not, then restore transactions. 

See the following pseudo example.
[block:code]
{
  "codes": [
    {
      "code": "const isSubscribedInOldSystem = oldTracking.isSubscribed();\nconst isSubscribedInRevenueCat = purchaserInfo.hasActiveEntitlement(\"pro\");\n\n// If the old system says we have a subscription, but RevenueCat does not\nif (isSubscribedInOldSystem && !isSubscribedInRevenueCat) \n{\n  // Tell Purchases to restoreTransactions. \n  // This will sync the user's receipt with RevenueCat.\n  Purchases.restoreTransactions();\n}",
      "language": "javascript",
      "name": "Example"
    }
  ]
}
[/block]
When a subscriber launches with the first version containing Purchases it will trigger a restore. Once the restore is complete, it won't be triggered again.
[block:api-header]
{
  "title": "Capturing Old Data"
}
[/block]
If you wish import historical data from users who no longer use your app you can send us a bulk receipt file for import. [Email us](mailto:jacob@revenuecat.com) for details.
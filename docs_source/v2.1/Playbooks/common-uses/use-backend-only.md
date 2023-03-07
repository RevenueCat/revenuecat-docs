---
title: "Observer Mode"
slug: "use-backend-only"
excerpt: "How to migrate subscriptions from your existing setup"
hidden: true
createdAt: "2018-12-14T01:24:45.064Z"
updatedAt: "2019-04-23T18:07:26.708Z"
---
If you already have an existing app that is using subscriptions, it's easy to migrate them over to RevenueCat. You can use the Purchases SDK to replace all of your in-app-purchase code, or you can just use it along side your current stack to track in-app-purchases and benefit from our charting, webhooks, and other integrations.
[block:api-header]
{
  "title": "1. Client Side Migration"
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
      "code": "const isSubscribedInOldSystem = oldTracking.isSubscribed();\nconst isSubscribedInRevenueCat = purchaserInfo.hasActiveEntitlement(\"pro\");\n\n// If the old system says we have a subscription, but RevenueCat does not\nif (isSubscribedInOldSystem && !isSubscribedInRevenueCat) \n{\n  // Tell Purchases to restoreTransactions. \n  // This will sync the user's receipt with RevenueCat.\n  Purchases.restoreTransactions();\n}",
      "language": "javascript",
      "name": "Example"
    }
  ]
}
[/block]
When a subscriber launches with the first version containing *Purchases* it will trigger a restore. Once the restore is complete, it won't be triggered again.
[block:api-header]
{
  "title": "2. Use RevenueCat Backend Only"
}
[/block]
In some cases, if you have already built a functioning subscription system, it may not be possible or feasible to use the Purchases SDK to make purchases. However, you can still use the SDK to get access to the advanced charting, webhooks, and attribution that RevenueCat can provide.

By simply setting up and instantiating an instance of *Purchases*, any receipt will automatically be recorded and stored in the RevenueCat backend. It's important that you still implement the delegate/listeners (even if they're empty) and set `finishTransactions` to false. This lets *Purchases* know that another system is in place to validate purchases.
[block:code]
{
  "codes": [
    {
      "code": "let purchases = RCPurchases(apiKey: \"my_api_key\")\npurchases.delegate = self\npurchases.finishTransactions = false",
      "language": "swift"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "warning",
  "title": "Important",
  "body": "If you aren't using Purchases SDK to make the purchase. Be sure to the listener/delegate and `finishTransactions` to `false`."
}
[/block]

[block:callout]
{
  "type": "warning",
  "title": "Configure entitlements for accurate pricing",
  "body": "If you aren't using Purchases SDK to make the purchase. Make sure you've properly [configured entitlements](doc:entitlements) in the dashboard to get accurate pricing information."
}
[/block]

[block:api-header]
{
  "title": "Capturing Old Data"
}
[/block]
If you wish import historical data from users who no longer use your app you can send us a bulk receipt file for import. [Email us](mailto:jacob@revenuecat.com) for details.
[block:api-header]
{
  "title": "Next Steps"
}
[/block]
* If you want to use your own user identifiers, read about [setting app user ids :fa-arrow-right:](doc:user-ids)
* Once you're ready to test your integration, you can follow our guides on [testing purchases :fa-arrow-right:](doc:testing-purchases)
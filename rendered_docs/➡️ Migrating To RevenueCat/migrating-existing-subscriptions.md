---
title: Migrating Subscriptions
slug: migrating-existing-subscriptions
excerpt: How to migrate subscriptions from your existing setup
hidden: false
metadata:
  title: Migrating in-app subscriptions to RevenueCat
  description: If you already have an existing app that is using subscriptions, it's
    easy to migrate them over to RevenueCat. You can use the Purchases SDK to replace
    all of your in-app-purchase code, or you can just use it alongside your current
    stack to track in-app-purchases and benefit from our charting, webhooks, and other
    integrations.
  image:
    0: https://files.readme.io/a57161b-RevenueCat_Docs_OG.png
    1: RevenueCat Docs OG.png
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: '2023-03-02T20:33:26.499Z'
updatedAt: '2023-06-16T16:17:40.079Z'
category: 648c78a2becc511ba812b3f7
order: 0
---
[block:parameters]
{
  "data": {
    "0-0": "Work with a member of the RevenueCat team to [start building your custom migration plan.](https://www.revenuecat.com/request-a-migration-plan?utm_source=migrationdocs&utm_medium=web&utm_campaign=formfill)",
    "h-0": "🧑‍💻 Request Your Migration Consult"
  },
  "cols": 1,
  "rows": 1
}
[/block]
If you already have an existing app that is using subscriptions, it's easy to migrate them over to RevenueCat. 
Whether you're looking to replace all of your in-app-purchase code, or use RevenueCat along side your current setup in [Observer Mode](doc:observer-mode), this guide will help you get started.

If you're building in-app purchases into your app for the first time, a migration should not be required and you can start from our [Quickstart](doc:getting-started) guide.

If you have any questions about migrating your app to RevenueCat, or have a high volume of historical receipts in import, feel free to [contact sales](https://www.revenuecat.com/demo/) to see how we can help with the process. 

# Determining Your Migration Path
Migrating existing subscribers to RevenueCat can be done server-side, or client-side. A server side migration is preferable whenever possible because it ensures that all subscriptions will be recorded in RevenueCat regardless of any in-app activity.

**Do you have all of the raw base64 Apple receipts and/or purchase tokens saved in your database?
**
**Yes** :fa-arrow-right: Server-side migration
**No** :fa-arrow-right: Client-side migration

Alternatively, if you're looking to access to charting, webhooks, and integrations in RevenueCat while retaining your existing code for fetching products, making purchases, and checking subscription status, check our guide on [Observer Mode](doc:observer-mode) for details on setting this up.

# Server Side Migration

A server side migration involves sending all of the Apple receipts and/or purchase tokens to RevenueCat via the `POST /receipts` endpoint. From there, RevenueCat will validate the receipt and keep the subscription up-to-date. 

Before you begin migrating historical receipts, **we recommend first setting up a server-side [Observer Mode](doc:observer-mode) implementation**. This ensures that new purchases happening during and after the import are still captured in RevenueCat.

After these two steps, if any of your customers open the version of the app containing the RevenueCat SDK their subscription status will automatically be synced.

**Check out our guide on [Importing Receipts](doc:receipt-imports) for more details on server-side migrations.**

# Client Side Migration

A client side migration is a technique to sync existing purchases with RevenueCat when the app is first launched.

The RevenueCat SDK will automatically detect new transactions and sends them to RevenueCat. However, when migrating from an older system, you need to tell the RevenueCat SDK to sync to ensure we are tracking your subscribers correctly. Keep in mind that with a client-side migration RevenueCat will only ever "see" customers that open the latest version of the app containing RevenueCat and sync their purchases.

The way to do this is: if your existing subscription code knows you have a subscription, but RevenueCat does not, then programmatically sync purchases. 

See the following pseudo example.
```javascript Example
const isSubscribedInOldSystem = oldTracking.isSubscribed()
const isSubscribedInRevenueCat = !customerInfo.entitlements.active.isEmpty

// If the old system says we have a subscription, but RevenueCat does not
if (isSubscribedInOldSystem && !isSubscribedInRevenueCat) 
{
  // Tell Purchases to syncPurchases. 
  // This will sync the user's receipt with RevenueCat.
  Purchases.shared.syncPurchases { (customerInfo, error) in }
}
```

When a subscriber launches with the first version containing RevenueCat it will trigger a sync. Once the sync is complete, it won't be triggered again.
[block:callout]
{
  "type": "info",
  "title": "Do not sync or restore on every app launch",
  "body": "It's okay to trigger a sync once per subscriber programmatically the first time they open a version of your app containing RevenueCat. You **should not** call this programmatically on every app launch for every user. This can increase latency in your app and can unintentionally alias users together."
}
[/block]

[block:callout]
{
  "type": "warning",
  "title": "iOS Only: originalApplicationVersion is always 1.0 in Sandbox",
  "body": "According to Apple, the `originalApplicationVersion` is always 1.0 in sandbox and TestFlight, which is unlike production where it reflects the build number of the app. If you're migrating your app and relying on `originalApplicationVersion` to determine which subscribers should have access in RevenueCat, try mocking different values of `originalApplicationVersion` to ensure the migration works as expected. You can learn more about `originalApplicationVersion` in [Apple's docs](https://developer.apple.com/library/archive/releasenotes/General/ValidateAppStoreReceipt/Chapters/ReceiptFields.html)."
}
[/block]

# Next Steps

* If you want to use your own user identifiers, read about [setting app user ids :fa-arrow-right:](doc:user-ids)
* Once you're ready to test your integration, you can follow our guides on [testing and debugging :fa-arrow-right:](doc:debugging)
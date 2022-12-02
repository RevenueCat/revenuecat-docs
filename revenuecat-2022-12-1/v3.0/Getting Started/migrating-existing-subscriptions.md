---
title: "Migrating Subscriptions"
slug: "migrating-existing-subscriptions"
excerpt: "How to migrate subscriptions from your existing setup"
hidden: false
metadata: 
  title: "Migrating in-app subscriptions | RevenueCat"
  description: "If you already have an existing app that is using subscriptions, it's easy to migrate them over to RevenueCat. You can use the Purchases SDK to replace all of your in-app-purchase code, or you can just use it alongside your current stack to track in-app-purchases and benefit from our charting, webhooks, and other integrations."
  image: 
    0: "https://files.readme.io/885c4b4-Reddit__E.jpg"
    1: "Reddit – E.jpg"
    2: 1200
    3: 630
    4: "#fbabaf"
createdAt: {}
updatedAt: "2020-07-09T16:42:08.963Z"
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
      "code": "const isSubscribedInOldSystem = oldTracking.isSubscribed()\nconst isSubscribedInRevenueCat = !purchaserInfo.entitlements.active.isEmpty\n\n// If the old system says we have a subscription, but RevenueCat does not\nif (isSubscribedInOldSystem && !isSubscribedInRevenueCat) \n{\n  // Tell Purchases to restoreTransactions. \n  // This will sync the user's receipt with RevenueCat.\n  Purchases.shared.restoreTransactions { (purchaserInfo, error) in }\n}",
      "language": "javascript",
      "name": "Example"
    }
  ]
}
[/block]
When a subscriber launches with the first version containing *Purchases* it will trigger a restore. Once the restore is complete, it won't be triggered again.
[block:callout]
{
  "type": "info",
  "title": "Do not restore on every app launch",
  "body": "It's okay to trigger a restore once per subscriber programmatically the first time they open a version of your app containing RevenueCat. You **should not** call restore programmatically on every app launch for every user. This can increase latency in your app and unintentionally alias users together."
}
[/block]

[block:api-header]
{
  "title": "Use RevenueCat Backend Only (Observer Mode)"
}
[/block]
In some cases, if you have already built a functioning subscription system, it may not be possible or feasible to use the Purchases SDK to make purchases. However, you can still use the SDK to get access to the advanced charting, webhooks, and attribution that RevenueCat can provide.

Check our guide on [Observer Mode](doc:observer-mode) for details on setting this up.


[block:api-header]
{
  "title": "Importing Existing Data"
}
[/block]
### Using the REST API
If you have the correct data saved already for your users, you can import them through the REST API `POST /receipts` endpoint. This will create the user in RevenueCat and start tracking their subscription status.

More info in the [API Reference here](https://docs.revenuecat.com/reference#receipts).

### Bulk imports
For large datasets that aren't practical to import through the REST API, you can send us a .csv file to import manually. [Email us](mailto:support@revenuecat.com) with the below information and we'll be in touch.
[block:callout]
{
  "type": "info",
  "title": "Bulk imports DO NOT trigger webhooks or integrations",
  "body": "Bulk imports done by RevenueCat will not trigger any webhook or integration events. If this is a requirement, then you'll need to perform an import using the REST API as mentioned above."
}
[/block]
To do a receipt import we'll need 3 csv files for iOS, Android and Stripe with the following fields:

**iOS:**
  * app_user_id
  * receipt (the raw receipt file)
  * product_id
  * price
  * introductory_price (if not a free trial)
  * currency

*If you don't have prices and currency with the transactions we can take a separate file with a mapping of product_id, price, currency as well. If there were any known price changes, those should also be included here.

**Android:**
  * app_user_id
  * product_id
  * token

**Important: **We need to know your [API quota](https://developers.google.com/android-publisher/quotas) with Google and approximately how many remaining requests per day you have so we don't exceed your quota.

*Note that Android receipts that expired more than 90 days ago can't be imported, and more than 90 days of history can't be retrieved from each Android receipt. This means that Android charts for historical data won't be accurate.

**Stripe:**
 * app_user_id
 * subscription_token (e.g. sub_xxxxxx)



[block:callout]
{
  "type": "info",
  "title": "Allow up to 7-days for bulk imports",
  "body": "Depending on the size of your import and the current queue, please allow up to a week for your import to be processed."
}
[/block]

[block:api-header]
{
  "title": "Next Steps"
}
[/block]
* If you want to use your own user identifiers, read about [setting app user ids :fa-arrow-right:](doc:user-ids)
* Once you're ready to test your integration, you can follow our guides on [testing and debugging :fa-arrow-right:](doc:debugging)
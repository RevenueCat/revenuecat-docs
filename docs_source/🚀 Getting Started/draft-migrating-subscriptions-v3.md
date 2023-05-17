---
title: "[DRAFT] Migrating Subscriptions v3"
slug: draft-migrating-subscriptions-v3
excerpt: How to migrate subscriptions from your existing setup
hidden: true
createdAt: '2021-12-29T03:23:56.845Z'
updatedAt: '2021-12-29T07:05:43.408Z'
category: 6465151171aace1d6f6388e2
---
If you already have an existing app that is using subscriptions, it's easy to migrate them over to RevenueCat. You can use the Purchases SDK to replace all of your in-app-purchase code, or you can just use it along side your current stack to track in-app-purchases and benefit from our charting, webhooks, and other integrations.

# Determining Your Migration Path

Your migration path will depend on your app’s existing infrastructure and the data that you store. Use the flowchart and table below to determine which steps need to be taken to complete your migration.

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/26752a1-Migration_Diagram-4.png",
        "Migration Diagram-4.png",
        1800,
        1158,
        "#f7f7f7"
      ],
      "sizing": "full",
      "border": true
    }
  ]
}
[/block]

[block:parameters]
{
  "data": {
    "h-0": "Situation",
    "h-1": "Client Side Migration",
    "h-2": "Forward Receipts to RevenueCat",
    "h-3": "Server Side Migration",
    "0-0": "I'm implementing a **new app** with RevenueCat that has no active or past customers.",
    "0-1": "Not needed",
    "0-2": "Not needed",
    "0-3": "Not needed",
    "1-0": "I'm migrating an **existing app** to RevenueCat that has either active or past customers.",
    "1-1": "Required",
    "1-2": "Optional\n\nRecommended only if you send receipts to your backend for validation.",
    "1-3": "Optional\n\nRecommended only if you collect receipts in a database."
  },
  "cols": 4,
  "rows": 2
}
[/block]
# Configure Server-Side Receipt Forwarding

If you normally collect receipts or purchase tokens on your backend, then you should forward receipts of purchases on older app versions from your backend to RevenueCat with the [createPurchase API endpoint](https://docs.revenuecat.com/reference#receipts). 

Please configure the receipt forwarding before importing your existing data to guarantee that there are no gaps during the migration process.

# Client Side Migration
[block:callout]
{
  "type": "success",
  "body": "This section assumes you've followed our [Quickstart](doc:getting-started-1) section of our Getting Started guide to install and configure our SDK."
}
[/block]
A client side migration is a technique to sync existing purchases with RevenueCat when the app is first launched.

If you are integrating RevenueCat into an app that already has paying customers, it is strongly recommended to implement a client side migration to ensure that RevenueCat has all past purchases.

A client side migration is recommended even if you implement other migration strategies - it's compatible with all of the other strategies in this guide and improves your app's robustness during the migration period. Without a client side migration, RevenueCat will detect new purchases but may miss old purchases, which can lock users out of their purchases once you ship RevenueCat in your app.

The way to do this is: if your existing subscription code knows you have a subscription, but RevenueCat does not, then programmatically sync purchases. 

See the following pseudo-code for an example.
[block:code]
{
  "codes": [
    {
      "code": "const isSubscribedInOldSystem = oldTracking.isSubscribed()\nconst isSubscribedInRevenueCat = !purchaserInfo.entitlements.active.isEmpty\n\n// If the old system says we have a subscription, but RevenueCat does not\nif (isSubscribedInOldSystem && !isSubscribedInRevenueCat) \n{\n  // Tell Purchases to syncPurchases. \n  // This will sync the user's receipt with RevenueCat.\n  Purchases.shared.syncPurchases { (purchaserInfo, error) in }\n}",
      "language": "javascript",
      "name": "Client side migration example"
    }
  ]
}
[/block]
When a subscriber launches with the first version containing *Purchases*, it will trigger a sync. Once the sync is complete, it won't be triggered again.
[block:callout]
{
  "type": "info",
  "title": "Do not sync or restore on every app launch",
  "body": "It's okay to trigger a sync once per subscriber programmatically the first time they open a version of your app containing RevenueCat. You **should not** call this programmatically on every app launch for every user. This can increase latency in your app and unintentionally alias users together."
}
[/block]

[block:callout]
{
  "type": "warning",
  "title": "iOS Only: originalApplicationVersion in Sandbox testing is unreliable",
  "body": "According to Apple, the `originalApplicationVersion` is always 1.0 in sandbox and TestFlight, which is unlike production where it reflects the build number of the app. If you're migrating your app and relying on `originalApplicationVersion` to determine which subscribers should have access in RevenueCat, try mocking different values of `originalApplicationVersion` to ensure the migration works as expected. You can learn more about `originalApplicationVersion` in [Apple's docs](https://developer.apple.com/library/archive/releasenotes/General/ValidateAppStoreReceipt/Chapters/ReceiptFields.html)."
}
[/block]
# Server Side Migration

A server side migration is possible if you store receipts/purchase tokens on your backend. You can import those receipts into RevenueCat in two ways:

1. Sending them to RevenueCat with the [createPurchase API endpoint](https://docs.revenuecat.com/reference#receipts).
2. Sending bulk imports to [RevenueCat support](mailto:support@revenuecat.com) to do an assisted bulk import.

## Using the REST API

If you have the correct data saved already for your users, you can import them through the REST API `POST /receipts` endpoint. This will create the user in RevenueCat and start tracking their subscription status.

More info in the [API Reference here](https://docs.revenuecat.com/reference#receipts).

Here's a pseudo-code sample to illustrate how this process would look like as a one-time migration job to import receipts into RevenueCat:
[block:code]
{
  "codes": [
    {
      "code": "// Get all user IDs and receipts from your database.\nconst records = ...\n\nfor (let record of records) {\n  \n  // Pull the app user ID, receipt, product ID, and price info from the database record.\n  // This is going to vary depending on your database schema.\n  const app_user_id = record.user_id;\n  const receipt = record.receipt;\n  const product_id = record.product_id;\n  const price = record.price;\n  const currency = record.currency.\n\n  // Build the request headers with your public SDK key.\n\tvar myHeaders = new Headers();\n\tmyHeaders.append(\"Content-Type\", \"application/json\");\n\tmyHeaders.append(\"Authorization\", \"Bearer PUBLIC_SDK_KEY\");\n\n  // Build the request body with the app user ID, receipt, and required info.\n\tconst raw = JSON.stringify({\n\t  product_id: product_id,\n\t  price: price,\n\t  currency: currency,\n\t  is_restore: 'false',\n\t  app_user_id: app_user_id,\n\t  fetch_token: receipt\n\t});\n\n\tconst requestOptions = {\n\t  method: 'POST',\n\t  headers: myHeaders,\n\t  body: raw,\n\t  redirect: 'follow'\n\t};\n\n  // Send the receipt to RevenueCat.\n\tfetch(\"https://api.revenuecat.com/v1/receipts\", requestOptions)\n\t  .then(response => response.text())\n\t  .then(result => console.log(result))\n\t  .catch(error => console.log('error', error));\n  \n  // Sleep for one second to remain under the rate limit.\n  sleep(1);\n}",
      "language": "javascript",
      "name": "Migration script"
    }
  ]
}
[/block]
## Bulk imports

For large datasets that aren't practical to import through the REST API, you can send us a .csv file to import manually. [Email us](mailto:support@revenuecat.com) with the below information and we'll be in touch. Please note that depending on the size, bulk imports can take time to complete, sometimes up to several days or weeks for the largest data sets. Please keep this in consideration as you are planning your launch.
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

You can find a sample iOS reference csv file [here](https://github.com/RevenueCat-Samples/import-csv-samples/blob/main/ios_receipt_import_sample.csv).

*If you don't have prices and currency with the transactions we can take a separate file with a mapping of product_id, price, currency as well. If there were any known price changes, those should also be included here. You can find a sample price mapping [here](https://github.com/RevenueCat-Samples/import-csv-samples/blob/main/ios_product_price_map_sample.csv).
[block:callout]
{
  "type": "info",
  "title": "Product prices are required for iOS imports",
  "body": "Whether you include the products and prices with each receipt in the CSV file or attach a separate file of products and prices, the prices of products is required so that RevenueCat can accurately compute your charts and send events with correct revenue data."
}
[/block]

[block:callout]
{
  "type": "warning",
  "title": "`latest_receipt_info` not supported for iOS imports",
  "body": "The entire iOS receipt file must be used for imports. The [`latest_receipt_info`](https://developer.apple.com/documentation/appstorereceipts/responsebody/latest_receipt_info) is not supported as it's only a subset of the entire receipt."
}
[/block]
**Google Play:**
  * app_user_id
  * product_id
  * token

You can find a reference Google Play import csv file [here](https://github.com/RevenueCat-Samples/import-csv-samples/blob/main/android_receipt_import_sample.csv).

**Important: **We need to know your [API quota](https://developers.google.com/android-publisher/quotas) with Google and approximately how many remaining requests per day you have so we don't exceed your quota.

*Note that Google Play receipts that expired more than 90 days ago can't be imported, and only the current status can be retrieved from each receipt. This means that historical data won't be presented accurately in charts.

**Stripe:**
 * app_user_id
 * subscription_token (e.g. sub_xxxxxx)

You can find a reference Stripe import csv file [here](https://github.com/RevenueCat-Samples/import-csv-samples/blob/main/stripe_receipt_import_sample.csv).

*Note that Stripe subscription tokens contain only the current status can be retrieved from each Stripe subscription token. This means that Stripe charts for historical data won't be accurate.
[block:callout]
{
  "type": "info",
  "title": "Allow up to 7 days for bulk imports",
  "body": "Depending on the size of your import and the current queue, please allow up to a week for your import to be processed."
}
[/block]
# Use RevenueCat Backend Only (Observer Mode)

In some cases, if you have already built a functioning subscription system, it may not be possible or feasible to use the Purchases SDK to make purchases. However, you can still use the SDK to get access to the advanced charting, webhooks, and attribution that RevenueCat can provide.

Check our guide on [Observer Mode](doc:observer-mode) for details on setting this up.

# Next Steps

* If you want to use your own user identifiers, read about [setting app user ids :fa-arrow-right:](doc:user-ids)
* Once you're ready to test your integration, you can follow our guides on [testing and debugging :fa-arrow-right:](doc:debugging)
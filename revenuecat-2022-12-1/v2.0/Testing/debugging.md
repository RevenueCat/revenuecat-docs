---
title: "Debugging"
slug: "debugging"
excerpt: "View and understand Purchases logs"
hidden: false
createdAt: "2019-01-25T20:16:05.419Z"
updatedAt: "2019-03-26T17:39:10.220Z"
---
[block:callout]
{
  "type": "success",
  "body": "This section assumes you've followed our [Quickstart](doc:getting-started-1) section of our Getting Started guide to install and configure our SDK."
}
[/block]

[block:api-header]
{
  "title": "Debugging"
}
[/block]
*Purchases* will log important information and errors to help you understand what is going on behind the scenes. You can enable more detailed debug logs with the `debugLogsEnabled` flag. You can set this immediately in your app while testing, **before you configure Purchases**.
[block:code]
{
  "codes": [
    {
      "code": "Purchases.debugLogsEnabled = true\nPurchases.configure(withAPIKey: \"my_api_key\", appUserID: \"my_app_user_id\")",
      "language": "swift"
    },
    {
      "code": "RCPurchases.debugLogsEnabled = YES;\n[RCPurchases configureWithAPIKey:@\"my_api_key\" appUserID:@\"my_app_user_id\"];",
      "language": "objectivec"
    },
    {
      "code": "Purchases.debugLogsEnabled = true\nPurchases.configure(this, \"my_api_key\", \"my_app_user_id\")",
      "language": "kotlin"
    },
    {
      "code": "Purchases.setDebugLogsEnabled(true);\nPurchases.configure(this, \"my_api_key\", \"my_app_user_id\");",
      "language": "java"
    },
    {
      "code": "Purchases.setDebugLogsEnabled(true);\nPurchases.setup(\"my_api_key\", \"my_app_user_id\");",
      "language": "javascript"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "title": "OS_ACTIVITY_MODE",
  "body": "On iOS, disabling `OS_ACTIVITY_MODE` in your XCode scheme will block debug logs from printing in the console. If you have debug logs enabled, but don't see any output, go to `Product -> Scheme -> Edit Scheme...` in Xcode and uncheck the `OS_ACTIVITY_MODE` environment variable."
}
[/block]

## Filtering *Purchases* Logs
All logs from *Purchases SDK* are prepended with "`[Purchases]`", you can use this string as a filter in your log output to clearly see the logs that are from *Purchases*.
[block:api-header]
{
  "title": "Sample Output"
}
[/block]
Below are sample logs generated when setting `debugLogsEnabled = true`. Keep an eye out for any `ERROR` level logs, status codes other than `200`, or any `Invalid Product Identifiers`.
[block:code]
{
  "codes": [
    {
      "code": "[Purchases] - DEBUG: Debug logging enabled.\n[Purchases] - DEBUG: SDK Version - 2.0.0\n[Purchases] - DEBUG: Initial App User ID - <APP_USER_ID>\n[Purchases] - DEBUG: Changing App User ID: (null) -> <APP_USER_ID>\n[Purchases] - DEBUG: GET /v1/subscribers/<APP_USER_ID>\n[Purchases] - DEBUG: GET /v1/subscribers/<APP_USER_ID>/products\n[Purchases] - DEBUG: Delegate set\n[Purchases] - DEBUG: Sending latest purchaser info to delegate\n[Purchases] - DEBUG: Vending purchaserInfo from cache\n[Purchases] - DEBUG: Vending purchaserInfo from cache\n[Purchases] - DEBUG: applicationDidBecomeActive\n[Purchases] - DEBUG: No cached entitlements, fetching\n[Purchases] - DEBUG: GET /v1/subscribers/<APP_USER_ID> 200\n[Purchases] - DEBUG: Purchaser info updated, sending to delegate\n[Purchases] - DEBUG: GET /v1/subscribers/<APP_USER_ID>/products 200\n[Purchases] - DEBUG: Requesting products with identifiers: {(\n    onetime,\n    annual,\n    onemonth\n)}\n[Purchases] - DEBUG: Products request finished\n[Purchases] - DEBUG: Valid Products:\n[Purchases] - DEBUG: annual - <SKProduct: 0x600000308980>\n[Purchases] - DEBUG: onemonth - <SKProduct: 0x6000003131b0>\n[Purchases] - DEBUG: onetime - <SKProduct: 0x600000313180>\n[Purchases] - DEBUG: Invalid Product Identifiers - (\n)\n[Purchases] - DEBUG: 2 completion handlers waiting on products\n[Purchases] - DEBUG: makePurchase - onemonth\n[Purchases] - DEBUG: PaymentQueue updatedTransaction: onemonth (null) ((null)) - 0\n[Purchases] - DEBUG: PaymentQueue updatedTransaction: onemonth <TRANSACTION_ID> ((null)) - 2\n[Purchases] - DEBUG: Finishing onemonth <TRANSACTION_ID> ((null))\n[Purchases] - DEBUG: PaymentQueue removedTransaction: onemonth <TRANSACTION_ID> ((null)) - 2",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "Next Steps"
}
[/block]
* You've verified that *Purchases* is running correctly, time to start [making purchases in sandbox :fa-arrow-right:](doc:sandbox)
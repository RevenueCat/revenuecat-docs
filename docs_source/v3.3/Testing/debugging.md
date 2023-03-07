---
title: "Debugging"
slug: "debugging"
excerpt: "View and understand Purchases logs"
hidden: false
metadata: 
  title: "Debugging – RevenueCat"
  description: "Purchases will log important information and errors to help you understand what is going on behind the scenes. You can enable more detailed debug logs with the `debugLogsEnabled` flag. You can set this immediately in your app while testing, before you configure Purchases."
  image: 
    0: "https://files.readme.io/490fee4-60993e3c40039b67596bcc8c_slack-preview.png"
    1: "60993e3c40039b67596bcc8c_slack-preview.png"
    2: 1200
    3: 627
    4: "#f45476"
createdAt: {}
updatedAt: "2021-10-19T13:23:28.700Z"
---
[block:callout]
{
  "type": "success",
  "body": "This section assumes you've followed our [Quickstart](doc:getting-started-1) section of our Getting Started guide to install and configure our SDK."
}
[/block]
# Debugging

*Purchases* will log important information and errors to help you understand what is going on behind the scenes. You can enable more detailed debug logs with the `debugLogsEnabled` flag. You can set this immediately in your app while testing, **before you configure Purchases**.
[block:code]
{
  "codes": [
    {
      "code": "Purchases.logLevel = .debug\nPurchases.configure(withAPIKey: \"public_sdk_key\", appUserID: \"my_app_user_id\")",
      "language": "swift"
    },
    {
      "code": "RCPurchases.logLevel = RCLogLevelDebug;\n[RCPurchases configureWithAPIKey:@\"public_sdk_key\" appUserID:@\"my_app_user_id\"];",
      "language": "objectivec"
    },
    {
      "code": "Purchases.debugLogsEnabled = true\nPurchases.configure(this, \"public_sdk_key\", \"my_app_user_id\")",
      "language": "kotlin"
    },
    {
      "code": "Purchases.setDebugLogsEnabled(true);\nPurchases.configure(this, \"public_sdk_key\", \"my_app_user_id\");",
      "language": "java"
    },
    {
      "code": "Purchases.setDebugLogsEnabled(true);\nPurchases.setup(\"public_sdk_key\", \"my_app_user_id\");",
      "language": "javascript",
      "name": "React Native"
    },
    {
      "code": "await Purchases.setDebugLogsEnabled(true);\nawait Purchases.setup(\"public_sdk_key\", \"my_app_user_id\");",
      "language": "javascript",
      "name": "Flutter"
    },
    {
      "code": "Purchases.SetDebugLogsEnabled(true);",
      "language": "javascript",
      "name": "Unity"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "title": "OS_ACTIVITY_MODE and Common iOS Issues",
  "body": "On iOS, disabling `OS_ACTIVITY_MODE` in your Xcode scheme will block debug logs from printing in the console. If you have debug logs enabled, but don't see any output, go to `Product -> Scheme -> Edit Scheme...` in Xcode and uncheck the `OS_ACTIVITY_MODE` environment variable.\n\nFlutter projects using Swift may fail to show debug logs in the console if you are using Visual Studio Code, Android Studio, or other IDE's to run your project. We recommend running your Flutter project using Xcode to view debug logs from the Purchases SDK."
}
[/block]

## Filtering *Purchases* Logs
All logs from *Purchases SDK* are prepended with "`[Purchases]`", you can use this string as a filter in your log output to clearly see the logs that are from *Purchases*.

## Debug Logs Legend
Emojis currently available on the following platforms:
* Android version >= 4.0.2
* iOS version >= 3.10.1
Support for other platforms coming soon.
[block:parameters]
{
  "data": {
    "h-0": "Icon(s)",
    "h-1": "Log Level",
    "h-2": "Description",
    "0-0": "🍎 :bangbang:",
    "0-1": "Error\nWarn",
    "0-2": "Error/warning messages generated from Apple",
    "1-0": "🤖 :bangbang:",
    "1-1": "Error\nWarn",
    "1-2": "Error/warning messages generated from Google",
    "2-0": "😿 :bangbang:",
    "2-1": "Error",
    "2-2": "Error messages generated from RevenueCat",
    "3-0": "😻",
    "3-1": "Debug",
    "3-2": "Success messages generated from RevenueCat",
    "4-0": "😻💰",
    "4-1": "Info",
    "4-2": "RevenueCat received purchase information",
    "5-0": "💰",
    "5-1": "Debug",
    "5-2": "Messages related to your products",
    "6-0": "ℹ️",
    "6-1": "Debug\nInfo",
    "6-2": "Messages detailing events that occur in your app cycle",
    "7-0": "👤",
    "7-1": "Debug",
    "7-2": "Messages related to a user's App User ID",
    "8-0": ":warning:",
    "8-1": "Warn",
    "8-2": "Warning messages about implementation",
    "h-3": "Required Actions",
    "0-3": "View [error handling doc](doc:errors) if on Error level",
    "1-3": "View [error handling doc](doc:errors) if on Error level",
    "2-3": "View [error handling doc](doc:errors)",
    "3-3": "No action required, for informational purposes.",
    "4-3": "No action required, for informational purposes.",
    "5-3": "No action required, for informational purposes.",
    "6-3": "No action required, for informational purposes.",
    "7-3": "No action required, for informational purposes.",
    "8-3": "View log message for additional information."
  },
  "cols": 4,
  "rows": 9
}
[/block]
Messages that have the double red exclamation marks prefix (:bangbang:) attached provides important information regarding your implementation and may require your attention. Paying attention to the source of the message will assist you during the development process. Be sure to address these logs before shipping your app. 

# Sample Output

Below are sample logs generated when setting `debugLogsEnabled = true`. Keep an eye out for any `ERROR` level logs, status codes other than `200`, or any `Invalid Product Identifiers`.
[block:code]
{
  "codes": [
    {
      "code": "[Purchases] - DEBUG: Debug logging enabled.\n[Purchases] - DEBUG: SDK Version - 2.0.0\n[Purchases] - DEBUG: Initial App User ID - <APP_USER_ID>\n[Purchases] - DEBUG: Changing App User ID: (null) -> <APP_USER_ID>\n[Purchases] - DEBUG: GET /v1/subscribers/<APP_USER_ID>\n[Purchases] - DEBUG: GET /v1/subscribers/<APP_USER_ID>/products\n[Purchases] - DEBUG: Delegate set\n[Purchases] - DEBUG: Sending latest purchaser info to delegate\n[Purchases] - DEBUG: Vending purchaserInfo from cache\n[Purchases] - DEBUG: Vending purchaserInfo from cache\n[Purchases] - DEBUG: applicationDidBecomeActive\n[Purchases] - DEBUG: No cached entitlements, fetching\n[Purchases] - DEBUG: GET /v1/subscribers/<APP_USER_ID> 200\n[Purchases] - DEBUG: Purchaser info updated, sending to delegate\n[Purchases] - DEBUG: GET /v1/subscribers/<APP_USER_ID>/products 200\n[Purchases] - DEBUG: Requesting products with identifiers: {(\n    onetime,\n    annual,\n    onemonth\n)}\n[Purchases] - DEBUG: Products request finished\n[Purchases] - DEBUG: Valid Products:\n[Purchases] - DEBUG: annual - <SKProduct: 0x600000308980>\n[Purchases] - DEBUG: onemonth - <SKProduct: 0x6000003131b0>\n[Purchases] - DEBUG: onetime - <SKProduct: 0x600000313180>\n[Purchases] - DEBUG: Invalid Product Identifiers - (\n)\n[Purchases] - DEBUG: 2 completion handlers waiting on products\n[Purchases] - DEBUG: makePurchase - onemonth\n[Purchases] - DEBUG: PaymentQueue updatedTransaction: onemonth (null) ((null)) - 0\n[Purchases] - DEBUG: PaymentQueue updatedTransaction: onemonth <TRANSACTION_ID> ((null)) - 2\n[Purchases] - DEBUG: Finishing onemonth <TRANSACTION_ID> ((null))\n[Purchases] - DEBUG: PaymentQueue removedTransaction: onemonth <TRANSACTION_ID> ((null)) - 2",
      "language": "text"
    },
    {
      "code": "[Purchases] - DEBUG: ℹ️ Debug logging enabled\n[Purchases] - DEBUG: ℹ️ SDK Version - 3.10.1\n[Purchases] - DEBUG: 👤 Initial App User ID - <APP_USER_ID>\n[Purchases] - DEBUG: ℹ️ PurchaserInfo cache is stale, updating caches\n[Purchases] - DEBUG: ℹ️ Offerings cache is stale, updating caches\n[Purchases] - DEBUG: ℹ️ Vending PurchaserInfo from cache.\n[Purchases] - DEBUG: ℹ️ There are no requests currently running, starting request GET /subscribers/<APP_UESR_ID>\n[Purchases] - DEBUG: ℹ️ API request started: GET /v1/subscribers/<APP_UESR_ID>\n[Purchases] - DEBUG: ℹ️ API request started: GET /v1/subscribers/<APP_UESR_ID>/offerings\n[Purchases] - DEBUG: ℹ️ No cached Offerings, fetching from network\n[Purchases] - DEBUG: ℹ️ API request completed with status: GET /v1/subscribers/<APP_UESR_ID>/offerings 200\n[Purchases] - DEBUG: ℹ️ Requesting products from the store with identifiers: {(\n    onetime,\n    annual,\n    onemonth\n)}\n[Purchases] - DEBUG: ℹ️ Products request finished.\n[Purchases] - DEBUG: 💰 Retrieved SKProducts: \n[Purchases] - DEBUG: 💰 onetime - <SKProduct: 0x600000308980>\n[Purchases] - DEBUG: 💰 annual - <SKProduct: 0x600000308980>\n[Purchases] - DEBUG: 💰 onemonth - <SKProduct: 0x600000308980>\n[Purchases] - WARN: 🍎‼️ Invalid Product Identifiers - (\n)\n[Purchases] - DEBUG: ℹ️ 3 completion handlers waiting on products\n[Purchases] - DEBUG: ℹ️ makePurchase\n[Purchases] - DEBUG: 💰 Purchasing product from package  - annual in Offering main\n[Purchases] - DEBUG: ℹ️ PaymentQueue updatedTransaction: annual <TRANSACTION_ID> ((null)) (null) - 0\n\n[Purchases] - DEBUG: 💰 Finishing transaction annual <TRANSACTION_ID> ((null))\n[Purchases] - DEBUG: ℹ️ PaymentQueue removedTransaction: annual <TRANSACTION_ID> (null (null)) (null) - 1",
      "language": "text",
      "name": "With emojis"
    }
  ]
}
[/block]
# Next Steps

* If you spotted any errors while debugging, make sure you're [handling errors correctly :fa-arrow-right:](doc:errors)
* You've verified that *Purchases* is running correctly, time to start [making purchases in sandbox :fa-arrow-right:](doc:sandbox)
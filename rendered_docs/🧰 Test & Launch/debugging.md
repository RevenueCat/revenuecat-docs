---
title: Debugging
slug: debugging
excerpt: View and understand Purchases logs
hidden: false
metadata:
  title: Debugging – RevenueCat
  description: Purchases will log important information and errors to help you understand
    what is going on behind the scenes. You can enable more detailed debug logs with
    the `debugLogsEnabled` flag. You can set this immediately in your app while testing,
    before you configure Purchases.
  image:
    0: https://files.readme.io/126dacb-RevenueCat_Docs_OG.png
    1: RevenueCat Docs OG.png
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: '2022-11-07T19:48:37.380Z'
updatedAt: '2022-11-07T19:48:37.380Z'
category: 640a7bf096064f005a3e667a
---
[block:callout]
{
  "type": "success",
  "body": "This section assumes you've followed our [Quickstart](doc:getting-started-1) section of our Getting Started guide to install and configure our SDK."
}
[/block]
# Debugging

RevenueCat's SDK will log important information and errors to help you understand what is going on behind the scenes. You can enable more detailed debug logs with the `debugLogsEnabled` flag. You can set this immediately in your app while testing, **before you configure Purchases**.
```swift
Purchases.logLevel = .debug
Purchases.configure(withAPIKey: "public_sdk_key", appUserID: "my_app_user_id")
```
```objectivec
RCPurchases.logLevel = RCLogLevelDebug;
[RCPurchases configureWithAPIKey:@"public_sdk_key" appUserID:@"my_app_user_id"];
```
```kotlin
Purchases.debugLogsEnabled = true
Purchases.configure(PurchasesConfiguration.Builder(context, apiKey = "")
            .appUserID("my_app_user_id")
            .build()
```
```java
Purchases.setDebugLogsEnabled(true);
Purchases.configure(new PurchasesConfiguration.Builder(context, "api_key").appUserID("my_app_user_id").build());
```
```javascript
Purchases.SetDebugLogsEnabled(true);
```

[block:callout]
{
  "type": "info",
  "title": "OS_ACTIVITY_MODE and Common iOS Issues",
  "body": "On iOS, disabling `OS_ACTIVITY_MODE` in your Xcode scheme will block debug logs from printing in the console. If you have debug logs enabled, but don't see any output, go to `Product -> Scheme -> Edit Scheme...` in Xcode and uncheck the `OS_ACTIVITY_MODE` environment variable.\n\nFlutter projects using Swift may fail to show debug logs in the console if you are using Visual Studio Code, Android Studio, or other IDE's to run your project. We recommend running your Flutter project using Xcode to view debug logs from the Purchases SDK."
}
[/block]

## Filtering *Purchases* Logs
All logs from the SDK are prepended with "`[Purchases]`", you can use this string as a filter in your log output to clearly see the logs that are from *Purchases*.

## Debug Logs Legend
Emojis currently available on the following platforms:
* Android version >= 4.0.2
* iOS version >= 3.10.1
[block:parameters]
{
  "data": {
    "h-0": "Icon(s)",
    "h-1": "Log Level",
    "h-2": "Description",
    "0-0": "🍎 ‼️",
    "0-1": "Error\nWarn",
    "0-2": "Error/warning messages generated from Apple",
    "1-0": "🤖 ‼️",
    "1-1": "Error\nWarn",
    "1-2": "Error/warning messages generated from Google",
    "3-0": "😿 ‼️",
    "3-1": "Error",
    "3-2": "Error messages generated from RevenueCat",
    "4-0": "😻",
    "4-1": "Debug",
    "4-2": "Success messages generated from RevenueCat",
    "5-0": "😻💰",
    "5-1": "Info",
    "5-2": "RevenueCat received purchase information",
    "6-0": "💰",
    "6-1": "Debug",
    "6-2": "Messages related to your products",
    "7-0": "ℹ️",
    "7-1": "Debug\nInfo",
    "7-2": "Messages detailing events that occur in your app cycle",
    "8-0": "👤",
    "8-1": "Debug",
    "8-2": "Messages related to a user's App User ID",
    "9-0": "⚠️",
    "9-1": "Warn",
    "9-2": "Warning messages about implementation",
    "h-3": "Required Actions",
    "0-3": "View [error handling doc](doc:errors) if on Error level",
    "1-3": "View [error handling doc](doc:errors) if on Error level",
    "3-3": "View [error handling doc](doc:errors)",
    "4-3": "No action required, for informational purposes.",
    "5-3": "No action required, for informational purposes.",
    "6-3": "No action required, for informational purposes.",
    "7-3": "No action required, for informational purposes.",
    "8-3": "No action required, for informational purposes.",
    "9-3": "View log message for additional information.",
    "2-1": "Error\nWarn",
    "2-2": "Error/warning messages generated from Amazon",
    "2-3": "View [error handling doc](doc:errors) if on Error level",
    "2-0": "📦 ‼️"
  },
  "cols": 4,
  "rows": 10
}
[/block]
Messages that have the double red exclamation marks prefix (‼️) attached provides important information regarding your implementation and may require your attention. Paying attention to the source of the message will assist you during the development process. Be sure to address these logs before shipping your app. 

# Sample Output

Below are sample logs generated when setting `debugLogsEnabled = true`. Keep an eye out for any `ERROR` level logs, status codes other than `200`, or any `Invalid Product Identifiers`.
```text
[Purchases] - DEBUG: ℹ️ Debug logging enabled
[Purchases] - DEBUG: ℹ️ SDK Version - 3.10.1
[Purchases] - DEBUG: 👤 Initial App User ID - <APP_USER_ID>
[Purchases] - DEBUG: ℹ️ PurchaserInfo cache is stale, updating caches
[Purchases] - DEBUG: ℹ️ Offerings cache is stale, updating caches
[Purchases] - DEBUG: ℹ️ Vending PurchaserInfo from cache.
[Purchases] - DEBUG: ℹ️ There are no requests currently running, starting request GET /subscribers/<APP_UESR_ID>
[Purchases] - DEBUG: ℹ️ API request started: GET /v1/subscribers/<APP_UESR_ID>
[Purchases] - DEBUG: ℹ️ API request started: GET /v1/subscribers/<APP_UESR_ID>/offerings
[Purchases] - DEBUG: ℹ️ No cached Offerings, fetching from network
[Purchases] - DEBUG: ℹ️ API request completed with status: GET /v1/subscribers/<APP_UESR_ID>/offerings 200
[Purchases] - DEBUG: ℹ️ Requesting products from the store with identifiers: {(
    onetime,
    annual,
    onemonth
)}
[Purchases] - DEBUG: ℹ️ Products request finished.
[Purchases] - DEBUG: 💰 Retrieved SKProducts: 
[Purchases] - DEBUG: 💰 onetime - <SKProduct: 0x600000308980>
[Purchases] - DEBUG: 💰 annual - <SKProduct: 0x600000308980>
[Purchases] - DEBUG: 💰 onemonth - <SKProduct: 0x600000308980>
[Purchases] - WARN: 🍎‼️ Invalid Product Identifiers - (
)
[Purchases] - DEBUG: ℹ️ 3 completion handlers waiting on products
[Purchases] - DEBUG: ℹ️ makePurchase
[Purchases] - DEBUG: 💰 Purchasing product from package  - annual in Offering main
[Purchases] - DEBUG: ℹ️ PaymentQueue updatedTransaction: annual <TRANSACTION_ID> ((null)) (null) - 0

[Purchases] - DEBUG: 💰 Finishing transaction annual <TRANSACTION_ID> ((null))
[Purchases] - DEBUG: ℹ️ PaymentQueue removedTransaction: annual <TRANSACTION_ID> (null (null)) (null) - 1
```
# Next Steps

* If you spotted any errors while debugging, make sure you're [handling errors correctly :fa-arrow-right:](doc:errors)
* You've verified that *Purchases* is running correctly, time to start [making purchases in sandbox :fa-arrow-right:](doc:sandbox)
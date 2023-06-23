---
title: Debugging
slug: debugging
excerpt: View and understand Purchases logs
hidden: false
categorySlug: test-launch
order: 0
---
> 👍 
> 
> This section assumes you've followed our [Quickstart](doc:getting-started-1) section of our Getting Started guide to install and configure our SDK.

RevenueCat's SDK will log important information and errors to help you understand what is going on behind the scenes. You can enable more detailed debug logs with the `debugLogsEnabled` flag. You can set this immediately in your app while testing, **before you configure Purchases**.

```swift 
Purchases.logLevel = .debug
Purchases.configure(withAPIKey: <public_sdk_key>, appUserID: <my_app_user_id>)
```
```objectivec 
RCPurchases.logLevel = RCLogLevelDebug;
[RCPurchases configureWithAPIKey:@<public_sdk_key> appUserID:@<my_app_user_id>];
```
```kotlin 
Purchases.debugLogsEnabled = true
Purchases.configure(PurchasesConfiguration.Builder(context, apiKey = "")
            .appUserID(<my_app_user_id>)
            .build()
```
```java 
Purchases.setDebugLogsEnabled(true);
Purchases.configure(new PurchasesConfiguration.Builder(context, <api_key>).appUserID(<my_app_user_id>).build());
```
```javascript React Native
Purchases.setDebugLogsEnabled(true);
Purchases.setup(<public_sdk_key>, <my_app_user_id>);
```
```javascript Flutter
await Purchases.setDebugLogsEnabled(true);
PurchasesConfiguration pc = PurchasesConfiguration(<public_sdk_key>);
await Purchases.configure(pc);
```
```javascript Unity
Purchases.SetDebugLogsEnabled(true);
```
```javascript Cordova
Purchases.setLogLevel(LOG_LEVEL.DEBUG);
```

> 📘 OS_ACTIVITY_MODE and Common iOS Issues
> 
> On iOS, disabling `OS_ACTIVITY_MODE` in your Xcode scheme will block debug logs from printing in the console. If you have debug logs enabled, but don't see any output, go to `Product -> Scheme -> Edit Scheme...` in Xcode and uncheck the `OS_ACTIVITY_MODE` environment variable.
> 
> Flutter projects using Swift may fail to show debug logs in the console if you are using Visual Studio Code, Android Studio, or other IDE's to run your project. We recommend running your Flutter project using Xcode to view debug logs from the Purchases SDK.

# Debug UI

RevenueCat's iOS 4.22.0+ SDK provides an overlay for your iOS app that displays relevant details of the SDK configuration. The debug overlay includes each of your configured Offerings, with the option to purchase any of the products and validate access to entitlements.

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/03f4de1-simulator_screenshot_0e51e44b-dd33-41f6-9c26-ca3bed754b34.png",
        null,
        "RevenueCat iOS Debug UI"
      ],
      "align": "center",
      "sizing": "240px",
      "border": true
    }
  ]
}
[/block]

```swift SwiftUI
// To display the overlay in SwiftUI, add the `.debugRevenueCatOverlay()` to your view.

// This will display it automatically on app-launch:
ContentView()
  .debugRevenueCatOverlay()

// Alternatively, you can control when to present it:
@State private var debugOverlayVisible: Bool = false

var body: some View {
    Button {
        self.debugOverlayVisible = true
    } label: {
        Text("Display debug screen"
    }
        .debugRevenueCatOverlay(isPresented: self.$debugOverlayVisible)
}
```
```swift UIKit
// To display the overlay in UIKit, use the `presentDebugRevenueCatOverlay` method on any UIViewController:
self.presentDebugRevenueCatOverlay()  

// or, initialize the DebugViewController and present it manually:
let debugOverlay = RevenueCat.DebugViewController()  
self.present(debugOverlay, animated: true)
```

You can export your configuration details in JSON format to share with RevenueCat support if you need to open a support ticket.

Note: The debug UI won't compile for release builds, so you'll need to disable the behavior before archiving for release.

## Reference

| Debug Section | Details                                                                                                                                                                                        |
| :------------ | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Diagnostics   | The status of your configuration based on access to the RevenueCat API with your API key                                                                                                       |
| Configuration | SDK configuration based on your `configure` parameters                                                                                                                                         |
| Customer Info | The configured users’ IDs as well as entitlement details                                                                                                                                       |
| Offerings     | Each of your configured Offerings, packages, and products. Only includes Offerings with products accessible via StoreKit. See our guide on Empty Offerings if your Offerings aren’t populating |

# Debug Logs

All logs from the SDK are prepended with "`[Purchases]`", you can use this string as a filter in your log output to clearly see the logs that are from _Purchases_.

## Reference

Emojis currently available on the following platforms:

- Android version >= 4.0.2
- iOS version >= 3.10.1

[block:parameters]
{
  "data": {
    "h-0": "Icon(s)",
    "h-1": "Log Level",
    "h-2": "Description",
    "h-3": "Required Actions",
    "0-0": "🍎 ‼️",
    "0-1": "Error  \nWarn",
    "0-2": "Error/warning messages generated from Apple",
    "0-3": "View [error handling doc](doc:errors) if on Error level",
    "1-0": "🤖 ‼️",
    "1-1": "Error  \nWarn",
    "1-2": "Error/warning messages generated from Google",
    "1-3": "View [error handling doc](doc:errors) if on Error level",
    "2-0": "📦 ‼️",
    "2-1": "Error  \nWarn",
    "2-2": "Error/warning messages generated from Amazon",
    "2-3": "View [error handling doc](doc:errors) if on Error level",
    "3-0": "😿 ‼️",
    "3-1": "Error",
    "3-2": "Error messages generated from RevenueCat",
    "3-3": "View [error handling doc](doc:errors)",
    "4-0": "😻",
    "4-1": "Debug",
    "4-2": "Success messages generated from RevenueCat",
    "4-3": "No action required, for informational purposes.",
    "5-0": "😻💰",
    "5-1": "Info",
    "5-2": "RevenueCat received purchase information",
    "5-3": "No action required, for informational purposes.",
    "6-0": "💰",
    "6-1": "Debug",
    "6-2": "Messages related to your products",
    "6-3": "No action required, for informational purposes.",
    "7-0": "ℹ️",
    "7-1": "Debug  \nInfo",
    "7-2": "Messages detailing events that occur in your app cycle",
    "7-3": "No action required, for informational purposes.",
    "8-0": "👤",
    "8-1": "Debug",
    "8-2": "Messages related to a user's App User ID",
    "8-3": "No action required, for informational purposes.",
    "9-0": "⚠️",
    "9-1": "Warn",
    "9-2": "Warning messages about implementation",
    "9-3": "View log message for additional information."
  },
  "cols": 4,
  "rows": 10,
  "align": [
    "left",
    "left",
    "left",
    "left"
  ]
}
[/block]

Messages that have the double red exclamation marks prefix (‼️) attached provides important information regarding your implementation and may require your attention. Paying attention to the source of the message will assist you during the development process. Be sure to address these logs before shipping your app. 

## Sample Output

Below are sample logs generated when setting `debugLogsEnabled = true`. Keep an eye out for any `ERROR` level logs, status codes other than `200`, or any `Invalid Product Identifiers`.

```text 
[Purchases] - DEBUG: Debug logging enabled.
[Purchases] - DEBUG: SDK Version - 2.0.0
[Purchases] - DEBUG: Initial App User ID - <APP_USER_ID>
[Purchases] - DEBUG: Changing App User ID: (null) -> <APP_USER_ID>
[Purchases] - DEBUG: GET /v1/subscribers/<APP_USER_ID>
[Purchases] - DEBUG: GET /v1/subscribers/<APP_USER_ID>/products
[Purchases] - DEBUG: Delegate set
[Purchases] - DEBUG: Sending latest purchaser info to delegate
[Purchases] - DEBUG: Vending purchaserInfo from cache
[Purchases] - DEBUG: Vending purchaserInfo from cache
[Purchases] - DEBUG: applicationDidBecomeActive
[Purchases] - DEBUG: No cached entitlements, fetching
[Purchases] - DEBUG: GET /v1/subscribers/<APP_USER_ID> 200
[Purchases] - DEBUG: Purchaser info updated, sending to delegate
[Purchases] - DEBUG: GET /v1/subscribers/<APP_USER_ID>/products 200
[Purchases] - DEBUG: Requesting products with identifiers: {(
    onetime,
    annual,
    onemonth
)}
[Purchases] - DEBUG: Products request finished
[Purchases] - DEBUG: Valid Products:
[Purchases] - DEBUG: annual - <SKProduct: 0x600000308980>
[Purchases] - DEBUG: onemonth - <SKProduct: 0x6000003131b0>
[Purchases] - DEBUG: onetime - <SKProduct: 0x600000313180>
[Purchases] - DEBUG: Invalid Product Identifiers - (
)
[Purchases] - DEBUG: 2 completion handlers waiting on products
[Purchases] - DEBUG: makePurchase - onemonth
[Purchases] - DEBUG: PaymentQueue updatedTransaction: onemonth (null) ((null)) - 0
[Purchases] - DEBUG: PaymentQueue updatedTransaction: onemonth <TRANSACTION_ID> ((null)) - 2
[Purchases] - DEBUG: Finishing onemonth <TRANSACTION_ID> ((null))
[Purchases] - DEBUG: PaymentQueue removedTransaction: onemonth <TRANSACTION_ID> ((null)) - 2
```
```text With emojis
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

- If you spotted any errors while debugging, make sure you're [handling errors correctly ](doc:errors)
- You've verified that _Purchases_ is running correctly, time to start [making purchases in sandbox ](doc:sandbox)
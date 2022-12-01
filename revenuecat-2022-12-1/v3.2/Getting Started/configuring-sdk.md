---
title: "Configuring the SDK"
slug: "configuring-sdk"
hidden: false
metadata: 
  title: "Configuring the SDK – RevenueCat"
  description: "You should only configure Purchases once, usually early in your application lifecycle. After configuration, the same instance is shared throughout your app by accessing the `.shared` instance in the SDK."
  image: 
    0: "https://files.readme.io/f066399-OG_image.png"
    1: "OG image.png"
    2: 1200
    3: 627
    4: "#e9acb0"
createdAt: "2020-06-29T17:25:26.484Z"
updatedAt: "2021-12-06T00:09:36.320Z"
---
If this is your first time integrating RevenueCat into your app, we recommend following our [Quickstart](https://docs.revenuecat.com/docs/getting-started) guide.

# Basic Configuration
## Initialization

Once you've [installed](https://docs.revenuecat.com/docs/installation) the <<glossary:Purchases SDK>> for your app, it's time to initialize and configure it.

You should only configure *Purchases* once, usually early in your application lifecycle. After configuration, the same instance is shared throughout your app by accessing the `.shared` instance in the SDK.

Make sure you configure *Purchases* with your public SDK key only. You can read more about the different API keys available in our [Authentication guide](https://docs.revenuecat.com/docs/authentication).
[block:code]
{
  "codes": [
    {
      "code": "func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {\n  \n    Purchases.logLevel = .debug\n    Purchases.configure(withAPIKey: \"public_sdk_key\")\n  \n}",
      "language": "swift"
    },
    {
      "code": "- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {\n  \t// Override point for customization after application launch.\n    \n  \tRCPurchases.logLevel = RCLogLevelDebug;\n  \t[RCPurchases configureWithAPIKey:@\"public_sdk_key\"];\n    \n  \treturn YES;\n}",
      "language": "objectivec"
    },
    {
      "code": "class MainApplication: Application() {\n\n    override fun onCreate() {\n        super.onCreate()\n        Purchases.debugLogsEnabled = true\n        Purchases.configure(this, \"public_sdk_key\")\n    }\n\n}",
      "language": "kotlin"
    },
    {
      "code": "public class MainApplication extends Application {\n\n    @Override\n    public void onCreate() {\n        super.onCreate();\n        Purchases.debugLogsEnabled = true;\n       Purchases.configure(this, \"public_sdk_key\");\n    }\n\n}",
      "language": "java"
    },
    {
      "code": "Future<void> initPlatformState() async {\n  await Purchases.setDebugLogsEnabled(true);\n  await Purchases.setup(\"public_sdk_key\");\n}",
      "language": "javascript",
      "name": "Flutter"
    },
    {
      "code": "export default class App extends React.Component {\n  \n  componentDidMount() {\n    Purchases.setDebugLogsEnabled(true);\n    Purchases.setup(\"public_sdk_key\");\n  }\n  \n}",
      "language": "javascript",
      "name": "React Native"
    },
    {
      "code": "document.addEventListener(\"deviceready\", onDeviceReady, false);\n\nfunction onDeviceReady() {\n    Purchases.setDebugLogsEnabled(true);\n    Purchases.setup(\"public_sdk_key\");\n}",
      "language": "javascript",
      "name": "Cordova"
    },
    {
      "code": "See Unity installation instructions https://docs.revenuecat.com/docs/unity",
      "language": "text",
      "name": "Unity"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "title": "SwiftUI App Protocol",
  "body": "Using SwiftUI's App protocol? Check out our [resource](https://docs.revenuecat.com/docs/swiftui-app-lifecycle) on setting up the *Purchases* SDK with SwiftUI."
}
[/block]
## Enabling Debug Logs

Be sure to enable and view debug logs before filing a ticket with RevenueCat Support.

As detailed in the sample code above, debug logs can be enabled or disabled by setting the `debugLogsEnabled` property before configuring *Purchases*.

Debug logs will provide detailed log output in Xcode or LogCat for what is going on behind the scenes and should be the first thing you check if your app is behaving unexpectedly, and also to confirm there aren't any unhandled warnings or errors.

## Additional Configuration Options

The Purchases SDK allows additional configuration on first setup:

- **API Key (required)**: The public API key found in your app Settings in the RevenueCat dashboard
- **App User ID (optional)**: An identifier for the current user. Pass null if you don't have a user identifier at the time of configuration and RevenueCat will generate an anonymous Id for you. See our [guide on identifying users](https://docs.revenuecat.com/docs/user-ids) for more info.
- **Observer Mode (optional)**: A boolean value to set *Purchases* in [Observer Mode](https://docs.revenuecat.com/docs/observer-mode). Only pass true if you're using RevenueCat for analytics purposes, and you're handling making purchases and checking subscription status yourself.
- **User Defaults (optional, iOS only)**: A key to override the standard user defaults used to cache the purchaser info. This is required if you need to access purchaser info in an [iOS App Extension](https://developer.apple.com/app-extensions/).

If you're planning to use RevenueCat alongside your existing purchase code, check out our guide on [Observer Mode](https://docs.revenuecat.com/docs/observer-mode).

# Advanced Configuration

Additional configuration options on the `.shared` instance of *Purchases*.

## iOS

---

**Delegates**

`DELEGATE` `didReceiveUpdatedPurchaserInfo`

Called whenever *Purchases* receives an updated PurchaserInfo object. This may happen periodically throughout the life of the app if new information becomes available (e.g. after making a purchase).
[block:callout]
{
  "type": "info",
  "body": "Note: RevenueCat doesn't push new data to *Purchases*, so this method is only called when PurchaserInfo is updated from another SDK method or after a purchase is made."
}
[/block]
---

`DELEGATE` `shouldPurchasePromoProduct`

Called when a user initiates a promotional in-app purchase from the App Store. If your app is able to handle a purchase at the current time, run the deferment block in this method. If the app is not in a state to make a purchase: cache the defermentBlock, then call the defermentBlock when the app is ready to make the promotional purchase. If the purchase should never be made, you don't need to ever call the defermentBlock and *Purchases* will not proceed with promotional purchases.

## Android

---

**Listeners**

`LISTENER` `UpdatedPurchaserInfoListener`

Called whenever *Purchases* receives an updated PurchaserInfo object. This may happen periodically throughout the life of the app if new information becomes available (e.g. after making a purchase).
[block:callout]
{
  "type": "info",
  "body": "Note: RevenueCat doesn't push new data to *Purchases*, so this method is only called when PurchaserInfo is updated from another SDK method or after a purchase is made."
}
[/block]
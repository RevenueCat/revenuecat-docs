---
title: "Configuring the SDK - Markdown"
slug: "configuring-sdk-markdown"
hidden: false
metadata:
  title: "Configuring the SDK – RevenueCat"
  description: "You should only configure Purchases once, usually early in your application lifecycle. After configuration, the same instance is shared throughout your app by accessing the `.shared` instance in the SDK."
  image:
    0: "https://files.readme.io/7afb78b-RevenueCat_Docs_OG.png"
    1: "RevenueCat Docs OG.png"
    2: 1200
    3: 627
    4: "#f7f5f5"
category: 63890774aab00f0086eaa2d6
---
If this is your first time integrating RevenueCat into your app, we recommend following our [Quickstart](https://docs.revenuecat.com/docs/getting-started) guide.
[block:callout]
{
  "type": "info",
  "title": "Using an older SDK (v3.x)?",
  "body": "View our migration guide to v4.x [here](doc:ios-native-3x-to-4x-migration) or view our legacy docs [here](https://docs.revenuecat.com/v3.3/docs)."
}
[/block]
# Basic Configuration
## Initialization
asdf
Once you've [installed](https://docs.revenuecat.com/docs/installation) the SDK for your app, it's time to initialize and configure it.

You should only configure *Purchases* once, usually early in your application lifecycle. After configuration, the same instance is shared throughout your app by accessing the `.shared` instance in the SDK.

Make sure you configure *Purchases* with your public SDK key only. You can read more about the different API keys available in our [Authentication guide](https://docs.revenuecat.com/docs/authentication).
[block:code]
{
  "codes": [
    {
      "code": "func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {\n  \n    Purchases.logLevel = .debug\n    Purchases.configure(\n     with: Configuration.Builder(withAPIKey: Constants.apiKey)\n              .with(appUserID: \"<app_user_id>\")\n              .build()\n     )\n  \n}",
      "language": "swift"
    },
    {
      "code": "- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {\n  \t// Override point for customization after application launch.\n    \n  \tRCPurchases.logLevel = RCLogLevelDebug;\n  \tRCConfigurationBuilder *configuration = [RCConfiguration builderWithAPIKey:@\"public_sdk_key\"];\n  \tconfiguration = [configuration withAppUserID:@\"<app_user_id>\"];\n  \t[RCPurchases configureWithConfiguration:[configuration build]];\n    \n  \treturn YES;\n}",
      "language": "objectivec"
    },
    {
      "code": "// If you're targeting only Google Play Store\nclass MainApplication: Application() {\n    override fun onCreate() {\n        super.onCreate()\n        Purchases.debugLogsEnabled = true\n        Purchases.configure(PurchasesConfiguration.Builder(this, \"public_google_sdk_key\").build())\n    }\n}\n\n// If you're building for the Amazon Appstore, you can use flavors to determine which keys to use\n// In your build.gradle:\nflavorDimensions \"store\"\nproductFlavors {\n    amazon {\n        buildConfigField \"String\", \"STORE\", \"\\\"amazon\\\"\"\n    }\n\n    google {\n        buildConfigField \"String\", \"STORE\", \"\\\"google\\\"\"\n    }       \n}\n\n///...\n\nclass MainApplication: Application() {\n    override fun onCreate() {\n        super.onCreate()\n        Purchases.debugLogsEnabled = true\n          \n        if (BuildConfig.STORE.equals(\"amazon\")) {\n        \tPurchases.configure(AmazonConfiguration.Builder(this, \"public_amazon_sdk_key\").build())\n        } else if (BuildConfig.STORE.equals(\"google\")) {\n        \tPurchases.configure(PurchasesConfiguration.Builder(this, \"public_google_sdk_key\").build())\n        }\n    }\n}",
      "language": "kotlin"
    },
    {
      "code": "// If you're targeting only Google Play Store\npublic class MainApplication extends Application {\n    @Override\n    public void onCreate() {\n        super.onCreate();\n        Purchases.debugLogsEnabled = true;\n        Purchases.configure(new PurchasesConfiguration.Builder(this, \"public_google_sdk_key\").build());\n    }\n}\n\n// If you're building for the Amazon Appstore, \n// click the Kotlin tab to see how to set up flavors in your build.gradle:\n///...\n\npublic class MainApplication extends Application {\n    @Override\n    public void onCreate() {\n        super.onCreate();\n        Purchases.debugLogsEnabled = true;\n      \n        PurchasesConfiguration.Builder builder = null;\n      \n        if (BuildConfig.STORE.equals(\"amazon\")) {\n            builder = new AmazonConfiguration.Builder(this, \"public_amazon_sdk_key\");\n        } else if (BuildConfig.STORE.equals(\"google\")) {\n            builder = new PurchasesConfiguration.Builder(this, \"public_google_sdk_key\");\n        }\n      \n        Purchases.configure(builder.build());\n    }\n}",
      "language": "java"
    },
    {
      "code": "import 'dart:io' show Platform;\n\n//...\n\nFuture<void> initPlatformState() async {\n  await Purchases.setDebugLogsEnabled(true);\n  \n  PurchasesConfiguration configuration;\n  if (Platform.isAndroid) {\n    configuration = PurchasesConfiguration(\"public_google_sdk_key\");\n    if (buildingForAmazon) { \n      // use your preferred way to determine if this build is for Amazon store\n      // checkout our MagicWeather sample for a suggestion\n      configuration = AmazonConfiguration(\"public_amazon_sdk_key\");\n    }\n  } else if (Platform.isIOS) {\n    configuration = PurchasesConfiguration(\"public_ios_sdk_key\");\n  }\n  await Purchases.configure(configuration);\n}",
      "language": "javascript",
      "name": "Flutter"
    },
    {
      "code": "import { Platform } from 'react-native';\n\n//...\n\nexport default class App extends React.Component {\n \n  componentDidMount() {\n    Purchases.setDebugLogsEnabled(true);\n    \n    if (Platform.OS === 'ios') {\n    \tawait Purchases.configure({ apiKey: \"public_ios_sdk_key\" });\n    } else if (Platform.OS === 'android') {\n    \tawait Purchases.configure({ apiKey: \"public_google_sdk_key\" });\n      \n      // OR: if building for Amazon, be sure to follow the installation instructions then:\n    \tawait Purchases.configure({ apiKey: \"public_amazon_sdk_key\", useAmazon: true });\n    }\n    \n  }\n}",
      "language": "javascript",
      "name": "React Native"
    },
    {
      "code": "document.addEventListener(\"deviceready\", onDeviceReady, false);\n\nfunction onDeviceReady() {\n    Purchases.setDebugLogsEnabled(true);\n    if (window.cordova.platformId === 'ios') {\n        Purchases.setup(\"public_ios_sdk_key\");\n    } else if (window.cordova.platformId === 'android') {\n        Purchases.setup(\"public_google_sdk_key\");\n    }\n    // OR: if building for Amazon, be sure to follow the installation instructions then:\n    await Purchases.setup({ apiKey: \"public_amazon_sdk_key\", useAmazon: true });\n}",
      "language": "javascript",
      "name": "Cordova"
    },
    {
      "code": "// The SDK can be configured through the Unity Editor.\n// See Unity installation instructions https://docs.revenuecat.com/docs/unity\n\n// If you'd like to configure the SDK programmatically, \n// make sure to check \"Use runtime setup\" in the Unity Editor, and then:\n\nPurchases.PurchasesConfiguration.Builder builder = Purchases.PurchasesConfiguration.Builder.Init(\"api_key\");\nPurchases.PurchasesConfiguration purchasesConfiguration =\n    .SetAppUserId(appUserId)\n    .Build();\npurchases.Configure(purchasesConfiguration);",
      "language": "csharp",
      "name": "Unity"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "danger",
  "title": "iOS 15+ Prewarming",
  "body": "In certain cases, calling `configure` in `application:didFinishLaunchingWithOptions:` should be avoided. See [Identifying Users](https://docs.revenuecat.com/docs/user-ids#provide-app-user-id-on-configuration) for more information."
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

As detailed in the sample code above, debug logs can be enabled or disabled by setting the `Purchases.logLevel` property before configuring *Purchases*.

Debug logs will provide detailed log output in Xcode or LogCat for what is going on behind the scenes and should be the first thing you check if your app is behaving unexpectedly, and also to confirm there aren't any unhandled warnings or errors.

## Additional Configuration Options

The SDK allows additional configuration on first setup:

- **API Key (required)**: The public API key that corresponds to your app, found via **Project Settings > API keys > App specific keys** in the RevenueCat dashboard.
- **App User ID (optional)**: An identifier for the current user. Pass `null` if you don't have a user identifier at the time of configuration and RevenueCat will generate an anonymous Id for you. See our [guide on identifying users](https://docs.revenuecat.com/docs/user-ids) for more information.
- **Observer Mode (optional)**: A boolean value to set *Purchases* in [Observer Mode](https://docs.revenuecat.com/docs/observer-mode). Only pass true if you're using RevenueCat for analytics purposes, and you're handling making purchases and checking subscription status yourself.
- **User Defaults (optional, iOS only)**: A key to override the standard user defaults used to cache `CustomerInfo`. This is required if you need to access `CustomerInfo` in an [iOS App Extension](https://developer.apple.com/app-extensions/).
- **StoreKit 2 (optional, iOS only):** Defaults to enabled. StoreKit 2 APIs will be used under the hood for purchases in compatible devices. On devices that don't support StoreKit 2, StoreKit 1 will be used automatically instead. It can be manually disabled to always use StoreKit 1 by setting `usesStoreKit2IfAvailable` to `false`.

If you're planning to use RevenueCat alongside your existing purchase code, check out our guide on [Observer Mode](https://docs.revenuecat.com/docs/observer-mode).

# Advanced Configuration

Additional configuration options on the `.shared` instance of *Purchases*.

## iOS

---

**Delegates**

`DELEGATE` `purchases:receivedUpdated`

Called whenever *Purchases* receives an updated `CustomerInfo` object. This may happen periodically throughout the life of the app if new information becomes available (e.g. after making a purchase).
[block:callout]
{
  "type": "info",
  "body": "Note: RevenueCat doesn't push new data to the SDK, so this method is only called when <<glossary:CustomerInfo>> is updated from another SDK method or after a purchase is made."
}
[/block]
---

`DELEGATE` `purchases:readyForPromotedProduct`

Called when a user initiates a promoted in-app purchase from the App Store. If your app is able to handle a purchase at the current time, run the `defermentBlock` in this method. If the app is not in a state to make a purchase: cache the `defermentBlock`, then call the `defermentBlock` when the app is ready to make the promoted purchase. If the purchase should never be made, you don't need to ever call the `defermentBlock` and *Purchases* will not proceed with promoted purchases.

## Android

---

**Listeners**

`LISTENER` `UpdatedCustomerInfoListener`

Called whenever *Purchases* receives an updated `CustomerInfo` object. This may happen periodically throughout the life of the app if new information becomes available (e.g. after making a purchase).
[block:callout]
{
  "type": "info",
  "body": "Note: RevenueCat doesn't push new data to the SDK, so this method is only called when <<glossary:CustomerInfo>> is updated from another SDK method or after a purchase is made."
}
[/block]
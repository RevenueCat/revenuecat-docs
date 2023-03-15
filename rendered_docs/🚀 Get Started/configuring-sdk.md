---
title: Configuring the SDK
slug: configuring-sdk
hidden: false
metadata:
  title: Configuring the SDK – RevenueCat
  description: You should only configure Purchases once, usually early in your application
    lifecycle. After configuration, the same instance is shared throughout your app
    by accessing the `.shared` instance in the SDK.
  image:
    0: https://files.readme.io/7afb78b-RevenueCat_Docs_OG.png
    1: RevenueCat Docs OG.png
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: '2020-06-29T17:25:26.484Z'
updatedAt: '2022-12-07T20:55:20.111Z'
category: 640a7bef79274d00428d102b
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

Once you've [installed](https://docs.revenuecat.com/docs/installation) the SDK for your app, it's time to initialize and configure it.

You should only configure *Purchases* once, usually early in your application lifecycle. After configuration, the same instance is shared throughout your app by accessing the `.shared` instance in the SDK.

Make sure you configure *Purchases* with your public SDK key only. You can read more about the different API keys available in our [Authentication guide](https://docs.revenuecat.com/docs/authentication).
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
  
    Purchases.logLevel = .debug
    Purchases.configure(
     with: Configuration.Builder(withAPIKey: Constants.apiKey)
              .with(appUserID: "<app_user_id>")
              .build()
     )
  
}
```
```objectivec
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  	// Override point for customization after application launch.
    
  	RCPurchases.logLevel = RCLogLevelDebug;
  	RCConfigurationBuilder *configuration = [RCConfiguration builderWithAPIKey:@"public_sdk_key"];
  	configuration = [configuration withAppUserID:@"<app_user_id>"];
  	[RCPurchases configureWithConfiguration:[configuration build]];
    
  	return YES;
}
```
```kotlin
// If you're targeting only Google Play Store
class MainApplication: Application() {
    override fun onCreate() {
        super.onCreate()
        Purchases.debugLogsEnabled = true
        Purchases.configure(PurchasesConfiguration.Builder(this, "public_google_sdk_key").build())
    }
}

// If you're building for the Amazon Appstore, you can use flavors to determine which keys to use
// In your build.gradle:
flavorDimensions "store"
productFlavors {
    amazon {
        buildConfigField "String", "STORE", "\"amazon\""
    }

    google {
        buildConfigField "String", "STORE", "\"google\""
    }       
}

///...

class MainApplication: Application() {
    override fun onCreate() {
        super.onCreate()
        Purchases.debugLogsEnabled = true
          
        if (BuildConfig.STORE.equals("amazon")) {
        	Purchases.configure(AmazonConfiguration.Builder(this, "public_amazon_sdk_key").build())
        } else if (BuildConfig.STORE.equals("google")) {
        	Purchases.configure(PurchasesConfiguration.Builder(this, "public_google_sdk_key").build())
        }
    }
}
```
```java
// If you're targeting only Google Play Store
public class MainApplication extends Application {
    @Override
    public void onCreate() {
        super.onCreate();
        Purchases.setDebugLogsEnabled(true);
        Purchases.configure(new PurchasesConfiguration.Builder(this, "public_google_sdk_key").build());
    }
}

// If you're building for the Amazon Appstore, 
// click the Kotlin tab to see how to set up flavors in your build.gradle:
///...

public class MainApplication extends Application {
    @Override
    public void onCreate() {
        super.onCreate();
        Purchases.setDebugLogsEnabled(true);
      
        PurchasesConfiguration.Builder builder = null;
      
        if (BuildConfig.STORE.equals("amazon")) {
            builder = new AmazonConfiguration.Builder(this, "public_amazon_sdk_key");
        } else if (BuildConfig.STORE.equals("google")) {
            builder = new PurchasesConfiguration.Builder(this, "public_google_sdk_key");
        }
      
        Purchases.configure(builder.build());
    }
}
```
```javascript
document.addEventListener("deviceready", onDeviceReady, false);

function onDeviceReady() {
    Purchases.setDebugLogsEnabled(true);
    if (window.cordova.platformId === 'ios') {
        Purchases.setup("public_ios_sdk_key");
    } else if (window.cordova.platformId === 'android') {
        Purchases.setup("public_google_sdk_key");
    }
    // OR: if building for Amazon, be sure to follow the installation instructions then:
    await Purchases.setup({ apiKey: "public_amazon_sdk_key", useAmazon: true });
}
```
```csharp
// The SDK can be configured through the Unity Editor.
// See Unity installation instructions https://docs.revenuecat.com/docs/unity

// If you'd like to configure the SDK programmatically, 
// make sure to check "Use runtime setup" in the Unity Editor, and then:

Purchases.PurchasesConfiguration.Builder builder = Purchases.PurchasesConfiguration.Builder.Init("api_key");
Purchases.PurchasesConfiguration purchasesConfiguration =
    .SetAppUserId(appUserId)
    .Build();
purchases.Configure(purchasesConfiguration);
```

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
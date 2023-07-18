---
title: Quickstart (old)
slug: getting-started-old
excerpt: Get up and running with mobile subscriptions
hidden: true
categorySlug: documentation
order: 0
---
This guide will walk you through how to get up and running with subscriptions and RevenueCat's SDK with only a few lines of code.

# 1. Setting Up Your Account
We recommend using a company account when registering for RevenueCat and setting up your app within a project. You'll be able to invite the rest of your team as [collaborators](doc:collaborators) to your project, but only the project owner can manage billing. Note that there is no mechanism for transferring apps or projects between accounts, but you can change the account owner's email address. If you intend on selling an app, you should create a separate account.

# 2. Create a Project 
Navigate to the RevenueCat dashboard and [add a new project :fa-arrow-right:](https://app.revenuecat.com/overview) from the dropdown in the top navigation menu called *Projects*.
![](https://files.readme.io/eb2161b-Screen_Shot_2021-12-01_at_9.48.58_AM.png "Screen Shot 2021-12-01 at 9.48.58 AM.png")
# 3. Register Your App

From **Project Settings > Apps** in the left menu of the project dashboard, select the platform for the app you will be adding.  
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/a97e002-Screen_Shot_2021-12-01_at_9.51.06_AM.png",
        "Screen Shot 2021-12-01 at 9.51.06 AM.png",
        1732,
        1276,
        "#f9f9f9"
      ],
      "caption": "Project dashboard for selecting the app platform"
    }
  ]
}
[/block]
The field **App name** is required to add your app to RevenueCat. The rest of the configuration fields can be added later. 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/c169e89-Screen_Shot_2021-12-01_at_9.55.28_AM.png",
        "Screen Shot 2021-12-01 at 9.55.28 AM.png",
        1254,
        1088,
        "#fbfbfb"
      ],
      "caption": "App configuration page"
    }
  ]
}
[/block]
After registering your app, we recommend setting up [Platform Server Notifications](doc:server-notifications). These notifications aren't required but will speed up [webhooks](doc:webhooks) and integration delivery times and reduce lag time updating your subscribers. 
[block:callout]
{
  "type": "info",
  "body": "RevenueCat itself does not have separate environments for staging and production. Any RevenueCat app can make both sandbox and production purchases from the stores. If you do have separate apps for staging and production, you can create multiple projects in RevenueCat to mirror your setup.",
  "title": "Staging vs. Production apps"
}
[/block]
# 4. Store Setup 
Before you can start using RevenueCat to fetch products, you must configure your products in the respective stores. See the following guides for [App Store Connect](doc:ios-products), [Google Play Console](doc:android-products), [Amazon Appstore](doc:amazon-product-setup), and [Stripe](doc:stripe-products) for help navigating through this process.

Service credentials need to be set up for RevenueCat to communicate with the app stores on your behalf. See our guides [App Store Connect Shared Secret](doc:itunesconnect-app-specific-shared-secret ), [Play Service Credentials](doc:creating-play-service-credentials), and [Amazon Appstore Shared Secret](doc:amazon-appstore) for more information. Note that Play service credentials can take up to 36 hours to propagate throughout Google's servers.

If you are selling iOS products, be sure to sign your 'Paid Applications Agreement' and fill out your bank and tax information in **App Store Connect > Agreements, Tax, and Banking**. **This needs to be completed before you can test any purchases**.

# 5. Configure Your Products

Once your in-app products have been configured in  [App Store Connect](doc:ios-products), [Google Play Console](doc:android-products), [Amazon Appstore](doc:amazon-product-setup), or [Stripe](doc:stripe-products), you'll need to copy that configuration into the RevenueCat dashboard. RevenueCat uses an Entitlements system to control access to premium features, and Offerings to manage the set of products you offer to customers. 

Entitlements are the level of access that a customer is "entitled" to after purchasing a specific product, and Offerings is a simple way for you to organize the in-app products you wish to "offer" on your paywall and configure them remotely. We **recommend** utilizing these features to simplify your code and enable you to change products without releasing an app update.

See [Configuring Products](doc:entitlements) to set up your products and then organize them into Offerings or Entitlements.

![](https://files.readme.io/55e2667-1628274-Entitlements_2.0.png "1628274-Entitlements_2.0.png")
# 6. Install the SDK

Our SDK seamlessly implements purchases and subscriptions across platforms while syncing tokens with the RevenueCat server.

* [iOS Installation :fa-arrow-right:](doc:ios) 
* [Android Installation :fa-arrow-right:](doc:android)
* [React Native Installation :fa-arrow-right:](doc:reactnative) 
* [Flutter Installation :fa-arrow-right:](doc:flutter)
* [Cordova Installation :fa-arrow-right:](doc:cordova) 
* [Ionic Installation :fa-arrow-right:](doc:ionic)
* [Unity Installation :fa-arrow-right:](doc:unity) 
* [macOS / Catalyst Installation :fa-arrow-right:](doc:macos)

If you run into issues with the SDK, see [Troubleshooting the SDKs](doc:troubleshooting-the-sdks) for guidance.

# 7. Configure the SDK
[block:callout]
{
  "type": "info",
  "body": "You can get your public SDK key from the **API keys** tab under **Project settings** in the dashboard.",
  "title": "Only use your public SDK key to configure Purchases"
}
[/block]
You should only configure the shared instance of *Purchases* once, usually on app launch. After that, the same instance is shared throughout your app by accessing the `.shared` instance in the SDK.

See our guide on [Configuring SDK](https://docs.revenuecat.com/docs/configuring-sdk) for more information and best practices.

Make sure you configure *Purchases* with your public SDK key only. You can read more about the different API keys available in our [Authentication guide](doc:authentication).

```swift 
// on iOS and tvOS, use `application:didFinishLaunchingWithOptions:`
// on macOS and watchOS use `applicationDidFinishLaunching:` 

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
// on iOS and tvOS, use `application:didFinishLaunchingWithOptions:`
// on macOS and watchOS use `applicationDidFinishLaunching:` 

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
```javascript Flutter
import 'dart:io' show Platform;

//...

Future<void> initPlatformState() async {
  await Purchases.setDebugLogsEnabled(true);
  
  PurchasesConfiguration configuration;
  if (Platform.isAndroid) {
    configuration = PurchasesConfiguration("public_google_sdk_key");
    if (buildingForAmazon) { 
      // use your preferred way to determine if this build is for Amazon store
      // checkout our MagicWeather sample for a suggestion
      configuration = AmazonConfiguration("public_amazon_sdk_key");
    }
  } else if (Platform.isIOS) {
    configuration = PurchasesConfiguration("public_ios_sdk_key");
  }
  await Purchases.configure(configuration);
}
```
```typescript React Native
import { Platform } from 'react-native';

//...

export default class App extends React.Component {
 
  componentDidMount() {
    Purchases.setDebugLogsEnabled(true);
    
    if (Platform.OS === 'ios') {
        await Purchases.configure({apiKey: "public_ios_sdk_key"});
    } else if (Platform.OS === 'android') {
        await Purchases.configure({apiKey: "public_google_sdk_key"});
      
      // OR: if building for Amazon, be sure to follow the installation instructions then:
        await Purchases.configure({ apiKey: "public_amazon_sdk_key", useAmazon: true });
    }
    
  }
}
```
```javascript Cordova
document.addEventListener("deviceready", onDeviceReady, false);

function onDeviceReady() {
    Purchases.setDebugLogsEnabled(true);
    if (window.cordova.platformId === 'ios') {
        Purchases.configureWith({
            apiKey: "public_ios_sdk_key"
        });
    } else if (window.cordova.platformId === 'android') {
        Purchases.configureWith({
            apiKey: "public_google_sdk_key"
        });
    }
    // OR: if building for Amazon, be sure to follow the installation instructions then:
    Purchases.configureWith({
        apiKey: "public_amazon_sdk_key",
        useAmazon: true
    });
}
```
```text Unity
See Unity installation instructions https://docs.revenuecat.com/docs/unity
```
When in development, we recommend enabling more verbose debug logs. For more information about these logs, see our [Debugging](doc:debugging) guide.  

If you're planning to use RevenueCat alongside your existing purchase code, check out our guide on [Observer Mode](doc:observer-mode).
[block:callout]
{
  "type": "info",
  "title": "Configuring Purchases with User IDs",
  "body": "If you have a user authentication system in your app, you can provide a user identifier at the time of configuration or at a later date with a call to `.logIn()`. To learn more, check out our guide on [Identifying Users](user-ids)."
}
[/block]
# 8. Displaying Available Products

The SDK will automatically fetch the [configured Offerings](doc:entitlements#offerings) and retrieve the product information from Apple, Google, or Amazon. Thus, available products will already be loaded when customers launch your purchase screen.

Below is an example of fetching Offerings. You can utilize Offerings to organize your paywall screen. See our guide on [Displaying Products](doc:displaying-products) for more information and best practices.
```swift 
Purchases.shared.getOfferings { (offerings, error) in
	if let offerings = offerings {
	  // Display current offering with offerings.current
  }
}
```
```objectivec 
[[RCPurchases sharedPurchases] getOfferingsWithCompletion:^(RCOfferings *offerings, NSError *error) {
  if (offerings) {
		// Display current offering with offerings.current
  } else if (error) {
    // optional error handling
  }
}];
```
```kotlin 
Purchases.sharedInstance.getOfferingsWith(
	onError = { error ->
    /* Optional error handling */ 
  },
  onSuccess = { offerings ->  
  	// Display current offering with offerings.current
	}
}
```
```java 
Purchases.getSharedInstance().getOfferings(new ReceiveOfferingsCallback() {

     @Override
     public void onReceived(@NonNull Offerings offerings) {
     }

     @Override
     public void onError(@NonNull PurchasesError error) {
        /* Optional error handling */
     }
});
```
```javascript Flutter
try {
  Offerings offerings = await Purchases.getOfferings();
  if (offerings.current != null) {
    // Display current offering with offerings.current
  }
} on PlatformException catch (e) {
	// optional error handling
}
```
```javascript React Native
try {
  const offerings = await Purchases.getOfferings();
  if (offerings.current !== null) {  
	  // Display current offering with offerings.current
  }
} catch (e) {

}
```
```javascript Cordova
func displayUpsellScreen() {
  Purchases.getOfferings(
      offerings => {
        if (offerings.current !== null) {  
          // Display current offering with offerings.current
        }
      },
      error => {

      }
  );
}
```
```csharp Unity
var purchases = GetComponent<Purchases>();
purchases.GetOfferings((offerings, error) =>
{
  if (error != null) {
    LogError(error);
  } else if (offerings.Current != null {
    // Display current offering with offerings.current
  }
});
```
```curl Web
curl --request GET \
  --url https://api.revenuecat.com/v1/subscribers/<app_user_id>/offerings \
  --header 'Accept: application/json' \
  --header 'Authorization: Bearer REVENUECAT_API_KEY' \
  --header 'Content-Type: application/json' \
  --header 'X-Platform: stripe'
```

[block:html]
{
  "html": "<body>\n  <h3> See it in action </h3>\n  <a href=\"https://github.com/RevenueCat/purchases-ios/blob/main/Examples/MagicWeather/MagicWeather/Sources/Controllers/PaywallViewController.swift#L24-L35\" target=\"_blank\" class=\"button-text\">Swift</a>\n  <a href=\"https://github.com/RevenueCat/purchases-android/blob/main/examples/MagicWeather/app/src/main/java/com/revenuecat/sample/ui/paywall/PaywallFragment.kt#L48-L53\" target=\"_blank\" class=\"button-text\">Kotlin</a>\n  <a href=\"https://github.com/RevenueCat/purchases-flutter/blob/main/revenuecat_examples/MagicWeather/lib/src/views/weather.dart#L41-L79\" target=\"_blank\" class=\"button-text\">Flutter</a>\n  <a href=\"https://github.com/RevenueCat/react-native-purchases/blob/main/examples/MagicWeather/src/screens/PaywallScreen/index.js#L24-L33\" target=\"_blank\"  class=\"button-text\">React Native</a>\n</body>"
}
[/block]

If fetching your [Offerings](doc:entitlements#offerings), [products](doc:entitlements#products), or available [packages](doc:entitlements#adding-packages) are empty, it's due to some configuration issue in the respective store. 

The most common reasons for this in App Store Connect are an out-of-date 'Paid Applications Agreement' or products not at least in the 'Ready To Submit' state. In Google Play this usually occurs when the app is not published on a closed track and a valid test user added.

You can find more info about troubleshooting this issue in our [Help Center](https://support.revenuecat.com/hc/en-us/articles/360041793174).

# 9. Make a Purchase

The SDK includes a simple method for facilitating purchases. The `purchase:package` takes a package from the fetched Offering and processes the transaction with the respective app store.

The code sample below shows the process of purchasing a package and confirming it unlocks the "your_entitlement_id" content. More detail about the `purchase:package` method can be found in our guide on [Making Purchases](doc:making-purchases).

```swift 
Purchases.shared.purchase(package: package) { (transaction, customerInfo, error, userCancelled) in
    if customerInfo?.entitlements.all["your_entitlement_id"]?.isActive == true {
        // Unlock that great "pro" content
    }
}
```
```objectivec 
[[RCPurchases sharedPurchases] purchasePackage:package withCompletion:^(RCStoreTransaction *transaction, RCCustomerInfo *customerInfo, NSError *error, BOOL cancelled) {
    if (customerInfo.entitlements.all[@"your_entitlement_id"].isActive) {
    // User is "premium"
	}
}];
```
```kotlin 
Purchases.sharedInstance.purchasePackageWith(
  this,
  package,
  onError = { error, userCancelled -> /* No purchase */ },
  onSuccess = { product, customerInfo ->
    if (customerInfo.entitlements["my_entitlement_identifier"]?.isActive == true) {
    // Unlock that great "pro" content
  }
})
```
```java 
Purchases.getSharedInstance().purchasePackage(this, packageToPurchase, new PurchaseCallback() {
    @Override
    public void onCompleted(@NonNull StoreTransaction storeTransaction, @NonNull CustomerInfo customerInfo) {
        if (customerInfo.getEntitlements().get("my_entitlement_identifier").isActive()) {
            // Unlock that great "pro" content
        }
    }

    @Override
    public void onError(@NonNull PurchasesError purchasesError, boolean b) {
        // No purchase
    }
});
```
```javascript Flutter
try {
  CustomerInfo customerInfo = await Purchases.purchasePackage(package);
  var isPro = customerInfo.entitlements.all["my_entitlement_identifier"].isActive;
  if (isPro) {
    // Unlock that great "pro" content
  }
} on PlatformException catch (e) {
  var errorCode = PurchasesErrorHelper.getErrorCode(e);
  if (errorCode != PurchasesErrorCode.purchaseCancelledError) {
    showError(e);  	          
  }
}
```
```javascript React Native
// Using packages
try {
  const purchaseMade = await Purchases.purchasePackage(package);
  if (typeof purchaseMade.customerInfo.entitlements.active.my_entitlement_identifier !== "undefined") {
    // Unlock that great "pro" content
  }
} catch (e) {
  if (!e.userCancelled) {
  	showError(e);
  }
}

// Note: if you are using purchaseProduct to purchase Android In-app products, an optional third parameter needs to be provided when calling purchaseProduct. You can use the package system to avoid this
await Purchases.purchaseProduct("product_id", null, Purchases.PURCHASE_TYPE.INAPP);
```
```javascript Cordova
Purchases.purchasePackage(package, ({ productIdentifier, customerInfo }) => {
    if (typeof customerInfo.entitlements.active.my_entitlement_identifier !== "undefined") {
      // Unlock that great "pro" content
    }
  },
  ({error, userCancelled}) => {
    // Error making purchase
  }
);

// Note: if you are using purchaseProduct to purchase Android In-app products, an optional third parameter needs to be provided when calling purchaseProduct. You can use the package system to avoid this.

Purchases.purchaseProduct("product_id", ({ productIdentifier, customerInfo }) => {
}, ({error, userCancelled}) => {
    // Error making purchase
}, null, Purchases.PURCHASE_TYPE.INAPP);
```
```csharp Unity
Purchases purchases = GetComponent<Purchases>();
purchases.PurchasePackage(package, (productIdentifier, purchaserInfo, userCancelled, error) =>
{
  if (purchaserInfo.Entitlements.Active.ContainsKey("my_entitlement_identifier")) {
    // Unlock that great "pro" content
  }
});
```
```curl Web
curl -X POST \
  https://api.revenuecat.com/v1/receipts \
  -H 'Content-Type: application/json' \
  -H 'X-Platform: stripe' \
  -H 'Authorization: Bearer YOUR_REVENUECAT_API_KEY' \
  -d '{ "app_user_id": "my_app_user_id",
  "fetch_token": "sub_xxxxxxxxxx"
  }'
```

[block:html]
{
  "html": "<body>\n  <h3> See it in action </h3>\n  <a href=\"https://github.com/RevenueCat/purchases-ios/blob/main/Examples/MagicWeather/MagicWeather/Sources/Controllers/PaywallViewController.swift#L78-L95\" target=\"_blank\" class=\"button-text\">Swift</a>\n  <a href=\"https://github.com/RevenueCat/purchases-android/blob/main/examples/MagicWeather/app/src/main/java/com/revenuecat/sample/ui/paywall/PaywallFragment.kt#L55-L66\" target=\"_blank\" class=\"button-text\">Kotlin</a>\n  <a href=\"https://github.com/RevenueCat/purchases-flutter/blob/main/revenuecat_examples/MagicWeather/lib/src/views/paywall.dart#L53-L61\" target=\"_blank\" class=\"button-text\">Flutter</a>\n  <a href=\"https://github.com/RevenueCat/react-native-purchases/blob/main/examples/MagicWeather/src/components/PackageItem/index.js#L15-L31\" target=\"_blank\"  class=\"button-text\">React Native</a>\n</body>\n"
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "`purchase:package` handles the underlying framework interaction and automatically validates purchases with the respective store through our secure servers. This helps reduce in-app purchase fraud and decreases the complexity of your app. Receipt tokens are stored remotely and always kept up to date by RevenueCat."
}
[/block]
# 10. Get Subscription Status

The SDK makes it easy to check what active subscriptions the current customer has, too. This can be done by checking if a specific Entitlement is active, or by checking if the active Entitlements array contains a specific Entitlement ID.

If you're not using Entitlements (you probably should be!) you can check the array of active subscriptions to see what product IDs from the respective store it contains.
```swift 
Purchases.shared.getCustomerInfo { (customerInfo, error) in
    if customerInfo?.entitlements.all["your_entitlement_id"]?.isActive == true {
        // User is "premium"
    }
}
```
```objectivec 
[[RCPurchases sharedPurchases] getCustomerInfoWithCompletion:^(RCPurchaserInfo * customerInfo, NSError * error) {
    if (customerInfo.entitlements.all[@"your_entitlement_id"].isActive) {
    // User is "premium"
	}
}];
```
```kotlin 
Purchases.sharedInstance.getCustomerInfo({ error -> /* Optional error handling */ }) { customerInfo ->
  if (customerInfo.entitlements["my_entitlement_identifier"]?.isActive == true) {
    // Grant user "pro" access
  }
}
```
```java 
Purchases.getSharedInstance().getCustomerInfo(new ReceiveCustomerInfoCallback() {
    @Override
    public void onReceived(@NonNull CustomerInfo customerInfo) {
        if (customerInfo.getEntitlements().get("my_entitlement_identifier").isActive()) {
            // Grant user "pro" access
        }
    }

    @Override
    public void onError(@NonNull PurchasesError purchasesError) {
    }
});
```
```javascript Flutter
try {
  CustomerInfo customerInfo = await Purchases.getCustomerInfo();
  if (customerInfo.entitlements.all["my_entitlement_identifier"].isActive) {
    // Grant user "pro" access
  }
} on PlatformException catch (e) {
  // Error fetching purchaser info
}
```
```javascript React Native
try {
  const customerInfo = await Purchases.getCustomerInfo();
  if(typeof customerInfo.entitlements.active.my_entitlement_identifier !== "undefined") {
    // Grant user "pro" access
  }
} catch (e) {
 // Error fetching purchaser info
}
```
```javascript Cordova
Purchases.getCustomerInfo(
  info => {
    const isPro = typeof customerInfo.entitlements.active.my_entitlement_identifier !== "undefined";
  },
  error => {
    // Error fetching customer info
  }
);
```
```csharp Unity
var purchases = GetComponent<Purchases>();
purchases.GetPurchaserInfo((info, error) =>
{
   if (purchaserInfo.Entitlements.Active.ContainsKey("my_entitlement_identifier")) {
    // Unlock that great "pro" content
  }
});
```
```curl Web
curl --request GET \
  --url https://api.revenuecat.com/v1/subscribers/<app_user_id> \
  --header 'Accept: application/json' \
  --header 'Authorization: Bearer REVENUECAT_API_KEY' \
  --header 'Content-Type: application/json'
```

[block:html]
{
  "html": "<body>\n  <h3> See it in action </h3>\n  <a href=\"https://github.com/RevenueCat/purchases-ios/blob/main/Examples/MagicWeather/MagicWeather/Sources/Controllers/UserViewController.swift#L37-L45\" target=\"_blank\" class=\"button-text\">Swift</a>\n  <a href=\"https://github.com/RevenueCat/purchases-android/blob/main/examples/MagicWeather/app/src/main/java/com/revenuecat/sample/ui/weather/WeatherFragment.kt#L69-L84\" target=\"_blank\" class=\"button-text\">Kotlin</a>\n  <a href=\"https://github.com/RevenueCat/purchases-flutter/blob/main/revenuecat_examples/MagicWeather/lib/src/views/weather.dart#L31-L39\" target=\"_blank\" class=\"button-text\">Flutter</a>\n  <a href=\"https://github.com/RevenueCat/react-native-purchases/blob/main/examples/MagicWeather/src/screens/WeatherScreen/index.js#L29-L46\" target=\"_blank\"  class=\"button-text\">React Native</a>\n</body>\n"
}
[/block]

You can use this method whenever you need to get the latest status, and it's safe to call this repeatedly throughout the lifecycle of your app. *Purchases* automatically caches the latest <<glossary:CustomerInfo>> whenever it updates — so in most cases, this method pulls from the cache and runs very fast.

It's typical to call this method when deciding which UI to show the user and whenever the user performs an action that requires a certain entitlement level.
[block:callout]
{
  "type": "info",
  "body": "You can access a lot more information about a subscription than simply whether it's active or not. See our guide on [Subscription Status](doc:purchaserinfo) to learn if subscription is set to renew, if there's an issue detected with the user's credit card, and more."
}
[/block]
# 11. Restoring Purchases

RevenueCat enables your users to restore their in-app purchases, reactivating any content that they previously purchased from the **same store account** (Apple, Google, or Amazon account). We recommend that all apps have some way for users to trigger the restore method. Note that Apple does require a restore mechanism in the event a user loses access to their purchases (e.g: uninstalling/reinstalling the app, losing their account information, etc).
```swift 
Purchases.shared.restorePurchases { (customerInfo, error) in
    //... check customerInfo to see if entitlement is now active
}
```
```objectivec 
[[RCPurchases sharedPurchases] restorePurchasesWithCompletion:^(RCCustomerInfo *customerInfo, NSError *error) {
    //... check customerInfo to see if entitlement is now active
}];
```
```kotlin 
Purchases.sharedInstance.restorePurchasesWith(::showError) { customerInfo ->
    //... check customerInfo to see if entitlement is now active
}
```
```java 
Purchases.getSharedInstance().restorePurchases(new ReceiveCustomerInfoCallback() {
    @Override
    public void onReceived(@NonNull CustomerInfo customerInfo) {
        //... check purchaserInfo to see if entitlement is now active 	
    }

    @Override
    public void onError(@NonNull PurchasesError purchasesError) {

    }
});
```
```javascript Flutter
try {
  CustomerInfo restoredInfo = await Purchases.restoreTransactions();
  // ... check restored customerInfo to see if entitlement is now active
} on PlatformException catch (e) {
  // Error restoring purchases
}
```
```javascript React Native
try {
  const restore = await Purchases.restorePurchases();
  // ... check restored customerInfo to see if entitlement is now active
} catch (e) {

}
```
```javascript Cordova
Purchases.restorePurchases(
  info => {
    //... check customerInfo to see if entitlement is now active
  },
  error => {
    // Error restoring purchases
  }
);
```
```csharp Unity
var purchases = GetComponent<Purchases>();
purchases.RestoreTransactions((info, error) =>
{
    //... check purchaserInfo to see if entitlement is now active
});
```

[block:html]
{
  "html": "<body>\n  <h3> See it in action </h3>\n  <a href=\"https://github.com/RevenueCat/purchases-ios/blob/main/Examples/MagicWeather/MagicWeather/Sources/Controllers/UserViewController.swift#L107-L123\" target=\"_blank\" class=\"button-text\">Swift</a>\n  <a href=\"https://github.com/RevenueCat/purchases-android/blob/main/examples/MagicWeather/app/src/main/java/com/revenuecat/sample/ui/user/UserFragment.kt#L78-L85\" target=\"_blank\" class=\"button-text\">Kotlin</a>\n  <a href=\"https://github.com/RevenueCat/purchases-flutter/blob/main/revenuecat_examples/MagicWeather/lib/src/views/user.dart#L29-L55\" target=\"_blank\" class=\"button-text\">Flutter</a>\n  <a href=\"https://github.com/RevenueCat/react-native-purchases/blob/main/examples/MagicWeather/src/components/RestorePurchasesButton/index.js#L11-L18\" target=\"_blank\"  class=\"button-text\">React Native</a>\n</body>\n"
}
[/block]
If two different [App User IDs](doc:user-ids) restore transactions from the same underlying store account (Apple, Google, or Amazon account) RevenueCat may attempt to create an alias between the two App User IDs and count them as the same user going forward. See our guide on [Restoring Purchases](doc:restoring-purchases) for more information on the different configurable restore behaviors.


# (optional) Listening For CustomerInfo Updates

Since the SDK works seamlessly on any platform, changes to a user's purchase info may come from a variety of sources. You can respond to any changes in a customer's <<glossary:CustomerInfo>> by conforming to an optional delegate method, `purchases:receivedUpdated:`. This will fire whenever the SDK receives an updated customer info object from calls to `getCustomerInfo()`, `purchase(package:)`, `purchase(product:)`, or `restorePurchases()`. 

<<glossary:CustomerInfo>> updates are *not* pushed to your app from the RevenueCat backend, updates can only happen from an outbound network request to RevenueCat.

Depending on your app, it may be sufficient to ignore the delegate and simply handle changes to customer information the next time your app is launched or in the completion blocks of the SDK methods.
```swift 
// Additional configure setup
// on iOS and tvOS, use `application:didFinishLaunchingWithOptions:`
// on macOS and watchOS use `applicationDidFinishLaunching:` 

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
  
    Purchases.logLevel = .debug
    Purchases.configure(withAPIKey: "public_sdk_key")
    Purchases.shared.delegate = self // make sure to set this after calling configure
    
    return true
}

extension AppDelegate: PurchasesDelegate {
    func purchases(_ purchases: Purchases, receivedUpdated customerInfo: CustomerInfo) {
        /// - handle any changes to the user's CustomerInfo
    }
}
```
```objectivec 
// Additional configure setup
// on iOS and tvOS, use `application:didFinishLaunchingWithOptions:`
// on macOS and watchOS use `applicationDidFinishLaunching:`

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    RCPurchases.logLevel = RCLogLevelDebug;
    [RCPurchases configureWithAPIKey:@"public_sdk_key"];
    RCPurchases.sharedPurchases.delegate = self;

    return YES;
}

- (void)purchases:(nonnull RCPurchases *)purchases receivedUpdatedCustomerInfo:(nonnull RCCustomerInfo *)customerInfo {
    // handle any changes to purchaserInfo
}
```
```kotlin 
class UpsellActivity : AppCompatActivity(), UpdatedCustomerInfoListener {
		override fun onReceived(customerInfo: CustomerInfo) {
        // handle any changes to purchaserInfo
    }
}
```
```java 
public class UpsellActivity extends AppCompatActivity implements UpdatedCustomerInfoListener {
		@Override
    public void onReceived(CustomerInfo customerInfo) {
        // handle any changes to customerInfo
    }
}
```
```javascript Flutter
Purchases.addPurchaserInfoUpdateListener((purchaserInfo) => {
  // handle any changes to purchaserInfo
});
```
```javascript React Native
Purchases.addCustomerInfoUpdateListener(info => {
	// handle any changes to purchaserInfo
});
```
```javascript Cordova
// subscribe to the window event onCustomerInfoUpdated to get any changes that happen in the customerInfo
window.addEventListener("onCustomerInfoUpdated", onCustomerInfoUpdated, false);

//...

onCustomerInfoUpdated: function(info) {
    // handle any changes to customerInfo
}
```
```csharp Unity
public override void PurchaserInfoReceived(Purchases.PurchaserInfo purchaserInfo)
{
    // handle any changes to purchaserInfo
}
```

[block:html]
{
  "html": "<body>\n  <h3> See it in action </h3>\n  <a href=\"https://github.com/RevenueCat/purchases-ios/blob/main/Examples/MagicWeather/MagicWeather/Sources/Lifecycle/AppDelegate.swift#L49-L59\" target=\"_blank\" class=\"button-text\">Swift</a>\n  <a href=\"https://github.com/RevenueCat/purchases-android/blob/main/examples/MagicWeather/app/src/main/java/com/revenuecat/sample/MainApplication.kt#L26-L51\" target=\"_blank\" class=\"button-text\">Kotlin</a>\n  <a href=\"https://github.com/RevenueCat/purchases-flutter/blob/main/revenuecat_examples/MagicWeather/lib/src/views/home.dart#L40-L50\" target=\"_blank\" class=\"button-text\">Flutter</a>\n  <a href=\"https://github.com/RevenueCat/react-native-purchases/blob/main/examples/MagicWeather/src/screens/UserScreen/index.js#L35-L41\" target=\"_blank\"  class=\"button-text\">React Native</a>\n</body>\n"
}
[/block]

[block:callout]
{
  "type": "success",
  "title": "You did it!",
  "body": "You have now implemented a fully-featured subscription purchasing system without spending a month writing server code. Congrats!"
}
[/block]
# Sample Apps

To download more complete examples of integrating the SDK, head over to our sample app resources.

**[View Samples :fa-arrow-right:](doc:sample-apps)**

# Next Steps

* If you haven't already, make sure your products are configured correctly by checking out our [guide on entitlements :fa-arrow-right:](doc:entitlements).
* If you want to use your own user identifiers, read about [setting app user IDs :fa-arrow-right:](doc:user-ids).
* If you're moving to RevenueCat from another system, see our guide on [migrating your existing subscriptions :fa-arrow-right:](doc:migrating-existing-subscriptions).
* Once you're ready to test your integration, you can follow our guides on [testing and debugging :fa-arrow-right:](doc:debugging).
* If you qualify for the App Store Small Business Program, check out our guide on [how to apply and inform RevenueCat :fa-arrow-right:](doc:app-store-small-business-program)
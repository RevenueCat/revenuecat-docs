---
title: "[Draft] Quickstart v2"
slug: draft-quickstart
excerpt: Get up and running with mobile subscriptions
hidden: true
categorySlug: documentation
order: 19
---
This guide will walk you through how to get up and running with subscriptions and the Purchases SDK with only a few lines of code.

# 1. Setting up your Account
We recommend using a company account when registering for RevenueCat and setting up your app. You'll be able to invite the rest of your team as [collaborators](doc:collaborators) to your app, but only the app owner can manage billing. Note that there is not a mechanism for transferring apps between accounts, but you can change the email address of the account owner. If you intend on selling an app, you should create a separate account.

# 2. Register Your App

Navigate to the RevenueCat dashboard and [add a new app :fa-arrow-right:](https://app.revenuecat.com/apps/add) from the dropdown. A single app in RevenueCat supports all platforms.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/e3a8920-registering_app.png",
        "registering_app.png",
        638,
        729,
        "#f5f7f7"
      ]
    }
  ]
}
[/block]
The field "App name" is required to add your app into RevenueCat. The rest of the configuration fields can be added later. 

After registering your app, we recommend setting up [Platform Server Notifications](doc:server-notifications). This isn't required, but will speed up [webhooks](doc:webhooks) and integration delivery times and reduce lag time updating your subscribers. 
[block:callout]
{
  "type": "info",
  "body": "RevenueCat itself does not have separate environments for staging and production. Both sandbox and production purchases from the stores can be made from any RevenueCat app. If you do have separate apps for staging and production, you can create multiple apps in RevenueCat to mirror your setup.",
  "title": "Staging vs. Production apps"
}
[/block]
# 3. Store set up 
Before you can start using RevenueCat to fetch products, you would need to configure your products in the respective stores. See the following guides for [App Store Connect](doc:ios-products), [Google Play Console](doc:android-products), and [Stripe](doc:stripe-products) for help navigating through this process.

Service credentials need to be set up for RevenueCat to communicate with the app stores on your behalf. See our guides [iTunesConnect App Specific Shared Secret](doc:itunesconnect-app-specific-shared-secret ) and [Play Service Credentials](doc:creating-play-service-credentials) for more information. Note that Play service credentials can take up to 36 hours to propagate throughout Google's servers.

If you are selling iOS products, be sure to sign your 'Paid Applications Agreement' and fill out your bank and tax information in App Store Connect > Agreements, Tax, and Banking. This needs to be completed before you can test any purchases.

# 4. Configure Your Products

Once your in-app products have been configured in  [App Store Connect](doc:ios-products), [Google Play Console](doc:android-products), or [Stripe](doc:stripe-products), you'll need to copy that configuration into the RevenueCat dashboard. RevenueCat uses an Entitlements system to control access to premium features, and Offerings to manage the set of products you offer to customers. 

Entitlements are the level of access that a customer is "entitled" to after purchasing a specific product, and Offerings is a simple way for you to organize the in-app products you wish to "offer" on your paywall and configure them remotely. We **recommend** utilizing these features to simplify your code and enable you to change products without releasing an app update.

See [Configuring Products](doc:entitlements) to set up your products and then organize them into Offerings or Entitlements.

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/55e2667-1628274-Entitlements_2.0.png",
        "1628274-Entitlements_2.0.png",
        1154,
        1254,
        "#f6f6f5"
      ]
    }
  ]
}
[/block]
# 5. Install the Purchases SDK

*Purchases* is the RevenueCat SDK that seamlessly implements purchases and subscriptions across platforms while syncing tokens with the RevenueCat server.
[block:html]
{
  "html": "<ul>\n  <li>\n  \t<a href=\"/docs/ios\" class=\"button-text-links\">iOS Installation</a>\n   </li>\n  <li>\n  \t<a href=\"/docs/android\" class=\"button-text-links\">Android Installation</a>\n  </li>\t\n  <li>\n  \t<a href=\"/docs/reactnative\" class=\"button-text-links\">React Native Installation</a>\n  </li>\n  <li>\n  \t<a href=\"/docs/flutter\" class=\"button-text-links\">Flutter Installation</a>\n  </li>\n  <li>\n  \t<a href=\"/docs/cordova\" class=\"button-text-links\">Cordova Installation</a>\n  </li>\n  <li>\n  \t<a href=\"/docs/ionic\" class=\"button-text-links\">Ionic Installation</a>\n  </li>\n  <li>\n  \t<a href=\"/docs/unity\" class=\"button-text-links\">Unity Installation</a>\n  </li>\n  <li>\n  \t<a href=\"/docs/macos\" class=\"button-text-links\">macOS / Catalyst Installation</a>\n  </li>\n</ul>"
}
[/block]
If you run into issues with the SDK, see [Troubleshooting the SDKs](doc:troubleshooting-the-sdks) for guidance.

# 6. Configure the Purchases SDK
[block:callout]
{
  "type": "info",
  "body": "You can get your public SDK key from the app settings in the [dashboard](https://app.revenuecat.com/apps/).",
  "title": "Only use your public SDK key to configure Purchases"
}
[/block]
You should only configure *Purchases* once, usually on app launch. The same instance is shared throughout your app by accessing the `.shared` instance in the SDK.

See our guide on [Configuring SDK](https://docs.revenuecat.com/docs/configuring-sdk) for more information and best practices.

Make sure you configure *Purchases* with your public SDK key only. You can read more about the different API keys available in our [Authentication guide](doc:authentication).

```swift 
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
  
    Purchases.debugLogsEnabled = true
    Purchases.configure(withAPIKey: "public_sdk_key")
  
}
```
```objectivec 
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  	// Override point for customization after application launch.
    
  	RCPurchases.debugLogsEnabled = YES;
  	[RCPurchases configureWithAPIKey:@"public_sdk_key"];
    
  	return YES;
}
```
```kotlin 
class MainApplication: Application() {

    override fun onCreate() {
        super.onCreate()
        Purchases.debugLogsEnabled = true
        Purchases.configure(this, "public_sdk_key")
    }

}
```
```java 
public class MainApplication extends Application {

    @Override
    public void onCreate() {
        super.onCreate();
        Purchases.debugLogsEnabled = true;
       Purchases.configure(this, "public_sdk_key");
    }

}
```
```javascript Flutter
@override
void initState() {
  super.initState();
  initPlatformState();
}

Future<void> initPlatformState() async {
  await Purchases.setDebugLogsEnabled(true);
  await Purchases.setup("public_sdk_key");
}
```
```javascript React Native
export default class App extends React.Component {
  
  componentDidMount() {
    Purchases.setDebugLogsEnabled(true);
    Purchases.setup("public_sdk_key");
  }
  
}
```
```javascript Cordova
document.addEventListener("deviceready", onDeviceReady, false);

function onDeviceReady() {
    Purchases.setDebugLogsEnabled(true);
    Purchases.setup("public_sdk_key");
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
  "body": "If you have a user authentication system in your app, you can provide a user identifier to Purchases at the time of configuration or at a later date with a call to `.identify()`. To learn more, check out our guide on [Identifying Users](user-ids)."
}
[/block]
# 7. Displaying Available Products

*Purchases* will automatically fetch the [configured Offerings](doc:entitlements#offerings) and retrieve the product information from Apple or Google. This means when customers launch your purchase screen, available products will already be loaded.

Below is an example of fetching Offerings. You can utilize Offerings to organize your paywall screen. See our guide on [Displaying Products](doc:displaying-products) for more information and best practices.

```swift 
Purchases.shared.offerings { (offerings, error) in
	if let offerings = offerings {
	  // Display current offering with offerings.current
  }
}
```
```objectivec 
[[RCPurchases sharedPurchases] offeringsWithCompletionBlock:^(RCOfferings *offerings, NSError *error) {
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
Purchases.getSharedInstance().getOfferings(new ReceiveOfferingsListener() {
    @Override
    public void onReceived(@Nullable Map<String, Entitlement> offerings) {
        // Display current offering with offerings.current
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
  "html": "<body>\n  <h3> See it in action </h3>\n  <a href=\"https://github.com/RevenueCat/purchases-ios/blob/main/Examples/MagicWeather/MagicWeather/Sources/Controllers/PaywallViewController.swift#L24-L35\" target=\"_blank\" class=\"button-text\">Swift</a>\n  <a href=\"https://github.com/RevenueCat/purchases-android/blob/develop/examples/MagicWeather/app/src/main/java/com/revenuecat/sample/ui/paywall/PaywallFragment.kt#L48-L53\" target=\"_blank\" class=\"button-text\">Kotlin</a>\n  <a href=\"https://github.com/RevenueCat/purchases-android/blob/develop/examples/purchase-tester-java/src/main/java/com/revenuecat/purchasetester/java/UpsellActivity.java#L61-L74\" target=\"_blank\"  class=\"button-text\">Java</a>\n  <a href=\"https://github.com/RevenueCat/purchases-flutter/blob/develop/revenuecat_examples/MagicWeather/lib/src/views/weather.dart#L41-L79\" target=\"_blank\" class=\"button-text\">Flutter</a>\n  <a href=\"https://github.com/RevenueCat/react-native-purchases/blob/develop/examples/MagicWeather/src/screens/PaywallScreen/index.js#L22-L33\" target=\"_blank\"  class=\"button-text\">React Native</a>\n</body>\n"
}
[/block]

If fetching your [Offerings](doc:entitlements#offerings), [products](doc:entitlements#products), or available [packages](doc:entitlements#adding-packages) are empty, it's due to some configuration issue in App Store Connect or the Play Console. 

The most common reasons for this in App Store Connect are an out-of-date 'Paid Applications Agreement' or products not at least in the 'Ready To Submit' state. On Android this usually occurs when the app is not published on a closed track and a valid test user added.

You can find more info about trouble shooting this issue in our [Help Center](https://support.revenuecat.com/hc/en-us/articles/360041793174).

# 8. Make a Purchase

*Purchases* includes a simple method for facilitating purchases. The `purchasePackage` takes a package from the fetched Offering and processes the transaction with Apple or Google.

The code sample below shows the process of purchasing a package and confirming it unlocks the "your_entitlement_id" content. More detail about the `purchasePackage` method can be found in our guide on [Making Purchases](doc:making-purchases).

```swift 
Purchases.shared.purchasePackage(package) { (transaction, purchaserInfo, error, userCancelled) in
    if purchaserInfo?.entitlements.all["your_entitlement_id"]?.isActive == true {
        // Unlock that great "pro" content
    }
})
```
```objectivec 
[[RCPurchases sharedPurchases] purchasePackage:package withCompletionBlock:^(SKPaymentTransaction *transaction, RCPurchaserInfo *purchaserInfo, NSError *error, BOOL cancelled) {
    if (purchaserInfo.entitlements.all[@"your_entitlement_id"].isActive) {
    // User is "premium"
	}
}];
```
```kotlin 
Purchases.sharedInstance.purchasePackageWith(
  this,
  package,
  onError = { error, userCancelled -> /* No purchase */ },
  onSuccess = { product, purchaserInfo ->
    if (purchaserInfo.entitlements["my_entitlement_identifier"]?.isActive == true) {
    // Unlock that great "pro" content
  }
})
```
```java 
Purchases.getSharedInstance().purchasePackage(
    this,
    package,
    new MakePurchaseListener() {
        @Override
        public void onCompleted(@NonNull Purchase purchase, @NonNull PurchaserInfo purchaserInfo) {
            if (purchaserInfo.getEntitlements().get("my_entitlement_identifier").isActive()) {
              // Unlock that great "pro" content
            }
        }

        @Override
        public void onError(@NonNull PurchasesError error, Boolean userCancelled) {
          // No purchase
        }
    }
);
```
```javascript Flutter
try {
  PurchaserInfo purchaserInfo = await Purchases.purchasePackage(package);
  var isPro = purchaserInfo.entitlements.all["my_entitlement_identifier"].isActive;
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
  if (typeof purchaseMade.purchaserInfo.entitlements.active.my_entitlement_identifier !== "undefined") {
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
Purchases.purchasePackage(package, ({ productIdentifier, purchaserInfo }) => {
    if (typeof purchaserInfo.entitlements.active.my_entitlement_identifier !== "undefined") {
      // Unlock that great "pro" content
    }
  },
  ({error, userCancelled}) => {
    // Error making purchase
  }
);

// Note: if you are using purchaseProduct to purchase Android In-app products, an optional third parameter needs to be provided when calling purchaseProduct. You can use the package system to avoid this.

Purchases.purchaseProduct("product_id", ({ productIdentifier, purchaserInfo }) => {
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
  "html": "<body>\n  <h3> See it in action </h3>\n  <a href=\"https://github.com/RevenueCat/purchases-ios/blob/main/Examples/MagicWeather/MagicWeather/Sources/Controllers/PaywallViewController.swift#L78-L95\" target=\"_blank\" class=\"button-text\">Swift</a>\n  <a href=\"https://github.com/RevenueCat/purchases-android/blob/develop/examples/MagicWeather/app/src/main/java/com/revenuecat/sample/ui/paywall/PaywallFragment.kt#L55-L66\" target=\"_blank\" class=\"button-text\">Kotlin</a>\n  <a href=\"https://github.com/RevenueCat/purchases-android/blob/develop/examples/purchase-tester-java/src/main/java/com/revenuecat/purchasetester/java/UpsellActivity.java#L111-L127\" target=\"_blank\"  class=\"button-text\">Java</a>\n  <a href=\"https://github.com/RevenueCat/purchases-flutter/blob/develop/revenuecat_examples/MagicWeather/lib/src/views/paywall.dart#L53-L61\" target=\"_blank\" class=\"button-text\">Flutter</a>\n  <a href=\"https://github.com/RevenueCat/react-native-purchases/blob/develop/examples/MagicWeather/src/components/PackageItem/index.js#L15-L31\" target=\"_blank\"  class=\"button-text\">React Native</a>\n</body>\n"
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "`purchasePackage` handles the underlying framework interaction and automatically validates purchases with Apple or Google through our secure servers. This helps reduce in-app purchase fraud and decreases the complexity of your app. Receipt tokens are stored remotely and always kept up to date by RevenueCat."
}
[/block]
# 9. Get Subscription Status

*Purchases* makes it easy to check what active subscriptions the current customer has. This can be done by checking if a specific Entitlement is active, or by checking if the active Entitlements array contains a specific Entitlement ID.
If you're not using Entitlements (you probably should be!) you can check the array of active subscriptions to see what product IDs from App Store Connect or Google Play Store it contains.

```swift 
Purchases.shared.purchaserInfo { (purchaserInfo, error) in
    if purchaserInfo?.entitlements.all["your_entitlement_id"]?.isActive == true {
        // User is "premium"
    }
}
```
```objectivec 
[[RCPurchases sharedPurchases] purchaserInfoWithCompletionBlock:^(RCPurchaserInfo * purchaserInfo, NSError * error) {
        
    if (purchaserInfo.entitlements.all[@"your_entitlement_id"].isActive) {
    // User is "premium"
	}
}];
```
```kotlin 
Purchases.sharedInstance.getPurchaserInfoWith({ error -> /* Optional error handling */ }) { purchaserInfo ->
  if (purchaserInfo.entitlements["my_entitlement_identifier"]?.isActive == true) {
    // Grant user "pro" access
  }
}
```
```java 
Purchases.getSharedInstance().getPurchaserInfo(new ReceivePurchaserInfoListener() {
  @Override
  public void onReceived(@NonNull PurchaserInfo purchaserInfo) {
    if (purchaserInfo.getEntitlements().get("my_entitlement_identifier").isActive()) {
      // Grant user "pro" access
    }
  }
  
  @Override
  public void onError(@NonNull PurchasesError error) {

  }
});
```
```javascript Flutter
try {
  PurchaserInfo purchaserInfo = await Purchases.getPurchaserInfo();
  if (purchaserInfo.entitlements.all["my_entitlement_identifier"].isActive) {
    // Grant user "pro" access
  }
} on PlatformException catch (e) {
  // Error fetching purchaser info
}
```
```javascript React Native
try {
  const purchaserInfo = await Purchases.getPurchaserInfo();
  if(typeof purchaserInfo.entitlements.active.my_entitlement_identifier !== "undefined") {
    // Grant user "pro" access
  }
} catch (e) {
 // Error fetching purchaser info
}
```
```javascript Cordova
Purchases.getPurchaserInfo(
  info => {
    const isPro = typeof purchaserInfo.entitlements.active.my_entitlement_identifier !== "undefined";
  },
  error => {
    // Error fetching purchaser info
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
  "html": "<body>\n  <h3> See it in action </h3>\n  <a href=\"https://github.com/RevenueCat/purchases-ios/blob/main/Examples/MagicWeather/MagicWeather/Sources/Controllers/UserViewController.swift#L37-L45\" target=\"_blank\" class=\"button-text\">Swift</a>\n  <a href=\"https://github.com/RevenueCat/purchases-android/blob/develop/examples/MagicWeather/app/src/main/java/com/revenuecat/sample/ui/weather/WeatherFragment.kt#L69-L84\" target=\"_blank\" class=\"button-text\">Kotlin</a>\n  <a href=\"https://github.com/RevenueCat/purchases-android/blob/develop/examples/purchase-tester-java/src/main/java/com/revenuecat/purchasetester/java/InitialActivity.java#L29-L45\" target=\"_blank\"  class=\"button-text\">Java</a>\n  <a href=\"https://github.com/RevenueCat/purchases-flutter/blob/develop/revenuecat_examples/MagicWeather/lib/src/views/weather.dart#L31-L39\" target=\"_blank\" class=\"button-text\">Flutter</a>\n  <a href=\"https://github.com/RevenueCat/react-native-purchases/blob/develop/examples/MagicWeather/src/screens/WeatherScreen/index.js#L29-L46\" target=\"_blank\"  class=\"button-text\">React Native</a>\n</body>\n"
}
[/block]

You can use this method whenever you need to get the latest status, and it's safe to call this repeatedly throughout the lifecycle of your app. *Purchases* automatically caches the latest `purchaserInfo` whenever it updates — so in most cases, this method pulls from the cache and runs very fast.

It's typical to call this method when deciding which UI to show the user and whenever the user performs an action that requires a certain entitlement level.
[block:callout]
{
  "type": "info",
  "body": "You can access a lot more information about a subscription than simply whether it's active or not. See our guide on [Subscription Status](doc:purchaserinfo) to learn if subscription is set to renew, if there's an issue detected with the user's credit card, and more."
}
[/block]
# 10. Restoring Purchases

RevenueCat enables your users to restore their in-app purchases, reactivating any content that they previously purchased from the **same store account** (Apple or Google). We recommend that all apps have some way for users to trigger the restore method. Note that Apple does require a restore mechanism in the event a user loses access to their purchases (e.g: uninstalling/reinstalling the app, losing their account information, etc).
```swift 
Purchases.shared.restoreTransactions { (purchaserInfo, error) in
    //... check purchaserInfo to see if entitlement is now active
}
```
```objectivec 
[[RCPurchases sharedPurchases] restoreTransactionsWithCompletionBlock:^(RCPurchaserInfo *purchaserInfo, NSError *error) {
    //... check purchaserInfo to see if entitlement is now active
}];
```
```kotlin 
Purchases.sharedInstance.restorePurchasesWith(::showError) { purchaserInfo ->
    //... check purchaserInfo to see if entitlement is now active
}
```
```java 
Purchases.getSharedInstance().restorePurchases(new ReceivePurchaserInfoListener() {
	@Override
	public void onReceived(@android.support.annotation.Nullable PurchaserInfo purchaserInfo, @android.support.annotation.Nullable PurchasesError error) {
    //... check purchaserInfo to see if entitlement is now active 	
  }
});
```
```javascript Flutter
try {
  PurchaserInfo restoredInfo = await Purchases.restoreTransactions();
  // ... check restored purchaserInfo to see if entitlement is now active
} on PlatformException catch (e) {
  // Error restoring purchases
}
```
```javascript React Native
try {
  const restore = await Purchases.restoreTransactions();
  // ... check restored purchaserInfo to see if entitlement is now active
} catch (e) {

}
```
```javascript Cordova
Purchases.restoreTransactions(
  info => {
    //... check purchaserInfo to see if entitlement is now active
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
  "html": "<body>\n  <h3> See it in action </h3>\n  <a href=\"https://github.com/RevenueCat/purchases-ios/blob/main/Examples/MagicWeather/MagicWeather/Sources/Controllers/UserViewController.swift#L107-L123\" target=\"_blank\" class=\"button-text\">Swift</a>\n  <a href=\"https://github.com/RevenueCat/purchases-android/blob/develop/examples/MagicWeather/app/src/main/java/com/revenuecat/sample/ui/user/UserFragment.kt#L78-L85\" target=\"_blank\" class=\"button-text\">Kotlin</a>\n  <a href=\"https://github.com/RevenueCat/purchases-android/blob/develop/examples/purchase-tester-java/src/main/java/com/revenuecat/purchasetester/java/CatsActivity.java#L43-L57\" target=\"_blank\"  class=\"button-text\">Java</a>\n  <a href=\"https://github.com/RevenueCat/purchases-flutter/blob/develop/revenuecat_examples/MagicWeather/lib/src/views/user.dart#L29-L50\" target=\"_blank\" class=\"button-text\">Flutter</a>\n  <a href=\"https://github.com/RevenueCat/react-native-purchases/blob/develop/examples/MagicWeather/src/components/RestorePurchasesButton/index.js#L11-L18\" target=\"_blank\"  class=\"button-text\">React Native</a>\n</body>\n"
}
[/block]
If two different [App User IDs](doc:user-ids) restore transactions from the same underlying store account (Apple or Google) the default behavior is RevenueCat will create an alias between the two App User IDs and count them as the same user going forward. See our guide on [Restoring Purchases](doc:restoring-purchases) for more information on the different configurable restore behaviors.


# (optional) Listening For Purchaser Info Updates

Since the *Purchases SDK* works seamlessly on any platform, changes to a user's purchase info may come from a variety of sources. You can respond to any changes in a customer's PurchaserInfo by conforming to an optional delegate method, `didReceivePurchaserInfo:`. This will fire whenever the *Purchases SDK* receives an updated purchaser info object from calls to `getPurchaserInfo()`, `purchasePackage()`, `purchaserProduct()`, or `restoreTransactions()`. 

PurchaserInfo updates are *not* pushed to your app from the RevenueCat backend, updates can only happen from an outbound network request to RevenueCat.

Depending on your app, it may be sufficient to ignore the delegate and simply handle changes to purchaser information the next time your app is launched or in the completion blocks of the *Purchases SDK* methods.

```swift 
extension AppDelegate: PurchasesDelegate {
  func purchases(_ purchases: Purchases, didReceiveUpdated purchaserInfo: Purchases.PurchaserInfo) {
      // handle any changes to purchaserInfo
  }
}
```
```objectivec 
- (void)purchases:(nonnull RCPurchases *)purchases didReceiveUpdatedPurchaserInfo:(nonnull RCPurchaserInfo *)purchaserInfo {
    // handle any changes to purchaserInfo
}
```
```kotlin 
class UpsellActivity : AppCompatActivity(), UpdatedPurchaserInfoListener {
		override fun onReceived(purchaserInfo: PurchaserInfo) {
        // handle any changes to purchaserInfo
    }
}
```
```java 
public class UpsellActivity extends AppCompatActivity implements UpdatedPurchaserInfoListener {
		@Override
    public void onReceived(PurchaserInfo purchaserInfo) {
        // handle any changes to purchaserInfo
    }
}
```
```javascript Flutter
Purchases.addPurchaserInfoUpdateListener((purchaserInfo) => {
  // handle any changes to purchaserInfo
});
```
```javascript React Native
Purchases.addPurchaserInfoUpdateListener(info => {
	// handle any changes to purchaserInfo
});
```
```javascript Cordova
// subscribe to the window event onPurchaserInfoUpdated to get any changes that happen in the purchaserInfo
window.addEventListener("onPurchaserInfoUpdated", onPurchaserInfoUpdated, false);

//...

onPurchaserInfoUpdated: function(info) {
    // handle any changes to purchaserInfo
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
  "html": "<body>\n  <h3> See it in action </h3>\n  <a href=\"https://github.com/RevenueCat/purchases-ios/blob/main/Examples/MagicWeather/MagicWeather/Sources/Lifecycle/AppDelegate.swift#L49-L59\" target=\"_blank\" class=\"button-text\">Swift</a>\n  <a href=\"https://github.com/RevenueCat/purchases-android/blob/develop/examples/MagicWeather/app/src/main/java/com/revenuecat/sample/MainApplication.kt#L26-L36\" target=\"_blank\" class=\"button-text\">Kotlin</a>\n  <a href=\"https://github.com/RevenueCat/purchases-android/blob/develop/examples/purchase-tester-java/src/main/java/com/revenuecat/purchasetester/java/UpsellActivity.java#L52-L57\" target=\"_blank\"  class=\"button-text\">Java</a>\n  <a href=\"https://github.com/RevenueCat/purchases-flutter/blob/develop/revenuecat_examples/MagicWeather/lib/src/views/home.dart#L40-L50\" target=\"_blank\" class=\"button-text\">Flutter</a>\n  <a href=\"https://github.com/RevenueCat/react-native-purchases/blob/develop/examples/MagicWeather/src/screens/UserScreen/index.js#L35-L41\" target=\"_blank\"  class=\"button-text\">React Native</a>\n</body>\n"
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

To download more complete examples of integrating the Purchases SDK, head over to our sample app resources.
[block:html]
{
  "html": "<ul>\n  <li>\n   \t<a href=\"/docs/sample-apps\" class=\"button-text-links\">View samples</a>\n   </li>\n</ul>"
}
[/block]

# Next Steps
[block:html]
{
  "html": "<ul>\n  <li>\n   \tIf you haven't already, make sure your products are configured correctly by checking out our <a href=\"/docs/entitlements\" class=\"button-text-links\">guide on entitlements</a>\n   </li>\n  <li>\n    If you want to use your own user identifiers, read about <a href=\"/docs/user-ids\" class=\"button-text-links\">setting app user ids</a>\n  </li>\t\n  <li>\n    If you're moving to RevenueCat from another system, see our guide on <a href=\"/docs/migrating-existing-subscriptions\" class=\"button-text-links\">migrating your existing subscriptions</a>\n  </li>\n  <li>\n    Once you're ready to test your integration, you can follow our guides on<a href=\"/docs/debugging\" class=\"button-text-links\">testing and debugging</a>\n  </li>\n  <li>\n    If you qualify for the App Store Small Business Program, check out our guide on <a href=\"/docs/app-store-small-business-program\" class=\"button-text-links\">how to apply and inform RevenueCat</a>\n  </li>\n</ul>"
}
[/block]
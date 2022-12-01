---
title: "Quickstart"
slug: "getting-started"
excerpt: "Get up and running with in-app purchases and subscriptions"
hidden: false
metadata: 
  title: "Quickstart – RevenueCat"
  description: "This guide will walk you through a practical example to get you up and running with subscriptions and the Purchases SDK with only a few lines of code."
  image: 
    0: "https://files.readme.io/fd05eb8-OG_image.png"
    1: "OG image.png"
    2: 1200
    3: 627
    4: "#e9acb0"
createdAt: {}
updatedAt: "2021-06-18T15:50:41.651Z"
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
# 3. Store setup 
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

* [iOS Installation :fa-arrow-right:](doc:ios) 
* [Android Installation :fa-arrow-right:](doc:android)
* [React Native Installation :fa-arrow-right:](doc:reactnative) 
* [Flutter Installation :fa-arrow-right:](doc:flutter)
* [Cordova Installation :fa-arrow-right:](doc:cordova) 
* [Ionic Installation :fa-arrow-right:](doc:ionic)
* [Unity Installation :fa-arrow-right:](doc:unity) 
* [macOS / Catalyst Installation :fa-arrow-right:](doc:macos)

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

[block:code]
{
  "codes": [
    {
      "code": "func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {\n  \n    Purchases.debugLogsEnabled = true\n    Purchases.configure(withAPIKey: \"public_sdk_key\")\n  \n}",
      "language": "swift"
    },
    {
      "code": "- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {\n  \t// Override point for customization after application launch.\n    \n  \tRCPurchases.debugLogsEnabled = YES;\n  \t[RCPurchases configureWithAPIKey:@\"public_sdk_key\"];\n    \n  \treturn YES;\n}\n",
      "language": "objectivec"
    },
    {
      "code": "class MainApplication: Application() {\n\n    override fun onCreate() {\n        super.onCreate()\n        Purchases.debugLogsEnabled = true\n        Purchases.configure(this, \"public_sdk_key\")\n    }\n\n}",
      "language": "kotlin"
    },
    {
      "code": "\npublic class MainApplication extends Application {\n\n    @Override\n    public void onCreate() {\n        super.onCreate();\n        Purchases.debugLogsEnabled = true;\n       Purchases.configure(this, \"public_sdk_key\");\n    }\n\n}\n",
      "language": "java"
    },
    {
      "code": "@override\nvoid initState() {\n  super.initState();\n  initPlatformState();\n}\n\nFuture<void> initPlatformState() async {\n  await Purchases.setDebugLogsEnabled(true);\n  await Purchases.setup(\"public_sdk_key\");\n}",
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

[block:code]
{
  "codes": [
    {
      "code": "Purchases.shared.offerings { (offerings, error) in\n\tif let offerings = offerings {\n\t  // Display current offering with offerings.current\n  }\n}",
      "language": "swift"
    },
    {
      "code": "[[RCPurchases sharedPurchases] offeringsWithCompletionBlock:^(RCOfferings *offerings, NSError *error) {\n  if (offerings) {\n\t\t// Display current offering with offerings.current\n  } else if (error) {\n    // optional error handling\n  }\n}];",
      "language": "objectivec"
    },
    {
      "code": "Purchases.sharedInstance.getOfferingsWith(\n\tonError = { error ->\n    /* Optional error handling */ \n  },\n  onSuccess = { offerings ->  \n  \t// Display current offering with offerings.current\n\t}\n}",
      "language": "kotlin"
    },
    {
      "code": "Purchases.getSharedInstance().getOfferings(new ReceiveOfferingsListener() {\n    @Override\n    public void onReceived(@Nullable Map<String, Entitlement> offerings) {\n        // Display current offering with offerings.current\n    }\n  \n\t  @Override\n    public void onError(@NonNull PurchasesError error) {\n        /* Optional error handling */ \n    }\n});",
      "language": "java"
    },
    {
      "code": "try {\n  Offerings offerings = await Purchases.getOfferings();\n  if (offerings.current != null) {\n    // Display current offering with offerings.current\n  }\n} on PlatformException catch (e) {\n\t// optional error handling\n}",
      "language": "javascript",
      "name": "Flutter"
    },
    {
      "code": "try {\n  const offerings = await Purchases.getOfferings();\n  if (offerings.current !== null) {  \n\t  // Display current offering with offerings.current\n  }\n} catch (e) {\n\n}",
      "language": "javascript",
      "name": "React Native"
    },
    {
      "code": "func displayUpsellScreen() {\n  Purchases.getOfferings(\n      offerings => {\n        if (offerings.current !== null) {  \n          // Display current offering with offerings.current\n        }\n      },\n      error => {\n\n      }\n  );\n}",
      "language": "javascript",
      "name": "Cordova"
    },
    {
      "code": "var purchases = GetComponent<Purchases>();\npurchases.GetOfferings((offerings, error) =>\n{\n  if (error != null) {\n    LogError(error);\n  } else if (offerings.Current != null {\n    // Display current offering with offerings.current\n  }\n});",
      "language": "csharp",
      "name": "Unity"
    },
    {
      "code": "curl --request GET \\\n  --url https://api.revenuecat.com/v1/subscribers/<app_user_id>/offerings \\\n  --header 'Accept: application/json' \\\n  --header 'Authorization: Bearer REVENUECAT_API_KEY' \\\n  --header 'Content-Type: application/json' \\\n  --header 'X-Platform: stripe'",
      "language": "curl",
      "name": "Web"
    }
  ]
}
[/block]

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

[block:code]
{
  "codes": [
    {
      "code": "Purchases.shared.purchasePackage(package) { (transaction, purchaserInfo, error, userCancelled) in\n    if purchaserInfo?.entitlements.all[\"your_entitlement_id\"]?.isActive == true {\n        // Unlock that great \"pro\" content\n    }\n})\n",
      "language": "swift"
    },
    {
      "code": "[[RCPurchases sharedPurchases] purchasePackage:package withCompletionBlock:^(SKPaymentTransaction *transaction, RCPurchaserInfo *purchaserInfo, NSError *error, BOOL cancelled) {\n    if (purchaserInfo.entitlements.all[@\"your_entitlement_id\"].isActive) {\n    // User is \"premium\"\n\t}\n}];\n",
      "language": "objectivec"
    },
    {
      "code": "Purchases.sharedInstance.purchasePackageWith(\n  this,\n  package,\n  onError = { error, userCancelled -> /* No purchase */ },\n  onSuccess = { product, purchaserInfo ->\n    if (purchaserInfo.entitlements[\"my_entitlement_identifier\"]?.isActive == true) {\n    // Unlock that great \"pro\" content\n  }\n})",
      "language": "kotlin"
    },
    {
      "code": "Purchases.getSharedInstance().purchasePackage(\n    this,\n    package,\n    new MakePurchaseListener() {\n        @Override\n        public void onCompleted(@NonNull Purchase purchase, @NonNull PurchaserInfo purchaserInfo) {\n            if (purchaserInfo.getEntitlements().get(\"my_entitlement_identifier\").isActive()) {\n              // Unlock that great \"pro\" content\n            }\n        }\n\n        @Override\n        public void onError(@NonNull PurchasesError error, Boolean userCancelled) {\n          // No purchase\n        }\n    }\n);",
      "language": "java"
    },
    {
      "code": "try {\n  PurchaserInfo purchaserInfo = await Purchases.purchasePackage(package);\n  var isPro = purchaserInfo.entitlements.all[\"my_entitlement_identifier\"].isActive;\n  if (isPro) {\n    // Unlock that great \"pro\" content\n  }\n} on PlatformException catch (e) {\n  var errorCode = PurchasesErrorHelper.getErrorCode(e);\n  if (errorCode != PurchasesErrorCode.purchaseCancelledError) {\n    showError(e);  \t          \n  }\n}",
      "language": "javascript",
      "name": "Flutter"
    },
    {
      "code": "// Using packages\ntry {\n  const purchaseMade = await Purchases.purchasePackage(package);\n  if (typeof purchaseMade.purchaserInfo.entitlements.active.my_entitlement_identifier !== \"undefined\") {\n    // Unlock that great \"pro\" content\n  }\n} catch (e) {\n  if (!e.userCancelled) {\n  \tshowError(e);\n  }\n}\n\n// Note: if you are using purchaseProduct to purchase Android In-app products, an optional third parameter needs to be provided when calling purchaseProduct. You can use the package system to avoid this\nawait Purchases.purchaseProduct(\"product_id\", null, Purchases.PURCHASE_TYPE.INAPP);\n",
      "language": "javascript",
      "name": "React Native"
    },
    {
      "code": "Purchases.purchasePackage(package, ({ productIdentifier, purchaserInfo }) => {\n    if (typeof purchaserInfo.entitlements.active.my_entitlement_identifier !== \"undefined\") {\n      // Unlock that great \"pro\" content\n    }\n  },\n  ({error, userCancelled}) => {\n    // Error making purchase\n  }\n);\n\n// Note: if you are using purchaseProduct to purchase Android In-app products, an optional third parameter needs to be provided when calling purchaseProduct. You can use the package system to avoid this.\n\nPurchases.purchaseProduct(\"product_id\", ({ productIdentifier, purchaserInfo }) => {\n}, ({error, userCancelled}) => {\n    // Error making purchase\n}, null, Purchases.PURCHASE_TYPE.INAPP);",
      "language": "javascript",
      "name": "Cordova"
    },
    {
      "code": "Purchases purchases = GetComponent<Purchases>();\npurchases.PurchasePackage(package, (productIdentifier, purchaserInfo, userCancelled, error) =>\n{\n  if (purchaserInfo.Entitlements.Active.ContainsKey(\"my_entitlement_identifier\")) {\n    // Unlock that great \"pro\" content\n  }\n});",
      "language": "csharp",
      "name": "Unity"
    },
    {
      "code": "curl -X POST \\\n  https://api.revenuecat.com/v1/receipts \\\n  -H 'Content-Type: application/json' \\\n  -H 'X-Platform: stripe' \\\n  -H 'Authorization: Bearer YOUR_REVENUECAT_API_KEY' \\\n  -d '{ \"app_user_id\": \"my_app_user_id\",\n  \"fetch_token\": \"sub_xxxxxxxxxx\"\n  }'",
      "language": "curl",
      "name": "Web"
    }
  ]
}
[/block]

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

[block:code]
{
  "codes": [
    {
      "code": "Purchases.shared.purchaserInfo { (purchaserInfo, error) in\n    if purchaserInfo?.entitlements.all[\"your_entitlement_id\"]?.isActive == true {\n        // User is \"premium\"\n    }\n}",
      "language": "swift"
    },
    {
      "code": "[[RCPurchases sharedPurchases] purchaserInfoWithCompletionBlock:^(RCPurchaserInfo * purchaserInfo, NSError * error) {\n        \n    if (purchaserInfo.entitlements.all[@\"your_entitlement_id\"].isActive) {\n    // User is \"premium\"\n\t}\n}];",
      "language": "objectivec"
    },
    {
      "code": "Purchases.sharedInstance.getPurchaserInfoWith({ error -> /* Optional error handling */ }) { purchaserInfo ->\n  if (purchaserInfo.entitlements[\"my_entitlement_identifier\"]?.isActive == true) {\n    // Grant user \"pro\" access\n  }\n}",
      "language": "kotlin"
    },
    {
      "code": "Purchases.getSharedInstance().getPurchaserInfo(new ReceivePurchaserInfoListener() {\n  @Override\n  public void onReceived(@NonNull PurchaserInfo purchaserInfo) {\n    if (purchaserInfo.getEntitlements().get(\"my_entitlement_identifier\").isActive()) {\n      // Grant user \"pro\" access\n    }\n  }\n  \n  @Override\n  public void onError(@NonNull PurchasesError error) {\n\n  }\n});",
      "language": "java"
    },
    {
      "code": "try {\n  PurchaserInfo purchaserInfo = await Purchases.getPurchaserInfo();\n  if (purchaserInfo.entitlements.all[\"my_entitlement_identifier\"].isActive) {\n    // Grant user \"pro\" access\n  }\n} on PlatformException catch (e) {\n  // Error fetching purchaser info\n}",
      "language": "javascript",
      "name": "Flutter"
    },
    {
      "code": "try {\n  const purchaserInfo = await Purchases.getPurchaserInfo();\n  if(typeof purchaserInfo.entitlements.active.my_entitlement_identifier !== \"undefined\") {\n    // Grant user \"pro\" access\n  }\n} catch (e) {\n // Error fetching purchaser info\n}",
      "language": "javascript",
      "name": "React Native"
    },
    {
      "code": "Purchases.getPurchaserInfo(\n  info => {\n    const isPro = typeof purchaserInfo.entitlements.active.my_entitlement_identifier !== \"undefined\";\n  },\n  error => {\n    // Error fetching purchaser info\n  }\n);",
      "language": "javascript",
      "name": "Cordova"
    },
    {
      "code": "var purchases = GetComponent<Purchases>();\npurchases.GetPurchaserInfo((info, error) =>\n{\n   if (purchaserInfo.Entitlements.Active.ContainsKey(\"my_entitlement_identifier\")) {\n    // Unlock that great \"pro\" content\n  }\n});",
      "language": "csharp",
      "name": "Unity"
    },
    {
      "code": "curl --request GET \\\n  --url https://api.revenuecat.com/v1/subscribers/<app_user_id> \\\n  --header 'Accept: application/json' \\\n  --header 'Authorization: Bearer REVENUECAT_API_KEY' \\\n  --header 'Content-Type: application/json'",
      "language": "curl",
      "name": "Web"
    }
  ]
}
[/block]

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
[block:code]
{
  "codes": [
    {
      "code": "Purchases.shared.restoreTransactions { (purchaserInfo, error) in\n    //... check purchaserInfo to see if entitlement is now active\n}",
      "language": "swift"
    },
    {
      "code": "[[RCPurchases sharedPurchases] restoreTransactionsWithCompletionBlock:^(RCPurchaserInfo *purchaserInfo, NSError *error) {\n    //... check purchaserInfo to see if entitlement is now active\n}];",
      "language": "objectivec"
    },
    {
      "code": "Purchases.sharedInstance.restorePurchasesWith(::showError) { purchaserInfo ->\n    //... check purchaserInfo to see if entitlement is now active\n}",
      "language": "kotlin"
    },
    {
      "code": "Purchases.getSharedInstance().restorePurchases(new ReceivePurchaserInfoListener() {\n\t@Override\n\tpublic void onReceived(@android.support.annotation.Nullable PurchaserInfo purchaserInfo, @android.support.annotation.Nullable PurchasesError error) {\n    //... check purchaserInfo to see if entitlement is now active \t\n  }\n});",
      "language": "java"
    },
    {
      "code": "try {\n  PurchaserInfo restoredInfo = await Purchases.restoreTransactions();\n  // ... check restored purchaserInfo to see if entitlement is now active\n} on PlatformException catch (e) {\n  // Error restoring purchases\n}",
      "language": "javascript",
      "name": "Flutter"
    },
    {
      "code": "try {\n  const restore = await Purchases.restoreTransactions();\n  // ... check restored purchaserInfo to see if entitlement is now active\n} catch (e) {\n\n}",
      "language": "javascript",
      "name": "React Native"
    },
    {
      "code": "Purchases.restoreTransactions(\n  info => {\n    //... check purchaserInfo to see if entitlement is now active\n  },\n  error => {\n    // Error restoring purchases\n  }\n);",
      "language": "javascript",
      "name": "Cordova"
    },
    {
      "code": "var purchases = GetComponent<Purchases>();\npurchases.RestoreTransactions((info, error) =>\n{\n    //... check purchaserInfo to see if entitlement is now active\n});",
      "language": "csharp",
      "name": "Unity"
    }
  ]
}
[/block]

[block:html]
{
  "html": "<body>\n  <h3> See it in action </h3>\n  <a href=\"https://github.com/RevenueCat/purchases-ios/blob/main/Examples/MagicWeather/MagicWeather/Sources/Controllers/UserViewController.swift#L107-L123\" target=\"_blank\" class=\"button-text\">Swift</a>\n  <a href=\"https://github.com/RevenueCat/purchases-android/blob/develop/examples/MagicWeather/app/src/main/java/com/revenuecat/sample/ui/user/UserFragment.kt#L78-L85\" target=\"_blank\" class=\"button-text\">Kotlin</a>\n  <a href=\"https://github.com/RevenueCat/purchases-android/blob/develop/examples/purchase-tester-java/src/main/java/com/revenuecat/purchasetester/java/CatsActivity.java#L43-L57\" target=\"_blank\"  class=\"button-text\">Java</a>\n  <a href=\"https://github.com/RevenueCat/purchases-flutter/blob/develop/revenuecat_examples/MagicWeather/lib/src/views/user.dart#L29-L50\" target=\"_blank\" class=\"button-text\">Flutter</a>\n  <a href=\"https://github.com/RevenueCat/react-native-purchases/blob/develop/examples/MagicWeather/src/components/RestorePurchasesButton/index.js#L11-L18\" target=\"_blank\"  class=\"button-text\">React Native</a>\n</body>\n"
}
[/block]
If two different [App User IDs](doc:user-ids) restore transactions from the same underlying store account (Apple or Google) the default behavior is RevenueCat will create an alias between the two App User IDs and count them as the same user going forward. See our guide on [Restoring Purchases](https://docs.revenuecat.com/v3.2/docs/restoring-purchases) for more information on the different configurable restore behaviors.


# (optional) Listening For Purchaser Info Updates

Since the *Purchases SDK* works seamlessly on any platform, changes to a user's purchase info may come from a variety of sources. You can respond to any changes in a customer's PurchaserInfo by conforming to an optional delegate method, `didReceivePurchaserInfo:`. This will fire whenever the *Purchases SDK* receives an updated purchaser info object from calls to `getPurchaserInfo()`, `purchasePackage()`, `purchaserProduct()`, or `restoreTransactions()`. 

PurchaserInfo updates are *not* pushed to your app from the RevenueCat backend, updates can only happen from an outbound network request to RevenueCat.

Depending on your app, it may be sufficient to ignore the delegate and simply handle changes to purchaser information the next time your app is launched or in the completion blocks of the *Purchases SDK* methods.

[block:code]
{
  "codes": [
    {
      "code": "extension AppDelegate: PurchasesDelegate {\n  func purchases(_ purchases: Purchases, didReceiveUpdated purchaserInfo: Purchases.PurchaserInfo) {\n      // handle any changes to purchaserInfo\n  }\n}",
      "language": "swift"
    },
    {
      "code": "- (void)purchases:(nonnull RCPurchases *)purchases didReceiveUpdatedPurchaserInfo:(nonnull RCPurchaserInfo *)purchaserInfo {\n    // handle any changes to purchaserInfo\n}",
      "language": "objectivec"
    },
    {
      "code": "class UpsellActivity : AppCompatActivity(), UpdatedPurchaserInfoListener {\n\t\toverride fun onReceived(purchaserInfo: PurchaserInfo) {\n        // handle any changes to purchaserInfo\n    }\n}",
      "language": "kotlin"
    },
    {
      "code": "public class UpsellActivity extends AppCompatActivity implements UpdatedPurchaserInfoListener {\n\t\t@Override\n    public void onReceived(PurchaserInfo purchaserInfo) {\n        // handle any changes to purchaserInfo\n    }\n}",
      "language": "java"
    },
    {
      "code": "Purchases.addPurchaserInfoUpdateListener((purchaserInfo) => {\n  // handle any changes to purchaserInfo\n});",
      "language": "javascript",
      "name": "Flutter"
    },
    {
      "code": "Purchases.addPurchaserInfoUpdateListener(info => {\n\t// handle any changes to purchaserInfo\n});",
      "language": "javascript",
      "name": "React Native"
    },
    {
      "code": "// subscribe to the window event onPurchaserInfoUpdated to get any changes that happen in the purchaserInfo\nwindow.addEventListener(\"onPurchaserInfoUpdated\", onPurchaserInfoUpdated, false);\n\n//...\n\nonPurchaserInfoUpdated: function(info) {\n    // handle any changes to purchaserInfo\n}\n\n\n",
      "language": "javascript",
      "name": "Cordova"
    },
    {
      "code": "public override void PurchaserInfoReceived(Purchases.PurchaserInfo purchaserInfo)\n{\n    // handle any changes to purchaserInfo\n}",
      "language": "csharp",
      "name": "Unity"
    }
  ]
}
[/block]

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

**[View Samples :fa-arrow-right:](doc:sample-apps)**

# Next Steps

* If you haven't already, make sure your products are configured correctly by checking out our [guide on entitlements :fa-arrow-right:](doc:entitlements).
* If you want to use your own user identifiers, read about [setting app user ids :fa-arrow-right:](doc:user-ids).
* If you're moving to RevenueCat from another system, see our guide on [migrating your existing subscriptions :fa-arrow-right:](doc:migrating-existing-subscriptions).
* Once you're ready to test your integration, you can follow our guides on [testing and debugging :fa-arrow-right:](doc:debugging).
* If you qualify for the App Store Small Business Program, check out our guide on [how to apply and inform RevenueCat :fa-arrow-right:](doc:app-store-small-business-program)
---
title: "Quickstart (old)"
slug: "getting-started-old"
excerpt: "Get up and running with mobile subscriptions"
hidden: true
metadata: 
  title: "Quickstart – RevenueCat"
  description: "This guide will walk you through a practical example to get you up and running with subscriptions and the Purchases SDK with only a few lines of code."
  image: 
    0: "https://files.readme.io/02a97df-RevenueCat_Docs_OG.png"
    1: "RevenueCat Docs OG.png"
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: {}
updatedAt: "2022-12-09T20:31:16.384Z"
---
This guide will walk you through how to get up and running with subscriptions and RevenueCat's SDK with only a few lines of code.

# 1. Setting Up Your Account
We recommend using a company account when registering for RevenueCat and setting up your app within a project. You'll be able to invite the rest of your team as [collaborators](doc:collaborators) to your project, but only the project owner can manage billing. Note that there is no mechanism for transferring apps or projects between accounts, but you can change the account owner's email address. If you intend on selling an app, you should create a separate account.

# 2. Create a Project 
Navigate to the RevenueCat dashboard and [add a new project :fa-arrow-right:](https://app.revenuecat.com/overview) from the dropdown in the top navigation menu called *Projects*.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/eb2161b-Screen_Shot_2021-12-01_at_9.48.58_AM.png",
        "Screen Shot 2021-12-01 at 9.48.58 AM.png",
        838,
        610,
        "#e5e7e7"
      ]
    }
  ]
}
[/block]
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

[block:code]
{
  "codes": [
    {
      "code": "// on iOS and tvOS, use `application:didFinishLaunchingWithOptions:`\n// on macOS and watchOS use `applicationDidFinishLaunching:` \n\nfunc application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {\n  \n    Purchases.logLevel = .debug\n    Purchases.configure(\n     with: Configuration.Builder(withAPIKey: Constants.apiKey)\n              .with(appUserID: \"<app_user_id>\")\n              .build()\n     )\n  \n}",
      "language": "swift"
    },
    {
      "code": "// on iOS and tvOS, use `application:didFinishLaunchingWithOptions:`\n// on macOS and watchOS use `applicationDidFinishLaunching:` \n\n- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {\n    // Override point for customization after application launch.\n    \n    RCPurchases.logLevel = RCLogLevelDebug;\n    RCConfigurationBuilder *configuration = [RCConfiguration builderWithAPIKey:@\"public_sdk_key\"];\n    configuration = [configuration withAppUserID:@\"<app_user_id>\"];\n    [RCPurchases configureWithConfiguration:[configuration build]];\n    \n    return YES;\n}",
      "language": "objectivec"
    },
    {
      "code": "// If you're targeting only Google Play Store\nclass MainApplication: Application() {\n    override fun onCreate() {\n        super.onCreate()\n        Purchases.debugLogsEnabled = true\n        Purchases.configure(PurchasesConfiguration.Builder(this, \"public_google_sdk_key\").build())\n    }\n}\n\n// If you're building for the Amazon Appstore, you can use flavors to determine which keys to use\n// In your build.gradle:\nflavorDimensions \"store\"\nproductFlavors {\n    amazon {\n        buildConfigField \"String\", \"STORE\", \"\\\"amazon\\\"\"\n    }\n\n    google {\n        buildConfigField \"String\", \"STORE\", \"\\\"google\\\"\"\n    }       \n}\n\n///...\n\nclass MainApplication: Application() {\n    override fun onCreate() {\n        super.onCreate()\n        Purchases.debugLogsEnabled = true\n          \n        if (BuildConfig.STORE.equals(\"amazon\")) {\n            Purchases.configure(AmazonConfiguration.Builder(this, \"public_amazon_sdk_key\").build())\n        } else if (BuildConfig.STORE.equals(\"google\")) {\n            Purchases.configure(PurchasesConfiguration.Builder(this, \"public_google_sdk_key\").build())\n        }\n    }\n}",
      "language": "kotlin"
    },
    {
      "code": "// If you're targeting only Google Play Store\npublic class MainApplication extends Application {\n    @Override\n    public void onCreate() {\n        super.onCreate();\n        Purchases.setDebugLogsEnabled(true);\n        Purchases.configure(new PurchasesConfiguration.Builder(this, \"public_google_sdk_key\").build());\n    }\n}\n\n// If you're building for the Amazon Appstore, \n// click the Kotlin tab to see how to set up flavors in your build.gradle:\n///...\n\npublic class MainApplication extends Application {\n    @Override\n    public void onCreate() {\n        super.onCreate();\n        Purchases.setDebugLogsEnabled(true);\n      \n        PurchasesConfiguration.Builder builder = null;\n      \n        if (BuildConfig.STORE.equals(\"amazon\")) {\n            builder = new AmazonConfiguration.Builder(this, \"public_amazon_sdk_key\");\n        } else if (BuildConfig.STORE.equals(\"google\")) {\n            builder = new PurchasesConfiguration.Builder(this, \"public_google_sdk_key\");\n        }\n      \n        Purchases.configure(builder.build());\n    }\n}",
      "language": "java"
    },
    {
      "code": "import 'dart:io' show Platform;\n\n//...\n\nFuture<void> initPlatformState() async {\n  await Purchases.setDebugLogsEnabled(true);\n  \n  PurchasesConfiguration configuration;\n  if (Platform.isAndroid) {\n    configuration = PurchasesConfiguration(\"public_google_sdk_key\");\n    if (buildingForAmazon) { \n      // use your preferred way to determine if this build is for Amazon store\n      // checkout our MagicWeather sample for a suggestion\n      configuration = AmazonConfiguration(\"public_amazon_sdk_key\");\n    }\n  } else if (Platform.isIOS) {\n    configuration = PurchasesConfiguration(\"public_ios_sdk_key\");\n  }\n  await Purchases.configure(configuration);\n}",
      "language": "javascript",
      "name": "Flutter"
    },
    {
      "code": "import { Platform } from 'react-native';\n\n//...\n\nexport default class App extends React.Component {\n \n  componentDidMount() {\n    Purchases.setDebugLogsEnabled(true);\n    \n    if (Platform.OS === 'ios') {\n        await Purchases.configure({apiKey: \"public_ios_sdk_key\"});\n    } else if (Platform.OS === 'android') {\n        await Purchases.configure({apiKey: \"public_google_sdk_key\"});\n      \n      // OR: if building for Amazon, be sure to follow the installation instructions then:\n        await Purchases.configure({ apiKey: \"public_amazon_sdk_key\", useAmazon: true });\n    }\n    \n  }\n}",
      "language": "typescript",
      "name": "React Native"
    },
    {
      "code": "document.addEventListener(\"deviceready\", onDeviceReady, false);\n\nfunction onDeviceReady() {\n    Purchases.setDebugLogsEnabled(true);\n    if (window.cordova.platformId === 'ios') {\n        Purchases.configureWith({\n            apiKey: \"public_ios_sdk_key\"\n        });\n    } else if (window.cordova.platformId === 'android') {\n        Purchases.configureWith({\n            apiKey: \"public_google_sdk_key\"\n        });\n    }\n    // OR: if building for Amazon, be sure to follow the installation instructions then:\n    Purchases.configureWith({\n        apiKey: \"public_amazon_sdk_key\",\n        useAmazon: true\n    });\n}",
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
  "body": "If you have a user authentication system in your app, you can provide a user identifier at the time of configuration or at a later date with a call to `.logIn()`. To learn more, check out our guide on [Identifying Users](user-ids)."
}
[/block]
# 8. Displaying Available Products

The SDK will automatically fetch the [configured Offerings](doc:entitlements#offerings) and retrieve the product information from Apple, Google, or Amazon. Thus, available products will already be loaded when customers launch your purchase screen.

Below is an example of fetching Offerings. You can utilize Offerings to organize your paywall screen. See our guide on [Displaying Products](doc:displaying-products) for more information and best practices.
[block:code]
{
  "codes": [
    {
      "code": "Purchases.shared.getOfferings { (offerings, error) in\n\tif let offerings = offerings {\n\t  // Display current offering with offerings.current\n  }\n}",
      "language": "swift"
    },
    {
      "code": "[[RCPurchases sharedPurchases] getOfferingsWithCompletion:^(RCOfferings *offerings, NSError *error) {\n  if (offerings) {\n\t\t// Display current offering with offerings.current\n  } else if (error) {\n    // optional error handling\n  }\n}];",
      "language": "objectivec"
    },
    {
      "code": "Purchases.sharedInstance.getOfferingsWith(\n\tonError = { error ->\n    /* Optional error handling */ \n  },\n  onSuccess = { offerings ->  \n  \t// Display current offering with offerings.current\n\t}\n}",
      "language": "kotlin"
    },
    {
      "code": "Purchases.getSharedInstance().getOfferings(new ReceiveOfferingsCallback() {\n\n     @Override\n     public void onReceived(@NonNull Offerings offerings) {\n     }\n\n     @Override\n     public void onError(@NonNull PurchasesError error) {\n        /* Optional error handling */\n     }\n});",
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
  "html": "<body>\n  <h3> See it in action </h3>\n  <a href=\"https://github.com/RevenueCat/purchases-ios/blob/main/Examples/MagicWeather/MagicWeather/Sources/Controllers/PaywallViewController.swift#L24-L35\" target=\"_blank\" class=\"button-text\">Swift</a>\n  <a href=\"https://github.com/RevenueCat/purchases-android/blob/main/examples/MagicWeather/app/src/main/java/com/revenuecat/sample/ui/paywall/PaywallFragment.kt#L48-L53\" target=\"_blank\" class=\"button-text\">Kotlin</a>\n  <a href=\"https://github.com/RevenueCat/purchases-flutter/blob/main/revenuecat_examples/MagicWeather/lib/src/views/weather.dart#L41-L79\" target=\"_blank\" class=\"button-text\">Flutter</a>\n  <a href=\"https://github.com/RevenueCat/react-native-purchases/blob/main/examples/MagicWeather/src/screens/PaywallScreen/index.js#L24-L33\" target=\"_blank\"  class=\"button-text\">React Native</a>\n</body>"
}
[/block]

If fetching your [Offerings](doc:entitlements#offerings), [products](doc:entitlements#products), or available [packages](doc:entitlements#adding-packages) are empty, it's due to some configuration issue in the respective store. 

The most common reasons for this in App Store Connect are an out-of-date 'Paid Applications Agreement' or products not at least in the 'Ready To Submit' state. In Google Play this usually occurs when the app is not published on a closed track and a valid test user added.

You can find more info about troubleshooting this issue in our [Help Center](https://support.revenuecat.com/hc/en-us/articles/360041793174).

# 9. Make a Purchase

The SDK includes a simple method for facilitating purchases. The `purchase:package` takes a package from the fetched Offering and processes the transaction with the respective app store.

The code sample below shows the process of purchasing a package and confirming it unlocks the "your_entitlement_id" content. More detail about the `purchase:package` method can be found in our guide on [Making Purchases](doc:making-purchases).

[block:code]
{
  "codes": [
    {
      "code": "Purchases.shared.purchase(package: package) { (transaction, customerInfo, error, userCancelled) in\n    if customerInfo?.entitlements.all[\"your_entitlement_id\"]?.isActive == true {\n        // Unlock that great \"pro\" content\n    }\n}",
      "language": "swift"
    },
    {
      "code": "[[RCPurchases sharedPurchases] purchasePackage:package withCompletion:^(RCStoreTransaction *transaction, RCCustomerInfo *customerInfo, NSError *error, BOOL cancelled) {\n    if (customerInfo.entitlements.all[@\"your_entitlement_id\"].isActive) {\n    // User is \"premium\"\n\t}\n}];\n",
      "language": "objectivec"
    },
    {
      "code": "Purchases.sharedInstance.purchasePackageWith(\n  this,\n  package,\n  onError = { error, userCancelled -> /* No purchase */ },\n  onSuccess = { product, customerInfo ->\n    if (customerInfo.entitlements[\"my_entitlement_identifier\"]?.isActive == true) {\n    // Unlock that great \"pro\" content\n  }\n})",
      "language": "kotlin"
    },
    {
      "code": "Purchases.getSharedInstance().purchasePackage(this, packageToPurchase, new PurchaseCallback() {\n    @Override\n    public void onCompleted(@NonNull StoreTransaction storeTransaction, @NonNull CustomerInfo customerInfo) {\n        if (customerInfo.getEntitlements().get(\"my_entitlement_identifier\").isActive()) {\n            // Unlock that great \"pro\" content\n        }\n    }\n\n    @Override\n    public void onError(@NonNull PurchasesError purchasesError, boolean b) {\n        // No purchase\n    }\n});",
      "language": "java"
    },
    {
      "code": "try {\n  CustomerInfo customerInfo = await Purchases.purchasePackage(package);\n  var isPro = customerInfo.entitlements.all[\"my_entitlement_identifier\"].isActive;\n  if (isPro) {\n    // Unlock that great \"pro\" content\n  }\n} on PlatformException catch (e) {\n  var errorCode = PurchasesErrorHelper.getErrorCode(e);\n  if (errorCode != PurchasesErrorCode.purchaseCancelledError) {\n    showError(e);  \t          \n  }\n}",
      "language": "javascript",
      "name": "Flutter"
    },
    {
      "code": "// Using packages\ntry {\n  const purchaseMade = await Purchases.purchasePackage(package);\n  if (typeof purchaseMade.customerInfo.entitlements.active.my_entitlement_identifier !== \"undefined\") {\n    // Unlock that great \"pro\" content\n  }\n} catch (e) {\n  if (!e.userCancelled) {\n  \tshowError(e);\n  }\n}\n\n// Note: if you are using purchaseProduct to purchase Android In-app products, an optional third parameter needs to be provided when calling purchaseProduct. You can use the package system to avoid this\nawait Purchases.purchaseProduct(\"product_id\", null, Purchases.PURCHASE_TYPE.INAPP);\n",
      "language": "javascript",
      "name": "React Native"
    },
    {
      "code": "Purchases.purchasePackage(package, ({ productIdentifier, customerInfo }) => {\n    if (typeof customerInfo.entitlements.active.my_entitlement_identifier !== \"undefined\") {\n      // Unlock that great \"pro\" content\n    }\n  },\n  ({error, userCancelled}) => {\n    // Error making purchase\n  }\n);\n\n// Note: if you are using purchaseProduct to purchase Android In-app products, an optional third parameter needs to be provided when calling purchaseProduct. You can use the package system to avoid this.\n\nPurchases.purchaseProduct(\"product_id\", ({ productIdentifier, customerInfo }) => {\n}, ({error, userCancelled}) => {\n    // Error making purchase\n}, null, Purchases.PURCHASE_TYPE.INAPP);",
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
[block:code]
{
  "codes": [
    {
      "code": "Purchases.shared.getCustomerInfo { (customerInfo, error) in\n    if customerInfo?.entitlements.all[\"your_entitlement_id\"]?.isActive == true {\n        // User is \"premium\"\n    }\n}",
      "language": "swift"
    },
    {
      "code": "[[RCPurchases sharedPurchases] getCustomerInfoWithCompletion:^(RCPurchaserInfo * customerInfo, NSError * error) {\n    if (customerInfo.entitlements.all[@\"your_entitlement_id\"].isActive) {\n    // User is \"premium\"\n\t}\n}];",
      "language": "objectivec"
    },
    {
      "code": "Purchases.sharedInstance.getCustomerInfo({ error -> /* Optional error handling */ }) { customerInfo ->\n  if (customerInfo.entitlements[\"my_entitlement_identifier\"]?.isActive == true) {\n    // Grant user \"pro\" access\n  }\n}",
      "language": "kotlin"
    },
    {
      "code": "Purchases.getSharedInstance().getCustomerInfo(new ReceiveCustomerInfoCallback() {\n    @Override\n    public void onReceived(@NonNull CustomerInfo customerInfo) {\n        if (customerInfo.getEntitlements().get(\"my_entitlement_identifier\").isActive()) {\n            // Grant user \"pro\" access\n        }\n    }\n\n    @Override\n    public void onError(@NonNull PurchasesError purchasesError) {\n    }\n});",
      "language": "java"
    },
    {
      "code": "try {\n  CustomerInfo customerInfo = await Purchases.getCustomerInfo();\n  if (customerInfo.entitlements.all[\"my_entitlement_identifier\"].isActive) {\n    // Grant user \"pro\" access\n  }\n} on PlatformException catch (e) {\n  // Error fetching purchaser info\n}",
      "language": "javascript",
      "name": "Flutter"
    },
    {
      "code": "try {\n  const customerInfo = await Purchases.getCustomerInfo();\n  if(typeof customerInfo.entitlements.active.my_entitlement_identifier !== \"undefined\") {\n    // Grant user \"pro\" access\n  }\n} catch (e) {\n // Error fetching purchaser info\n}",
      "language": "javascript",
      "name": "React Native"
    },
    {
      "code": "Purchases.getCustomerInfo(\n  info => {\n    const isPro = typeof customerInfo.entitlements.active.my_entitlement_identifier !== \"undefined\";\n  },\n  error => {\n    // Error fetching customer info\n  }\n);",
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
[block:code]
{
  "codes": [
    {
      "code": "Purchases.shared.restorePurchases { (customerInfo, error) in\n    //... check customerInfo to see if entitlement is now active\n}",
      "language": "swift"
    },
    {
      "code": "[[RCPurchases sharedPurchases] restorePurchasesWithCompletion:^(RCCustomerInfo *customerInfo, NSError *error) {\n    //... check customerInfo to see if entitlement is now active\n}];",
      "language": "objectivec"
    },
    {
      "code": "Purchases.sharedInstance.restorePurchasesWith(::showError) { customerInfo ->\n    //... check customerInfo to see if entitlement is now active\n}",
      "language": "kotlin"
    },
    {
      "code": "Purchases.getSharedInstance().restorePurchases(new ReceiveCustomerInfoCallback() {\n    @Override\n    public void onReceived(@NonNull CustomerInfo customerInfo) {\n        //... check purchaserInfo to see if entitlement is now active \t\n    }\n\n    @Override\n    public void onError(@NonNull PurchasesError purchasesError) {\n\n    }\n});",
      "language": "java"
    },
    {
      "code": "try {\n  CustomerInfo restoredInfo = await Purchases.restoreTransactions();\n  // ... check restored customerInfo to see if entitlement is now active\n} on PlatformException catch (e) {\n  // Error restoring purchases\n}",
      "language": "javascript",
      "name": "Flutter"
    },
    {
      "code": "try {\n  const restore = await Purchases.restorePurchases();\n  // ... check restored customerInfo to see if entitlement is now active\n} catch (e) {\n\n}",
      "language": "javascript",
      "name": "React Native"
    },
    {
      "code": "Purchases.restorePurchases(\n  info => {\n    //... check customerInfo to see if entitlement is now active\n  },\n  error => {\n    // Error restoring purchases\n  }\n);",
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
  "html": "<body>\n  <h3> See it in action </h3>\n  <a href=\"https://github.com/RevenueCat/purchases-ios/blob/main/Examples/MagicWeather/MagicWeather/Sources/Controllers/UserViewController.swift#L107-L123\" target=\"_blank\" class=\"button-text\">Swift</a>\n  <a href=\"https://github.com/RevenueCat/purchases-android/blob/main/examples/MagicWeather/app/src/main/java/com/revenuecat/sample/ui/user/UserFragment.kt#L78-L85\" target=\"_blank\" class=\"button-text\">Kotlin</a>\n  <a href=\"https://github.com/RevenueCat/purchases-flutter/blob/main/revenuecat_examples/MagicWeather/lib/src/views/user.dart#L29-L55\" target=\"_blank\" class=\"button-text\">Flutter</a>\n  <a href=\"https://github.com/RevenueCat/react-native-purchases/blob/main/examples/MagicWeather/src/components/RestorePurchasesButton/index.js#L11-L18\" target=\"_blank\"  class=\"button-text\">React Native</a>\n</body>\n"
}
[/block]
If two different [App User IDs](doc:user-ids) restore transactions from the same underlying store account (Apple, Google, or Amazon account) RevenueCat may attempt to create an alias between the two App User IDs and count them as the same user going forward. See our guide on [Restoring Purchases](doc:restoring-purchases) for more information on the different configurable restore behaviors.


# (optional) Listening For CustomerInfo Updates

Since the SDK works seamlessly on any platform, changes to a user's purchase info may come from a variety of sources. You can respond to any changes in a customer's <<glossary:CustomerInfo>> by conforming to an optional delegate method, `purchases:receivedUpdated:`. This will fire whenever the SDK receives an updated customer info object from calls to `getCustomerInfo()`, `purchase(package:)`, `purchase(product:)`, or `restorePurchases()`. 

<<glossary:CustomerInfo>> updates are *not* pushed to your app from the RevenueCat backend, updates can only happen from an outbound network request to RevenueCat.

Depending on your app, it may be sufficient to ignore the delegate and simply handle changes to customer information the next time your app is launched or in the completion blocks of the SDK methods.
[block:code]
{
  "codes": [
    {
      "code": "// Additional configure setup\n// on iOS and tvOS, use `application:didFinishLaunchingWithOptions:`\n// on macOS and watchOS use `applicationDidFinishLaunching:` \n\nfunc application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {\n  \n    Purchases.logLevel = .debug\n    Purchases.configure(withAPIKey: \"public_sdk_key\")\n    Purchases.shared.delegate = self // make sure to set this after calling configure\n    \n    return true\n}\n\nextension AppDelegate: PurchasesDelegate {\n    func purchases(_ purchases: Purchases, receivedUpdated customerInfo: CustomerInfo) {\n        /// - handle any changes to the user's CustomerInfo\n    }\n}",
      "language": "swift"
    },
    {
      "code": "// Additional configure setup\n// on iOS and tvOS, use `application:didFinishLaunchingWithOptions:`\n// on macOS and watchOS use `applicationDidFinishLaunching:`\n\n- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {\n    // Override point for customization after application launch.\n    RCPurchases.logLevel = RCLogLevelDebug;\n    [RCPurchases configureWithAPIKey:@\"public_sdk_key\"];\n    RCPurchases.sharedPurchases.delegate = self;\n\n    return YES;\n}\n\n- (void)purchases:(nonnull RCPurchases *)purchases receivedUpdatedCustomerInfo:(nonnull RCCustomerInfo *)customerInfo {\n    // handle any changes to purchaserInfo\n}",
      "language": "objectivec"
    },
    {
      "code": "class UpsellActivity : AppCompatActivity(), UpdatedCustomerInfoListener {\n\t\toverride fun onReceived(customerInfo: CustomerInfo) {\n        // handle any changes to purchaserInfo\n    }\n}",
      "language": "kotlin"
    },
    {
      "code": "public class UpsellActivity extends AppCompatActivity implements UpdatedCustomerInfoListener {\n\t\t@Override\n    public void onReceived(CustomerInfo customerInfo) {\n        // handle any changes to customerInfo\n    }\n}",
      "language": "java"
    },
    {
      "code": "Purchases.addPurchaserInfoUpdateListener((purchaserInfo) => {\n  // handle any changes to purchaserInfo\n});",
      "language": "javascript",
      "name": "Flutter"
    },
    {
      "code": "Purchases.addCustomerInfoUpdateListener(info => {\n\t// handle any changes to purchaserInfo\n});",
      "language": "javascript",
      "name": "React Native"
    },
    {
      "code": "// subscribe to the window event onCustomerInfoUpdated to get any changes that happen in the customerInfo\nwindow.addEventListener(\"onCustomerInfoUpdated\", onCustomerInfoUpdated, false);\n\n//...\n\nonCustomerInfoUpdated: function(info) {\n    // handle any changes to customerInfo\n}",
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
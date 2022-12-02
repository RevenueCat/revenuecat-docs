---
title: "Quickstart"
slug: "getting-started"
excerpt: "Get up and running with mobile subscriptions"
hidden: false
metadata: 
  title: "Quickstart | RevenueCat"
  description: "This guide will walk you through a practical example to get you up and running with subscriptions and the Purchases SDK with only a few lines of code."
  image: 
    0: "https://files.readme.io/09fdba1-Reddit__E.jpg"
    1: "Reddit – E.jpg"
    2: 1200
    3: 630
    4: "#fbabaf"
createdAt: {}
updatedAt: "2020-09-15T21:39:53.015Z"
---
This guide will walk you through how to get up and running with subscriptions and the Purchases SDK with only a few lines of code.
[block:api-header]
{
  "title": "Register Your App"
}
[/block]
Navigate to the RevenueCat dashboard and [add a new app :fa-arrow-right:](https://app.revenuecat.com/apps/add) from the dropdown.
[block:callout]
{
  "type": "info",
  "body": "A single app in RevenueCat supports all platforms.",
  "title": "One app for all platforms"
}
[/block]

[block:api-header]
{
  "title": "Configure Your Products"
}
[/block]
Once your in-app products have been configured in [App Store Connect](doc:ios-products)  and the [Google Play Console](doc:android-products), RevenueCat provides a couple of features for unlocking access and displaying products: Entitlements and Offerings.

Entitlements are the level of access that a user is "entitled" to after purchasing a specific product, and Offerings is a simple way for you to organize your in-app products and configure them remotely. Together, these two features simplify your code and enable you to change products without an app update.

See [Configuring Products](doc:entitlements) for how to configure and leverage Entitlements and Offerings.

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

[block:api-header]
{
  "title": "Install the Purchases SDK"
}
[/block]
*Purchases* is the RevenueCat SDK that seamlessly implements purchases and subscriptions across platforms while syncing tokens with the RevenueCat server.

* [iOS Installation :fa-arrow-right:](doc:ios) 
* [Android Installation :fa-arrow-right:](doc:android)
* [React Native Installation :fa-arrow-right:](doc:reactnative) 
* [Flutter Installation :fa-arrow-right:](doc:flutter)
* [Cordova Installation :fa-arrow-right:](doc:cordova) 
* [Ionic Installation :fa-arrow-right:](doc:ionic)
* [Unity Installation :fa-arrow-right:](doc:unity) 
* [macOS / Catalyst Installation :fa-arrow-right:](doc:macos)
[block:api-header]
{
  "title": "Configure Purchases"
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "You can get your public SDK key from the app settings in the [dashboard](https://app.revenuecat.com/apps/).",
  "title": "Use your public SDK key to configure Purchases"
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

If you're planning to use RevenueCat alongside your existing purchase code, check out our guide on [Observer Mode](doc:observer-mode).
[block:callout]
{
  "type": "info",
  "title": "Configuring Purchases with User IDs",
  "body": "If you have a user authentication system in your app, you can provide a user identifier to Purchases at the time of configuration or at a later date with a call to identify. To learn more, check out our guide on [Identifying Users](user-ids)."
}
[/block]

[block:api-header]
{
  "title": "Displaying Available Products"
}
[/block]
*Purchases* will automatically fetch the [configured Offerings](doc:entitlements) and retrieve the product information from Apple or Google. This means when users launch your purchase screen, available products will already be loaded.

Below is an example of fetching entitlements and launching a paywall screen. See our guide on [Displaying Products](doc:displaying-products) for more information and best practices.

[block:code]
{
  "codes": [
    {
      "code": "Purchases.shared.offerings { (offerings, error) in\n\tif let offerings = offerings {\n\t  showPaywall(offerings.current)\n  }\n}",
      "language": "swift"
    },
    {
      "code": "[[RCPurchases sharedPurchases] offeringsWithCompletionBlock:^(RCOfferings *offerings, NSError *error) {\n  if (offerings) {\n\t\t[self showPaywallWithOffering:offerings.current];\n  } else if (error) {\n    // optional error handling\n  }\n}];",
      "language": "objectivec"
    },
    {
      "code": "Purchases.sharedInstance.getOfferingsWith(\n\tonError = { error ->\n    /* Optional error handling */ \n  },\n  onSuccess = { offerings ->  \n  \tshowPaywall(offerings.current)\n\t}\n}",
      "language": "kotlin"
    },
    {
      "code": "Purchases.getSharedInstance().getOfferings(new ReceiveOfferingsListener() {\n    @Override\n    public void onReceived(@Nullable Map<String, Entitlement> offerings) {\n        showPaywall(offerings.current);\n    }\n  \n\t  @Override\n    public void onError(@NonNull PurchasesError error) {\n        /* Optional error handling */ \n    }\n});",
      "language": "java"
    },
    {
      "code": "try {\n  Offerings offerings = await Purchases.getOfferings();\n  if (offerings.current != null) {\n    showPaywall(offerings.current);\n  }\n} on PlatformException catch (e) {\n\t// optional error handling\n}",
      "language": "javascript",
      "name": "Flutter"
    },
    {
      "code": "try {\n  const offerings = await Purchases.getOfferings();\n  if (offerings.current !== null) {  \n\t  showPaywall(offerings.current);\n  }\n} catch (e) {\n\n}",
      "language": "javascript",
      "name": "React Native"
    },
    {
      "code": "func displayUpsellScreen() {\n  Purchases.getOfferings(\n      offerings => {\n        if (offerings.current !== null) {  \n          showPaywall(offerings.current);\n        }\n      },\n      error => {\n\n      }\n  );\n}",
      "language": "javascript",
      "name": "Cordova"
    },
    {
      "code": "var purchases = GetComponent<Purchases>();\npurchases.GetOfferings((offerings, error) =>\n{\n  if (error != null) {\n    LogError(error);\n  } else if (offerings.Current != null {\n    showPaywall(offerings.Current);\n  }\n});",
      "language": "csharp",
      "name": "Unity"
    }
  ]
}
[/block]
If your Offerings, products, or available packages are empty, it's due to some configuration issue in App Store Connect or the Play Console. 

The most common reasons for this in App Store Connect are an out-of-date 'Paid Applications Agreement' or products not at least in the 'Ready To Submit' state. On Android this usually occurs when the app is not published on a closed track and a valid test user added.

You can find more info about trouble shooting this issue in our [Help Center](https://support.revenuecat.com/hc/en-us/articles/360041793174).
[block:callout]
{
  "type": "info",
  "body": "Since the SDK pre-fetches the available products, in most cases the completion block won't need to make a network request to get offerings. This creates a seamless onboarding experience that results in less drop-off, happier users, and more revenue for you.",
  "title": ""
}
[/block]

[block:api-header]
{
  "title": "Make a Purchase"
}
[/block]
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
      "code": "Purchases.getSharedInstance()purchasePackage(\n    this,\n    package,\n    new MakePurchaseListener() {\n        @Override\n        public void onCompleted(@NonNull Purchase purchase, @NonNull PurchaserInfo purchaserInfo) {\n            if (purchaserInfo.getEntitlements().get(\"my_entitlement_identifier\").isActive()) {\n              // Unlock that great \"pro\" content\n            }\n        }\n\n        @Override\n        public void onError(@NonNull PurchasesError error, Boolean userCancelled) {\n          // No purchase\n        }\n    }\n);",
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
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "`purchasePackage` handles the underlying framework interaction and automatically validates purchases with Apple or Google through our secure servers. This helps reduce in-app purchase fraud and decreases the complexity of your app. Receipt tokens are stored remotely and always kept up to date by RevenueCat. Note: that a physical device and [sandbox account](doc:sandbox) are required for testing purchases."
}
[/block]

[block:api-header]
{
  "title": "Get Subscription Status"
}
[/block]
*Purchases* makes it easy to check what active subscriptions the current user has. This can be done by checking if a specific entitlement is active, or by checking if the active entitlements contains a specific entitlement ID.
If you're not using entitlements (you should be!) you can check the array of active subscriptions to see what product IDs from iTunes Connect or Google Play Store it contains.

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
    }
  ]
}
[/block]

You can use this method whenever you need to get the latest status, and it's safe to call this repeatedly throughout the lifecycle of your app. Purchases automatically caches the latest `purchaserInfo` whenever it updates — so in most cases, this method pulls from the cache and runs very fast.

It's typical to call this method when deciding which UI to show the user and whenever the user performs an action that requires a certain entitlement level.
[block:callout]
{
  "type": "info",
  "body": "You can access a lot more information about a subscription than simply whether it's active or not. See our guide on [Subscription Status](doc:purchaserinfo) to learn if subscription is set to renew, if there's an issue detected with the user's credit card, and more."
}
[/block]

[block:api-header]
{
  "title": "Restoring Purchases"
}
[/block]
RevenueCat enables your users to restore their in-app purchases, reactivating any content that they previously purchased from the **same store account** (Apple or Google).

If two different [App User IDs](doc:user-ids) try to restore transactions from the same underlying store account (Apple or Google), RevenueCat will create an alias between the two App User IDs and count them as the same user going forward.

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

[block:api-header]
{
  "title": "Listening For Purchaser Info Updates"
}
[/block]
Since the *Purchases* SDK works seamlessly on any platform, changes to a user's purchase info may come from a variety of sources. You can respond to any changes in a user’s purchaser info by conforming to an optional delegate method, `didReceivePurchaserInfo:`. This will fire whenever we receive a change in purchaser info — you should expect it to be called at launch and throughout the life of the app.

Depending on your app, it may be sufficient to ignore the delegate and simply handle changes to purchaser information the next time your app is launched.

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

[block:callout]
{
  "type": "success",
  "title": "You did it!",
  "body": "You have now implemented a fully-featured subscription purchasing system without spending a month writing server code. Congrats!"
}
[/block]

[block:api-header]
{
  "title": "Sample Apps"
}
[/block]
To download more examples of integrating the Purchases SDK, head over to our sample app resources.

**[View Samples :fa-arrow-right:](doc:sample-apps)**
[block:api-header]
{
  "title": "Next Steps"
}
[/block]
* If you haven't already, make sure your products are configured correctly by checking out our [guide on entitlements :fa-arrow-right:](doc:entitlements).
* If you want to use your own user identifiers, read about [setting app user ids :fa-arrow-right:](doc:user-ids).
* If you're moving to RevenueCat from another system, see our guide on [migrating your existing subscriptions :fa-arrow-right:](doc:migrating-existing-subscriptions).
* Once you're ready to test your integration, you can follow our guides on [testing and debugging :fa-arrow-right:](doc:debugging).
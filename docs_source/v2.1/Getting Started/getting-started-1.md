---
title: "Quickstart"
slug: "getting-started-1"
excerpt: "Get up and running with mobile subscriptions"
hidden: false
createdAt: "2018-06-10T21:50:09.383Z"
updatedAt: "2019-05-03T17:13:49.647Z"
---
This guide will walk you through a practical example to get you up and running with subscriptions and the Purchases SDK with only a few lines of code.
[block:api-header]
{
  "title": "Register your app in RevenueCat"
}
[/block]
Navigate to the the RevenueCat [dashboard](https://app.revenuecat.com/apps/add) and add a new app from the dropdown.
[block:callout]
{
  "type": "info",
  "body": "A single app in RevenueCat supports all platforms.",
  "title": "One app for all platforms"
}
[/block]

[block:api-header]
{
  "title": "Setup your Entitlements"
}
[/block]
Entitlements are a simple way for you to organize your in-app products and configure them remotely. This simplifies the client side code and enables you to change products without an app update.

See [Understanding Entitlements](doc:entitlements) for how to configure and leverage entitlements.
[block:callout]
{
  "type": "info",
  "title": "Configure Products First",
  "body": "Before configuring entitlements, you should setup your in-app products in either [App Store Connect](doc:itunesconnect-app-specific-shared-secret) or [Play Developer Console](doc:creating-play-service-credentials)."
}
[/block]
A common and simple setup example is one entitlement with identifier *pro*, one offering *monthly*, with one product. 
[block:api-header]
{
  "title": "Install the Purchases SDK"
}
[/block]
*Purchases* is our SDK that correctly implements purchases and subscriptions across platforms while syncing tokens with the RevenueCat server.

* [iOS Installation :fa-arrow-right:](doc:ios) 
* [Android Installation :fa-arrow-right:](doc:android) 
* [React Native Installation :fa-arrow-right:](doc:reactnative) 
* [Cordova Installation :fa-arrow-right:](doc:cordova) 
* [Unity Installation :fa-arrow-right:](doc:unity) 
* [macOS Installation :fa-arrow-right:](doc:macos)
[block:api-header]
{
  "title": "Configure Purchases"
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "You can get your API key from app settings in the [dashboard](https://app.revenuecat.com/apps/)."
}
[/block]
You should only configure *Purchases* once (usually on app launch) as soon as your app has a unique user id for your user. This can be when a user logs in if you have accounts or on launch if you can generate a random user identifier. The same instance is shared throughout your app by accessing the `.shared` instance in the SDK.
[block:code]
{
  "codes": [
    {
      "code": "func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {\n    \n    Purchases.debugLogsEnabled = true\n    Purchases.configure(withAPIKey: \"my_api_key\", appUserID: \"my_app_user_id\")\n}",
      "language": "swift"
    },
    {
      "code": "- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {\n\t\t// Override point for customization after application launch.\n    \n  \tRCPurchases.debugLogsEnabled = YES;\n  \t[RCPurchases configureWithAPIKey:@\"my_api_key\" appUserID:@\"my_app_user_id\"];\n    \n  \treturn YES;\n}\n",
      "language": "objectivec"
    },
    {
      "code": "class MainApplication: Application() {\n\n    override fun onCreate() {\n        super.onCreate()\n        Purchases.debugLogsEnabled = true\n        Purchases.configure(this, \"my_api_key\", \"my_app_user_id\")\n    }\n\n}",
      "language": "kotlin"
    },
    {
      "code": "\npublic class MainApplication extends Application {\n\n    @Override\n    public void onCreate() {\n        super.onCreate();\n        Purchases.setDebugLogsEnabled(true);\n        Purchases.configure(this, \"my_api_key\", \"my_app_user_id\");\n    }\n\n}\n",
      "language": "java"
    },
    {
      "code": "export default class App extends React.Component {\n  componentWillMount() {\n    Purchases.setDebugLogsEnabled(true);\n    Purchases.setup(\"my_api_key\", \"my_app_user_id\");\n  }\n}",
      "language": "javascript",
      "name": "React Native"
    },
    {
      "code": "constructor(public platform: Platform) {\n  platform.ready().then(() => {\n    Purchases.setDebugLogsEnabled(true);\n    Purchases.setup(\n      \"my_api_key\",\n      \"my_app_user_id\"\n    );\n  });\n}",
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
  "title": "Usage without User IDs",
  "body": "If your app doesn't have user IDs, you can use `.configure(withAPIKey:)` or pass `nil` for the `appUserID`. We will generate a random User ID for you."
}
[/block]

[block:api-header]
{
  "title": "Displaying Available Products"
}
[/block]
*Purchases* will automatically fetch the latest *active* entitlements and get the product information from Apple or Google. This means when users launch your purchase screen, products will already be loaded.

Below is an example of fetching entitlements and launching an upsell screen.
[block:code]
{
  "codes": [
    {
      "code": "func displayUpsellScreen() {\n    Purchases.shared.entitlements { (entitlements, error) in\n        let vc = UpsellController()\n        vc.entitlements = entitlements\n        presentViewController(vc, animated: true, completion: nil)\n    }\n}",
      "language": "swift"
    },
    {
      "code": "[[RCPurchases sharedPurchases] entitlementsWithCompletionBlock:^(RCEntitlements *entitlements, NSError *error) {\n  UpsellViewController *vc = [[UpsellViewController alloc] init];\n  vc.entitlements = entitlements;\n  [self presentViewController:vc animated:YES completion:nil];\n}];",
      "language": "objectivec"
    },
    {
      "code": "Purchases.sharedInstance.getEntitlements(ReceiveEntitlementsListener { entitlements, error ->\n    showUpsellScreen(entitlements)\n})\n  \n// or\n  \nPurchases.sharedInstance.getEntitlementsWith(onError = { /* Optional error handling */ }) { entitlementMap ->  \n\n}",
      "language": "kotlin"
    },
    {
      "code": "Purchases.getSharedInstance().getEntitlements(new ReceiveEntitlementsListener() {\n            @Override\n    public void onReceived(@Nullable Map<String, Entitlement> entitlements, @Nullable PurchasesError error) {\n        showScreen(entitlements);\n    }\n});",
      "language": "java"
    },
    {
      "code": "try {\n  const entitlements = await Purchases.getEntitlements();\n  showUpsellScreen(entitlements);\n} catch (e) {\n\n}\n",
      "language": "javascript",
      "name": "React Native"
    },
    {
      "code": "func displayUpsellScreen() {\n  Purchases.getEntitlements(\n      entitlements => {\n\n      },\n      error => {\n\n      }\n  );\n}",
      "language": "javascript",
      "name": "Cordova"
    },
    {
      "code": "var purchases = GetComponent<Purchases>();\npurchases.GetProducts(new []{ \"onemonth_freetrial\", \"annual_freetrial\" }, (products, error) =>\n{\n    if (error != null) {\n        LogError(error);\n    }\n});",
      "language": "csharp",
      "name": "Unity"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "Since the SDK pre-fetches the available products, the completion block to get entitlements won't need to make a network request in most cases. This creates a seamless onboarding experience that results in less drop-off, happier users, and more revenue for you.",
  "title": ""
}
[/block]

[block:callout]
{
  "type": "info",
  "title": "Active products are nil",
  "body": "If your active products are returning nil, make sure they're configured correctly in the Play Store or App Store Connect."
}
[/block]

[block:api-header]
{
  "title": "Make a Purchase"
}
[/block]
When it comes time to make a purchase, *Purchases* has a simple method, `makePurchase`. The code sample below shows the process of purchasing a product and confirming it unlocks the "my_entitlement_identifier" content.
[block:code]
{
  "codes": [
    {
      "code": "Purchases.shared.makePurchase(product, { (transaction, purchaserInfo, error, cancelled) in\n    if let purchaserInfo = purchaserInfo {\n    \n        if purchaserInfo.activeEntitlements.contains(\"my_entitlement_identifier\") {\n            // Unlock that great \"pro\" content\n        }\n        \n    }\n})\n",
      "language": "swift"
    },
    {
      "code": "[[RCPurchases sharedPurchases] makePurchase:product withCompletionBlock:^(SKPaymentTransaction *transaction, RCPurchaserInfo *purchaserInfo, NSError *error, BOOL cancelled) {\n    if ([purchaserInfo.activeEntitlements containsObject:@\"my_entitlement_identifier\"]) {\n        // Unlock that great \"pro\" content\n    }\n}];\n",
      "language": "objectivec"
    },
    {
      "code": "Purchases.sharedInstance.makePurchaseWith(\n    this,\n    product.sku,\n    BillingClient.SkuType.SUBS,\n    { error, userCancelled ->\n        // No purchase\n    }) { product, purchaserInfo ->\n        \n        if (purchaserInfo.activeEntitlements.contains(\"my_entitlement_identifier\")) {\n            // Unlock that great \"pro\" content\n        }\n    }",
      "language": "kotlin"
    },
    {
      "code": "Purchases.getSharedInstance().makePurchase(\n    this,\n    product.getSku(),\n    BillingClient.SkuType.SUBS,\n    new MakePurchaseListener() {\n        @Override\n        public void onCompleted(@NonNull Purchase purchase, @NonNull PurchaserInfo purchaserInfo) {\n            if (purchaserInfo.getActiveEntitlements().contains(\"my_entitlement_identifier\")) {\n                // Unlock that great \"pro\" content\n            }\n        }\n\n        @Override\n        public void onError(@NonNull PurchasesError error, Boolean userCancelled) {\n          // No purchase\n        }\n    }\n);",
      "language": "java"
    },
    {
      "code": "try {\n\tconst purchaseMade = await Purchases.makePurchase(\"product_id\");\n  if (purchaseMade.purchaserInfo.activeEntitlements !== \"undefined\" &&\n      purchaseMade.purchaserInfo.activeEntitlements.includes(\"my_entitlement_identifier\")) {\n    // Unlock that great \"pro\" content\n  }\n} catch (e) {\n\tshowError(e);\n}\n\n\n",
      "language": "javascript",
      "name": "React Native"
    },
    {
      "code": "Purchases.makePurchase(\"product_id\", \n  (productIdentifier, purchaserInfo) {\n    if (purchaserInfo.activeEntitlements.includes(\"my_entitlement_identifier\")) {\n      // Unlock that great \"pro\" content\n    }\n  },\n  error => {\n    // Error making purchase\n  }\n})\n",
      "language": "javascript",
      "name": "Cordova"
    },
    {
      "code": "Purchases purchases = GetComponent<Purchases>();\npurchases.MakePurchase(product, (productIdentifier, purchaserInfo, userCancelled, error) =>\n{\n    foreach(string sub in info.ActiveSubscriptions)\n    {\n        if (item.Contains(\"my_product_identifier\")) {\n           // Unlock that great \"pro\" content\n        }\n    }\n});",
      "language": "csharp",
      "name": "Unity"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "`makePurchase` handles the underlying framework interaction and automatically validates purchases with Apple or Google through our secure servers. This helps reduce in-app purchase fraud and decreases the complexity of your app. Receipt tokens are stored remotely and always kept up-to-date by RevenueCat. Note that a physical device and [sandbox account](doc:sandbox) are required for testing purchases."
}
[/block]

[block:api-header]
{
  "title": "Get Subscription Status"
}
[/block]
*Purchases* makes it easy to check what active subscriptions the current user has. This can be done two ways within the `.purchaserInfo` method:
* Checking active Entitlements - this lets you see what entitlements (from RevenueCat dashboard) are active for the user.
* Checking the active subscriptions - this lets you see what product ids (from iTunes Connect or Play Store) are active for the user.

You can use this method whenever you need to get the latest status, and it's safe to call this repeatedly throughout the lifecycle of your app. *Purchases* automatically caches the latest `purchaserInfo` whenever it updates so in most cases this method is pulling from the cache and is run very fast. 

It's typical to call this method when deciding which UI to show the user and when the user performs and action that requires a certain entitlement level.   
[block:code]
{
  "codes": [
    {
      "code": "Purchases.shared.purchaserInfo { (purchaserInfo, error) in\n    if let purchaserInfo = purchaserInfo {\n\n        // Option 1: Check if user has access to entitlement (from RevenueCat dashboard)\n        if purchaserInfo.activeEntitlements.contains(\"my_entitlement_identifier\") {\n            // Grant user \"pro\" access\n        }\n\n        // Option 2: Check if user has active subscription (from App Store Connect or Play Store)\n        if purchaserInfo.activeSubscriptions.contains(\"my_product_identifier\") {\n            // Grant user \"pro\" access\n        }\n    }\n}",
      "language": "swift"
    },
    {
      "code": "[[RCPurchases sharedPurchases] purchaserInfoWithCompletionBlock:^(RCPurchaserInfo * purchaserInfo, NSError * error) {\n        \n    // Option 1: Check if user has access to entitlement (from RevenueCat dashboard)\n    if ([purchaserInfo.activeEntitlements containsObject:@\"my_entitlement_identifier\"]) {\n        // Grant user \"pro\" access\n    }\n\n    // Option 2: Check if user has active subscription (from App Store Connect or Play Store)\n    if ([purchaserInfo.activeSubscriptions containsObject:@\"my_product_identifier\"]) {\n        // Grant user \"pro\" access\n    }\n}];",
      "language": "objectivec"
    },
    {
      "code": "Purchases.sharedInstance.getPurchaserInfo(ReceivePurchaserInfoListener { purchaserInfo, error ->\n    if purchaserInfo?.let {\n        // Option 1: Check if user has access to entitlement (from RevenueCat dashboard)\n        if (it.activeEntitlements.contains(\"my_entitlement_identifier\")) {\n            // Grant user \"pro\" access\n        }\n\n        // Option 2: Check if user has active subscription (from App Store Connect or Play Store)\n        if (it.activeSubscriptions.contains(\"my_product_identifier\")) {\n            // Grant user \"pro\" access\n        }\n    }\n})\n  \n// or\n\nPurchases.sharedInstance.getPurchaserInfoWith({ error -> /* Optional error handling */ }) { purchaserInfo ->\n       // Option 1: Check if user has access to entitlement (from RevenueCat dashboard)\n        if (it.activeEntitlements.contains(\"my_entitlement_identifier\")) {\n            // Grant user \"pro\" access\n        }\n\n        // Option 2: Check if user has active subscription (from App Store Connect or Play Store)\n        if (it.activeSubscriptions.contains(\"my_product_identifier\")) {\n            // Grant user \"pro\" access\n        }         \n}",
      "language": "kotlin"
    },
    {
      "code": "Purchases.getSharedInstance().getPurchaserInfo(new ReceivePurchaserInfoListener() {\n    @Override\n    public void onReceived(@android.support.annotation.Nullable PurchaserInfo purchaserInfo, @android.support.annotation.Nullable PurchasesError error) {\n        if (purchaserInfo != null) {\n            // Option 1: Check if user has access to entitlement (from RevenueCat dashboard)\n            if (purchaserInfo.getActiveEntitlements().contains(\"my_entitlement_identifier\")) {\n                // Grant user \"pro\" access\n            }\n\n            // Option 2: Check if user has active subscription (from App Store Connect or Play Store)\n            if (purchaserInfo.getActiveSubscriptions().contains(\"my_product_identifier\")) {\n                // Grant user \"pro\" access\n            }\n        }\n    }\n});",
      "language": "java"
    },
    {
      "code": "try {\n  const purchaserInfo = await Purchases.getPurchaserInfo();\n\t// Option 1: Check if user has access to entitlement (from RevenueCat dashboard)\n  if(purchaserInfo.activeEntitlements !== \"undefined\" && purchaserInfo.activeEntitlements.includes(\"my_entitlement_identifier\")) {\n    // Grant user \"pro\" access\n  }\n  // Option 2: Check if user has active subscription (from App Store Connect or Play Store)\n  if (purchaserInfo.activeSubscriptions !== \"undefined\" && purchaserInfo.activeSubscriptions.includes(\"my_product_identifier\")) {\n    // Grant user \"pro\" access\n  }\n} catch (e) {\n // Error fetching purchaser info\n}",
      "language": "javascript",
      "name": "React Native"
    },
    {
      "code": "Purchases.getPurchaserInfo(\n  info => {\n    // Option 1: Check if user has access to entitlement (from RevenueCat dashboard)\n    const isPro =\n      info.activeEntitlements !== \"undefined\" &&\n      info.activeEntitlements.includes(\"pro\");\n\n    // Option 2: Check if user has active subscription (from App Store Connect or Play Store)\n    const isPro =\n      info.activeSubscriptions !== \"undefined\" &&\n      info.activeSubscriptions.includes(\"my_product_identifier\");\n  },\n  error => {\n    // Error fetching purchaser info\n  }\n);",
      "language": "javascript",
      "name": "Cordova"
    },
    {
      "code": "var purchases = GetComponent<Purchases>();\npurchases.GetPurchaserInfo((info, error) =>\n{\n    foreach(string sub in info.ActiveSubscriptions)\n    {\n        if (item.Contains(\"my_product_identifier\")) {\n           // User has \"pro\" access\n        }\n    }\n});",
      "language": "csharp",
      "name": "Unity"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "Since the SDK updates and caches the latest PurchaserInfo when the app becomes active, the completion block in .purchaserInfo won't need to make a network request in most cases."
}
[/block]

[block:api-header]
{
  "title": "Listening For Purchaser Info Updates"
}
[/block]
Since *Purchases* SDK works seamlessly on any platform, a user's purchase info may change from a variety of sources. You can respond to any changes in purchaser info by conforming to an optional delegate method, `didReceivePurchaserInfo:`. This will fire whenever we receive a *change* in purchaser info and you should expect it to be called at launch and throughout the life of the app.

Depending on your app, it may be sufficient to ignore the delegate and simply handle changes to purchaser information the next time your app is launched.
[block:code]
{
  "codes": [
    {
      "code": "func purchases(_ purchases: Purchases, didReceiveUpdated purchaserInfo: PurchaserInfo) {\n    // handle any changes to purchaserInfo\n}",
      "language": "swift"
    },
    {
      "code": "- (void)purchases:(nonnull RCPurchases *)purchases didReceiveUpdatedPurchaserInfo:(nonnull RCPurchaserInfo *)purchaserInfo {\n    // handle any changes to purchaserInfo\n}",
      "language": "objectivec"
    },
    {
      "code": "class UpsellActivity : AppCompatActivity(), UpdatedPurchaserInfoListener {\n\t\toverride fun onReceived(purchaserInfo: PurchaserInfo?) {\n        // handle any changes to purchaserInfo\n    }\n}",
      "language": "kotlin"
    },
    {
      "code": "public class UpsellActivity extends AppCompatActivity implements UpdatedPurchaserInfoListener {\n\t\t@Override\n    public void onReceived(PurchaserInfo purchaserInfo) {\n        // handle any changes to purchaserInfo\n    }\n}",
      "language": "java"
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
  "title": "You've done it!",
  "body": "That's all there is to it! You have now implemented a fully featured subscription purchasing system without spending a month writing server code. Congrats!"
}
[/block]

[block:api-header]
{
  "title": "Sample Apps"
}
[/block]
To download complete examples of integrating the Purchases SDK - head over to our to our sample app resources. 

**[View Samples :fa-arrow-right:](doc:sample-apps)**
[block:api-header]
{
  "title": "Next Steps"
}
[/block]
* If you haven't already, make sure your products are configured correctly by checking out our [guide on entitlements :fa-arrow-right:](doc:entitlements)
* If you want to use your own user identifiers, read about [setting app user ids :fa-arrow-right:](doc:user-ids)
* If you're moving to RevenueCat from another system, see our guide on [migrating your existing subscriptions :fa-arrow-right:](doc:migrating-existing-subscriptions)
* Once you're ready to test your integration, you can follow our guides on [testing and debugging :fa-arrow-right:](doc:debugging)
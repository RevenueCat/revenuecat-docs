---
title: "Quickstart"
slug: "getting-started-1"
excerpt: "Get up and running with mobile subscriptions"
hidden: false
createdAt: "2018-06-10T21:50:09.383Z"
updatedAt: "2019-02-26T19:33:33.833Z"
---
[block:callout]
{
  "type": "warning",
  "title": "Outdated documentation",
  "body": "You're viewing docs for an older version of our SDK.\n\n[**Send me to the new Purchases documentation :fa-arrow-right:**](https://docs.revenuecat.com/docs/getting-started-1)"
}
[/block]
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
  "type": "warning",
  "title": "Configure Products First",
  "body": "Before configuring entitlements, you should setup your in-app products in either [App Store Connect](doc:itunesconnect-app-specific-shared-secret) or [Play Developer Console](doc:creating-play-service-credentials).\n\n\nFor the most accurate analytics, you shouldn't change your product prices in App Store Connect or Play Console after they're set. Instead, create a new product id with the new price."
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
* [Unity Installation :fa-arrow-right:](doc:setting-up-unity-sdk)
[block:api-header]
{
  "title": "Initialize Purchases"
}
[/block]
You should only initialize *Purchases* once (usually on app launch) and share the same instance throughout your app by setting the shared instance in the SDK - we will take care of making a singleton for you.
[block:code]
{
  "codes": [
    {
      "code": "import Purchases\n\nlet purchases = RCPurchases.configure(withAPIKey: \"my_api_key\")",
      "language": "swift"
    },
    {
      "code": "#import \"RCPurchases.h\"\n...\nRCPurchases *purchases = [RCPurchases configureWithAPIKey:@\"my_app_api_key\"];",
      "language": "objectivec"
    },
    {
      "code": "Purchases purchases = new Purchases.Builder(this, \n                                            \"my_app_api_key\").build();\nPurchases.setSharedInstance(purchases);",
      "language": "java"
    },
    {
      "code": "const purchaserInfoHandler = (purchaserInfo, error) => {\n  if (purchaserInfo)\n  {\n    this.receivePurchaserInfo(purchaserInfo);\n  }\n}\n\nPurchases.addPurchaseListener((productIdentifier, purchaserInfo, error) => {\n  if (error) {\n    console.warn(error);\n  } else {\n    this.setState({\n      purchasedProduct: productIdentifier\n    });\n    this.receivePurchaserInfo(purchaserInfo);\n  }\n});\nPurchases.addPurchaserInfoUpdateListener(purchaserInfoHandler);\nPurchases.addRestoreTransactionsListener(purchaserInfoHandler);\n\nPurchases.setup(REVENUECAT_API_KEY);",
      "language": "javascript",
      "name": "React Native"
    },
    {
      "code": "Purchases.sharedInstance = Purchases.Builder(this, \"my_app_api_key\").build()",
      "language": "kotlin"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "You can get your API key from app settings in the [dashboard](https://app.revenuecat.com/apps/)."
}
[/block]

[block:api-header]
{
  "title": "Get Subscription Status"
}
[/block]
*Purchases* makes it easy to check what active subscriptions the current user has. This can be done two ways within the `receivedUpdatedPurchaserInfo` listener/delegate:
1. Checking active Entitlements - this lets you see what entitlements (from RevenueCat dashboard) are active for the user.
2. Checking the active subscriptions - this lets you see what product ids (from iTunes Connect or Play Store) are active for the user.
[block:code]
{
  "codes": [
    {
      "code": "func purchases(_ purchases: RCPurchases, receivedUpdatedPurchaserInfo purchaserInfo: RCPurchaserInfo) {\n    let entitlements = purchaserInfo.activeEntitlements\n    let subscriptions = purchaserInfo.activeSubscriptions\n\n    if entitlements.contains(\"my_entitlement_name\") {\n        // print(\"user is a pro\")\n    }\n\n    if subscriptions.contains(\"my_subscription_id\") {\n        // print(\"user is a pro\")\n    }\n}",
      "language": "swift"
    },
    {
      "code": "override fun onReceiveUpdatedPurchaserInfo(purchaserInfo: PurchaserInfo) {\n  val entitlements = purchaserInfo.activeEntitlements\n  val subscriptions = purchaserInfo.activeSubscriptions\n  if (entitlements.contains(\"my_entitlement_name\")) {\n    // print(\"user is a pro\")\n  }\n\n  if (subscriptions.contains(\"my_subscription_id\")) {\n    // print(\"user is a pro\")\n  }\n}",
      "language": "kotlin"
    },
    {
      "code": "Purchases.addPurchaserInfoUpdateListener((purchaserInfo, error) => {\n  if (purchaserInfo) {\n    if (purchaserInfo.activeEntitlements.includes(\"my_entitlement_name\")) {\n      console.log(\"user is a pro\")\n    }\n    if (purchaserInfo.activeSubscriptions.includes(\"my_subscription_id\")) {\n      console.log(\"user is a pro\")\n    }\n  }\n});",
      "language": "javascript",
      "name": "React Native"
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "Displaying Available Products"
}
[/block]
*Purchases* will automatically fetch the latest *active* entitlements and get the product information from Apple or Google. This means when users launch your purchase screen, products will already be loaded.
[block:code]
{
  "codes": [
    {
      "code": "func displayUpsellScreen() {\n    purchases?.entitlements({ (ents) in\n        let vc = UpsellController()\n        vc.entitlements = ents\n        presentViewController(vc, animated: true, completion: nil)\n    })\n}",
      "language": "swift"
    },
    {
      "code": "[self.purchases entitlements:^(NSDictionary<NSString *, RCEntitlement *> *entitlements) {\n  UpsellViewController *vc = [[UpsellViewController alloc] init];\n  vc.entitlements = entitlements;\n  [self presentViewController:vc animated:YES completion:nil];\n}];",
      "language": "objectivec"
    },
    {
      "code": "fun displayUpsellScreen() {\n        purchases?.getEntitlements(object : Purchases.GetEntitlementsHandler {\n          override fun onReceiveEntitlements(entitlementMap: Map<String, Entitlement>) {\n            // Display entitlements\n          }\n\n          override fun onReceiveEntitlementsError(\n            domain: Purchases.ErrorDomains,\n            code: Int,\n            message: String\n          ) {\n            // Display error\n          }\n\n        })\n}",
      "language": "kotlin"
    },
    {
      "code": "let entitlements = await Purchases.getEntitlements();\nconsole.log(entitlements);",
      "language": "javascript",
      "name": "React Native"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "Since the SDK pre-fetches the available products, the completion block to get entitlements won't need to make a network request in most cases. This creates a seamless onboarding experience that results in less drop-off, happier users, and more revenue for you."
}
[/block]

[block:api-header]
{
  "title": "Make a Purchase"
}
[/block]
When it comes time to make a purchase, *Purchases* has a simple method, `makePurchase`. The code sample below shows the process of fetching entitlements (which should be pre-loaded and super fast) and purchasing the "monthly" product offering.
[block:code]
{
  "codes": [
    {
      "code": "purchases.entitlements { entitlements in\n    guard let pro = entitlements?[\"my_entitlement_name\"] else { return }\n    guard let monthly = pro.offerings[\"my_offering_name\"] else { return }\n    guard let product = monthly.activeProduct else { return }\n    purchases.makePurchase(product)\n}\n",
      "language": "swift"
    },
    {
      "code": " [purchases entitlements:^(NSDictionary<NSString *, RCEntitlement *> *entitlements) {\n     SKProduct *product = entitlements[@\"my_entitlement_name\"].offerings[@\"my_offering_name\"].activeProduct;\n     [purchases makePurchase:product];\n }];\n",
      "language": "objectivec"
    },
    {
      "code": "purchases.getEntitlements(new Purchases.GetEntitlementsHandler() {\n            @Override\n            public void onReceiveEntitlements(Map<String, Entitlement> entitlementMap) {\n                Entitlement pro = entitlementMap.get(\"my_entitlement_name\");\n                Offering monthly = pro.getOfferings().get(\"my_offering_name\");\n              \tSkuDetails details = monthly.getSkuDetails();\n              \tpurchases.makePurchase(activity, details.getSku(), details.getType());\n            }\n        });",
      "language": "java"
    },
    {
      "code": "let entitlements = await Purchases.getEntitlements()\nPurchases.makePurchase(entitlements.pro.monthly.identifier)",
      "language": "javascript",
      "name": "React Native"
    },
    {
      "code": "purchases.getEntitlements(object : Purchases.GetEntitlementsHandler {\n            override fun onReceiveEntitlements(entitlementMap: Map<String, Entitlement>) {\n                entitlementMap[\"pro\"]\n                    ?.offerings?.get(\"monthly\")\n                    ?.skuDetails?.let { purchases.makePurchase(activity, it.sku, it.type); }\n            }\n        })",
      "language": "kotlin"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "`makePurchase` handles the underlying framework interaction and automatically validates purchases with Apple or Google through our secure servers. This helps reduce in-app-purchase fraud and decreases the complexity of your app. Receipt tokens are stored remotely and always kept up-to-date by RevenueCat."
}
[/block]

[block:callout]
{
  "type": "warning",
  "title": "Active products are nil",
  "body": "If your active products are returning nil, make sure they're configured correctly in the Play Store or App Store Connect."
}
[/block]

[block:api-header]
{
  "title": "Unlock Content"
}
[/block]
Once the purchase is made, verified, and stored, RevenueCat will send you the latest version of a purchaser's available entitlements - this is done via the *Purchases* listener/delegate. It is on you to unlock appropriate content or features in response to this.
[block:code]
{
  "codes": [
    {
      "code": "func purchases(_ purchases: RCPurchases, completedTransaction transaction: SKPaymentTransaction, withUpdatedInfo purchaserInfo: RCPurchaserInfo) {\n    if purchaserInfo.activeEntitlements.contains(\"my_entitlement_name\") {\n        // Unlock that great \"pro\" content.\n    }\n}\n",
      "language": "swift"
    },
    {
      "code": "- (void)purchases:(RCPurchases *)purchases completedTransaction:(SKPaymentTransaction*)transaction withUpdatedInfo:(RCPurchaserInfo *)purchaserInfo {\n    [purchaserInfo.activeEntitlements containsObject:@\"my_entitlement_name\"];\n}",
      "language": "objectivec"
    },
    {
      "code": "@Override\npublic void onCompletedPurchase(String sku, PurchaserInfo purchaserInfo) {\n  if (purchaserInfo.getActiveEntitlements().contains(\"my_entitlement_name\")) {\n    // Unlock pro content\n  }\n}",
      "language": "java"
    },
    {
      "code": "let purchasesHandle = (productIdentifier, purchaserInfo, error) => {\n  if (purchaserInfo.activeEntitlements.includes(\"my_entitlement_name\")) {\n    // Unlock pro content\n  }\n}",
      "language": "javascript",
      "name": "React Native"
    },
    {
      "code": "override fun onCompletedPurchase(sku: String, purchaserInfo: PurchaserInfo) {\n  if (purchaserInfo.activeEntitlements.contains(\"my_entitlement_name\")) {\n    // Unlock pro content\n  }\n}",
      "language": "kotlin"
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
  "title": "Next Steps"
}
[/block]
* If you haven't already, make sure your products are configured correctly by checking out our [guide on entitlements :fa-arrow-right:](doc:entitlements)
* If you want to use your own user identifiers, read about [setting app user ids :fa-arrow-right:](doc:user-ids)
* If you're moving to RevenueCat from another system, see our guide on [migrating your existing subscriptions :fa-arrow-right:](doc:migrating-existing-subscriptions)
* Once you're ready to test your integration, you can follow our guides on [testing purchases :fa-arrow-right:](doc:testing-purchases)
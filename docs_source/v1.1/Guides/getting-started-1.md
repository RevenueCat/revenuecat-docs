---
title: "Quickstart"
slug: "getting-started-1"
excerpt: "Get up and running with mobile subscriptions"
hidden: false
createdAt: "2018-06-10T21:50:09.383Z"
updatedAt: "2018-11-30T01:38:35.243Z"
---
This guide will get you up and running with subscriptions.
[block:api-header]
{
  "title": "1. Register your app in RevenueCat"
}
[/block]
Add your app via the RevenueCat [dashboard](http://app.revenuecat.com). 
[block:callout]
{
  "type": "info",
  "body": "A single app in RevenueCat supports all platforms.",
  "title": "One app for all platforms"
}
[/block]

[block:api-header]
{
  "title": "2. Setup your Entitlements"
}
[/block]
Entitlements are a simple way for you to organize your in-app products and configure them remotely. This simplifies the client side code and enables you to change products without an app update.

See [Understanding Entitlements](doc:entitlements) for how to configure and leverage entitlements.
[block:callout]
{
  "type": "warning",
  "title": "Configure Products First",
  "body": "Before configuring entitlements, you should setup your in-app products in either App Store Connect or Play Developer Console."
}
[/block]
A common and simple setup example is one entitlement with identifier *pro*, one offering *monthly*, with one product. 
[block:api-header]
{
  "title": "3. Integrate the Purchases Framework"
}
[/block]
*Purchases* is our mobile framework available on all platforms that correctly implements in-app building for all platforms and handles syncing purchase tokens with the RevenueCat server.


* [iOS](doc:ios) 
* [Android](doc:android) 
* [ReactNative](doc:reactnative) 
* [Unity](doc:setting-up-unity-sdk) 
[block:api-header]
{
  "title": "4. Initialize Purchases"
}
[/block]
There should be only one *Purchases* object in memory at any given time. You can set a shared instance in the SDK and we will take care of making a singleton for you. 

If your app has accounts you should initialize when a user logs in. If you do not have your own account system, you should initialize it once on app launch and share the same instance throughout your app by setting the shared instance in the SDK.

You can get your API key from app settings in the [dashboard](https://app.revenuecat.com/apps/).
[block:code]
{
  "codes": [
    {
      "code": "import Purchases\n\nlet purchases = RCPurchases.configure(withApiKey: \"my_app_api_key\")!",
      "language": "swift"
    },
    {
      "code": "@import Purchases\n\nRCPurchases *purchases = [RCPurchases configureWithAPIKey:@\"my_app_api_key\"];",
      "language": "objectivec"
    },
    {
      "code": "Purchases purchases = new Purchases.Builder(this, \n                                            \"my_app_api_key\").build();\nPurchases.setSharedInstance(purchases);",
      "language": "java"
    },
    {
      "code": "const purchaserInfoHandler = (purchaserInfo, error) => {\n  if (purchaserInfo)\n  {\n    this.receivePurchaserInfo(purchaserInfo);\n  }\n}\n\nPurchases.addPurchaseListener((productIdentifier, purchaserInfo, error) => {\n  if (error) {\n    console.warn(error);\n  } else {\n    this.setState({\n      purchasedProduct: productIdentifier\n    });\n    this.receivePurchaserInfo(purchaserInfo);\n  }\n});\nPurchases.addPurchaserInfoUpdateListener(purchaserInfoHandler);\nPurchases.addRestoreTransactionsListener(purchaserInfoHandler);\n\nPurchases.setup(REVENUECAT_API_KEY);",
      "language": "javascript",
      "name": "ReactNative"
    },
    {
      "code": "Purchases.sharedInstance = Purchases.Builder(this, \"my_app_api_key\").build()",
      "language": "kotlin"
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "5. Make a Purchase"
}
[/block]
*Purchases* will automatically fetch the latest entitlements and get the product information from Apple or Google. This means when users launch your purchase screen, products will already be loaded.
[block:code]
{
  "codes": [
    {
      "code": "purchases.entitlements { entitlements in\n    guard let pro = entitlements?[\"pro\"] else { return }\n    guard let monthly = pro.offerings[\"monthly\"] else { return }\n    guard let product = monthly.activeProduct else { return }\n    purchases.makePurchase(product)\n}\n",
      "language": "swift"
    },
    {
      "code": " [purchases entitlements:^(NSDictionary<NSString *, RCEntitlement *> *entitlements) {\n     SKProduct *product = entitlements[@\"pro\"].offerings[@\"monthly\"].activeProduct;\n     [purchases makePurchase:product];\n }];\n",
      "language": "objectivec"
    },
    {
      "code": "purchases.getEntitlements(new Purchases.GetEntitlementsHandler() {\n            @Override\n            public void onReceiveEntitlements(Map<String, Entitlement> entitlementMap) {\n                Entitlement pro = entitlementMap.get(\"pro\");\n                Offering monthly = pro.getOfferings().get(\"monthly\");\n              \tSkuDetails details = monthly.getSkuDetails();\n              \tpurchases.makePurchase(activity, details.getSku(), details.getType());\n            }\n        });",
      "language": "java"
    },
    {
      "code": "let entitlements = await Purchases.getEntitlements()\nPurchases.makePurchase(entitlements.pro.monthly.identifier)",
      "language": "javascript",
      "name": "ReactNative"
    },
    {
      "code": "purchases.getEntitlements(object : Purchases.GetEntitlementsHandler {\n\n            override fun onReceiveEntitlements(entitlementMap: Map<String, Entitlement>) {\n              Entitlement pro = entitlementMap.get(\"pro\");\n                Offering monthly = pro.getOfferings().get(\"monthly\");\n              \tSkuDetails details = monthly.getSkuDetails();\n              \tpurchases.makePurchase(this, details.getSku(), details.getType());\n\n                entitlementMap[\"pro\"]\n                    ?.offerings?.get(\"monthly\")\n                    ?.skuDetails?.let { purchases.makePurchase(activity, it.sku, it.type); }\n\t\t\t\t\n            }\n        })",
      "language": "kotlin"
    }
  ]
}
[/block]
*Purchases* handles the underlying framework interaction and receipt verification. Receipt tokens are stored remotely and kept up-to-date by RevenueCat.
[block:api-header]
{
  "title": "6. Unlock Entitlements"
}
[/block]
Once the purchase is made, verified, and stored, RevenueCat will send you the latest version of a purchaser's available entitlements. It is on you to unlock appropriate content or features in response to this. This is done via the Purchases listener/delegate.
[block:code]
{
  "codes": [
    {
      "code": "func purchases(_ purchases: RCPurchases, completedTransaction transaction: SKPaymentTransaction, withUpdatedInfo purchaserInfo: RCPurchaserInfo) {\n    if purchaserInfo.activeEntitlements.contains(\"pro\") {\n        // Unlock that great \"pro\" content.\n    }\n}\n",
      "language": "swift"
    },
    {
      "code": "- (void)purchases:(RCPurchases *)purchases completedTransaction:(SKPaymentTransaction*)transaction withUpdatedInfo:(RCPurchaserInfo *)purchaserInfo {\n    [purchaserInfo.activeEntitlements containsObject:@\"pro\"];\n}",
      "language": "objectivec"
    },
    {
      "code": "@Override\npublic void onCompletedPurchase(String sku, PurchaserInfo purchaserInfo) {\n  if (purchaserInfo.getActiveEntitlements().contains(\"pro\")) {\n    // Unlock pro content\n  }\n}",
      "language": "java"
    },
    {
      "code": "let purchasesHandle = (productIdentifier, purchaserInfo, error) => {\n  if (purchaserInfo.activeEntitlements.includes(\"pro\")) {\n    // Unlock pro content\n  }\n}",
      "language": "javascript",
      "name": "ReactNative"
    },
    {
      "code": "override fun onCompletedPurchase(sku: String, purchaserInfo: PurchaserInfo) {\n  if (purchaserInfo.activeEntitlements.contains(\"pro\")) {\n    // Unlock pro content\n  }\n}",
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
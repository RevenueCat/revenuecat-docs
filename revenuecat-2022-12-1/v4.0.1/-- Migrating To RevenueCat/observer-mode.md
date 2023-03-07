---
title: "Observer Mode"
slug: "observer-mode"
excerpt: "Using RevenueCat without changing existing purchase code"
hidden: false
metadata: 
  title: "Observer Mode – RevenueCat"
  description: "In some cases, if you have already built a functioning subscription system, it may not be possible or feasible to use the Purchases SDK to make purchases. However, you can still use the SDK to get access to the advanced charting, webhooks, and attribution that RevenueCat can provide."
  image: 
    0: "https://files.readme.io/8301ff3-RevenueCat_Docs_OG.png"
    1: "RevenueCat Docs OG.png"
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: {}
updatedAt: "2022-09-27T21:19:45.511Z"
---
Observer Mode enables you to migrate your existing subscribers to RevenueCat while retaining your existing code for fetching products, making purchases, and checking subscription status. This allows you to access to the advanced charting, webhooks, and integrations that RevenueCat provides as quickly as possible and with minimal engineering effort.

Observer Mode may be set up as part of your migration strategy to RevenueCat, or as a permanent solution. Use the table below to compare what features become available with Observer Mode vs. a full RevenueCat SDK integration.
[block:parameters]
{
  "data": {
    "h-0": "Feature",
    "h-1": "Observer Mode",
    "h-2": "Full Integration",
    "5-0": "Fetching Products",
    "0-0": "Charts",
    "1-0": "Webhooks & Integrations",
    "2-0": "Data Exports",
    "3-0": "Customer Lists",
    "0-1": "✅ *",
    "3-1": "✅ *",
    "1-1": "✅",
    "2-1": "✅",
    "6-0": "Making Purchases",
    "7-0": "Checking Subscription Status",
    "0-2": "✅",
    "1-2": "✅",
    "2-2": "✅",
    "3-2": "✅",
    "5-2": "✅",
    "6-2": "✅",
    "7-2": "✅",
    "5-1": "❌",
    "6-1": "❌",
    "7-1": "❌ **",
    "4-0": "Experiments",
    "4-1": "❌",
    "4-2": "✅"
  },
  "cols": 3,
  "rows": 8
}
[/block]
**information based around the "last seen time" and "country" may not be complete in Observer Mode*

***subscription status will be correct for your customers in Observer Mode, but we strongly recommend a full integration if planning to use RevenueCat as your subscription source-of-truth*

#Implementation

Observer Mode can be implemented server-side via REST APIs or client-side through the RevenueCat SDK. You should only implement Observer Mode one way or the other. 

#Option 1: Server-side
[block:parameters]
{
  "data": {
    "h-0": "Pros",
    "h-1": "Cons",
    "0-0": "✅ No client-side code changes",
    "1-0": "✅ Captures purchases from any app version",
    "0-1": "❌ The \"last seen\" attribute will be missing from customers since they are never \"seen\" by the client",
    "1-1": "❌ The \"country\" attribute will be missing from customers and transactions since it is computed from the customer's device IP address"
  },
  "cols": 2,
  "rows": 2
}
[/block]
If you're already sending receipts to your server, you can enable Observer Mode by forwarding the receipts along to RevenueCat then processing them as you normally do.

With this option, you should already have a process in place for validating receipts on your server. When you receive a receipt, you can forward it to RevenueCat via the [POST /receipts endpoint](https://docs.revenuecat.com/reference/receipts) then have your server continue doing whatever it is already. 

Don't worry about validating the receipt before forwarding to RevenueCat - we always validate receipts with the stores before saving them.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/0925a4c-Receipt_Forwarding_Service.png",
        "Receipt Forwarding Service.png",
        1143,
        910,
        "#c9cccf"
      ]
    }
  ]
}
[/block]
## Requirements
The requirements for server-side Observer Mode are the same as those for the  [POST /receipts endpoint](https://docs.revenuecat.com/reference/receipts). This includes:
- `app_user_id`
- `fetch_token`
- `price`
- `currency`
- `product_id`

While **price**, **currency**, and **product_id** are not required parameters for the API, they're highly recommended for Observer Mode to get value out of the integration - without providing this info RevenueCat will not have any price information.

If you're not already sending **price** and **currency** to your server there are two options:
1. Update your client-side code to start sending price and currency to your server. However, at this point a client-side Observer Mode setup may be simpler.
2. Hardcode a mapping of product IDs to their corresponding USD currency on your server. While this system isn't perfect as it won't account for country specific pricing and currency conversion rates, it may be a suitable approximation.
[block:callout]
{
  "type": "warning",
  "title": "Complete Apple base64 receipt file required",
  "body": "Observer Mode requires the raw base64 encoded Apple receipt as the `fetch_token`. Partial receipts or the receipt information from the Apple server-to-server notifications is insufficient."
}
[/block]
#Option 2: Client-side
[block:parameters]
{
  "data": {
    "h-0": "Pros",
    "h-1": "Cons",
    "0-1": "❌ Only captures purchases from latest app version",
    "0-0": "✅ No server-side code changes"
  },
  "cols": 2,
  "rows": 1
}
[/block]
If you're not saving receipts already on your server, or have limited backend resources available, a client-side Observer Mode implementation is often the best path. Implementation is no more than a couple lines

## Requirements

**Android**
Google Play Billing Library: 2.0+ (Android only)

**iOS**
No special requirements

**Amazon**
No special requirements

## 1. Configure the SDK
[block:code]
{
  "codes": [
    {
      "code": "Purchases.logLevel = .debug\nPurchases.configure(\n  with: Configuration.Builder(withAPIKey: Constants.apiKey)\n    .with(appUserID: \"<app_user_id>\")\n    .with(observerMode: true)\n    .build()\n)",
      "language": "swift",
      "name": "Swift"
    },
    {
      "code": "RCPurchases.logLevel = RCLogLevelDebug;\nRCConfigurationBuilder *configuration = [RCConfiguration builderWithAPIKey:@\"public_sdk_key\"];\nconfiguration = [configuration withObserverMode:YES];\nconfiguration = [configuration withAppUserID:@\"<app_user_id>\"];\n[RCPurchases configureWithConfiguration:[configuration build]];",
      "language": "objectivec",
      "name": "Objective-C"
    },
    {
      "code": "// If you're targeting only Google Play Store\nclass MainApplication: Application() {\n    override fun onCreate() {\n        super.onCreate()\n        Purchases.debugLogsEnabled = true\n        Purchases.configure(PurchasesConfiguration.Builder(this, \"public_google_sdk_key\").observerMode(true).build())\n    }\n}\n\n// If you're building for the Amazon Appstore, you can use flavors to determine which keys to use\n// In your build.gradle:\nflavorDimensions \"store\"\nproductFlavors {\n    amazon {\n        buildConfigField \"String\", \"STORE\", \"\\\"amazon\\\"\"\n    }\n\n    google {\n        buildConfigField \"String\", \"STORE\", \"\\\"google\\\"\"\n    }       \n}\n\n///...\n\nclass MainApplication: Application() {\n    override fun onCreate() {\n        super.onCreate()\n        Purchases.debugLogsEnabled = true\n          \n        if (BuildConfig.STORE.equals(\"amazon\")) {\n            Purchases.configure(AmazonConfiguration.Builder(this, \"public_amazon_sdk_key\").observerMode(true).build())\n        } else if (BuildConfig.STORE.equals(\"google\")) {\n            Purchases.configure(PurchasesConfiguration.Builder(this, \"public_google_sdk_key\").observerMode(true).build())\n        }\n    }\n}",
      "language": "kotlin",
      "name": "Kotlin"
    },
    {
      "code": "// If you're targeting only Google Play Store\npublic class MainApplication extends Application {\n    @Override\n    public void onCreate() {\n        super.onCreate();\n        Purchases.debugLogsEnabled = true;\n        Purchases.configure(new PurchasesConfiguration.Builder(this, \"public_google_sdk_key\").observerMode(true).build());\n    }\n}\n\n// If you're building for the Amazon Appstore, \n// click the Kotlin tab to see how to set up flavors in your build.gradle:\n///...\n\npublic class MainApplication extends Application {\n    @Override\n    public void onCreate() {\n        super.onCreate();\n        Purchases.debugLogsEnabled = true;\n      \n        PurchasesConfiguration.Builder builder = null;\n      \n        if (BuildConfig.STORE.equals(\"amazon\")) {\n            builder = new AmazonConfiguration.Builder(this, \"public_amazon_sdk_key\");\n        } else if (BuildConfig.STORE.equals(\"google\")) {\n            builder = new PurchasesConfiguration.Builder(this, \"public_google_sdk_key\");\n        }\n      \n        Purchases.configure(builder.observerMode(true).build());\n    }\n}",
      "language": "java",
      "name": "Java"
    },
    {
      "code": "await Purchases.setup(\"my_api_key\", observerMode: true);",
      "language": "javascript",
      "name": "Flutter"
    },
    {
      "code": "// Observer mode can be configured through the Unity Editor. \n// If you'd like to do it programmatically instead, \n// make sure to check \"Use runtime setup\" in the Unity Editor, and then:\n\nPurchases.PurchasesConfiguration.Builder builder = Purchases.PurchasesConfiguration.Builder.Init(\"api_key\");\nPurchases.PurchasesConfiguration purchasesConfiguration =\n    builder.SetUserDefaultsSuiteName(\"user_default\")\n    .SetObserverMode(true)\n    .SetAppUserId(appUserId)\n    .Build();\npurchases.Configure(purchasesConfiguration);",
      "language": "csharp",
      "name": "Unity"
    }
  ]
}
[/block]
### Enable Observer Mode in Unity Editor (Unity Only)

#### For Google Play (can also be done programmatically, see Configuration section)
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/9fa8a00-Screen_Shot_2022-08-03_at_3.52.12_PM.png",
        "Screen Shot 2022-08-03 at 3.52.12 PM.png",
        1134,
        790,
        "#343434"
      ]
    }
  ]
}
[/block]
#### For Amazon Store (can also be done programmatically, see Configuration section)
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/3e32059-Screen_Shot_2022-08-03_at_3.51.12_PM.png",
        "Screen Shot 2022-08-03 at 3.51.12 PM.png",
        1124,
        834,
        "#343333"
      ]
    }
  ]
}
[/block]

[block:callout]
{
  "type": "warning",
  "title": "Important note regarding InAppBillingService (Android Unity only)",
  "body": "If using RevenueCat alongside Unity IAP or other plugin that includes the Android InAppBillingService class, follow [these instructions :fa-arrow-right:](doc:unity#installation-with-unity-iap-side-by-side)"
}
[/block]

[block:callout]
{
  "type": "danger",
  "body": "On Android, RevenueCat **will not** consume or acknowledge any purchase in Observer Mode so be sure your app is handling that. **Failure to do so will result in your purchases being refunded after 3 days.**",
  "title": "Important (Android only)"
}
[/block]
##2.1 Sync purchases with RevenueCat (Google Play only)

On Android with Google Play (including cross-platform SDKs running on Android), any time a purchase or restore occurs in your app you should call the `syncPurchases` method to record it in RevenueCat. **Failure to do so will result in no purchases being recorded**.
[block:code]
{
  "codes": [
    {
      "code": "// Called any time a purchase or restore \n// is successful in your existing code\nPurchases.sharedInstance.syncPurchases()\n  ",
      "language": "kotlin"
    },
    {
      "code": "// Called any time a purchase or restore \n// is successful in your existing code\nPurchases.getSharedInstance().syncPurchases();\n",
      "language": "java"
    },
    {
      "code": "// Called any time a purchase or restore \n// is successful in your existing code\nPurchases.syncPurchases();",
      "language": "javascript",
      "name": "React Native"
    },
    {
      "code": "// Called any time a purchase or restore \n// is successful in your existing code\nvar purchases = GetComponent<Purchases>();\npurchases.SyncPurchases();",
      "language": "csharp",
      "name": "Unity"
    }
  ]
}
[/block]
##2.2 Sync purchases with RevenueCat (Amazon Store only)

On Android with Amazon Store (including cross-platform SDKs running on Android), any time a purchase or restore occurs in your app you should call the `syncObserverModeAmazonPurchase` method to record it in RevenueCat. **Failure to do so will result in no purchases being recorded**.

[block:code]
{
  "codes": [
    {
      "code": "public void OnInitialized(IStoreController controller, IExtensionProvider extensions)\n{\n   m_StoreController = controller;\n   storeExtensionProvider = extensions;\n   var purchases = GetComponent<Purchases>();\n   purchases.SetDebugLogsEnabled(true);\n   foreach (Product product in controller.products.all)\n   {\n       if (product.hasReceipt) {\n           var amazonExtensions = storeExtensionProvider.GetExtension<IAmazonExtensions>();\n           var userId = amazonExtensions.amazonUserId;\n           purchases.SyncObserverModeAmazonPurchase( \n               product.definition.id,\n               product.transactionID,\n               userId,\n               product.metadata.isoCurrencyCode,\n               Decimal.ToDouble(product.metadata.localizedPrice)\n           );\n       }\n   }\n}\n\npublic PurchaseProcessingResult ProcessPurchase(PurchaseEventArgs e)\n{\n   var purchases = GetComponent<Purchases>();\n   \n   var amazonExtensions = storeExtensionProvider.GetExtension<IAmazonExtensions>();\n   var userId = amazonExtensions.amazonUserId;\n   purchases.SyncObserverModeAmazonPurchase(\n       e.purchasedProduct.definition.id,\n       e.purchasedProduct.transactionID,\n       userId,\n       e.purchasedProduct.metadata.isoCurrencyCode,\n       Decimal.ToDouble(e.purchasedProduct.metadata.localizedPrice)\n   );\n   return PurchaseProcessingResult.Complete;\n}",
      "language": "csharp",
      "name": "Unity"
    },
    {
      "code": "Purchases.sharedInstance.syncObserverModeAmazonPurchase(\n  receipt.termSku,\n  receipt.receiptId,\n  userData.userId,\n  isoCurrencyCode,\n  storeProduct.price\n)",
      "language": "kotlin"
    }
  ]
}
[/block]
# Configuring Integrations
Certain integrations, such as most of the [Attribution Integrations](https://docs.revenuecat.com/docs/attribution), require some device data to work properly. **Observer Mode does not automatically collect any device data**.

If you plan on using an integration that requires device data with Observer Mode, you'll need to integrate the RevenueCat SDK to collect the data or set the appropriate attributes via the [REST API](https://docs.revenuecat.com/reference/update-subscriber-attributes). Note that attributes can be passed as an object in the [POST /receipts endpoint](https://docs.revenuecat.com/reference/receipts) as well if you're doing a server-side Observer Mode implementation.

#Next Steps

* With Observer Mode up-and-running capturing new purchases, you may want to [migrate existing purchases to RevenueCat as well :fa-arrow-right:](doc:migrating-existing-subscriptions)
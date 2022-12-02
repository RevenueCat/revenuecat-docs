---
title: "SwiftyStoreKit Migration"
slug: "swiftystorekit"
excerpt: "Migrate your SwiftyStoreKit app to RevenueCat"
hidden: false
metadata: 
  title: "SwiftyStoreKit alternative | RevenueCat"
  description: "If you use SwiftyStoreKit in your iOS app and are looking for an alternative that includes receipt validation, server-side status tracking, cross-platform support, and more - RevenueCat is the ideal choice."
  image: 
    0: "https://files.readme.io/6580f6b-Reddit__E.jpg"
    1: "Reddit – E.jpg"
    2: 1200
    3: 630
    4: "#fbabaf"
createdAt: {}
updatedAt: "2020-03-26T15:40:24.212Z"
---
If you use SwiftyStoreKit in your iOS app and are looking for an alternative that includes receipt validation, server-side status tracking, cross-platform support and more - RevenueCat is the ideal choice for your app!

This guide describes how to integrate specific features from SwiftyStoreKit into your app. For basic RevenueCat setup instructions, see the [Quickstart guide](doc:getting-started-1).

If you're app is already live with SwiftyStoreKit, be sure to read the last section on [Migrating active subscriptions](doc:swiftystorekit#section-migrating-active-subscriptions).

-------------------------------------
[block:api-header]
{
  "title": "App startup"
}
[/block]
Apple recommends registering an `SKPaymentTransactionObserver` as soon as the app launches. RevenueCat automatically does this when you configure an instance of *Purchases SDK*.

**SwiftyStoreKit:**
[block:code]
{
  "codes": [
    {
      "code": "func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {\n\n    SwiftyStoreKit.completeTransactions(atomically: true) { purchases in\n\t    for purchase in purchases {\n\t        switch purchase.transaction.transactionState {\n\t        case .purchased, .restored:\n\t            if purchase.needsFinishTransaction {\n\t                // Deliver content from server, then:\n\t                SwiftyStoreKit.finishTransaction(purchase.transaction)\n\t            }\n\t            // Unlock content\n\t        case .failed, .purchasing, .deferred:\n\t            break // do nothing\n\t        }\n\t    }\n\t}\n    return true\n}",
      "language": "swift",
      "name": "AppDelegate.swift"
    }
  ]
}
[/block]

**RevenueCat:**
[block:code]
{
  "codes": [
    {
      "code": "func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {\n\n    Purchases.debugLogsEnabled = true\n    Purchases.configure(withAPIKey: \"public_sdk_key\", appUserID: \"my_app_user_id\")\n    \n    return true\n}",
      "language": "swift",
      "name": "AppDelegate.swift"
    }
  ]
}
[/block]
**Migration Steps:**
Remove the SwiftyStoreKit `completeTransactions()` method, and replace it with the *Purchases SDK* `configure()` method.

-------------------------------------
[block:api-header]
{
  "title": "Purchases"
}
[/block]
##Retrieve products info

**SwiftyStoreKit:**
[block:code]
{
  "codes": [
    {
      "code": "SwiftyStoreKit.retrieveProductsInfo([\"com.RevenueCat.Purchase1\"]) { result in\n    if let product = result.retrievedProducts.first {\n        let priceString = product.localizedPrice!\n        print(\"Product: \\(product.localizedDescription), price: \\(priceString)\")\n    }\n    else if let invalidProductId = result.invalidProductIDs.first {\n        print(\"Invalid product identifier: \\(invalidProductId)\")\n    }\n    else {\n        print(\"Error: \\(result.error)\")\n    }\n}",
      "language": "swift"
    }
  ]
}
[/block]
**RevenueCat:**
[block:code]
{
  "codes": [
    {
      "code": "Purchases.shared.offerings { (offerings, error) in\n    if let e = error {\n        print(e.localizedDescription)\n    }\n    \n    guard let offering = offerings?.current else {\n        print(\"No current offering configured\")\n        return\n    }\n    \n    for package in offering.availablePackages {\n        print(\"Product: \\(package.product.localizedDescription), price: \\(package.localizedPriceString())\")\n    }\n}",
      "language": "swift"
    }
  ]
}
[/block]
**Migration Steps:**
In RevenueCat, Offerings are [configured in the dashboard](doc:entitlements), and mapped to `SKProduct`s. Once you setup your products in RevenueCat, replace `retrieveProductsInfo()` in SwiftyStoreKit with `offerings()` in *Purchases SDK*.

Products are automatically fetched and cached when the *Purchases SDK* is configured, so in most cases the `offerings()` method will return synchronously. For this reason, it's safe to call `offerings()` as often as needed, knowing it will read from the cache without a network call.


##Purchase a product

**SwiftyStoreKit:**
[block:code]
{
  "codes": [
    {
      "code": "SwiftyStoreKit.purchaseProduct(product, quantity: 1, atomically: true) { result in\n    switch result {\n    case .success(let purchase):\n        print(\"Purchase Success: \\(purchase.productId)\")\n    case .error(let error):\n        switch error.code {\n        case .unknown: print(\"Unknown error. Please contact support\")\n        case .clientInvalid: print(\"Not allowed to make the payment\")\n        case .paymentCancelled: break\n        case .paymentInvalid: print(\"The purchase identifier was invalid\")\n        case .paymentNotAllowed: print(\"The device is not allowed to make the payment\")\n        case .storeProductNotAvailable: print(\"The product is not available in the current storefront\")\n        case .cloudServicePermissionDenied: print(\"Access to cloud service information is not allowed\")\n        case .cloudServiceNetworkConnectionFailed: print(\"Could not connect to the network\")\n        case .cloudServiceRevoked: print(\"User has revoked permission to use this cloud service\")\n        default: print((error as NSError).localizedDescription)\n        }\n    }\n}",
      "language": "swift"
    }
  ]
}
[/block]
**RevenueCat:**
[block:code]
{
  "codes": [
    {
      "code": "Purchases.shared.purchasePackage(package) { (transaction, info, error, cancelled) in\n    if cancelled {\n        print(\"User cancelled purchase\")\n        return\n    }\n\n    // Optionally handle specific purchase errors\n    if let err = error as NSError? {\n\n        // log error details\n        print(\"RCError: \\(err.userInfo[ReadableErrorCodeKey])\")\n        print(\"Message: \\(err.localizedDescription)\")\n        print(\"Underlying Error: \\(err.userInfo[NSUnderlyingErrorKey])\")\n\n        // handle specific errors from: https://docs.revenuecat.com/docs/errors\n        switch PurchasesErrorCode(_nsError: err).code {\n\n        case .purchaseNotAllowedError:\n            print(\"Purchases not allowed on this device.\")\n\n        case .purchaseInvalidError:\n            print(\"Purchase invalid, check payment source.\")\n\n        case .networkError:\n            print(\"Network error, check your connection and try again.\")\n\n        default:\n            break\n        }\n    } else if info?.entitlements.all[\"pro\"]?.isActive == true {\n        print(\"Unlocked Pro Cats 🎉\")\n    }\n\n}",
      "language": "swift"
    }
  ]
}
[/block]
**Migration Steps:**
In SwiftyStoreKit, purchases can be initiated from a product Id or an `SKProduct`. In *Purchases SDK* the preferred method is to provide a package to purchase. Replace the `purchaseProduct()` method in SwiftyStoreKit with `purchasePackage()`, and pass the package that was included with the RevenueCat Offering.

A convenience property, `userCancelled`, is provided in the callback. This allows you to check if the user cancelled the payment without parsing through the `SKError`. If you would like to handle errors for specific cases, see all of the errors available to you in our [error handling guide](doc:errors).

To check if the subscription has been successfully activated, check if the `purchaserInfo` object contains an active entitlement for the "pro" content you configured in the RevenueCat dashboard. 

##Handle purchases started on the App Store

**SwiftyStoreKit:**
[block:code]
{
  "codes": [
    {
      "code": "func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {\n\n  //...\n  \n  SwiftyStoreKit.shouldAddStorePaymentHandler = { payment, product in\n    // return true if the content can be delivered by your app\n    // return false otherwise\n   }\n\n  //...\n}",
      "language": "swift"
    }
  ]
}
[/block]
**RevenueCat:**
[block:code]
{
  "codes": [
    {
      "code": "func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {\n\n  //...\n  Purchases.shared.delegate = self\n  //...\n\n}\n\nfunc purchases(_ purchases: Purchases, shouldPurchasePromoProduct product: SKProduct, defermentBlock makeDeferredPurchase: @escaping RCDeferredPromotionalPurchaseBlock) {\n\n    // Save the deferment block and call it later...\n    let defermentBlock = makeDeferredPurchase\n\n    // ...or call it right away to proceed with the purchase\n    defermentBlock { (transaction, info, error, cancelled) in\n                    \n          if purchaserInfo?.entitlements.all[\"pro\"]?.isActive == true {\n            // Unlock that great \"pro\" content\n          }\n    }\n}",
      "language": "swift"
    }
  ]
}
[/block]
**Migration Steps:**
RevenueCat handles purchases initiated through the App Store with an optional delegate method. Replace the `shouldAddStorePaymentHandler` in SwiftyStoreKit with the `shouldPurchasePromoProduct` in *Purchases SDK*.

With *Purchases SDK* you have the option of deferring the purchase until a later point in time (maybe after the user logs in). If you need to do this, simply cache the deferment block and call it later, or else call it right away.

##Restore previous purchases

**SwiftyStoreKit:**
[block:code]
{
  "codes": [
    {
      "code": "SwiftyStoreKit.restorePurchases(atomically: true) { results in\n    if results.restoreFailedPurchases.count > 0 {\n        print(\"Restore Failed: \\(results.restoreFailedPurchases)\")\n    }\n    else if results.restoredPurchases.count > 0 {\n        print(\"Restore Success: \\(results.restoredPurchases)\")\n    }\n    else {\n        print(\"Nothing to Restore\")\n    }\n}",
      "language": "swift"
    }
  ]
}
[/block]
**RevenueCat:**
[block:code]
{
  "codes": [
    {
      "code": "Purchases.shared.restoreTransactions { (purchaserInfo, error) in\n    if let e = error {\n        print(\"Restore Failed: \\(e.localizedDescription)\")\n    } else {\n        print(\"Restore Success: \\(purchaserInfo?.activeEntitlements)\")\n    }\n}",
      "language": "swift"
    }
  ]
}
[/block]
**Migration Steps:**
The *Purchases SDK* has a similar method to SwiftyStoreKit to restore transactions - replace `restorePurchases()` in SwiftyStoreKit with `restoreTransactions()`. To check if the subscription has been restored, check if the `purchaserInfo` object contains an active entitlement for the "pro" content you configured in the RevenueCat dashboard.

-------------------------------------

[block:api-header]
{
  "title": "Receipt verification"
}
[/block]
Receipts are automatically verified by RevenueCat. You don't need any local or server-side receipt validation of your own after migration 🎉
[block:api-header]
{
  "title": "Verifying subscriptions"
}
[/block]
**SwiftyStoreKit:**
[block:code]
{
  "codes": [
    {
      "code": "let appleValidator = AppleReceiptValidator(service: .production, sharedSecret: \"your-shared-secret\")\nSwiftyStoreKit.verifyReceipt(using: appleValidator) { result in\n    switch result {\n    case .success(let receipt):\n        let productId = \"my_product_identifier\"\n        // Verify the purchase of Consumable or NonConsumable\n        let purchaseResult = SwiftyStoreKit.verifyPurchase(\n            productId: productId,\n            inReceipt: receipt)\n            \n        switch purchaseResult {\n        case .purchased(let receiptItem):\n            print(\"\\(productId) is purchased: \\(receiptItem)\")\n        case .notPurchased:\n            print(\"The user has never purchased \\(productId)\")\n        }\n    case .error(let error):\n        print(\"Receipt verification failed: \\(error)\")\n    }\n}",
      "language": "swift"
    }
  ]
}
[/block]
**RevenueCat:**
[block:code]
{
  "codes": [
    {
      "code": "Purchases.shared.purchaserInfo { (purchaserInfo, error) in\n    if purchaserInfo?.entitlements.all[\"pro\"]?.isActive == true {\n        // Grant user \"pro\" access\n    }\n}",
      "language": "swift"
    }
  ]
}
[/block]
**Migration Steps:**
RevenueCat keeps a subscribers status up-to-date on the server and shares this information with the *Purchases SDK* to determine what subscriptions are active for the current user. 

Replace the `verifyReceipt()` method in SwiftyStoreKit with `purchaserInfo()` in *Purchases SDK*. This call will fetch the latest status for that user, and you can check which subscriptions are active for them. 

The latest purchaser info is automatically fetched and cached when the *Purchases SDK* is configured and throughout the lifecycle of your app, so in most cases the `purchaserInfo()` method will return synchronously. **For this reason, it's safe to call `purchaserInfo()` as often as needed, knowing it will read from the cache without a network call.**
[block:api-header]
{
  "title": "Migrating active subscriptions"
}
[/block]
If you've already shipped your app with active subscribers using SwiftyStoreKit, those active subscribers need to be migrated to RevenueCat. There are a few options available to make sure these users can still access their subscription on RevenueCat.

### Option 1
**Receipt import:** If you are saving Apple receipts for your subscribers, [contact us](https://support.revenuecat.com/hc/en-us/requests/new) about importing them to RevenueCat.

### Option 2
**Make active subscribers [restore purchases](doc:swiftystorekit#section-restore-previous-purchases):** This is the simplest method of migration, since you can completely replace SwiftyStoreKit with RevenueCat and ship your app. When users restore, their previous purchases will be sent and tracked in RevenueCat.

### Option 3
**Check if the user is an active subscriber via SwiftyStoreKit, then automatically trigger a restore:** This may require you to ship a version of your app that has both SwiftyStoreKit and *Purchases SDK* until active subscribers are migrated. If that's the case, be sure you remove your implementation of `completeTransactions()` from SwiftyStoreKit.

A pseudo implementation of what Option #3 may look like is below:
[block:code]
{
  "codes": [
    {
      "code": "\nPurchases.shared.purchaserInfo { (purchaserInfo, error) in\n\n    if let e = error {\n        print(e.localizedDescription)\n    }\n\n    guard let purchaserInfo = purchaserInfo else {\n        print(\"No purchaser info\")\n        return\n    }\n\n    let isSubscribedInRevenueCat = purchaserInfo?.entitlements.all[\"pro\"]?.isActive == true\n\n    if isSubscribedInRevenueCat {\n\n        // User is already subscribed in RevenueCat\n\n    } else if isSubscribedInSwiftyStoreKit {\n\n        // User isn't subscribed in RevenueCat but is\n        // in SwiftyStoreKit. Let's restore. This will\n        // sync the user's receipt with RevenueCat\n\n        Purchases.shared.restoreTransactions({ (info, err) in\n            // info should contain updated PurchaserInfo\n            // now check again if the user has an active entitlement\n        })\n    }\n}",
      "language": "swift"
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "Next Steps"
}
[/block]
* If you haven't already, make sure your products are configured correctly by checking out our [guide on entitlements :fa-arrow-right:](doc:entitlements)
* If you want to use your own user identifiers, read about [setting app user ids :fa-arrow-right:](doc:user-ids)
* Once you're ready to test your integration, you can follow our guides on [testing and debugging :fa-arrow-right:](doc:debugging)
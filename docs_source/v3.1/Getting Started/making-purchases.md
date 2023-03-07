---
title: "Making Purchases"
slug: "making-purchases"
excerpt: "Process a transaction with Apple or Google"
hidden: false
metadata: 
  title: "Making purchases – RevenueCat"
  description: "When it comes time to make a purchase, Purchases SDK has a simple method, `purchasePackage`, that takes a package from the fetched Offering and purchases the underlying product with Apple or Google."
  image: 
    0: "https://files.readme.io/8e3f2ff-OG_image.png"
    1: "OG image.png"
    2: 1200
    3: 627
    4: "#e9acb0"
createdAt: {}
updatedAt: "2021-01-04T20:21:03.403Z"
---
When it comes time to make a purchase, *Purchases SDK* has a simple method, `purchasePackage`, that takes a package from the fetched Offering and purchases the underlying product with Apple or Google. 
[block:code]
{
  "codes": [
    {
      "code": "Purchases.shared.purchasePackage(package) { (transaction, purchaserInfo, error, userCancelled) in\n  if purchaserInfo.entitlements[\"your_entitlement_id\"]?.isActive == true {\n    // Unlock that great \"pro\" content              \n  }\n}\n",
      "language": "swift"
    },
    {
      "code": "[[RCPurchases sharedPurchases] purchasePackage:package withCompletionBlock:^(SKPaymentTransaction *transaction, RCPurchaserInfo *purchaserInfo, NSError *error, BOOL cancelled) {\n  if (purchaserInfo.entitlements[@\"your_entitlement_id\"].isActive) {\n    // Unlock that great \"pro\" content\n  }\n}];\n",
      "language": "objectivec"
    },
    {
      "code": "Purchases.sharedInstance.purchasePackageWith(\n  this,\n  aPackage,\n  onError = { error, userCancelled -> /* No purchase */ },\n  onSuccess = { product, purchaserInfo ->\n    if (purchaserInfo.entitlements[\"my_entitlement_identifier\"]?.isActive == true) {\n    // Unlock that great \"pro\" content\n  }\n})",
      "language": "kotlin"
    },
    {
      "code": "Purchases.getSharedInstance().purchasePackage(\n    this,\n    aPackage,\n    new MakePurchaseListener() {\n        @Override\n        public void onCompleted(@NonNull Purchase purchase, @NonNull PurchaserInfo purchaserInfo) {\n            if (purchaserInfo.getEntitlements().get(\"my_entitlement_identifier\").isActive()) {\n              // Unlock that great \"pro\" content\n            }\n        }\n\n        @Override\n        public void onError(@NonNull PurchasesError error, Boolean userCancelled) {\n          // No purchase\n        }\n    }\n);",
      "language": "java"
    },
    {
      "code": "try {\n  PurchaserInfo purchaserInfo = await Purchases.purchasePackage(package);\n  if (purchaserInfo.entitlements.all[\"my_entitlement_identifier\"].isActive) {\n    // Unlock that great \"pro\" content\n  }\n} on PlatformException catch (e) {\n  var errorCode = PurchasesErrorHelper.getErrorCode(e);\n  if (errorCode != PurchasesErrorCode.purchaseCancelledError) {\n    showError(e);  \t          \n  }\n}",
      "language": "javascript",
      "name": "Flutter"
    },
    {
      "code": "// Using packages\ntry {\n  const {purchaserInfo, productIdentifier} = await Purchases.purchasePackage(package);\n  if (typeof purchaserInfo.entitlements.active.my_entitlement_identifier !== \"undefined\") {\n    // Unlock that great \"pro\" content\n  }\n} catch (e) {\n  if (!e.userCancelled) {\n  \tshowError(e);\n  }\n}\n\n// Note: if you are using purchaseProduct to purchase Android In-app products, an optional third parameter needs to be provided when calling purchaseProduct. You can use the package system to avoid this\nawait Purchases.purchaseProduct(\"product_id\", null, Purchases.PURCHASE_TYPE.INAPP);\n",
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
The `purchasePackage` completion block will contain an updated [PurchaserInfo](doc:purchaserinfo) object if successful, along with some details about the transaction.

If the `error `object is present, then the purchase failed. See our guide on [Error Handling](doc:errors) for the specific error types.

The `userCancelled` boolean is a helper for handling user cancellation errors. There will still be an error object if the user cancels, but you can optionally check the boolean instead of unwrapping the error completely. 

Note: transactions will be automatically finished (acknowledged in Android), and will be made available through the RevenueCat SDK / Dashboard / ETL Exports. You can use [observer mode](https://docs.revenuecat.com/docs/observer-mode) if you don't wish to have transactions finished automatically, but you will have to make sure that you finish them yourself. 
[block:api-header]
{
  "title": "Restoring Purchases"
}
[/block]
Restoring purchases is a mechanism by which your user can restore their in-app purchases, reactivating any content that had previously been purchased **from the same store account** (Apple or Google).

If two different [App User IDs](doc:user-ids) try to restore transactions from the same underlying store account (Apple or Google) RevenueCat will create an alias between the two App User IDs and count them as the same user going forward.
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
It is recommended that all apps contain some way for users to trigger the `restoreTransactions` method, even if you have account based restore functionality. 
[block:api-header]
{
  "title": "Next Steps"
}
[/block]
* With purchases coming through, make sure they're [linked to the correct user Id :fa-arrow-right:](doc:user-ids)
* If you're ready to test, start with our guides on [sandbox testing :fa-arrow-right:](doc:debugging)
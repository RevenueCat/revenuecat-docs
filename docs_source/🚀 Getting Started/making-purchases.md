---
title: Making Purchases
slug: making-purchases
excerpt: Process a transaction with Apple or Google
hidden: false
metadata:
  title: Making in-app purchases using the SDK – RevenueCat
  description: When it comes time to make a purchase, Purchases SDK has a simple method,
    `purchasePackage`, that takes a package from the fetched Offering and purchases
    the underlying product with Apple or Google.
  image:
    0: https://files.readme.io/222c22e-RevenueCat_Docs_OG.png
    1: RevenueCat Docs OG.png
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: '2023-03-28T08:06:18.490Z'
updatedAt: '2023-03-28T08:06:18.490Z'
category: 646582bc33592e0017008a31
---
The SDK has a simple method, `purchase(package:)`, that takes a package from the fetched Offering and purchases the underlying product with Apple, Google, or Amazon. 
[block:code]
{
  "codes": [
    {
      "code": "Purchases.shared.purchase(package: package) { (transaction, customerInfo, error, userCancelled) in\n  if customerInfo.entitlements[\"your_entitlement_id\"]?.isActive == true {\n    // Unlock that great \"pro\" content              \n  }\n}\n",
      "language": "swift"
    },
    {
      "code": "[[RCPurchases sharedPurchases] purchasePackage:package withCompletion:^(RCStoreTransaction *transaction, RCCustomerInfo *customerInfo, NSError *error, BOOL cancelled) {\n  if (customerInfo.entitlements[@\"your_entitlement_id\"].isActive) {\n    // Unlock that great \"pro\" content\n  }\n}];\n",
      "language": "objectivec"
    },
    {
      "code": "Purchases.sharedInstance.purchaseWith(\n  PurchaseParams.Builder(this, aPackage).build(),\n  onError = { error, userCancelled -> /* No purchase */ },\n  onSuccess = { product, customerInfo ->\n    if (customerInfo.entitlements[\"my_entitlement_identifier\"]?.isActive == true) {\n      // Unlock that great \"pro\" content\n    }\n  }\n)",
      "language": "kotlin"
    },
    {
      "code": "Purchases.getSharedInstance().purchase(\n\tnew PurchaseParams.Builder(this, aPackage).build(), \n\tnew PurchaseCallback() {\n    @Override\n    public void onCompleted(@NonNull StoreTransaction storeTransaction, @NonNull CustomerInfo customerInfo) {\n\t\t\tif (customerInfo.getEntitlements().get(<my_entitlement_identifier>).isActive()) {\n\t\t\t\t// Unlock that great \"pro\" content\n\t\t\t}\n\t\t}\n\n\t\t@Override\n\t\tpublic void onError(@NonNull PurchasesError purchasesError, boolean b) {\n\t\t\t// No purchase\n\t\t}\n\t}\n);",
      "language": "java"
    },
    {
      "code": "try {\n  PurchaserInfo purchaserInfo = await Purchases.purchasePackage(package);\n  if (purchaserInfo.entitlements.all[\"my_entitlement_identifier\"].isActive) {\n    // Unlock that great \"pro\" content\n  }\n} on PlatformException catch (e) {\n  var errorCode = PurchasesErrorHelper.getErrorCode(e);\n  if (errorCode != PurchasesErrorCode.purchaseCancelledError) {\n    showError(e);  \t          \n  }\n}",
      "language": "javascript",
      "name": "Flutter"
    },
    {
      "code": "// Using Offerings/Packages\ntry {\n  const {customerInfo, productIdentifier} = await Purchases.purchasePackage(package);\n  if (typeof customerInfo.entitlements.active.my_entitlement_identifier !== \"undefined\") {\n    // Unlock that great \"pro\" content\n  }\n} catch (e) {\n  if (!e.userCancelled) {\n  \tshowError(e);\n  }\n}\n\n// -----\n// If you are NOT using Offerings/Packages:\nawait Purchases.purchaseProduct(\"product_id\");\n\n// Or, optionally provide the product type as the third parameter. Defaults to PURCHASE_TYPE.SUBS\n// The `null` second parameter is the `upgradeInfo` object discussed here: https://www.revenuecat.com/docs/managing-subscriptions#google-play\nawait Purchases.purchaseProduct(\"product_id\", null, Purchases.PURCHASE_TYPE.INAPP);",
      "language": "javascript",
      "name": "React Native"
    },
    {
      "code": "Purchases.purchasePackage(package, ({ productIdentifier, customerInfo }) => {\n    if (typeof customerInfo.entitlements.active.my_entitlement_identifier !== \"undefined\") {\n      // Unlock that great \"pro\" content\n    }\n  },\n  ({error, userCancelled}) => {\n    // Error making purchase\n  }\n);\n\n// Note: if you are using purchaseProduct to purchase Android In-app products, an optional third parameter needs to be provided when calling purchaseProduct. You can use the package system to avoid this.\n\nPurchases.purchaseProduct(\"product_id\", ({ productIdentifier, customerInfo }) => {\n}, ({error, userCancelled}) => {\n    // Error making purchase\n}, null, Purchases.PURCHASE_TYPE.INAPP);",
      "language": "javascript",
      "name": "Cordova"
    },
    {
      "code": "Purchases purchases = GetComponent<Purchases>();\npurchases.PurchasePackage(package, (productIdentifier, customerInfo, userCancelled, error) =>\n{\n  if (customerInfo.Entitlements.Active.ContainsKey(\"my_entitlement_identifier\")) {\n    // Unlock that great \"pro\" content\n  }\n});",
      "language": "csharp",
      "name": "Unity"
    }
  ]
}
[/block]
The `purchase(package:)` completion block will contain an updated [CustomerInfo](doc:purchaserinfo) object if successful, along with some details about the transaction.

If the `error `object is present, then the purchase failed. See our guide on [Error Handling](doc:errors) for the specific error types.

The `userCancelled` boolean is a helper for handling user cancellation errors. There will still be an error object if the user cancels, but you can optionally check the boolean instead of unwrapping the error completely. 
[block:callout]
{
  "type": "warning",
  "title": "Warning: Automatic Transaction Finishing/Acknowledgement/Consumption",
  "body": "Transactions (new and previous transactions that are synced) will be automatically finished (acknowledged and consumed in Android), and will be made available through the RevenueCat SDK / Dashboard / ETL Exports. \n\nYou can use [observer mode](https://docs.revenuecat.com/docs/observer-mode) if you don't wish to have transactions finished (or consumed, in Android) automatically, but you will have to make sure that you finish/consume them yourself."
}
[/block]

[block:api-header]
{
  "title": "Next Steps"
}
[/block]
* Don't forget to provide some way for customers to [restore their purchases :fa-arrow-right:](doc:restoring-purchases)
* With purchases coming through, make sure they're [linked to the correct user Id :fa-arrow-right:](doc:user-ids)
* If you're ready to test, start with our guides on [sandbox testing :fa-arrow-right:](doc:sandbox)
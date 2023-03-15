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
createdAt: '2022-12-05T12:58:02.450Z'
updatedAt: '2022-12-05T12:58:02.450Z'
category: 640a7bef79274d00428d102b
---
The SDK has a simple method, `purchase(package:)`, that takes a package from the fetched Offering and purchases the underlying product with Apple, Google, or Amazon. 
```swift
Purchases.shared.purchase(package: package) { (transaction, customerInfo, error, userCancelled) in
  if customerInfo.entitlements["your_entitlement_id"]?.isActive == true {
    // Unlock that great "pro" content              
  }
}
```
```objectivec
[[RCPurchases sharedPurchases] purchasePackage:package withCompletion:^(RCStoreTransaction *transaction, RCCustomerInfo *customerInfo, NSError *error, BOOL cancelled) {
  if (customerInfo.entitlements[@"your_entitlement_id"].isActive) {
    // Unlock that great "pro" content
  }
}];
```
```kotlin
Purchases.sharedInstance.purchasePackageWith(
  this,
  aPackage,
  onError = { error, userCancelled -> /* No purchase */ },
  onSuccess = { product, customerInfo ->
    if (customerInfo.entitlements["my_entitlement_identifier"]?.isActive == true) {
    // Unlock that great "pro" content
  }
})
```
```java
Purchases.getSharedInstance().purchasePackage(
    this,
    aPackage,
    new MakePurchaseListener() {
        @Override
        public void onCompleted(@NonNull Purchase purchase, @NonNull CustomerInfo customerInfo) {
            if (customerInfo.getEntitlements().get("my_entitlement_identifier").isActive()) {
              // Unlock that great "pro" content
            }
        }

        @Override
        public void onError(@NonNull PurchasesError error, Boolean userCancelled) {
          // No purchase
        }
    }
);
```
```javascript
Purchases.purchasePackage(package, ({ productIdentifier, customerInfo }) => {
    if (typeof customerInfo.entitlements.active.my_entitlement_identifier !== "undefined") {
      // Unlock that great "pro" content
    }
  },
  ({error, userCancelled}) => {
    // Error making purchase
  }
);

// Note: if you are using purchaseProduct to purchase Android In-app products, an optional third parameter needs to be provided when calling purchaseProduct. You can use the package system to avoid this.

Purchases.purchaseProduct("product_id", ({ productIdentifier, customerInfo }) => {
}, ({error, userCancelled}) => {
    // Error making purchase
}, null, Purchases.PURCHASE_TYPE.INAPP);
```
```csharp
Purchases purchases = GetComponent<Purchases>();
purchases.PurchasePackage(package, (productIdentifier, customerInfo, userCancelled, error) =>
{
  if (customerInfo.Entitlements.Active.ContainsKey("my_entitlement_identifier")) {
    // Unlock that great "pro" content
  }
});
```
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
* If you're ready to test, start with our guides on [sandbox testing :fa-arrow-right:](doc:debugging)
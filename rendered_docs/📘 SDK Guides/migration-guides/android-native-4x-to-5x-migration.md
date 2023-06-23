---
title: Android Native - 4.x to 5.x Migration
slug: android-native-4x-to-5x-migration
hidden: true
categorySlug: sdk-guides
order: 1
parentDoc: 648c7ee650eac80027fe8f2e
---
[block:callout]
{
  "type": "info",
  "body": "View the Android SDK Reference documentation [here :fa-arrow-right:](https://sdk.revenuecat.com/android/index.html)."
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "If you are looking for the legacy v4.x SDK documentation, you can view that [here :fa-arrow-right:](https://docs.revenuecat.com/v3.3/docs/)."
}
[/block]

There were various updates to our API in this release, in order to best support the Amazon Store and to maintain parity with our iOS SDK, which recently [migrated from ObjC to Swift](doc:ios-native-3x-to-4x-migration).

# Version Requirements

- `purchases-android` now requires Java 8

# Type Changes
- `PurchaserInfo` has been deprecated and renamed to `CustomerInfo`. This rename also affects to all functions that had `PurchaserInfo` in their name, like `getPurchaserInfo` which has been renamed to `getCustomerInfo`.
- `ReceiveOfferingsListener` and `PurchasesErrorListener` have been renamed to `ReceiveOfferingsCallback` and `PurchasesErrorCallback`
- `Package.product` has been changed from being a `SkuDetails` to `StoreProduct`.

| Old type name | New type name |
|------------|------|
| `PurchaserInfo` | `CustomerInfo` |
| `ReceivePurchaserInfoListener` | `ReceiveCustomerInfoCallback` |
| `UpdatedPurchaserInfoListener` | `UpdatedCustomerInfoListener` |
| `ReceiveOfferingsListener` | `ReceiveOfferingsCallback` |
| `PurchasesErrorListener` | `PurchasesErrorCallback` |

# Deprecated + New APIs

## Configuring the SDK

The `configure` function has been changed to accept a `PurchasesConfiguration.Builder`. The previous function is deprecated. The new function can be used like this:
```kotlin 
Purchases.configure(PurchasesConfiguration.Builder(this, <public_google_sdk_key>).build())
```
or for Amazon:
```kotlin 
Purchases.configure(AmazonConfiguration.Builder(this, <public_amazon_sdk_key>).build())
```
## Making purchases
`purchasePackage` and `purchaseProduct` callbacks have been changed to return a `StoreTransaction` instead of a `Purchase` in the `onCompleted`.  

This means that `MakePurchaseListener` has been deprecated in favor of `PurchaseCallback`. There is a helper extension function `MakePurchaseListener.toPurchaseCallback()` that can help migrate. For purchasing functions that accept an `UpgradeInfo`, `ProductChangeListener` has been deprecated in favor of `ProductChangeCallback`.  

Similarly, you can use `ProductChangeListener.toProductChangeCallback()` and `MakePurchaseListener.toProductChangeCallback()` in Kotlin for an easy migration. Due to the same change, Kotlin helper `purchaseProductWith` now accepts a `StoreProduct` instead of a`SkuDetails`

## Getting products
`getSubscriptionSkus` and `getNonSubscriptionSkus` callbacks has been changed to return `StoreProduct` objects instead of `SkuDetails`. 

This means that `GetSkusResponseListener` has been deprecated in favor of `GetStoreProductsCallback`. You can use `GetSkusResponseListener.toGetStoreProductsCallback()` in Kotlin for an easy migration. 

For the same reasons, `getSubscriptionSkusWith` and `getNonSubscriptionSkusWith` now receive `storeProducts` instead of `skus`.

## Deprecated APIs
| Deprecated | New  |
|------------|------|
| `configure(Context, String, String?, Boolean, ExecutorService)` | `configure(PurchasesConfiguration)` |
| `invalidatePurchaserInfoCache()` | `invalidateCustomerInfoCache()` |
| `removeUpdatedPurchaserInfoListener()` | `removeUpdatedCustomerInfoListener()` |
| `getPurchaserInfo(ReceivePurchaserInfoListener)` | `getCustomerInfo(ReceiveCustomerInfoCallback)` |
| `restorePurchases(ReceivePurchaserInfoListener)` | `restorePurchases(ReceiveCustomerInfoCallback)` |
| `logOut(ReceivePurchaserInfoListener)` | `logOut(ReceiveCustomerInfoCallback)` |
| `purchaseProduct(Activity, SkuDetails, MakePurchaseListener)` | `purchaseProduct(Activity, StoreProduct, PurchaseCallback)` |
| `purchaseProduct(Activity, SkuDetails, UpgradeInfo, ProductChangeListener)` | `purchaseProduct(Activity, StoreProduct, UpgradeInfo, ProductChangeCallback)` |
| `purchasePackage(Activity, Package, MakePurchaseListener)` | `purchasePackage(Activity, Package, PurchaseCallback)` |
| `purchasePackage(Activity, Package, UpgradeInfo, ProductChangeListener)` | `purchasePackage(Activity, Package, UpgradeInfo, ProductChangeCallback)` |
| `getSubscriptionSkus(List<String>, GetSkusResponseListener)` | `getSubscriptionSkus(List<String>, GetStoreProductsCallback)` |
| `getNonSubscriptionSkus(List<String>, GetSkusResponseListener)` | `getNonSubscriptionSkus(List<String>, GetStoreProductsCallback)` |

## Kotlin Helpers Changes

| Old signature | New signature |
|---------------|---------------|
| `getPurchaserInfoWith((PurchasesError) -> Unit, (PurchaserInfo) -> Unit)` | `getCustomerInfoWith((PurchasesError) -> Unit, (CustomerInfo) -> Unit)` |
| `purchasePackageWith(Activity, Package, (PurchasesError) -> Unit, (Purchase, PurchaserInfo) -> Unit)` | `purchasePackage(Activity, Package, (PurchasesError) -> Unit, (StoreTransaction, CustomerInfo) -> Unit)` |
| `purchasePackageWith(Activity, Package, UpgradeInfo, (PurchasesError) -> Unit, (Purchase, PurchaserInfo) -> Unit)` | `purchasePackage(Activity, Package, UpgradeInfo, (PurchasesError) -> Unit, (StoreTransaction, CustomerInfo) -> Unit)` |
| `purchaseProductWith(Activity, SkuDetails, (PurchasesError) -> Unit, (Purchase, PurchaserInfo) -> Unit)` | `purchaseProductWith(Activity, StoreProduct, (PurchasesError) -> Unit, (StoreTransaction, CustomerInfo) -> Unit)` |
| `purchaseProductWith(Activity, SkuDetails, UpgradeInfo, (PurchasesError) -> Unit, (Purchase, PurchaserInfo) -> Unit)` | `purchaseProductWith(Activity, StoreProduct, UpgradeInfo, (PurchasesError) -> Unit, (StoreTransaction, CustomerInfo) -> Unit)` |

## Removed APIs
Some deprecated functions have been removed: `identify`, `reset`, `createAlias`, `isBillingSupported`, `isFeatureSupported`, `addAttributionData` and the versions of `purchaseProduct`/`purchasePackage` accepting `UpgradeInfo` and `MakePurchaseListener`

For more information about recommended identity logic following the removal of these identification methods, see [Identifying Users](doc:user-ids).

| Removed APIs |  
|---------------------------------------------------------------------------|
| `purchaseProduct(Activity, SkuDetails, UpgradeInfo, MakePurchaseListener)` |
| `purchasePackage(Activity, Package, UpgradeInfo, MakePurchaseListener)` |
| `createAlias(String, ReceivePurchaserInfoListener?)` |
| `identify(String, ReceivePurchaserInfoListener?)` |
| `reset(ReceivePurchaserInfoListener?)` |
| `createAliasWith(String, (PurchasesError) -> Unit, (PurchaserInfo) -> Unit)` |
| `identifyWith(String, (PurchasesError) -> Unit, (PurchaserInfo) -> Unit)` |
| `resetWith((PurchasesError) -> Unit, (PurchaserInfo) -> Unit)` |
| `isBillingSupported(Context, Callback<Boolean>)` |
| `isFeatureSupported(BillingClient.FeatureType, Context, Callback<Boolean>)` |
| `addAttributionData(JSONObject, AttributionNetwork, String?)` |
| `addAttributionData(Map<String, Any?>, AttributionNetwork, String?)` |
| `AttributionNetwork` |

# Other changes

- Amazon support (see [the section in our docs for more information](https://docs.revenuecat.com/docs/amazon-platform-resources))

# Reporting undocumented issues

Feel free to file an issue! [New RevenueCat Issue](https://github.com/RevenueCat/purchases-android/issues/new/).
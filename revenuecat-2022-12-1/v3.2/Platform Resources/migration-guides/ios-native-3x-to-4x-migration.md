---
title: "iOS Native - 3.x to 4.x Migration"
slug: "ios-native-3x-to-4x-migration"
hidden: true
createdAt: "2021-09-30T14:32:30.784Z"
updatedAt: "2021-10-08T18:56:48.315Z"
---
We’re excited to announce a new major version of purchases-ios, v4.0.0. The team here at RevenueCat has worked tirelessly to strike the balance between making this a smooth transition for you, supporting the latest StoreKit2 feature set, and maintaining a clean API.

That said, there are a number of breaking changes with this release. We’ve been thoughtful in allowing only those we felt enhanced the quality of our SDK, and we want to provide you with the documentation and tools to migrate smoothly.

### Package Rename
We've renamed our package from `Purchases` to `RevenueCat`.  It contains all the same functionality (and almost exactly the same API) as Purchases. It's not a brand-new framework, but rather, a migration of the ObjC bits over to Swift with improved nullability, various bug fixes, and some new features.
### Swift 
Migrating to Swift proved necessary to best support StoreKit2 and will allow for faster development and deployments moving forward. For a more thorough explanation on the decision to migrate, see our Swift Migration Plan (link).

As a result of this migration, we made a few tweaks to our public-facing API. For a comprehensive list of the breaking changes, see [Breaking Changes](#breakingChangesHeader). We’ve also included a migration script (link) that should handle updating most of these references for you. 
### StoreKit2
Version 4 now features support for StoreKit2! For a comprehensive look at StoreKit2, check out our [blog post](https://www.revenuecat.com/blog/meet-storekit-2). 

Newly-exposed functionality can be found below (link to new methods), but as a RevenueCat customer, you'll get all the other enhancements for free through our existing API.  **You won’t have to worry about supporting StoreKit1 and StoreKit2 simultaneously**—we’ll do it for you, and we’ll use the new system wherever it’s available.
# Step-by-Step Migration Guide (maybe this should be a different page)
*Note: This guide assumes you are updating from Purchases 3.x.x to RevenueCat 4.x.x*

### 1. Update your dependency
<details>
   <summary>SPM</summary>
<br>
Due to the framework rename, you'll need to: <br>
1. Remove the package dependency from your project and target. <br>
2. Re-add the package to your project and target.
3. 
</details>

<details>
   <summary>Carthage</summary>

</details>

<details>
   <summary>Cocoapods</summary>

</details>

### 2. Update breaking changes
Run our migration script to port old method signatures to new ones, or check out the list of [breaking changes](#breakingChangesHeader) to make updates yourself.
### 3. Check for references to any deleted methods (do we have any?)
### 4. Check out our new methods!
async/await, SK2 stuff

# Breaking Changes <a name="breakingChangesHeader"></a>
<details>
   <summary>Obj-C Breaking Changes</summary>

  <br>
  <code>@import Purchases</code> is now <code>@import RevenueCat</code>
  <br>
  <br>
  <table>
  	  <thead>
  		  <tr>
			  <th>Old API</th>
			  <th>New API</th>
		  </tr>
	  </thead>
	  <tbody>
		  <tr>
			  <td>(RCPurchasesErrorCode).RCOperationAlreadyInProgressError</td>
			  <td>RCOperationAlreadyInProgressForProductError</td>
		  </tr>
		  <tr>
			  <td>RCBackendErrorDomain</td>
			  <td>RCBackendErrorCodeDomain</td>
		  </tr>
		  <tr>
			  <td>RCPurchasesErrorDomain</td>
			  <td>RCPurchasesErrorCodeDomain</td>
		  </tr>
		  <tr>
			  <td>RCFinishableKey</td>
			  <td>RCErrorDetails.RCFinishableKey</td>
		  </tr>
	  </tbody>
  </table>
</details>

<details>
  <summary>Swift Breaking Changes</summary>
  <br>
  <code>import Purchases</code> is now <code>import RevenueCat</code>
  <br>

### Type Changes

<table>
	<thead>
		<tr>
			<th>Old type name</th>
			<th>New type name</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>Purchases.Offering</td>
			<td>Offering</td>
		</tr>
		<tr>
			<td>Purchases.RevenueCatBackendErrorCode</td>
			<td>RCBackendErrorCodeDomain</td>
		</tr>
		<tr>
			<td>Purchases.ErrorCode.Code</td>
			<td>RCPurchasesErrorCodeDomain</td>
		</tr>
		<tr>
			<td>Purchases.Package</td>
			<td>Package</td>
		</tr>
		<tr>
			<td>Purchases.PurchaserInfo</td>
			<td>PurchaserInfo</td>
		</tr>
		<tr>
			<td>Purchases.EntitlementInfos</td>
			<td>EntitlementInfos</td>
		</tr>
		<tr>
			<td>Purchases.Transaction</td>
			<td>Transaction</td>
		</tr>
		<tr>
			<td>Purchases.EntitlementInfo</td>
			<td>EntitlementInfo</td>
		</tr>
		<tr>
			<td>Purchases.PeriodType</td>
			<td>PeriodType</td>
		</tr>
		<tr>
			<td>Purchases.Store</td>
			<td>Store</td>
		</tr>
		<tr>
			<td>RCPurchaseOwnershipType</td>
			<td>PurchaseOwnershipType</td>
		</tr>
		<tr>
			<td>RCAttributionNetwork</td>
			<td>AttributionNetwork</td>
		</tr>
		<tr>
			<td>Purchases.ErrorUtils</td>
			<td>ErrorUtils</td>
		</tr>
		<tr>
			<td>RCIntroEligibility</td>
			<td>IntroEligibility</td>
		</tr>
		<tr>
			<td>RCIntroEligibilityStatus</td>
			<td>IntroEligibilityStatus</td>
		</tr>
		<tr>
			<td>Purchases.LogLevel</td>
			<td>LogLevel</td>
		</tr>
		<tr>
			<td>Purchases.ReceivePurchaserInfoBlock</td>
			<td>ReceivePurchaserInfoBlock</td>
		</tr>
		<tr>
			<td>ReadableErrorCodeKey</td>
			<td>ErrorDetails.readableErrorCodeKey</td>
		</tr>
		<tr>
			<td>RCFinishableKey</td>
			<td>ErrorDetails.finishableKey</td>
		</tr>
		<tr>
			<td>RCDeferredPromotionalPurchaseBlock</td>
			<td>DeferredPromotionalPurchaseBlock</td>
		</tr>
		<tr>
			<td>Purchases.Offerings</td>
			<td>Offerings</td>
		</tr>
		<tr>
			<td>Purchases.PackageType</td>
			<td>PackageType</td>
		</tr>
		<tr>
			<td>Purchases.ReceiveOfferingsBlock</td>
			<td>ReceiveOfferingsBlock</td>
		</tr>
		<tr>
			<td>Purchases.ReceiveProductsBlock</td>
			<td>ReceiveProductsBlock</td>
		</tr>
		<tr>
			<td>Purchases.PurchaseCompletedBlock</td>
			<td>PurchaseCompletedBlock</td>
		</tr>
		<tr>
			<td>Purchases.PaymentDiscountBlock</td>
			<td>PaymentDiscountBlock</td>
		</tr>
	</tbody>
</table>

### API Changes 

<table>
	<thead>
		<tr>
			<th>Old API</th>
			<th>New API</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>logIn(_ appUserId, _ completion)</td>
			<td>login(appUserId:completionBlock)</td>
		</tr>
		<tr>
			<td>purchaserInfo(_ completion)</td>
			<td>purchaserInfo(completionBlock)</td>
		</tr>
		<tr>
			<td>offerings(_completion)</td>
			<td>offerings(completionBlock)</td>
		</tr>
		<tr>
			<td>products(_ productIdentifiers, _ completion)</td>
			<td>products(identifiers:completionBlock)</td>
		</tr>
		<tr>
			<td>purchaseProduct(_ product, _ completion)</td>
			<td>purchase(product, completion)</td>
		</tr>
		<tr>
			<td>purchasePackage(_ package, _ completion)</td>
			<td>purchase(package, completion)</td>
		</tr>
		<tr>
			<td>restoreTransactions(_completion)</td>
			<td>restoreTransactions(completionBlock)</td>
		</tr>
		<tr>
			<td>syncPurchases(_ completion)</td>
			<td>syncPurchases(completionBlock)</td>
		</tr>
		<tr>
			<td>paymentDiscount(for:product:completion)</td>
			<td>paymentDiscount(forProductDiscount:product:completion)</td>
		</tr>
		<tr>
			<td>purchaseProduct(_:discount:_)</td>
			<td>purchase(product:discount:completion:)</td>
		</tr>
		<tr>
			<td>purchasePackage(_:discount:_)</td>
			<td>purchase(package:discount:completion:)</td>
		</tr>
	</tbody>
</table>

</details>

# What's not in this release
Anything to put here?
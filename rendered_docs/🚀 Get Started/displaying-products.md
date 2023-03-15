---
title: Displaying Products
slug: displaying-products
excerpt: Build dynamic paywalls and control available products remotely
hidden: false
metadata:
  title: Displaying in-app purchase products | RevenueCat
  description: If you've configured Offerings in RevenueCat, you can control which
    products are shown to users without requiring an app update. Building paywalls
    that are dynamic and can react to different product configurations gives you maximum
    flexibility to make remote updates.
  image:
    0: https://files.readme.io/600479c-RevenueCat_Docs_OG.png
    1: RevenueCat Docs OG.png
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: '2022-06-20T21:57:39.646Z'
updatedAt: '2022-06-20T21:57:39.646Z'
category: 640a7bef79274d00428d102b
---
If you've [configured Offerings](doc:entitlements) in RevenueCat, you can control which products are shown to users without requiring an app update. Building paywalls that are dynamic and can react to different product configurations gives you maximum flexibility to make remote updates.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/edbe93c-Screen_Shot_2019-09-20_at_8.42.23_AM.png",
        "Screen Shot 2019-09-20 at 8.42.23 AM.png",
        409,
        732,
        "#c1787b"
      ]
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "Before products and offerings can be fetched from RevenueCat, be sure to initialize the Purchases SDK by following our [Quickstart](doc:getting-started) guide."
}
[/block]
# Fetching Offerings

Offerings are fetched through the SDK based on their [configuration](doc:entitlements) in the RevenueCat dashboard.

The `getOfferings` method will fetch the Offerings from RevenueCat. These are pre-fetched in most cases on app launch, so the completion block to get offerings won't need to make a network request in most cases. 
```swift
Purchases.shared.getOfferings { (offerings, error) in
    if let packages = offerings?.current?.availablePackages {
        // Display packages for sale
    }
}
```
```objectivec
[[RCPurchases sharedPurchases] getOfferingsWithCompletion:^(RCOfferings *offerings, NSError *error) {
  if (offerings.current && offerings.current.availablePackages.count != 0) {
    // Display packages for sale
  } else if (error) {
    // optional error handling
  }
}];
```
```kotlin
Purchases.sharedInstance.getOfferingsWith({ error ->
  // An error occurred
}) { offerings ->
  offerings.current?.availablePackages?.takeUnless { it.isNullOrEmpty() }?.let {
    // Display packages for sale
  }
}
```
```java
Purchases.getSharedInstance().getOfferings(new ReceiveOfferingsListener() {
  @Override
  public void onReceived(@NonNull Offerings offerings) {
    if (offerings.getCurrent() != null) {
      List<Package> availablePackages = offerings.getCurrent().getAvailablePackages();
      // Display packages for sale
    }
  }
  
  @Override
  public void onError(@NonNull PurchasesError error) {
    // An error occurred
  }
});
```
```javascript
func displayUpsellScreen() {
  Purchases.getOfferings(
      offerings => {
        if (offerings.current !== null && offerings.current.availablePackages.length !== 0) {  
			    // Display packages for sale
        }
      },
      error => {

      }
  );
}
```
```csharp
var purchases = GetComponent<Purchases>();
purchases.GetOfferings((offerings, error) =>
{
  if (offerings.Current != null && offerings.Current.AvailablePackages.Count != 0){
    // Display packages for sale
  }
});
```

[block:callout]
{
  "type": "info",
  "title": "Offerings, products or available packages empty",
  "body": "If your offerings, products, or available packages are empty, it's due to some configuration issue in App Store Connect or the Play Console. \n\nThe most common reasons for this in App Store Connect are an out-of-date 'Paid Applications Agreement' or products not at least in the 'Ready To Submit' state. For Google Play, this usually occurs when the app is not published on a closed track and a valid test user added.\n\nYou can find more info about trouble shooting this issue in our [Help Center](https://support.revenuecat.com/hc/en-us/articles/360041793174)."
}
[/block]
You must choose one Offering that is the "Current Offering" - which can easily be accessed via the `current` property of the returned offerings.

To change the current Offering, navigate to the Offerings tab for your project in the RevenueCat dashboard and click **Make current** next to the Offering you'd like to enable.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/0e956b6-Screen_Shot_2021-12-01_at_10.38.29_AM.png",
        "Screen Shot 2021-12-01 at 10.38.29 AM.png",
        1252,
        560,
        "#f9f8f9"
      ]
    }
  ]
}
[/block]
Offerings can be updated at any time, and the changes will go into effect for all users right away.


## Custom Offering identifiers
It's also possible to access other Offerings besides the "Current Offering" directly by its identifier.
```swift
Purchases.shared.getOfferings { (offerings, error) in
    if let packages = offerings?.offering(identifier: "experiment_group").availablePackages {
        // Display packages for sale
    }
}
```
```objectivec
[[RCPurchases sharedPurchases] offeringsWithCompletionBlock:^(RCOfferings *offerings, NSError *error) {
	NSArray<RCPackage *> *availablePackages = [offerings offeringWithIdentifier:"experiment_group"].availablePackages;
  if (availablePackages) {
    // Display packages for sale
  }
}];
```
```kotlin
Purchases.sharedInstance.getOfferingsWith({ error ->
  // An error occurred
}) { offerings ->
  offerings["experiment_group"]?.availablePackages?.takeUnless { it.isNullOrEmpty() }?.let {
    // Display packages for sale
  }
}
```
```java
Purchases.getSharedInstance().getOfferings(new ReceiveOfferingsListener() {
  @Override
  public void onReceived(@NonNull Offerings offerings) {
    if (offerings.get("experiment_group") != null) {
      List<Package> availablePackages = offerings.get("experiment_group").getAvailablePackages();
      // Display packages for sale
    }
  }
  
  @Override
  public void onError(@NonNull PurchasesError error) {
    // An error occurred
  }
});
```
```javascript
Purchases.getOfferings(
      offerings => {
        if (offerings.all["experiment_group"].availablePackages.length !== 0) {
			    // Display packages for sale
        }
      },
      error => {

      }
  );
```
```csharp
var purchases = GetComponent<Purchases>();
purchases.GetOfferings((offerings, error) =>
{
  if (offerings.All.ContainsKey("experiment_group") && offerings.All["experiment_group"].AvailablePackages.Count != 0) {
  	// Display packages for sale
  }
});
```
# Displaying Packages

Packages help abstract platform-specific products by grouping equivalent products across iOS, Android, and web. A package is made up of three parts: identifier, type, and underlying store product.
[block:parameters]
{
  "data": {
    "0-0": "Identifier",
    "1-0": "Type",
    "2-0": "Product",
    "2-1": "The underlying product that is mapped to this package. Either an [SKProduct](https://developer.apple.com/documentation/storekit/skproduct?language=objc) (iOS) or [SkuDetails](https://developer.android.com/reference/com/android/billingclient/api/SkuDetails) (Android).",
    "1-1": "The type of the package:\n- `UNKNOWN`\n- `CUSTOM`\n- `LIFETIME`\n- `ANNUAL`\n- `SIX_MONTH`\n- `THREE_MONTH`\n- `TWO_MONTH`\n- `MONTHLY`\n- `WEEKLY`",
    "h-0": "Name",
    "h-1": "Description",
    "0-1": "The package identifier (e.g. `com.revenuecat.app.monthly`)"
  },
  "cols": 2,
  "rows": 3
}
[/block]
### Getting the Product from the Package
```swift
// Accessing the monthly product

Purchases.shared.getOfferings { (offerings, error) in
    if let package = offerings?.current?.monthly?.storeProduct {
        // Get the price and introductory period from the StoreProduct
    }
}
```
```objectivec
// Accessing the monthly product

[[RCPurchases sharedPurchases] offeringsWithCompletionBlock:^(RCOfferings *offerings, NSError *error) {
  if (offerings.current && offerings.current.monthly) {
    SKProduct *product = offerings.current.monthly.storeProduct;
    // Get the price and introductory period from the StoreProduct
  } else if (error) {
    // optional error handling
  }
}];
```
```kotlin
// Accessing the monthly product

Purchases.sharedInstance.getOfferingsWith({ error ->
  // An error occurred
}) { offerings ->
  val product = offerings.current?.monthly?.product?.also {
    // Get the price and introductory period from the SkuDetails
  }
}
```
```java
// Accessing the monthly product

Purchases.getSharedInstance().getOfferings(new ReceiveOfferingsListener() {
  @Override
  public void onReceived(@NonNull Offerings offerings) {
    if (offerings.getCurrent() != null and offerings.getCurrent().monthly != null) {
      SkuDetails product = offerings.getCurrent().monthly.product;
      // Get the price and introductory period from the SkuDetails
    }
  }
  
  @Override
  public void onError(@NonNull PurchasesError error) {
    // An error occurred
  }
});
```
```javascript
// Accessing the monthly product

func displayUpsellScreen() {
  Purchases.getOfferings(
      offerings => {
        if (offerings.current && offerings.current.monthly) {  
          const product = offerings.current.monthly;
			    // Get the price and introductory period from the PurchasesProduct
        }
      },
      error => {

      }
  );
}
```
```csharp
// Accessing the monthly product

var purchases = GetComponent<Purchases>();
purchases.GetOfferings((offerings, error) =>
{
  if (offerings.Current != null && offerings.Current.Monthly != null){
    var product = offerings.Current.Monthly.Product;
    // Get the price and introductory period from the Product
  }
});
```
# Choosing which Offering to display

In practice, you may not want to display the default current Offering to every user and instead have a specific cohort that see a different Offering.

For example, displaying a higher priced Offering to users that came from [paid acquisition](doc:attribution) to help recover ad costs, or a specific Offering designed to show [iOS Subscription Offers](doc:ios-subscription-offers) when a user has [cancelled their subscription](doc:purchaserinfo#section-get-entitlement-information). 

This can be accomplished with custom Offering identifiers for each of these "cohorts".
```swift
Purchases.shared.getOfferings { (offerings, error) in
    var packages : [Package]?
    
    if user.isPaidDownload {
        packages = offerings?.offering(identifier: "paid_download_offer")?.availablePackages
    } else if user.signedUpOver30DaysAgo {
        packages = offerings?.offering(identifier: "long_term_offer")?.availablePackages
    } else if user.recentlyChurned {
        packages = offerings?.offering(identifier: "ios_subscription_offer")?.availablePackages
    }
    
    // Present your paywall
}
```
```objectivec
[[RCPurchases sharedPurchases] offeringsWithCompletionBlock:^(RCOfferings *offerings, NSError *error) {
  NSArray<RCPackage *> *packages;
  
  if (user.isPaidDownload) {
    packages = [offerings offeringWithIdentifier:"paid_download_offer"].availablePackages;
  } else if (user.signedUpOver30DaysAgo) {
    packages = [offerings offeringWithIdentifier:"long_term_offer"].availablePackages;
  } else if (user.recentlyChurned) {
    packages = [offerings offeringWithIdentifier:"ios_subscription_offer"].availablePackages;
  }
  
  [self presentPaywallWithPackages:packages];
}];
```
```kotlin
Purchases.sharedInstance.getOfferingsWith({ error ->
  // An error occurred
}) { offerings ->
  val packages: Package? = when {
    user.isPaidDownload -> offerings["paid_download_offer"]?.availablePackages
    user.signedUpOver30DaysAgo -> offerings["long_term_offer"]?.availablePackages
    user.recentlyChurned -> offerings["ios_subscription_offer"].availablePackages
    else -> null
  }
	presentPaywall(packages)
}
```
```java
Purchases.getSharedInstance().getOfferings(new ReceiveOfferingsListener() {
  @Override
  public void onReceived(@NonNull Offerings offerings) {
    List<Package> packages = null;
    if (user.isPaidDownload) {
      if (offerings.get("paid_download_offer") != null) {
        packages = offerings.get("paid_download_offer").getAvailablePackages();
      }
    } else if (user.signedUpOver30DaysAgo) {
      if (offerings.get("long_term_offer") != null) {
        packages = offerings.get("long_term_offer").getAvailablePackages();
      }
    }
    presentPaywall(packages);
  }
  
  @Override
  public void onError(@NonNull PurchasesError error) {
    // An error occurred
  }
});
```
```javascript
Purchases.getOfferings(
      offerings => {
        let packages;
        if (user.isPaidDownload) {
          packages = offerings.all["paid_download_offer"].availablePackages;
        } else if (user.signedUpOver30DaysAgo) {
          packages = offerings.all["long_term_offer"].availablePackages;
        } else if (user.recentlyChurned) {
          packages = offerings.all["ios_subscription_offer"].availablePackages;
        }
        presentPaywall(packages);
      },
      error => {

      }
  );
```
```csharp
var purchases = GetComponent<Purchases>();
purchases.GetOfferings((offerings, error) =>
{
  List<Purchases.Package> packages;
  if (user.isPaidDownload) {
    packages = offerings.All["paid_download_offer"].AvailablePackages;
  } else if (user.signedUpOver30DaysAgo) {
    packages = offerings.All["long_term_offer"].AvailablePackages;
  } else if (user.recentlyChurned) {
    packages = offerings.All["ios_subscription_offer"].AvailablePackages;
  }
  presentPaywall(packages);
});
```

[block:callout]
{
  "type": "info",
  "body": "As of now, cohort logic needs to be managed outside of RevenueCat."
}
[/block]
# Best Practices
[block:parameters]
{
  "data": {
    "h-0": "Do",
    "h-1": "Don't",
    "0-0": "✅ Make paywalls dynamic by minimizing or eliminating any hardcoded strings",
    "0-1": "❌ Make static paywalls hardcoded with specific product IDs",
    "2-0": "✅ Allow for any number of product choices",
    "2-1": "❌ Support only a fixed number of products",
    "3-0": "✅ Support for different free trial durations, or no free trial",
    "3-1": "❌ Hardcode free trial text",
    "1-0": "✅ Use default package types",
    "1-1": "❌ Use custom package identifiers in place of a default option"
  },
  "cols": 2,
  "rows": 4
}
[/block]
# Next Steps

* Now that you've shown the correct products to users, time to [make a purchase :fa-arrow-right:](doc:making-purchases)
* Check out our [sample apps :fa-arrow-right:](doc:sample-apps) for examples of how to display products.
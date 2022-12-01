---
title: "Displaying Products"
slug: "displaying-products"
excerpt: "Build dynamic paywalls and control available products remotely"
hidden: false
metadata: 
  title: "Displaying in-app products | RevenueCat"
  description: "If you've configured Offerings in RevenueCat, you can control which products are shown to users without requiring an app update. Building paywalls that are dynamic and can react to different product configurations gives you maximum flexibility to make remote updates."
  image: 
    0: "https://files.readme.io/01438da-Reddit__E.jpg"
    1: "Reddit – E.jpg"
    2: 1200
    3: 630
    4: "#fbabaf"
createdAt: {}
updatedAt: "2020-09-15T21:40:26.189Z"
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

[block:api-header]
{
  "title": "Fetching Offerings"
}
[/block]
Offerings are fetched through the *Purchases SDK* based on their [configuration](doc:entitlements) in the RevenueCat dashboard.

The `getOfferings` method will fetch the Offerings from RevenueCat. These are pre-fetched in most cases on app launch, so the completion block to get offerings won't need to make a network request in most cases. 
[block:code]
{
  "codes": [
    {
      "code": "Purchases.shared.offerings { (offerings, error) in\n    if let packages = offerings?.current?.availablePackages {\n        // Display packages for sale\n    }\n}",
      "language": "swift"
    },
    {
      "code": "[[RCPurchases sharedPurchases] offeringsWithCompletionBlock:^(RCOfferings *offerings, NSError *error) {\n  if (offerings.current && offerings.current.availablePackages.count != 0) {\n    // Display packages for sale\n  } else if (error) {\n    // optional error handling\n  }\n}];",
      "language": "objectivec",
      "name": "Objective-C"
    },
    {
      "code": "Purchases.sharedInstance.getOfferingsWith({ error ->\n  // An error occurred\n}) { offerings ->\n  offerings.current?.availablePackages?.takeUnless { it.isNullOrEmpty() }?.let {\n    // Display packages for sale\n  }\n}",
      "language": "kotlin"
    },
    {
      "code": "Purchases.getSharedInstance().getOfferings(new ReceiveOfferingsListener() {\n  @Override\n  public void onReceived(@NonNull Offerings offerings) {\n    if (offerings.getCurrent() != null) {\n      List<Package> availablePackages = offerings.getCurrent().getAvailablePackages();\n      // Display packages for sale\n    }\n  }\n  \n  @Override\n  public void onError(@NonNull PurchasesError error) {\n    // An error occurred\n  }\n});",
      "language": "java"
    },
    {
      "code": "try {\n  Offerings offerings = await Purchases.getOfferings();\n  if (offerings.current != null && offerings.current.availablePackages.isNotEmpty) {\n    // Display packages for sale\n  }\n} on PlatformException catch (e) {\n\t// optional error handling\n} ",
      "language": "javascript",
      "name": "Flutter"
    },
    {
      "code": "try {\n  const offerings = await Purchases.getOfferings();\n  if (offerings.current !== null && offerings.current.availablePackages.length !== 0) {\n    // Display packages for sale\n  }\n} catch (e) {\n \n}",
      "language": "javascript",
      "name": "React Native"
    },
    {
      "code": "func displayUpsellScreen() {\n  Purchases.getOfferings(\n      offerings => {\n        if (offerings.current !== null && offerings.current.availablePackages.length !== 0) {  \n\t\t\t    // Display packages for sale\n        }\n      },\n      error => {\n\n      }\n  );\n}",
      "language": "javascript",
      "name": "Cordova"
    },
    {
      "code": "var purchases = GetComponent<Purchases>();\npurchases.GetOfferings((offerings, error) =>\n{\n  if (offerings.Current != null && offerings.Current.AvailablePackages.Count != 0){\n    // Display packages for sale\n  }\n});",
      "language": "csharp",
      "name": "Unity"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "If your Offerings, products, or available packages are empty, it's due to some configuration issue in App Store Connect or the Play Console. \n\nThe most common reasons for this in App Store Connect are an out-of-date 'Paid Applications Agreement' or products not at least in the 'Ready To Submit' state. On Android this usually occurs when the app is not published on a closed track and a valid test user added.\n\nYou can find more info about trouble shooting this issue in our [Help Center](https://support.revenuecat.com/hc/en-us/articles/360041793174).",
  "title": "Offerings, products or available packages empty"
}
[/block]
You must choose one Offering that is the "Current Offering" - which can easily be accessed via the `current` property of the returned offerings.

To change the current Offering, navigate to the Offerings tab for your app in the RevenueCat dashboard and click **Make current** next to the Offering you'd like to enable.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/ac52b68-Screen_Shot_2019-09-24_at_9.11.38_PM.png",
        "Screen Shot 2019-09-24 at 9.11.38 PM.png",
        1422,
        678,
        "#f5f5f5"
      ]
    }
  ]
}
[/block]
Offerings can be updated at any time, and the changes will go into effect for all users right away.


## Custom Offering identifiers
It's also possible to access other Offerings besides the "Current Offering" directly by it's identifier.
[block:code]
{
  "codes": [
    {
      "code": "Purchases.shared.offerings { (offerings, error) in\n    if let packages = offerings?.offering(identifier: \"experiment_group\").availablePackages {\n        // Display packages for sale\n    }\n}",
      "language": "swift"
    },
    {
      "code": "[[RCPurchases sharedPurchases] offeringsWithCompletionBlock:^(RCOfferings *offerings, NSError *error) {\n\tNSArray<RCPackage *> *availablePackages = [offerings offeringWithIdentifier:\"experiment_group\"].availablePackages;\n  if (availablePackages) {\n    // Display packages for sale\n  }\n}];",
      "language": "objectivec",
      "name": "Objective-C"
    },
    {
      "code": "Purchases.sharedInstance.getOfferingsWith({ error ->\n  // An error occurred\n}) { offerings ->\n  offerings[\"experiment_group\"]?.availablePackages?.takeUnless { it.isNullOrEmpty() }?.let {\n    // Display packages for sale\n  }\n}",
      "language": "kotlin"
    },
    {
      "code": "Purchases.getSharedInstance().getOfferings(new ReceiveOfferingsListener() {\n  @Override\n  public void onReceived(@NonNull Offerings offerings) {\n    if (offerings.get(\"experiment_group\") != null) {\n      List<Package> availablePackages = offerings.get(\"experiment_group\").getAvailablePackages();\n      // Display packages for sale\n    }\n  }\n  \n  @Override\n  public void onError(@NonNull PurchasesError error) {\n    // An error occurred\n  }\n});",
      "language": "java"
    },
    {
      "code": "try {\n  Offerings offerings = await Purchases.getOfferings();\n  if (offerings.getOffering(\"experiment_group\").availablePackages.isNotEmpty) {\n    // Display packages for sale\n  }\n} on PlatformException catch (e) {\n\t// optional error handling\n} ",
      "language": "javascript",
      "name": "Flutter"
    },
    {
      "code": "try {\n  const offerings = await Purchases.getOfferings();\n  if (offerings.all[\"experiment_group\"].availablePackages.length !== 0) {\n    // Display packages for sale\n  }\n} catch (e) {\n \n}",
      "language": "javascript",
      "name": "React Native"
    },
    {
      "code": "Purchases.getOfferings(\n      offerings => {\n        if (offerings.all[\"experiment_group\"].availablePackages.length !== 0) {\n\t\t\t    // Display packages for sale\n        }\n      },\n      error => {\n\n      }\n  );",
      "language": "javascript",
      "name": "Cordova"
    },
    {
      "code": "var purchases = GetComponent<Purchases>();\npurchases.GetOfferings((offerings, error) =>\n{\n  if (offerings.All.ContainsKey(\"experiment_group\") && offerings.All[\"experiment_group\"].AvailablePackages.Count != 0) {\n  \t// Display packages for sale\n  }\n});",
      "language": "csharp",
      "name": "Unity"
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "Displaying Packages"
}
[/block]
Packages help abstract platform-specific products by grouping equivalent products on iOS and Android. A package is made up of three parts: identifier, type, and underlying store product.
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

[block:api-header]
{
  "title": "Choosing which Offering to display"
}
[/block]
In practice, you may not want to display the default current Offering to every user and instead have a specific cohort that see a different Offering.

For example, displaying a higher priced Offering to users that came from [paid acquisition](doc:attribution) to help recover ad costs, or a specific Offering designed to show [iOS Subscription Offers](doc:ios-subscription-offers) when a user has [cancelled their subscription](doc:purchaserinfo#section-get-entitlement-information). 

This can be accomplished with custom Offering identifiers for each of these "cohorts".
[block:code]
{
  "codes": [
    {
      "code": "Purchases.shared.offerings { (offerings, error) in\n    var packages : [Package]?\n    \n    if user.isPaidDownload {\n        packages = offerings?.offering(identifier: \"paid_download_offer\")?.availablePackages\n    } else if user.signedUpOver30DaysAgo {\n        packages = offerings?.offering(identifier: \"long_term_offer\")?.availablePackages\n    } else if user.recentlyChurned {\n        packages = offerings?.offering(identifier: \"ios_subscription_offer\")?.availablePackages\n    }\n    \n    // Present your paywall\n}",
      "language": "swift",
      "name": "Swift"
    },
    {
      "code": "[[RCPurchases sharedPurchases] offeringsWithCompletionBlock:^(RCOfferings *offerings, NSError *error) {\n  NSArray<RCPackage *> *packages;\n  \n  if (user.isPaidDownload) {\n    packages = [offerings offeringWithIdentifier:\"paid_download_offer\"].availablePackages;\n  } else if (user.signedUpOver30DaysAgo) {\n    packages = [offerings offeringWithIdentifier:\"long_term_offer\"].availablePackages;\n  } else if (user.recentlyChurned) {\n    packages = [offerings offeringWithIdentifier:\"ios_subscription_offer\"].availablePackages;\n  }\n  \n  [self presentPaywallWithPackages:packages];\n}];",
      "language": "objectivec",
      "name": "Objective-C"
    },
    {
      "code": "Purchases.sharedInstance.getOfferingsWith({ error ->\n  // An error occurred\n}) { offerings ->\n  val packages: Package? = when {\n    user.isPaidDownload -> offerings[\"paid_download_offer\"]?.availablePackages\n    user.signedUpOver30DaysAgo -> offerings[\"long_term_offer\"]?.availablePackages\n    user.recentlyChurned -> offerings[\"ios_subscription_offer\"].availablePackages\n    else -> null\n  }\n\tpresentPaywall(packages)\n}",
      "language": "kotlin"
    },
    {
      "code": "Purchases.getSharedInstance().getOfferings(new ReceiveOfferingsListener() {\n  @Override\n  public void onReceived(@NonNull Offerings offerings) {\n    List<Package> packages = null;\n    if (user.isPaidDownload) {\n      if (offerings.get(\"paid_download_offer\") != null) {\n        packages = offerings.get(\"paid_download_offer\").getAvailablePackages();\n      }\n    } else if (user.signedUpOver30DaysAgo) {\n      if (offerings.get(\"long_term_offer\") != null) {\n        packages = offerings.get(\"long_term_offer\").getAvailablePackages();\n      }\n    }\n    presentPaywall(packages);\n  }\n  \n  @Override\n  public void onError(@NonNull PurchasesError error) {\n    // An error occurred\n  }\n});",
      "language": "java"
    },
    {
      "code": "try {\n  Offerings offerings = await Purchases.getOfferings();\n  var packages;\n  if (user.isPaidDownload) {\n    packages = offerings?.getOffering(\"paid_download_offer\")?.availablePackages;\n  } else if (user.signedUpOver30DaysAgo) {\n    packages = offerings?.getOffering(\"long_term_offer\")?.availablePackages;\n  } else if (user.recentlyChurned) {\n    packages = offerings?.getOffering(\"ios_subscription_offer\")?.availablePackages;\n  }\n  presentPaywall(packages);\n} on PlatformException catch (e) {\n\t// optional error handling\n} ",
      "language": "javascript",
      "name": "Flutter"
    },
    {
      "code": "try {\n  const offerings = await Purchases.getOfferings();\n  let packages;\n  if (user.isPaidDownload) {\n    packages = offerings.all[\"paid_download_offer\"].availablePackages;\n  } else if (user.signedUpOver30DaysAgo) {\n    packages = offerings.all[\"long_term_offer\"].availablePackages;\n  } else if (user.recentlyChurned) {\n    packages = offerings.all[\"ios_subscription_offer\"].availablePackages;\n  }\n  presentPaywall(packages);\n} catch (e) {\n \n}",
      "language": "javascript",
      "name": "React Native"
    },
    {
      "code": "  Purchases.getOfferings(\n      offerings => {\n        let packages;\n        if (user.isPaidDownload) {\n          packages = offerings.all[\"paid_download_offer\"].availablePackages;\n        } else if (user.signedUpOver30DaysAgo) {\n          packages = offerings.all[\"long_term_offer\"].availablePackages;\n        } else if (user.recentlyChurned) {\n          packages = offerings.all[\"ios_subscription_offer\"].availablePackages;\n        }\n        presentPaywall(packages);\n      },\n      error => {\n\n      }\n  );",
      "language": "javascript",
      "name": "Cordova"
    },
    {
      "code": "var purchases = GetComponent<Purchases>();\npurchases.GetOfferings((offerings, error) =>\n{\n  List<Purchases.Package> packages;\n  if (user.isPaidDownload) {\n    packages = offerings.All[\"paid_download_offer\"].AvailablePackages;\n  } else if (user.signedUpOver30DaysAgo) {\n    packages = offerings.All[\"long_term_offer\"].AvailablePackages;\n  } else if (user.recentlyChurned) {\n    packages = offerings.All[\"ios_subscription_offer\"].AvailablePackages;\n  }\n  presentPaywall(packages);\n});",
      "language": "csharp",
      "name": "Unity"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "As of now, cohort logic needs to be managed outside of RevenueCat."
}
[/block]

[block:api-header]
{
  "title": "Best Practices"
}
[/block]

[block:parameters]
{
  "data": {
    "h-0": "Do",
    "h-1": "Don't",
    "0-0": "✅Make paywalls dynamic by minimizing or eliminating any hardcoded strings",
    "0-1": "❌Make static paywalls hardcoded with specific product IDs",
    "2-0": "✅Allow for any number of product choices",
    "2-1": "❌Support only a fixed number of products",
    "3-0": "✅Support for different free trial durations, or no free trial",
    "3-1": "❌Hardcode free trial text",
    "1-0": "✅Use default package types",
    "1-1": "❌Use custom package identifiers in place of a default option"
  },
  "cols": 2,
  "rows": 4
}
[/block]

[block:api-header]
{
  "title": "Next Steps"
}
[/block]
* Now that you've shown the correct products to users, it's time to [make a purchase :fa-arrow-right:](doc:making-purchases)
* Check out our [sample apps :fa-arrow-right:](doc:sample-apps) for examples of how to display products.
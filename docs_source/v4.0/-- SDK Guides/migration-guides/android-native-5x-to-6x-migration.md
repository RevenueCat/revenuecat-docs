---
title: "Android Native - 5.x to 6.x Migration"
slug: "android-native-5x-to-6x-migration"
excerpt: "New Google subscription model migration"
hidden: true
createdAt: "2023-01-09T02:40:39.741Z"
updatedAt: "2023-03-01T19:42:06.121Z"
---
Thank you for taking the time to test our first release with the new Google subscription model. In this document we will specify the capabilities and steps to migrate and test your app using this version. Note that since this is a beta version, the SDK API is subject to change in future versions.

## Limitations

If any of these features are critical for your app, please **do not** use this beta and wait until a future version of the SDK is available.
[block:parameters]
{
  "data": {
    "h-0": "Limitations",
    "h-1": "Supported versions?",
    "0-1": "❌",
    "0-0": "Observer mode won’t work with this version of the SDK. If you try to use it, it will throw an exception.",
    "1-0": "The Amazon store won’t work with this version of the SDK. If you try to use it, it will throw an exception.",
    "2-0": "The “Purchase.syncPurchases” method won’t work with version 6.0 of the SDK. If you try to use it, it will throw an exception. This method is only recommended for observer mode or when migrating your own implementation to RevenueCat.",
    "3-0": "Changing subscription products (upgrades/downgrades) will use the RevenueCat default proration mode of `IMMEDIATE_WITHOUT_PRORATION`. More proration modes may become available as the alpha and beta phases progress.",
    "4-0": "Avoid purchases with a developer-determined offer in the EU. You may be in violation of the Consumer Rights Directive if you do so (see [Google’s docs](https://developer.android.com/google/play/billing/integrate#personalized-price) on the matter).. Let your contact at RevenueCat know if this is a priority for you.",
    "1-1": "❌",
    "2-1": "❌",
    "3-1": "❌",
    "4-1": "❌"
  },
  "cols": 2,
  "rows": 5
}
[/block]
## Google Product setup
Google introduced a lot of new concepts in their new subscription model. Here are some definitions:
- **Subscription**: A subscription represents access to a set of features of your app. It can have 1 or more base plans.
- **Base plan**: represents an auto-renewing or prepaid period subscription. You can have multiple base plans in a single subscription to support different subscription periods.
- **Offer**: represents an offer on a base plan. Google’s billing client returns the offers that a user is eligible for. There are 3 eligibility criteria: 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/3aede2a-Screen_Shot_2023-01-12_at_11.44.20_AM.png",
        "Screen Shot 2023-01-12 at 11.44.20 AM.png",
        1692,
        638,
        "#000000"
      ],
      "sizing": "80",
      "border": true
    }
  ]
}
[/block]
- **Phase**: Allows to specify the pricing of the offer. You can add up to 2 “phases” to an offer. There are 3 types of offer:
- - Free trial: It provides access for free for a specific period of time
- - Single payment: Subscribers pay upfront for a specific period of time
- - Discounted recurring payment: Subscribers get a discount for a specific number of subscription periods.
- **Tags**: Strings you can add to a base plan or offer to help you identify the base plan / offer in the client.

This is a more visual representation of the relationship between these concepts:
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/8fa740d-Screen_Shot_2023-01-12_at_5.06.28_PM.png",
        "Screen Shot 2023-01-12 at 5.06.28 PM.png",
        2218,
        250,
        "#000000"
      ]
    }
  ]
}
[/block]
Our recommendation is to:
- Create a subscription for each set of features you need to unlock (e.g. “Pro”, “Premium”,…)
- Create a base plan for each renewal period you want to provide your users (e.g. “monthly”, “yearly”,...)
- If you want to provide free trials or other types of offers, add an offer with your choice of eligibility criteria and the appropriate phase. For example, to add a free trial for new users, you can create an offer with eligibility criteria “New customer acquisition” and a free trial phase with your desired duration.

**Note**: Existing subscriptions should still work, but you don’t need to create multiple subscriptions for different durations anymore. You should instead create multiple base plans for the same subscription.

If you plan to have multiple offers for the same plan or have developer determined offers, we highly recommend you add tags for each offer so it’s easier to identify them later. It is not needed from a RevenueCat perspective but is just best practice for you to manage these offers on your paywall. 

## RevenueCat Product Setup

Once you have created your products in Google, you can add your products in the RevenueCat dashboard. The entitlements, offerings and packages of your dashboard should remain the same. However, to add new products, the UI has changed. 

There are two ways to add products via the RevenueCat dashboard. 

### 1. Automatic Import 

Currently, this functionality is limited to importing subscriptions, but one-time purchases are in the works. 


[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/fe78bbb-Screen_Shot_2023-01-12_at_5.06.34_PM.png",
        "Screen Shot 2023-01-12 at 5.06.34 PM.png",
        2204,
        1184,
        "#000000"
      ],
      "sizing": "80",
      "border": true
    }
  ]
}
[/block]
### 2. Manual Import

For manual import, you need to add both your subscription ID and your base plan ID when adding a new product. 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/c8b5476-Screen_Shot_2023-01-12_at_5.10.18_PM.png",
        "Screen Shot 2023-01-12 at 5.10.18 PM.png",
        1468,
        1296,
        "#000000"
      ],
      "sizing": "80",
      "border": true
    }
  ]
}
[/block]
You can find this information in the Google Play Console here:
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/9d0e770-Screen_Shot_2023-01-12_at_5.07.03_PM.png",
        "Screen Shot 2023-01-12 at 5.07.03 PM.png",
        1982,
        1394,
        "#000000"
      ],
      "sizing": "80",
      "border": true
    }
  ]
}
[/block]
After you’ve added your products, you can assign them to packages the same as before. You can follow the documentation [here](https://www.revenuecat.com/docs/entitlements).

## Default Offer Selection

With the new configuration options, there could be multiple offers available when purchasing a `Package` or `StoreProduct`. The new `purchaseSubscriptionOption` function can be used to explicitly choose which offer (or base plan) you'd like to purchase. If you want to keep using `purchasePackage` and `purchaseProduct`, the SDK will choose which option to purchase as the "default offer".

The following logic will be used to determine the default `SubscriptionOption` to purchase:
- Filters out offers with `rc-ignore-default-offer` tag
- Uses `SubscriptionOption` with the longest free trial or cheapest first phase
- Falls back to use base plan

## Migration Guide

The full SDK migration reference can be found here: https://github.com/RevenueCat/purchases-android/blob/bc5-support/migrations/v6-MIGRATION.md 

These are the abstraction models we use to support Google’s new features:
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/ede6b16-Screen_Shot_2023-01-18_at_9.11.44_AM.png",
        "Screen Shot 2023-01-18 at 9.11.44 AM.png",
        795,
        246,
        "#000000"
      ]
    }
  ]
}
[/block]
With v6.x, the new `purchaseSubscriptionOptionWith`/`purchaseSubscriptionOption` functions now require you as the developer to pass an additional `SubscriptionOption` parameter to the method indicating the base plan or offer the user will be purchasing for a particular subscription.

The previous purchase functions (`purchaseProduct`, `purchasePackage`, `purchaseProductWith`, and `purchasePackageWith`) will purchase a default option with logic described [above](#default-offer-selection).

### Migration implementation steps

1. Update RevenueCat to version `6.0.0-alpha.4`. You can do this in your app’s module build.gradle.
```kotlin
implementation "com.revenuecat.purchases:purchases:6.0.0-alpha.4"
```

2. Adapt your paywall to use the new SDK. 

- The `price` property on `StoreProduct` (which is either the one-time purchase price or subscription's base plan price) is now a `Price` object
- There are also price related fields on the `StoreProduct` > `SubscriptionOption` > `PricingPhase` model. 

Follow the migration reference doc to migrate all the changes. These are some examples of code changes you might have to do:

```kotlin
// To get the price for your product after all offers

// Old:
Purchases.sharedInstance.getOfferingsWith(
     onError = { /* ... */ }, 
     onSuccess = { offerings ->  
         val price = offerings.current?.annual?.product?.price
         /* Do something with price */
     }
)

// New:
Purchases.sharedInstance.getOfferingsWith(
     onError = { /* ... */ },
     onSuccess = { offerings ->
         val price = offerings.current?.annual?.product?.price?.formatted
         /* Do something with price */
     }
)
```

```kotlin
// To purchase a subscription with a free trial

// Old:
Purchases.sharedInstance.purchasePackageWith(
    activity, 
    packageToPurchase = myPackage, 
    onError = { _, _ -> /* handle error */ }, 
    onSuccess = { _, _ -> /* handle success */ }
)

// New:
Purchases.sharedInstance.purchaseSubscriptionOptionWith(
    activity,
    subscriptionOption = freeTrialSubscriptionOption, // You need to obtain this with storeProduct.subscriptionOptions?.freeTrial
    onError = { _, _ -> /* handle error */ },
    onSuccess = { _, _ -> /* handle success */ }
)
```

3. If you are using products with offers:
 - If you keep using the existing purchase functions, the [default offer logic](#default-offer-selection) will be applied to choose which option to purchase. 
- If you want more control, you will need to choose the purchase option that includes your offer from your `StoreProduct`. A possible way to identify a free trial is `storeProduct.subscriptionOptions?.freeTrial`. Alternatively, you can add tags to your offer and filter them through the `storeProduct.subscriptionOptions?.withTag("your-tag")`.

## Updating to Newer Releases

There could be breaking changes in V6 between releases while V6 is in the alpha and beta phases. The above migration guide will always be up-to-date with the latest alpha/beta release. See the individual releases on the [Purchases-Android GitHub Releases](https://github.com/RevenueCat/purchases-android/releases) page for new features, fixes, and breaking changes between releases.

## Feedback

Please let us know if you have any issues and pain points you had during the migration or any feedback you would like to provide. You can contact us at https://app.revenuecat.com/settings/support.
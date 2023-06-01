---
title: Using Purchases 5.x for Google Play
slug: using-purchases-5x-for-google-play
hidden: true
createdAt: '2023-03-28T16:21:16.254Z'
updatedAt: '2023-03-28T16:55:13.172Z'
category: 6478b8643a66a114558bdd69
---
> 🚧 Legacy documentation
> 
> This guide references `purchases-android` v5.x, which is deprecated. We recommend upgrading to 6.x which uses the new Google subscription model. This guide will no longer be updated.
> 
> Read more in our migration guide [here](doc:android-native-5x-to-6x-migration).

## Product Configuration

In order to continue using version 5.x of RevenueCat's Purchases SDK, you must set the App compatibility setting in the RevenueCat dashboard to `SDK v6+ and backwards compatible`.

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/3e6b434-96831d2-Screenshot_2023-03-27_at_11.03.06.png",
        null,
        ""
      ],
      "align": "left",
      "sizing": "50% ",
      "border": true
    }
  ]
}
[/block]



Additionally, products in Google Play should be marked as Backwards Compatible.

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/a8da8e6-db3ff67-image_2.png",
        null,
        ""
      ],
      "align": "left",
      "sizing": "50% ",
      "border": true
    }
  ]
}
[/block]



## SDK Installation

Purchases for Android can be installed by adding the following to your `build.gradle`:

[block:file]
{"language":"Text","name":"build.gradle","file":"code_blocks/📙 Platform Resources/google-platform-resources/using-purchases-5x-for-google-play_1.Text"}
[/block]



Purchases for Android v5.x supports BillingClient 4.0.

## SDK Configuration

With version 5.x installed, you can import `Purchases`:

[block:file]
{"language":"Text","name":"Java","file":"code_blocks/📙 Platform Resources/google-platform-resources/using-purchases-5x-for-google-play_2.Text"}
[/block]



**Configure Proguard**

You should add `-keep class com.revenuecat.purchases.** { *; }` to you Proguard configuration.

### Initialization

After importing `Purchases`, you can initialize the SDK with your API key:

[block:file]
{"language":"Text","name":"Kotlin","file":"code_blocks/📙 Platform Resources/google-platform-resources/using-purchases-5x-for-google-play_3.Text"}
[/block]



## Fetching Products and Offerings

### Fetching Offerings

**Only** backwards compatible purchases, as mentioned above, can be fetched using Purchases for Android 5.x. Calling the `getOfferings` method will fetch your product configuration from RevenueCat:

[block:file]
{"language":"Text","name":"Kotlin","file":"code_blocks/📙 Platform Resources/google-platform-resources/using-purchases-5x-for-google-play_4.Text"}
[/block]



If your offerings, products, or available packages are empty, it's due to some configuration issue in the Play Console or in your project dashboard in RevenueCat. Generally, it's not an indication of an issue with RevenueCat, but rather typos, or an invalid tester, or using simulated devices instead of real devices. 

You can read more about empty offerings [here](https://community.revenuecat.com/sdks-51/why-are-offerings-or-products-empty-124).

### Displaying Packages and Products

Packages help abstract platform-specific products by grouping equivalent products across iOS, Android, and web. A package is made up of three parts: identifier, type, and underlying store product.

Packages can be access in a few different ways:

- via the `.availablePackages` property on an Offering
- via the duration convenience property on an Offering
- via the package identifier directly

[block:file]
{"language":"Text","name":"Kotlin","file":"code_blocks/📙 Platform Resources/google-platform-resources/using-purchases-5x-for-google-play_5.Text"}
[/block]



Each package includes an underlying product that includes more information about the price, duration, and other metadata. You can access the product via the storeProduct property:

[block:file]
{"language":"Text","name":"Kotlin","file":"code_blocks/📙 Platform Resources/google-platform-resources/using-purchases-5x-for-google-play_6.Text"}
[/block]



## Making Purchases

The SDK has a simple method, purchase(package:), that takes a package from the fetched Offering and purchases the underlying product with Google:

[block:file]
{"language":"Text","name":"Kotlin","file":"code_blocks/📙 Platform Resources/google-platform-resources/using-purchases-5x-for-google-play_7.Text"}
[/block]



The `purchase(package:)` completion block will contain an updated [CustomerInfo](https://www.revenuecat.com/docs/customer-info) object if successful, along with some details about the transaction.

If the `error` object is present, then the purchase failed. See our guide on [Error Handling](https://www.revenuecat.com/docs/errors) for the specific error types.

The `userCancelled` boolean is a helper for handling user cancellation errors. There will still be an error object if the user cancels, but you can optionally check the boolean instead of unwrapping the error completely.

> 🚧 Warning: Automatic Transaction Finishing/Acknowledgement/Consumption
> 
> Transactions (new and previous transactions that are synced) will be automatically finished (acknowledged and consumed in Android), and will be made available through the RevenueCat SDK / Dashboard / ETL Exports.
> 
> You can use observer mode if you don't wish to have transactions finished (or consumed, in Android) automatically, but you will have to make sure that you finish/consume them yourself.

### Observer Mode

Observer Mode is optional, and enables you to capture new or migrate your existing subscribers to RevenueCat while retaining your existing code for fetching products, making purchases, and checking subscription status. This allows you to access to the advanced charting, webhooks, and integrations that RevenueCat provides as quickly as possible and with minimal engineering effort.

#### Enable Observer Mode

When configuring the SDK, pass the `observerMode` property as part of the configuration builder:

[block:file]
{"language":"Text","name":"Kotlin","file":"code_blocks/📙 Platform Resources/google-platform-resources/using-purchases-5x-for-google-play_8.Text"}
[/block]



#### Sync Purchases

On Android with Google Play (including cross-platform SDKs running on Android), any time a purchase or restore occurs in your app you should call the syncPurchases method to record it in RevenueCat. **Failure to do so will result in no purchases being recorded.**

[block:file]
{"language":"Text","name":"Kotlin","file":"code_blocks/📙 Platform Resources/google-platform-resources/using-purchases-5x-for-google-play_9.Text"}
[/block]
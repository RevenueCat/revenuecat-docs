---
title: Android
slug: android
excerpt: Instructions for installing Purchases SDK for Android
hidden: false
metadata:
  title: Install Android SDK – RevenueCat
  description: RevenueCat handles the pain points of in-app purchases and subscriptions
    for Android, so you can get back to building your app.
  image:
    0: https://files.readme.io/e87f981-RevenueCat_Docs_OG.png
    1: RevenueCat Docs OG.png
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: '2023-04-17T16:07:45.008Z'
category: 648c78a1dbb1aa005e52ed52
order: 1
parentDoc: 648c7f084ca0960014e5d032
updatedAt: '2023-06-16T16:42:23.717Z'
---
# What is RevenueCat?

RevenueCat provides a backend and a wrapper around StoreKit and Google Play Billing to make implementing in-app purchases and subscriptions easy. With our SDK, you can build and manage your app business on any platform without having to maintain IAP infrastructure. You can read more about [how RevenueCat fits into your app](https://www.revenuecat.com/blog/growth/where-does-revenuecat-fit-in-your-app/) or you can [sign up free](https://app.revenuecat.com/signup) to start building.

# Android

## Installation

Purchases for Android (Google Play and Amazon Appstore) is available on Maven and can be included via Gradle.

[![Release](https://img.shields.io/github/release/RevenueCat/purchases-android.svg?style=flat)](https://github.com/RevenueCat/purchases-android/releases)

```groovy build.gradle
implementation 'com.revenuecat.purchases:purchases:6.0.0'
```



## Import Purchases

You should now be able to import `Purchases`.

```java 
import com.revenuecat.purchases.CustomerInfo;
import com.revenuecat.purchases.Entitlement;
import com.revenuecat.purchases.Offering;
import com.revenuecat.purchases.Purchases;
import com.revenuecat.purchases.models.Period;
import com.revenuecat.purchases.models.Price;
import com.revenuecat.purchases.models.StoreProduct;
```



## Configure Proguard (Optional)

We are adding Proguard rules to the library so you don't need to do anything. If you have any issues finding classes in our SDK, try adding `-keep class com.revenuecat.purchases.** { *; }` to your Proguard configuration.

# Amazon

## Additional Dependencies

Add a new dependency to the build.gradle apart from the regular `purchases` dependency. These new dependencies have the classes needed to use Amazon IAP:

```groovy build.gradle
implementation 'com.revenuecat.purchases:purchases:6.0.0'
implementation 'com.revenuecat.purchases:purchases-store-amazon:6.0.0'
```



## Add Amazon public key

Adding support for Amazon requires adding a `.pem` public key to your project. You can configure this key by following Amazon's guide [here](https://developer.amazon.com/es/docs/in-app-purchasing/integrate-appstore-sdk.html#configure_key).

Due to some limitations, RevenueCat will only validate purchases made in production or in Live App Testing and won't validate purchases made with the Amazon App Tester.

# Next Steps

- Now that you've installed the Purchases SDK in your Android app, get started by [configuring an instance of Purchases ](https://www.revenuecat.com/docs/getting-started#4-using-revenuecats-purchases-sdk)
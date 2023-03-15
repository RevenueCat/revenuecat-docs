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
createdAt: '2022-08-30T22:56:16.339Z'
updatedAt: '2022-08-30T22:56:16.339Z'
category: 640a7bef79274d00428d102b
---
# What is RevenueCat?

RevenueCat provides a backend and a wrapper around StoreKit and Google Play Billing to make implementing in-app purchases and subscriptions easy. With our SDK, you can build and manage your app business on any platform without having to maintain IAP infrastructure. You can read more about [how RevenueCat fits into your app](https://www.revenuecat.com/blog/where-does-revenuecat-fit-in-your-app) or you can [sign up free](https://app.revenuecat.com/signup) to start building.

# Android
## Installation

Purchases for Android (Google Play and Amazon Appstore) is available on Maven and can be included via Gradle.

[![Release](https://img.shields.io/github/release/RevenueCat/purchases-android.svg?style=flat)](https://github.com/RevenueCat/purchases-android/releases)
[block:code]
{
  "codes": [
    {
      "code": "implementation 'com.revenuecat.purchases:purchases:5.4.0'",
      "language": "groovy",
      "name": "build.gradle"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "warning",
  "title": "Billing Client 5 Unsupported",
  "body": "We're working on updating our SDKs for compatibility with Billing Client 5.0. See this [community thread](https://community.revenuecat.com/tips-discussion-56/google-i-o-22-announcements-rc-product-priorities-1620?postid=5842#post5842) for updates. For now, RevenueCat is only compatible with Billing Client 4.0."
}
[/block]
## Import Purchases

You should now be able to import `Purchases`.
[block:code]
{
  "codes": [
    {
      "code": "import com.android.billingclient.api.SkuDetails;\nimport com.revenuecat.purchases.Entitlement;\nimport com.revenuecat.purchases.Offering;\nimport com.revenuecat.purchases.PurchaserInfo;\nimport com.revenuecat.purchases.Purchases;",
      "language": "java"
    }
  ]
}
[/block]
## Configure Proguard

You should add `-keep class com.revenuecat.purchases.** { *; }` to your Proguard configuration.

# Amazon

## Additional Dependencies

Add a new dependency to the build.gradle apart from the regular `purchases` dependency. These new dependencies have the classes needed to use Amazon IAP:
[block:code]
{
  "codes": [
    {
      "code": "implementation 'com.revenuecat.purchases:purchases:5.4.0'\nimplementation 'com.revenuecat.purchases:purchases-store-amazon:5.4.0'",
      "language": "groovy",
      "name": "build.gradle"
    }
  ]
}
[/block]

## Add Amazon public key

Adding support for Amazon requires adding a `.pem` public key to your project. You can configure this key by following Amazon's guide [here](https://developer.amazon.com/es/docs/in-app-purchasing/integrate-appstore-sdk.html#configure_key).

Due to some limitations, RevenueCat will only validate purchases made in production or in Live App Testing and won't validate purchases made with the Amazon App Tester.

# Next Steps

* Now that you've installed the Purchases SDK in your Android app, get started by [configuring an instance of Purchases :fa-arrow-right:](doc:getting-started-1#section-configure-purchases)
---
title: "Android"
slug: "android"
excerpt: "Instructions for installing Purchases SDK for Android"
hidden: false
metadata: 
  title: "In-App Purchase Installation for Android – RevenueCat"
  description: "RevenueCat handles the pain points of in-app purchases and subscriptions for Android, so you can get back to building your app."
  image: 
    0: "https://files.readme.io/5c97626-OG_image.png"
    1: "OG image.png"
    2: 1200
    3: 627
    4: "#e9acb0"
createdAt: {}
updatedAt: "2021-09-15T17:55:23.969Z"
---
# What is RevenueCat?

RevenueCat provides a backend and a wrapper around StoreKit and Google Play Billing to make implementing in-app purchases and subscriptions easy. With our SDK, you can build and manage your app business on any platform without having to maintain IAP infrastructure. You can read more about [how RevenueCat fits into your app](https://www.revenuecat.com/blog/where-does-revenuecat-fit-in-your-app) or you can [sign up free](https://app.revenuecat.com/signup) to start building.

# Installation

Purchases for Android is available on Maven and can be included via Gradle.

[![Release](https://img.shields.io/github/release/RevenueCat/purchases-android.svg?style=flat)](https://github.com/RevenueCat/purchases-android/releases)
[block:code]
{
  "codes": [
    {
      "code": "implementation 'com.revenuecat.purchases:purchases:4.3.1'",
      "language": "groovy",
      "name": "build.gradle"
    }
  ]
}
[/block]
# Import Purchases

You should now be able in import `Purchases`
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
# Configure Proguard

You should add `-keep class com.revenuecat.purchases.** { *; }` to your Proguard configuration.

# Next Steps

* Now that you've installed the Purchases SDK in your Android app, get started by [configuring an instance of Purchases :fa-arrow-right:](doc:getting-started-1#section-configure-purchases)
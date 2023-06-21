---
title: Android
slug: android
excerpt: Instructions for installing Purchases SDK for Android
hidden: false
createdAt: '2023-04-17T16:07:45.008Z'
---
# What is RevenueCat?

RevenueCat provides a backend and a wrapper around StoreKit and Google Play Billing to make implementing in-app purchases and subscriptions easy. With our SDK, you can build and manage your app business on any platform without having to maintain IAP infrastructure. You can read more about [how RevenueCat fits into your app](https://www.revenuecat.com/blog/growth/where-does-revenuecat-fit-in-your-app/) or you can [sign up free](https://app.revenuecat.com/signup) to start building.

# Android

## Installation

Purchases for Android (Google Play) is available on Maven and can be included via Gradle.

[![Release](https://img.shields.io/github/release/RevenueCat/purchases-android.svg?style=flat)](https://github.com/RevenueCat/purchases-android/releases)

[block:file]
{"language":"groovy","name":"build.gradle","file":"code_blocks/🚀 Getting Started/installation/android_1.groovy"}
[/block]



## Import Purchases

You should now be able to import `Purchases`.

[block:file]
{"language":"java","name":"","file":"code_blocks/🚀 Getting Started/installation/android_2.java"}
[/block]



## Configure Proguard (Optional)

We are adding Proguard rules to the library so you don't need to do anything. If you have any issues finding classes in our SDK, try adding `-keep class com.revenuecat.purchases.** { *; }` to your Proguard configuration.

# Amazon

## Additional Dependencies

Add a new dependency to the build.gradle apart from the regular `purchases` dependency. These new dependencies have the classes needed to use Amazon IAP:

[block:file]
{"language":"groovy","name":"build.gradle","file":"code_blocks/🚀 Getting Started/installation/android_3.groovy"}
[/block]



## Add Amazon public key

Adding support for Amazon requires adding a `.pem` public key to your project. You can configure this key by following Amazon's guide [here](https://developer.amazon.com/es/docs/in-app-purchasing/integrate-appstore-sdk.html#configure_key).

Due to some limitations, RevenueCat will only validate purchases made in production or in Live App Testing and won't validate purchases made with the Amazon App Tester.

# Next Steps

- Now that you've installed the Purchases SDK in your Android app, get started by [configuring an instance of Purchases ](https://www.revenuecat.com/docs/getting-started#4-using-revenuecats-purchases-sdk)

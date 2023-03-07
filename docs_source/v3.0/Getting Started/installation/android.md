---
title: "Android"
slug: "android"
excerpt: "Instructions for installing Purchases SDK for Android"
hidden: false
metadata: 
  title: "Android Purchases SDK | RevenueCat"
  description: "RevenueCat handles the pain points of in-app purchases and subscriptions for Android, so you can get back to building your app."
  image: 
    0: "https://files.readme.io/c2c4470-Reddit__E.png"
    1: "Reddit – E.png"
    2: 2400
    3: 1260
    4: "#fbabb0"
createdAt: {}
updatedAt: "2020-07-30T02:44:08.042Z"
---
###What is RevenueCat?

RevenueCat is an in-app subscription platform that makes it easy to build and manage IAPs on any platform. With the RevenueCat SDK, you can build and manage your app business on any platform without having to maintain purchase infrastructure. You can read more about [how RevenueCat fits into your app](https://www.revenuecat.com/blog/where-does-revenuecat-fit-in-your-app) or you can [sign up free](https://app.revenuecat.com/signup) to start building.
[block:api-header]
{
  "title": "Installation"
}
[/block]
Purchases for Android is available on Maven and can be included via Gradle.
[block:code]
{
  "codes": [
    {
      "code": "implementation 'com.revenuecat.purchases:purchases:3.4.0'",
      "language": "groovy",
      "name": "build.gradle"
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "Importing Purchases"
}
[/block]
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

[block:api-header]
{
  "title": "Configure Proguard"
}
[/block]
You should add `-keep class com.revenuecat.purchases.** { *; }` to your Proguard configuration.
[block:api-header]
{
  "title": "Next Steps"
}
[/block]
* Now that you've installed the Purchases SDK in your Android app, get started by [configuring an instance of Purchases :fa-arrow-right:](doc:getting-started-1#section-configure-purchases)
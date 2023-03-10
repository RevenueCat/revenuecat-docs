---
title: "Android"
slug: "android"
excerpt: "Instructions for installing Purchases SDK for Android"
hidden: false
createdAt: "2018-06-11T03:51:25.904Z"
updatedAt: "2019-11-13T20:56:20.350Z"
---
[block:callout]
{
  "type": "warning",
  "title": "New version available",
  "body": "Our version 3.0 SDK is available for Android with a more powerful way to organize and configure products remotely. \n\n[**Go to the new docs :fa-arrow-right:**](https://docs.revenuecat.com/v3.0/docs)"
}
[/block]

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
      "code": "implementation 'com.revenuecat.purchases:purchases:2.4.1'",
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
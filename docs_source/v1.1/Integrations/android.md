---
title: "Android"
slug: "android"
hidden: false
createdAt: "2018-06-11T03:51:25.904Z"
updatedAt: "2018-11-29T23:09:25.940Z"
---
[block:api-header]
{
  "title": "Installation"
}
[/block]
The Purchases framework is available on Maven and can be included via Gradle. Google's Billing library must be included as a provided dependency.
[block:code]
{
  "codes": [
    {
      "code": "implementation 'com.android.billingclient:billing:1.0'\nimplementation 'com.revenuecat.purchases:purchases:1.4.0'",
      "language": "groovy",
      "name": "build.gradle"
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "Sample Code"
}
[/block]
See the [Purchases Sample](https://github.com/RevenueCat/purchases-android/blob/master/purchases-sample/src/main/java/com/revenuecat/purchases_sample/MainActivity.java#L81) for an example of integrating Purchases in your project.
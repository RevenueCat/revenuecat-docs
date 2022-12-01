---
title: "Configuring Products"
slug: "configuring-products"
excerpt: "Use Entitlements and Offerings to organize and display products"
hidden: true
createdAt: "2019-08-29T20:21:57.729Z"
updatedAt: "2019-09-24T19:31:53.479Z"
---
[block:callout]
{
  "type": "warning",
  "title": "Legacy Entitlements",
  "body": "If your app is using the legacy version of Entitlements, you can view the old documentation and upgrade guide [here](doc:legacy-entitlements)."
}
[/block]
The RevenueCat dashboard allows you to configure your available in-app products remotely and control how they're presented without the need to update your app. This is great for experimenting how different product configurations effect key subscription metrics.

There are three levels of product configuration available within RevenueCat:
  1. Entitlements
  2. Offerings
  3. Products

##Entitlements
An entitlement represents features or content that a user is "entitled" to.

Entitlements can be unlocked by having an active subscription or making a one-time purchase. Most subscription apps only have one entitlement, unlocking all premium features. However, if you had two tiers of content such as Pro and Pro Plus, you would have 2 entitlements.

##Offerings
The selection of products that are offered to a user.

Offerings allow you to choose which combination of products are shown to a user on your paywall or upsell screen. For example your default Offering may contain a monthly and annual subscription, but you might want to experiment with Offerings with a different combination of subscription durations, trial lengths, prices, etc.

Each Offering contains one or more **Packages**. Packages are simply a group of equivalent products across iOS, Android, and Stripe. If your app is available on multiple platforms, then a Package would contain all of the equivalent product Ids from each platform.


##Products
Products are a one-to-one mapping of the product identifiers configured for your app in App Store Connect, Play Store and Stripe. 

TODO: Update diagram showing Entitlements -> Offerings -> Packages -> Products
[block:api-header]
{
  "title": "Configuration"
}
[/block]
## 1. Set up products in the app stores
Before products can be purchased, they need to be properly set up in App Store Connect, Play Console, and Stripe. If you've never set up products before or are experiencing issues, our posts on [iOS](https://www.revenuecat.com/2018/10/11/configuring-in-app-products-is-hard) and [Android](https://www.revenuecat.com/2019/02/22/from-zero-to_android-subscriptions-configuration) product setup may be useful. 

If products are not configured correctly, you will see an invalid products message in the [debug logs](doc:debugging).

## 2. Add products to RevenueCat


## 3. Configure Entitlements
Create Entitlements
Add Products
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/26dbfa6-de42988-Entitlements_2.0_Copy.png",
        "de42988-Entitlements_2.0_Copy.png",
        679,
        1254,
        "#fafaf9"
      ]
    }
  ]
}
[/block]
## 4. Configure Offerings
Create Offering 
Create Package
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/2109169-1628274-Entitlements_2.0.png",
        "1628274-Entitlements_2.0.png",
        1154,
        1254,
        "#f6f6f5"
      ]
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "Displaying products in your app"
}
[/block]
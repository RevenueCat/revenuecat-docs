---
title: Configuring Products [LEGACY]
slug: configuring-products-legacy
excerpt: Use Entitlements and Offerings to organize and display products
hidden: true
categorySlug: documentation
order: 17
---
[block:callout]
{
  "type": "warning",
  "title": "Legacy Entitlements",
  "body": "If your app is using the legacy version of Entitlements, you can view the old documentation and upgrade guide [here](doc:legacy-entitlements)."
}
[/block]
The RevenueCat dashboard allows you to configure your available in-app products remotely so you can control how they're presented without the need to update your app. This is great for experimenting how different product configurations effect key subscription metrics.

There are three levels of product configuration available within RevenueCat:
  1. Entitlements
  2. Offerings
  3. Products

##Entitlements
An entitlement represents features or content that a user is "entitled" to.

Entitlements can be unlocked by having an active subscription or making a one-time purchase. Most subscription apps only have one entitlement, unlocking all premium features. However, if you had two tiers of content such as Pro and Pro Plus, you would have 2 entitlements.
[block:callout]
{
  "type": "info",
  "title": "Non-subscription products",
  "body": "If you have non-subscription products, you may or may not want to add them to entitlements depending on your use case. If the product is non-consumable (e.g. lifetime access to \"pro\" features), you likely want to attach it to an entitlement. However, if it is consumable (e.g. purchase more lives in a game) you likely do not want to add them to an entitlement. Whether a product is part of an entitlement or not, they can still be purchased the same way using the Purchases SDK. Learn more at [Making Purchases](https://docs.revenuecat.com/docs/making-purchases)."
}
[/block]

![](https://files.readme.io/811b48f-de42988-Entitlements_2.0_Copy.png "de42988-Entitlements_2.0_Copy.png")
##Offerings
The selection of products that are offered to a user.

Offerings allow you to choose which combination of products are shown to a user on your paywall or upsell screen. For example your default Offering may contain a monthly and annual subscription, but you might want to experiment with Offerings with a different combination of subscription durations, trial lengths, prices, etc.

Each Offering contains one or more **Packages**. Packages are simply a group of equivalent products across iOS and Android. If your app is available on multiple platforms, then a Package would contain all of the equivalent product Ids from each platform.
[block:callout]
{
  "type": "info",
  "body": "Any product can be added to an Offering, even if it's not part of any entitlement."
}
[/block]

![](https://files.readme.io/2109169-1628274-Entitlements_2.0.png "1628274-Entitlements_2.0.png")
##Products
Products are a one-to-one mapping of the product identifiers configured for your app in App Store Connect, Play Store and Stripe. 
[block:api-header]
{
  "title": "Configuration"
}
[/block]
## 1. Set up products in the app stores
Before products can be purchased, they need to be properly set up in App Store Connect, Play Console, and Stripe. If you've never set up products before or are experiencing issues, our posts on [iOS](https://www.revenuecat.com/2018/10/11/configuring-in-app-products-is-hard) and [Android](https://www.revenuecat.com/2019/02/22/from-zero-to_android-subscriptions-configuration) product setup may be useful. 

If products are not configured correctly, you will see an invalid products message in the [debug logs](doc:debugging).

## 2. Add products to RevenueCat
Navigate to the Products tab for your app in the RevenueCat dashboard. You'll see any previously purchased product identifiers already exist. 

If you need to add more products, click the **+ New** button and enter the product identifier and store it belongs to.
![](https://files.readme.io/ef131a9-Screen_Shot_2019-09-24_at_8.51.03_PM.png "Screen Shot 2019-09-24 at 8.51.03 PM.png")
Products will also appear here automatically as they are purchased. If you see a product you never added manually, it means a receipt was sent from a user that contained that product Id.

## 3. Configure Entitlements
Navigate to the Entitlements tab for your app in the RevenueCat dashboard and click **+ New** to create a new entitlement. 

You'll be prompted to enter an **Identifier** and **Description** for your entitlement then click **Add**.

Click into the newly created entitlement and begin attaching products by clicking **Attach**.
![](https://files.readme.io/24b5651-Screen_Shot_2019-09-24_at_8.44.52_PM.png "Screen Shot 2019-09-24 at 8.44.52 PM.png")
Choose one of your previously created products, or create a new one, and click **Add**. Repeat this process until all of your products are added.
![](https://files.readme.io/bf8b8c5-Screen_Shot_2019-09-24_at_8.49.08_PM.png "Screen Shot 2019-09-24 at 8.49.08 PM.png")
Whenever a user purchases one of the assigned products, access to the entitlement will be unlocked for the appropriate duration.

## 4. Configure Offerings
Navigate to the Offerings tab for your app in the RevenueCat dashboard and click **+ New** to create a new offering. 

Again, you'll be prompted to enter an **Identifier** and **Description** for your offering. *Note that the offering identifier cannot be changed later*. Once you've entered this information, click **Add**.

Click into the newly created offering and set up the first Package by clicking **+ New**.
![](https://files.readme.io/f3c7513-Screen_Shot_2019-09-24_at_9.00.21_PM.png "Screen Shot 2019-09-24 at 9.00.21 PM.png")
In the popup, choose an **Identifier** from the dropdown that corresponds with the duration of the package. If a duration isn't suitable for your package (e.g. consumable purchases), then you can choose a custom identifier. Include a **Description**, then click **Add**.
![](https://files.readme.io/58105b2-Screen_Shot_2019-09-24_at_9.02.09_PM.png "Screen Shot 2019-09-24 at 9.02.09 PM.png")
Click into the newly created package and begin attaching product by clicking **Attach**. 

In the popup you'll see dropdowns to select the appropriate product for each store. Choose the appropriate products, the click **Attach**.

![](https://files.readme.io/41db7d0-Screen_Shot_2019-09-24_at_9.05.56_PM.png "Screen Shot 2019-09-24 at 9.05.56 PM.png")
Continue this process until all of the packages are created for your Offering, and all Offerings are created.

The packages within an offering can be updated at any time, and their display order can be modified by dragging their position in the table.
![](https://files.readme.io/7ec7062-Screen_Shot_2019-09-26_at_1.45.45_PM.png "Screen Shot 2019-09-26 at 1.45.45 PM.png")

[block:api-header]
{
  "title": "Next Steps"
}
[/block]
* Now that your products are set up, learn how to [display them in your app :fa-arrow-right:](doc:displaying-products)
* If you're migrating from the legacy version of Entitlements, [check out our migration guide :fa-arrow-right:](doc:offerings-migration)
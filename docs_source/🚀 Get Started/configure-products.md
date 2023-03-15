---
title: Configure Products
slug: configure-products
excerpt: All your subscription/in-app purchases in one place
hidden: false
metadata:
  title: Configuring in-app products – RevenueCat
  description: The RevenueCat dashboard allows you to configure your available in-app
    products remotely so you can control how they're presented without the need to
    update your app.
  image:
    0: https://files.readme.io/d9c46d9-RevenueCat_Docs_OG.png
    1: RevenueCat Docs OG.png
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: '2023-01-09T15:42:05.505Z'
updatedAt: '2023-01-09T15:42:05.505Z'
category: 640a7bef79274d00428d102b
---
[block:callout]
{
  "type": "info",
  "title": "Objectives",
  "body": "1. Configure products in each store\n2. Connect store products to RevenueCat"
}
[/block]
# 1. Configure store products
Now that the stores are [connected to RevenueCat](doc:connect-to-stores), it's time to create subscription/in-app-purchase products in each store.

Follow these store-specific guides, then we will connect them to RevenueCat:
- **[iOS / App Store Connect :fa-arrow-right:](doc:ios-products)**
- **[Android / Google Play Console :fa-arrow-right:](doc:android-products)**
- **[Android / Amazon Appstore :fa-arrow-right:](doc:amazon-product-setup)**
- **[Stripe :fa-arrow-right:](doc:stripe-products)**

# 2. Connect store products to RevenueCat
You now have products configured in each store. Let's connect them to RevenueCat.

## Overview
Before we begin, we need to discuss **four** RevenueCat-specific objects that keep cross-platform purchasing simple:

1. [**Products**](doc:configure-products#products) are 1-to-1 mappings of the store products you just configured.
2. [**Entitlements**](doc:configure-products#entitlements) represent access to premium features of your app that your user is "entitled" to after making a purchase. Entitlements are attached to products.
3. [**Packages**](doc:configure-products#packages) (optional) are simply containers which hold similar products. Ex: your `monthly` package may contain your `monthly_ios`, `monthly_android`, and `monthly_stripe` products.
4. [**Offerings**](doc:configure-products#offerings) (optional) represent a selection of packages to be shown to users, and thus will form the basis of your paywalls.


[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/95adb7b-Frame_1.png",
        "Frame 1.png",
        3076,
        1484,
        "#000000"
      ],
      "caption": "A typical paywall is shown on the left. The **Offering** consists of the lifetime, yearly, and monthly **packages**. Within the monthly package are three **products** (one for each platform). Each of these products are attached to the \"Pro\" **entitlement**, which grants the user access to their premium features."
    }
  ]
}
[/block]
See below for in-depth implementation details regarding each object.

## Products (required)
In RevenueCat, **Products** represent the individual SKUs that users actually purchase.

You will need to set up a 1-to-1 mapping of products in the stores to RevenueCat products. These form the link between RevenueCat and the stores.

### Product Setup
Navigate to the **Products** tab in the settings for your project in the RevenueCat dashboard. To add a new product, click the **+ New** button and enter the product identifier ***exactly as it appears in the store***, as well as the store that the product belongs to.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/20b473f-Screen_Shot_2021-12-01_at_10.14.01_AM.png",
        "Screen Shot 2021-12-01 at 10.14.01 AM.png",
        1268,
        638,
        "#f8f9f9"
      ]
    }
  ]
}
[/block]
## Entitlements (required)
Entitlements represent the level of access (to features, content, etc.) your user is "entitled to" after purchasing a product.

Many apps have a single entitlement that unlocks all premium features. However, if your app uses multiple tiers of access (e.g., Silver, Gold, and Platinum), you will create multiple entitlements.

**Here's where RevenueCat makes in-app purchases easy**: A user's entitlements apply to every platform in your Project. Therefore, if your user buys a subscription on their iPhone, they can easily access their premium content from their other devices, regardless of platform!

### Entitlement Setup
To create a new entitlement, click **Entitlements** in the left menu of the **Project** dashboard and click **+ New.** You'll need to enter a unique identifier for your entitlement that you can reference in your app, like "pro". 

Again, most apps only have need entitlement, but create as many as your app need. For example a navigation app may have a subscription to "pro" access, and one-time purchases to unlock specific map regions. In this case you would probably create one "pro" entitlement, and additional entitlements for each map region that could be purchased.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/d3a8f78-Screen_Shot_2021-12-01_at_10.18.02_AM.png",
        "Screen Shot 2021-12-01 at 10.18.02 AM.png",
        1252,
        422,
        "#f9f9f9"
      ]
    }
  ]
}
[/block]
### Attach Entitlements to Products
Once your products and entitlements are created, you must connect them together. This tells RevenueCat which entitlement to unlock after your user purchases a product.

When viewing an Entitlement, click the **Attach** button to attach a product.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/233c96a-Screen_Shot_2021-12-01_at_10.19.56_AM.png",
        "Screen Shot 2021-12-01 at 10.19.56 AM.png",
        1256,
        662,
        "#fbfbfb"
      ]
    }
  ]
}
[/block]
When a product is purchased, RevenueCat will activate the corresponding entitlement for the duration of the subscription or *forever* for non-subscriptions (see: [Non-Subscription In-App Purchases](doc:non-subscriptions) for handling these entitlements).

(For non-subscription products: If the product is non-consumable (e.g., lifetime access), you will likely want to attach the product to an entitlement. If the product is consumable (e.g., more lives in a game), you will likely *not* want to attach the product to an entitlement.)

Attaching a new entitlement to a product will grant access to any customers that have previously purchased that product. Likewise, detaching an entitlement from a product will remove access from any customers that have previously purchased that product.

When designing your Entitlement structure, keep in mind:
* Multiple products can be attached to a single entitlement (you do not need to create a new entitlement for each platform)
* A single product can be attached to multiple entitlements (useful for subscriptions that unlock multiple levels of access)
[block:callout]
{
  "type": "warning",
  "body": "When creating new products, remember to connect them to an entitlement. Failure to do so will cause your users to make purchases that do not unlock promised content.",
  "title": "Attention"
}
[/block]
## Packages (optional)
Packages are simply a container of equivalent products across iOS, Android, Amazon, and Stripe.

For example, if you offer a monthly subscription for each platform, you would create a `monthly` package containing your four products (e.g., `monthly_ios`, `monthly_android`, `monthly_amazon`, `monthly_stripe`).

You will configure packages when you create an Offering in the next step.

## Offerings (optional)
Offerings form the selection of products that are "offered" to your users through your paywall.

These are optional, but *recommended*. Offerings make it easy to experiment with and perfect your paywalls.

### Create an Offering

To create an Offering, navigate to the Offerings tab to your project settings in the RevenueCat dashboard, and click **+ New** to get started.

You'll be prompted to enter an **Identifier** and **Description** for your offering. *Note that the offering identifier cannot be changed later*. Once you've entered this information, click **Add**.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/8dcca39-Screen_Shot_2021-12-01_at_10.22.24_AM.png",
        "Screen Shot 2021-12-01 at 10.22.24 AM.png",
        1266,
        452,
        "#f8f8f8"
      ]
    }
  ]
}
[/block]
**Current Offering**
The RevenueCat dashboard allows you to choose which Offering should be `current`. The `current` Offering is a convenience method for the Purchases SDK to reference a primary Offering.

If you build your paywall to reference the `current` Offering, instead of hardcoding an identifier value, you can change this Offering from the dashboard to dynamically display different Offerings at any time. We strongly recommend utilizing the `current` Offering feature. See [Displaying Products](doc:displaying-products) for more info.

### Adding Packages to an Offering
Each Offering you create should contain at least one Package that holds cross-platform products.

To create a package, click into your new Offering, then click **+ New** in the Packages section. In the popup, choose an **Identifier** from the dropdown that corresponds with the duration of the package. If a duration isn't suitable for your package (e.g. consumable purchases), then you can choose a custom identifier. Include a **Description**, then click **Add**. 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/c752d51-Screen_Shot_2021-12-01_at_10.23.49_AM.png",
        "Screen Shot 2021-12-01 at 10.23.49 AM.png",
        1258,
        648,
        "#fbfbfb"
      ]
    }
  ]
}
[/block]
Click into the newly created package and begin attaching product by clicking **Attach**.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/70abcf2-Screen_Shot_2021-12-01_at_10.25.21_AM.png",
        "Screen Shot 2021-12-01 at 10.25.21 AM.png",
        1250,
        664,
        "#fbfbfb"
      ]
    }
  ]
}
[/block]
In the popup you'll see dropdowns to select the appropriate product for each store. Choose the appropriate products, then click **Attach**.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/db8429d-Screenshot_2023-01-09_at_9.39.03_AM.png",
        "Screenshot 2023-01-09 at 9.39.03 AM.png",
        1280,
        1162,
        "#000000"
      ]
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "Any product can be added to an Offering, even if it's not part of any Entitlement. This can come in handy if your app's paywall contains a combination of subscription products that unlock Entitlements, and consumable products that do not."
}
[/block]
Continue this process until all of the packages are created for your Offering, and all Offerings are created.

The packages within an offering can be updated at any time, and their display order can be modified by dragging their position in the table. This display order will be reflected in the SDK when you fetch Offerings.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/896e871-Screen_Shot_2021-12-01_at_10.29.33_AM.png",
        "Screen Shot 2021-12-01 at 10.29.33 AM.png",
        1256,
        780,
        "#fafafb"
      ]
    }
  ]
}
[/block]
### Removing Packages from an Offering

Packages can be removed from an Offering at any time. This can be useful if you want to update your paywall on-the-fly without an app update.

Removing a package from an Offering **does not** remove the products from RevenueCat, remove transactions, or remove the products from any Entitlements. You can re-add a package and products at any time.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/dff40c4-Screen_Shot_2022-12-05_at_12.12.05_PM.png",
        "Screen Shot 2022-12-05 at 12.12.05 PM.png",
        1878,
        1032,
        "#000000"
      ]
    }
  ]
}
[/block]

[block:callout]
{
  "type": "success",
  "title": "What's next?",
  "body": "You've successfully created store products and connected them to RevenueCat Products, Entitlements, Packages, and Offerings!\n\nYou are now ready to [install the SDK](installation)."
}
[/block]
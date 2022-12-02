---
title: "Configuring Products"
slug: "entitlements"
excerpt: "Use Entitlements and Offerings to organize and display products"
hidden: false
metadata: 
  title: "Configuring in-app subscription products – RevenueCat"
  description: "The RevenueCat dashboard allows you to configure your available in-app products remotely so you can control how they're presented without the need to update your app."
  image: 
    0: "https://files.readme.io/b58b71d-60993e3c40039b67596bcc8c_slack-preview.png"
    1: "60993e3c40039b67596bcc8c_slack-preview.png"
    2: 1200
    3: 627
    4: "#f45476"
createdAt: {}
updatedAt: "2021-12-08T05:33:30.219Z"
---
The RevenueCat dashboard allows you to specify what level of access each product should unlock for your users, which can greatly simplify your in-app code to check for subscription access. The dashboard also allows you to configure which in-app products are shown to your users remotely, so you can control how they're presented without the need to update your app. This is great for experimenting how different product configurations affect key subscription metrics.

There are three levels of product configuration available within RevenueCat:
  1.  Products
  2. Entitlements
  3. Offerings
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/fb06e40-Screen_Shot_2020-07-01_at_6.12.53_PM.png",
        "Screen Shot 2020-07-01 at 6.12.53 PM.png",
        1470,
        570,
        "#e6e4e2"
      ],
      "caption": "An example of how products in Apple, Google, and Stripe translate to Products, Entitlements, and Offerings in RevenueCat."
    }
  ]
}
[/block]
The diagram above illustrates how products from Apple, Google, and Stripe would tie into RevenueCat. The configuration is explained in more detail below.

# Products
Products are the individual SKUs that users actually purchase. The stores (Apple, Google, Stripe, and Amazon) process these SKUs and charge the user.

## Store Configuration
No matter how you choose to use RevenueCat, you'll need to first have products set up in the stores. This is done outside of RevenueCat, and where you set things like price, duration, and free trials. If you've never set up products before or need a refresher (or tips and tricks) check out these guides:

- **[iOS / App Store Connect :fa-arrow-right:](doc:ios-products)**
- **[Android / Google Play Console :fa-arrow-right:](doc:android-products)**
- **[Android / Amazon Appstore :fa-arrow-right:](doc:amazon-product-setup)**
- **[Stripe :fa-arrow-right:](doc:stripe-products)**

## RevenueCat Configuration
After your products are set up in the stores, you'll also need to set up a 1-to-1 mapping of the products in RevenueCat as well.

Navigate to the **Products** tab in the settings for your project in the RevenueCat dashboard. To add a new product, click the **+ New** button and enter the product identifier **exactly as it appears in the store**, as well as the store that the product belongs to.

These product identifiers are the link between RevenueCat, and Apple, Google, Stripe, or Amazon.
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

[block:callout]
{
  "type": "info",
  "body": "If a user purchases a product that has not been set up in RevenueCat, the purchase will still go through and be tracked in RevenueCat."
}
[/block]
# Entitlements
An entitlement represents a level of access, features, or content that a user is "entitled" to.

Entitlements are used to ensure a user has appropriate access to content based on their purchases, without having to manage all of the product identifiers in your app code. 

Most apps only have one entitlement, unlocking all premium features. However, if you had two tiers of content such as Gold and Platinum, you would have 2 entitlements.

## Creating an Entitlement

To create a new entitlement, click **Entitlements** in the left menu of the **Project** dashboard and click **+ New.** You'll need to enter a unique identifier for your entitlement that you can reference in your app, like "pro". 

Most apps only have one entitlement, but create as many as you need. For example a navigation app may have a subscription to "pro" access, and one-time purchases to unlock specific map regions. In this case there would probably be one "pro" entitlement, and additional entitlements for each map region that could be purchased.
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
## Attaching Products to Entitlements
Once entitlements are created, you should attach products to entitlements. This lets RevenueCat know which entitlements to unlock for users after they purchase a specific product.

When viewing an Entitlement, click the **Attach** button to attach a product. If you've already added your products, you'll be able to select one from the list to attach.
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
When a product that is attached to an entitlement is purchased, that entitlement becomes active for the duration of the product. Subscription products will unlock entitlements for the subscription duration, and non-consumable and consumable purchases that are attached to an entitlement will unlock that content **forever**.

If you have non-subscription products, you may or may not want to add them to entitlements depending on your use case. If the product is non-consumable (e.g. lifetime access to "pro" features), you likely want to attach it to an entitlement. However, if it is consumable (e.g. purchase more lives in a game) you likely do not want to add them to an entitlement. 

When designing your Entitlement structure, keep in mind that a single product can unlock multiple entitlements, and multiple products may unlock the same entitlement.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/5bb6bc2-Screen_Shot_2020-07-01_at_6.14.38_PM.png",
        "Screen Shot 2020-07-01 at 6.14.38 PM.png",
        1346,
        741,
        "#f0f4f2"
      ],
      "caption": "Example Entitlement structure with associated Apple, Google, Stripe, or Amazon product identifiers."
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "When relying on entitlements to enable access to certain content, it's important that you remember to add new products to their associated entitlements if needed. Failing to add your products to an entitlement, could lead to your users making purchases that don't unlock access to the promised content."
}
[/block]
# Offerings

Offerings are the selection of products that are "offered" to a user on your paywall. They're an optional, but recommended feature of RevenueCat that can make it easier to change and experiment with your paywalls.

Offerings allow you to choose which combination of products are shown to a user on your paywall or upsell screen. For example your default Offering may contain a monthly and annual subscription, but you might want to experiment with Offerings with a different combination of subscription durations, trial lengths, prices, etc.

Within each Offering, there must be one or more **Packages**. Packages are simply a group of equivalent products across iOS, Android, and web. If your app is available on multiple platforms, then a Package would contain all of the equivalent product Ids from each platform. 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/c4f0b08-Screen_Shot_2020-07-01_at_6.35.06_PM.png",
        "Screen Shot 2020-07-01 at 6.35.06 PM.png",
        1448,
        699,
        "#ecdbda"
      ]
    }
  ]
}
[/block]
## Creating an Offering

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

## Adding Packages
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
        "https://files.readme.io/cebdefd-Screen_Shot_2021-12-01_at_10.26.20_AM.png",
        "Screen Shot 2021-12-01 at 10.26.20 AM.png",
        1334,
        546,
        "#e7e8e7"
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
# Next Steps
You've successfully created Entitlements, Offerings, and Packages, and have attached products to be used in your app. 

Continue on to [Displaying Products](doc:displaying-products) to start showing your new Offering in your app.
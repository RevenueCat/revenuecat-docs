---
title: Legacy Entitlements
slug: legacy-entitlements
hidden: true
createdAt: '2019-08-29T20:15:45.785Z'
updatedAt: '2023-06-14T14:26:45.244Z'
category: 6483560b2e0a290051a971d8
order: 12
---
[block:callout]
{
  "type": "danger",
  "title": "You're viewing outdated documentation",
  "body": "If you're setting up a new app or want to use the improved version of entitlements, see the updated guide [here](doc:entitlements)."
}
[/block]
With Entitlements, you can set up your available in-app products remotely and control their availability without the need to update your app.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/44a845a-entitlements.png",
        "entitlements.png",
        1477,
        1045,
        "#fbfafa"
      ],
      "caption": "Entitlements provide a way of organizing your available in-app purchases."
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "What is an entitlement?"
}
[/block]
An entitlement represents features or content that a user is "entitled" to. 

Entitlements can be unlocked by having an active subscription or making a one-time purchase. Most subscription apps only have one entitlement, unlocking all premium features. However, if you had two tiers of content such as *Pro* and *Pro Plus*, you would have 2 entitlements. 
[block:api-header]
{
  "title": "What is an offering?"
}
[/block]
Most well monetized subscription apps provide many different offerings to purchase an entitlement. These are usually associated with different durations i.e. an *Annual Plan* and *Monthly Plan*. 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/eb03276-iphonexspacegrey_landscape.png",
        "iphonexspacegrey_landscape.png",
        2000,
        2000,
        "#afc9c7"
      ],
      "caption": "A typical upsell screen featuring two offerings, one for monthly and one for annual."
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "What are products?"
}
[/block]
Products are a 1-to-1 mapping with your Apple or Google in-app purchase products.

### Active Products
Each offering will have one **active** product per platform. For example, the *Monthly* offering under the *Pro* entitlement could have products **monthly_pro_android** and **monthly_pro_ios** active. This will be the products fetched automatically by the Purchases SDK.

### Inactive Products
Inactive products will still unlock an entitlement for user if they are subscribed to that product, or if they've ever purchased it in the case of non-renewing purchases.
[block:callout]
{
  "type": "info",
  "title": "Do not change product price after configuration",
  "body": "For the most accurate analytics, you shouldn't change your product prices in App Store Connect or Play Console after they're set. Instead, create a new product id with the new price.\n\nLowering the price of a product will automatically put all existing subscribers at the lower price. Later, if you tried to raise the price, those existing users would continue to remain at the lower level."
}
[/block]

[block:api-header]
{
  "title": "Creating Entitlements"
}
[/block]
Entitlements can be created via the dashboard by selecting your app from the dropdown. A common and simple setup is one entitlement with identifier pro, one offering monthly, with one product.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/adc90b9-Screen_Shot_2018-12-12_at_5.53.04_PM.png",
        "Screen Shot 2018-12-12 at 5.53.04 PM.png",
        2324,
        1368,
        "#f9f8f9"
      ],
      "caption": "Entitlements, Offerings, and Products can be configured from the RevenueCat dashboard."
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "If RevenueCat detects a product was purchased that is not linked to an Entitlement, it will still be shown as an Unassigned Product and you can assign to an Offering later."
}
[/block]

[block:api-header]
{
  "title": "Next Steps"
}
[/block]
* If you're ready to try the new Offerings, start with our [migration guide :fa-arrow-right: ](doc:offerings-migration)
* Checkout our new [guide on entitlements :fa-arrow-right: ](doc:entitlements)
---
title: "Understanding Entitlements"
slug: "entitlements"
excerpt: "Entitlements help you organize your available in-app products."
hidden: false
createdAt: "2018-06-11T00:53:07.358Z"
---
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

Entitlements are unlocked by having an active subscription or making a one-time purchase. Many different products can unlock.

Most subscription apps only have one entitlement, unlocking all premium features. However, if you had two tiers of content such as *premium* and *premium_plus*, you would have 2 entitlements. 

A common and simple setup example is one entitlement with identifier pro, one offering monthly, with one product.
[block:api-header]
{
  "title": "What is an offering?"
}
[/block]
Most well monetized subscription apps provide many different offerings to purchase an entitlement. 

These are usually associated with different durations i.e. an annual plan and a monthly plan. 
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

You can create them manually via the entitlements menu. They will be also detected automatically if they are purchased via the Purchases SDK.

### Active Products

Each offering will have one **active** product per platform. For example, the *monthly* offering under the *pro* entitlement could have products **monthly_pro_android** and **monthly_pro_ios** active. This will be the products fetched automatically by the Purchases SDK.
[block:callout]
{
  "type": "info",
  "title": "Inactive Products",
  "body": "Inactive products will still unlock an entitlement for user if they are subscribed to that product, or if they've ever purchased it in the case of non-renewing purchases."
}
[/block]
---
title: "Free Trials & Promo Offers"
slug: "subscription-offers"
excerpt: "How to give your customers subscription discounts"
hidden: false
metadata: 
  title: "Subscription Offers – RevenueCat"
  description: "Subscription offers give you the opportunity to provide limited time discounts in order to attract or retain subscribers and can be an important part of a subscription lifecycle."
  image: 
    0: "https://files.readme.io/3a69ef7-RevenueCat_Docs_OG.png"
    1: "RevenueCat Docs OG.png"
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: "2022-06-21T21:53:53.114Z"
updatedAt: "2023-03-06T19:18:50.848Z"
---
Subscription offers give you the opportunity to provide limited time discounts in order to attract or retain subscribers and can be an important part of a subscription lifecycle.

# Introductory Offers & Free Trials

When an eligible user attempts to purchase a product that has an introductory offer (e.g. a free trial) the offer will be applied automatically.

If the introductory offer isn't applied to the purchase in the system payment sheet, double check that:
- The purchasing user is eligible, e.g. the underlying store account hasn't already purchased that product
- You've waited up to 24 hours for product propagation after adding the offer
- The free trial offer is marked as Backwards Compatible in Google Play Console *(Google Play only)*
[block:callout]
{
  "type": "info",
  "body": "The underlying stores apply introductory offers to purchases automatically and isn't something that RevenueCat's Purchases SDK controls.",
  "title": "Introductory Offers applied automatically"
}
[/block]
## Checking Eligibility

The Purchases SDK allows for easy checking of eligibility for introductory offers, so that you as the developer can display the proper subscription terms to your customers.

RevenueCat uses a best-effort approach to checking eligibility based on previous purchases by the customer. The native store payment sheet will ultimately display the correct eligibility before the customer subscribes.
[block:code]
{
  "codes": [
    {
      "code": "Purchases.shared.getOfferings { offerings, error in\n  if let product = offerings?.current?.availablePackages.first?.storeProduct {\n    Purchases.shared.checkTrialOrIntroDiscountEligibility(product: product) { eligibility in\n      if eligibility == .eligible {\n        // show trial/introductory terms\n      } else {\n        // user is not eligible, show non-trial/introductory terms\n      }\n    }\n  }\n}",
      "language": "swift"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "warning",
  "title": "Google Play not supported",
  "body": "Checking introductory eligibility is not supported for Google Play at this time. Hybrid SDKs that use the `checkTrialOrIntroductoryEligibility` method will not return a valid eligibility on Android."
}
[/block]
# Setting up Subscription Offers
## Apple App Store

Apple supports several types of subscription offers which we detail in our [Apple Subscription Offers](doc:ios-subscription-offers) guide.

## Google Play
[block:callout]
{
  "type": "info",
  "body": "As of May 2022, Google Play supports multiple offers for subscription products. This is not yet supported by RevenueCat.\n\nRead more in our [community](https://community.revenuecat.com/tips-discussion-56/google-i-o-22-announcements-rc-product-priorities-1620)."
}
[/block]
Google allows developers to set up Promo Codes to offer to customers. 

Read more in our guide on [Google Play Promo Codes](doc:android-promo-codes).

## Amazon Appstore

Amazon Appstore does not support subscription offers other than free trials.

## Stripe
Free trials can be added to subscriptions through Stripe's dashboard and API. See our [Stripe Free Trials](doc:stripe-free-trials) guide for instructions.

# Considerations

## Offer Codes and Promo Codes
Due to limitations of available information for redeemable codes, accurate revenue tracking is not yet supported in the RevenueCat dashboard. 

All initial purchases made with codes are assumed to be $0 transactions. Revenue from subsequent renewal transactions will be tracked normally.
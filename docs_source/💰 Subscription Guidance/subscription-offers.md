---
title: Free Trials & Promo Offers
slug: subscription-offers
excerpt: How to give your customers subscription discounts
hidden: false
metadata:
  title: Subscription Offers – RevenueCat
  description: Subscription offers give you the opportunity to provide limited time
    discounts in order to attract or retain subscribers and can be an important part
    of a subscription lifecycle.
  image:
    0: https://files.readme.io/3a69ef7-RevenueCat_Docs_OG.png
    1: RevenueCat Docs OG.png
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: '2022-06-21T21:53:53.114Z'
updatedAt: '2023-04-11T17:11:38.228Z'
category: 646582c0a0e52000586ab9e0
---
Subscription offers give you the opportunity to provide limited time discounts in order to attract or retain subscribers and can be an important part of a subscription lifecycle.

# Introductory Offers & Free Trials

## Apple and Amazon

On Apple App Store and Amazon Appstore, when an eligible user attempts to purchase a product that has an introductory offer (e.g. a free trial) the offer will be applied automatically.

If the introductory offer isn't applied to the purchase in the system payment sheet, double check that:

- The purchasing user is eligible, e.g. the underlying store account hasn't already purchased that product
- You've waited up to 24 hours for product propagation after adding the offer

> 📘 Introductory Offers applied automatically
> 
> Apple App Store and Amazon Appstore apply introductory offers to purchases automatically; this is outside of the control of RevenueCat's Purchases SDK.

For iOS, new subscribers are always eligible. Lapsed subscribers who renew are eligible if they haven't previously used an introductory offer for the given product or any product within the same subscription group. Existing subscribers are not eligible for an introductory offer for any product within the same subscription group. For example, customers are not eligible if they are upgrading, downgrading, or crossgrading their subscription from another product, regardless of whether they consumed an introductory offer in the past.

### Checking Eligibility

The Purchases SDK allows for easy checking of eligibility for introductory offers on iOS, so that you as the developer can display the proper subscription terms to your customers.

RevenueCat uses a best-effort approach to checking eligibility based on previous purchases by the customer. The native store payment sheet will ultimately display the correct eligibility before the customer subscribes.

[block:file]
{"language":"swift","name":"","file":"code_blocks/💰 Subscription Guidance/subscription-offers_1.swift"}
[/block]



> 🚧 Only supported on iOS
> 
> Checking introductory eligibility is only supported on iOS. Using the `checkTrialOrIntroductoryEligibility` method on our cross-platform SDKs (for example, React Native or Flutter) will not return a valid eligibility on Android.

## Google Play

Google Play allows setting up multiple offers per base plan and allows differentiating between Google Play determined eligibility and developer determined eligibility. Our SDKs provide several ways to select which offer to apply. 

### Automatic application of trials and introductory offers

If you pass a `StoreProduct` or `Package` to `PurchaseParams.Builder`, the RevenueCat SDK automatically applies an available free trial or introductory offer. This resembles the automatic application of free trials and introductory periods on Apple App Store and Amazon App Store and on Google Play before the [May 2022 subscription changes](https://developer.android.com/google/play/billing/compatibility). 

The logic to determine the offer that applies to the purchase is based on the following logic:

- Find the longest free trial the customer is eligible for
- If there is no free trial, find the cheapest introductory period the customer is eligible for
- If there is none, fall back to the base plan
- If you have an offer on one of your products that you never want to automatically be selected by this logic (for example, because it is a discount only used for a specific customer group), you can add the tag `rc-ignore-offer` to that offer.

> 🚧 Developer determined offers are considered for automatic offer application
> 
> If you rely on the RevenueCat SDK to automatically apply trials and introductory offers, be aware that offers with eligibility criteria of "developer determined" set up in Google Play Console will be considered when deciding which offer to apply. This means that you may inadvertently apply developer determined offers when using the automatic application. To prevent this, either refrain from using developer determined and "new customer acquisition" offers on the same base plan, apply the tag `rc-ignore-offer` to developer determined offers, or use the manual offer selection as described below.

### More control over offer selection

If you want to have greater control over which offer gets applied to purchases, you can pass a `SubscriptionOption` to `PurchaseParams.Builder` instead. Each subscription `StoreProduct` has a property `subscriptionOptions` which is a list of eligible options for subscribing to the product, including purchasing the base plan directly or purchasing an offer. The `subscriptionOptions` contain only offers that the current customer is eligible for. For example, if the customer previously had a free trial of this product which is configured as "new customer acquisition" on Google Play Console, the free trial will no longer be contained in the `subscriptionOptions`.

The `subscriptionOptions` property also has a number of convenience properties that allow finding the right offer to apply for your customer. The `defaultOption` property finds the offer with the longest free trial period or the cheapest introductory offer. In addition, the following properties are available:

[block:file]
{"language":"kotlin","name":"","file":"code_blocks/💰 Subscription Guidance/subscription-offers_2.kt"}
[/block]



# Setting up Subscription Offers

## Apple App Store

Apple supports several types of subscription offers which we detail in our [Apple Subscription Offers](doc:ios-subscription-offers) guide.

> 🚧 Accurate revenue tracking not supported for offer codes
> 
> Due to limitations of available information on App Store Offer Codes, accurate revenue tracking is not yet supported in the RevenueCat dashboard. All initial purchases made with Offer Codes are assumed to be $0 transactions. Revenue from subsequent renewal transactions will be tracked normally.

## Google Play

Google has several types of subscription offers, as well as Promo Codes to offer to customers.

Read more in our guide on [Google Play Offers](doc:google-play-offers).

## Amazon Appstore

Amazon Appstore does not support subscription offers other than free trials.

## Stripe

Free trials can be added to subscriptions through Stripe's dashboard and API. See our [Stripe Free Trials](doc:stripe-free-trials) guide for instructions.
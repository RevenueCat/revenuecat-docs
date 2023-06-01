---
title: Changing Prices
slug: price-changes
excerpt: Adjusting your pricing model
hidden: false
metadata:
  title: Price changes – RevenueCat
  description: If subscription prices are changed via App Store Connect or Google
    Play, any active subscribers will need to opt-in to the new price. If the user
    does not opt-in, their subscription will be canceled by Apple or Google.
  image:
    0: https://files.readme.io/d9f6fcd-RevenueCat_Docs_OG.png
    1: RevenueCat Docs OG.png
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: '2020-07-01T18:49:02.585Z'
updatedAt: '2023-04-13T01:25:27.246Z'
category: 6478b860c1b42a1325cf5835
---
If subscription prices are changed via App Store Connect or Google Play, any active subscribers may need to opt-in to the new price. If the user does not opt-in, their subscription may be canceled by [Apple](https://help.apple.com/app-store-connect/#/devc9870599e) or [Google](https://support.google.com/googleplay/android-developer/answer/140504?hl=en).

# Store Products

> 🚧 
> 
> Price changes can take 24 hours to propagate the App Store and Google Play.

## App Store Price Changes

When you increase the price of a subscription, Apple informs affected subscribers via email and push notification and may require them to agree to the new price. Smaller, infrequent price increases may not require opt-in by customers.

On iOS 13.4 and iPadOS 13.4 and later, affected subscribers are also notified through a message sheet that automatically displays in your app.  If opt-in to the price change is required and they do not agree, their subscription expires at the end of their current billing cycle.

Alternatively, you can choose to grandfather existing subscriptions at the lower price and increase the price for new subscriptions only. This type of price increase does not require user consent.

Price decreases will be effective immediately for new purchases and will apply to active subscriptions at the end of the billing period.

For more information about App Store price changes, see [Managing Prices](https://developer.apple.com/app-store/subscriptions/#managing-prices-for-existing-subscribers) from Apple.

## Google Play Price Changes

After you change the price of an existing subscription, here’s how it affects new users and existing subscribers:

- New users can immediately see the subscription’s new price and subscribe to it on Google Play.
- Existing subscribers receiving a price increase will be notified of the price change by email and through a notification on Google Play 7 days after the price change occurs. Subscribers will then have 30 days to agree to the price change, otherwise their subscription will be canceled on their next renewal date.
- Existing subscribers receiving a price decrease will be notified and receive the lower price on their next renewal date.

For more information about Google Play price changes, see [Google Play Support](https://support.google.com/googleplay/android-developer/answer/140504?hl=en).

## Stripe Price Changes

Once you change the price of a product in Stripe, as soon as that user is charged the new price, it will be reflected in the RevenueCat dashboard. This is because we are able to take this price information directly from the Stripe purchase unlike in the other stores. 

For more information about Stripe Price changes, see [Stripe Support](https://stripe.com/docs/billing/subscriptions/change).

> 📘 Pro Tip ☝️
> 
> We almost always recommend creating a new product instead of changing the price of an existing product.

# Prices in RevenueCat

The app stores do not make individual transaction prices directly available to developers, so RevenueCat tracks prices at the time of purchase and assumes any subscriptions will renew at this purchase price. Therefore, if you ever raise the price of a product, RevenueCat's reporting will be accurate if you choose to grandfather existing subscriptions at the current price. 

We are able to track the individual transaction prices directly with Stripe transactions, so if a price change happens for a Stripe product, we will track that price change accordingly.

For more information about Charts and Overview data, see [Charts](https://docs.revenuecat.com/docs/charts) and [Overview](https://docs.revenuecat.com/docs/overview) documentation.
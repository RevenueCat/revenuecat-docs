---
title: "iOS Subscription Offers"
slug: "ios-subscription-offers"
excerpt: "Implementing iOS Subscription Offers with Purchases SDK"
hidden: false
metadata: 
  title: "Implementing iOS Subscription Offers | RevenueCat"
  description: "In iOS 12.2, Apple announced a new feature for subscription developers called “Subscription Offers.” Subscription offers allow developers to apply custom pricing and trials to existing and lapsed subscriptions."
  image: 
    0: "https://files.readme.io/605d04e-OG_image.png"
    1: "OG image.png"
    2: 1200
    3: 627
    4: "#e9acb0"
createdAt: {}
updatedAt: "2021-06-10T23:29:20.363Z"
---
[block:callout]
{
  "type": "success",
  "body": "This guide assumes you already have your iOS products set up in App Store Connect.",
  "title": ""
}
[/block]
In iOS 12.2, Apple announced a new feature for subscription developers called “Subscription Offers.” Subscription offers allow developers to apply custom pricing and trials to existing and lapsed subscriptions.

Subscription Offers are supported in the *Purchases SDK*, but require some additional setup first in App Store Connect and the RevenueCat dashboard. 

# Types of Subscription Offers
[block:parameters]
{
  "data": {
    "h-0": "Offer Type",
    "h-1": "Applies To",
    "0-0": "Introductory Offers",
    "1-0": "Promotional Offers",
    "h-2": "Subscription Key Required",
    "h-3": "Notes",
    "2-0": "Offer Codes",
    "0-1": "New Users",
    "1-1": "Existing and Lapsed Users",
    "1-2": "✅",
    "0-2": "❌",
    "2-2": "✅",
    "0-3": "SDK applies offer to purchases automatically",
    "2-1": "New and Existing Users",
    "1-3": "SDK does not apply automatically, see implementation guide below",
    "2-3": "Requires iOS SDK 3.8.0+, see implementation guide below",
    "3-0": "[In-App Purchase Promo Codes](https://help.apple.com/app-store-connect/#/dev50869de4a) (**not recommended**)",
    "3-1": "New and Existing Users",
    "3-2": "❌",
    "3-3": "Treated as a regular purchase, revenue will not be accurate in [Charts](doc:charts) and [Integrations](doc:webhooks) due to Apple/StoreKit limitations"
  },
  "cols": 4,
  "rows": 4
}
[/block]
# Subscription Keys

For RevenueCat to securely authenticate and validate a subscription offer request with Apple, you'll need to upload a Subscription Key. 
[block:callout]
{
  "type": "info",
  "title": "Introductory Offers",
  "body": "A Subscription Key is not required for Introductory Offers, only for Promotional Offers and Offer Codes. The Purchases SDK will automatically apply an introductory offer to a purchase. [Documentation](https://docs.revenuecat.com/docs/ios-products#adding-introductory-offers-and-free-trials) for reference."
}
[/block]
## 1. Generating a Subscription Key

Subscription keys are generated in the *Users and Access* section of App Store Connect, and you can use the same subscription key for all of your offers.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/732775a-Screen_Shot_2019-04-18_at_12.29.45_PM.png",
        "Screen Shot 2019-04-18 at 12.29.45 PM.png",
        987,
        354,
        "#f4f4f6"
      ]
    }
  ]
}
[/block]
Click *Generate Subscription Key*, you'll be prompted to enter a name for the key. 

Once your key is generated, it will appear in *Active Keys* and you get one shot to download it. 

Click *Download API Key* and store the file in a safe place, you'll need to upload this to RevenueCat in the next step.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/806e232-Screen_Shot_2019-04-18_at_12.38.42_PM.png",
        "Screen Shot 2019-04-18 at 12.38.42 PM.png",
        926,
        177,
        "#f9f8f8"
      ]
    }
  ]
}
[/block]
## 2. Uploading Subscription Key to RevenueCat

Once everything is set up in App Store Connect, you need to upload the Subscription Key from the previous step to RevenueCat. RevenueCat will handle all the server-side authentication and validation of the Subscription Offers.

Navigate to your [app Settings](https://app.revenuecat.com/apps/) in the RevenueCat dashboard. 

In your app Settings you'll see an area to upload your Subscription Key .p8 file that you downloaded from App Store Connect. 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/5e8cca3-Screen_Shot_2019-04-18_at_1.48.42_PM.png",
        "Screen_Shot_2019-04-18_at_1.48.42_PM.png",
        843,
        390,
        "#f6f5f5"
      ]
    }
  ]
}
[/block]
# Promotional Offers

## 1. Configure Offer in App Store Connect

Subscription Offers are created from within App Store Connect and are included as a pricing option to an existing subscription product. When you click the "+" option next to Subscription Prices, you'll see an option to Create Promotional Offer.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/fd483c8-Screen_Shot_2019-04-17_at_3.32.04_PM.png",
        "Screen Shot 2019-04-17 at 3.32.04 PM.png",
        431,
        454,
        "#f9f8f8"
      ],
      "caption": "Subscription Offers are created as new pricing options in App Store Connect"
    }
  ]
}
[/block]
To create the offer there are two fields that you need to specify: Reference Name, which is just used for your reference, and the Promotional Offer Product Code, which is what you will actually use to activate a specific offer in your app.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/7c62bd9-Screen_Shot_2019-04-17_at_3.39.20_PM.png",
        "Screen Shot 2019-04-17 at 3.39.20 PM.png",
        906,
        568,
        "#fafbfc"
      ]
    }
  ]
}
[/block]
On the next screen you'll select the type of offer you wish to provide. Just like introductory offers, there are three types of subscription offers:

1. Pay-up-front — The customer pays once for a period of time, e.g. $0.99 for 3 months. Allowed durations are 1, 2, 3, 6 and 12 months.
2. Pay-as-you-go — The customer pays a reduced rate, each period, for a number of periods, e.g. $0.99 per month for 3 months. Allowed durations are 1-12 months. Can only be specified in months.
3. Free — This is analogous to a free trial, the user receives 1 of a specified period free. The allowed durations are 3 days, 1 week, 2 weeks, 1 month, 2 months, 3 months, 6 months, and 1 year.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/5bf1bca-Screen_Shot_2019-04-17_at_3.44.39_PM.png",
        "Screen Shot 2019-04-17 at 3.44.39 PM.png",
        907,
        567,
        "#fafafa"
      ]
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "Don't forget to click Save in the upper right after you configure the offer."
}
[/block]
## 2. Show Subscription Offer to Desired Users

It's up to you to decide which users you want to present a Subscription Offer to. The only eligibility requirements are that the user had (or currently has) an active subscription. Apple automatically enforces this requirement for you - if it's not met users be shown the regular product regardless of the offer you try to present.

### Fetch payment discount

Before you can present a Subscription Offer to a user, you first need to fetch the `SKPaymentDiscount`. This is done by passing the `SKProductDiscount` and `SKProduct` to the `.paymentDiscount` method, which uses the Subscription Key from Step 2 to validate the discount.
[block:code]
{
  "codes": [
    {
      "code": "Purchases.shared.paymentDiscount(for: product.discounts[0], product: product, completion: { (discount, error) in\n    \n    if let paymentDiscount = discount {\n        \n        // Payment discount fetched\n    }\n})",
      "language": "swift"
    },
    {
      "code": "[RCPurchases.sharedPurchases paymentDiscountForProductDiscount:product.discounts[0] product:product completion:^(SKPaymentDiscount * _Nullable discount, NSError * _Nullable error) {\n\tif (discount) {\n  \t// Payment discount fetched\n  }\n}];",
      "language": "objectivec",
      "name": "Objective-C"
    },
    {
      "code": "const paymentDiscount = await Purchases.getPaymentDiscount(product, product.discounts[0]);\nif (paymentDiscount) {\n  \t// Payment discount fetched\n}\n \n\n",
      "language": "javascript",
      "name": "React Native"
    }
  ]
}
[/block]
### Purchase product discount

After successfully fetching the `SKPaymentDiscount`, you can now display the Subscription Offer to the user however you'd like. If the user chooses to purchase, pass an `SKProduct` and `SKPaymentDiscount` to the `.makePurchase` method.
[block:code]
{
  "codes": [
    {
      "code": "Purchases.shared.purchasePackage(package, discount: paymentDiscount, { (transaction, purchaserInfo, error, cancelled) in\n    if purchaserInfo?.entitlements.all[\"your_entitlement_id\"]?.isActive == true {\n        // Unlock that great \"pro\" content\n    }\n})",
      "language": "swift"
    },
    {
      "code": "[RCPurchases.sharedPurchases purchasePackage:package withDiscount:discount completionBlock:^(SKPaymentTransaction * _Nullable transaction, RCPurchaserInfo * _Nullable purchaserInfo, NSError * _Nullable error, BOOL userCancelled) {\n  if (purchaserInfo.entitlements[\"your_entitlement_id\"].isActive) {\n    // Unlock that great \"pro\" content    \n  }\n}];",
      "language": "objectivec",
      "name": "Objective-C"
    },
    {
      "code": "const purchaseMade = await Purchases.purchaseDiscountedPackage(package, paymentDiscount);",
      "language": "javascript",
      "name": "React Native"
    }
  ]
}
[/block]
# Offer Codes

With iOS 14, Apple announced a new feature for subscription developers called “Offer Codes.” Offer Codes allow developers to offer custom pricing and trials, in the form of a redeemable code, to their customers.

## 1. Configuring an Offer Code

Offer Codes are configured similarly to Subscription Offers in App Store Connect. 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/4a0ab13-Screen_Shot_2020-12-01_at_10.02.15_AM.png",
        "Screen Shot 2020-12-01 at 10.02.15 AM.png",
        1044,
        432,
        "#f8f9f9"
      ],
      "sizing": "80",
      "border": true
    }
  ]
}
[/block]
## 2. Redeeming an Offer Code

To allow your users to redeem Offer Codes, you'll need to present the Offer Code redemption sheet. In *Purchases SDK* 3.8.0, you can call the `presentCodeRedemptionSheet` method.
[block:code]
{
  "codes": [
    {
      "code": "Purchases.shared.presentCodeRedemptionSheet()",
      "language": "swift",
      "name": "Swift"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "warning",
  "body": "The Offer Code redemption sheet may not display on a device if you haven't yet launched the App Store app and accepted the terms agreement."
}
[/block]
## Considerations

- Accurate revenue tracking for Offer Codes is not yet supported in the RevenueCat dashboard

# Next Steps

* For a guided walkthrough of implementing Subscription Offers into a Swift app [check out our blog :fa-arrow-right:](https://www.revenuecat.com/blog/signing-ios-subscription-offers)
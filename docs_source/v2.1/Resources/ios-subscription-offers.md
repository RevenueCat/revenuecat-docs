---
title: "iOS Subscription Offers"
slug: "ios-subscription-offers"
excerpt: "Implementing iOS Subscription Offers with Purchases SDK"
hidden: false
createdAt: "2019-04-22T21:37:42.699Z"
updatedAt: "2019-04-22T23:57:24.902Z"
---
In iOS 12.2, Apple announced a new feature for subscription developers called “Subscription Offers.” Subscription offers allow developers to apply custom pricing and trials to existing and lapsed subscriptions.

Subscription Offers are supported in the *Purchases SDK*, but require some additional setup first in App Store Connect and the RevenueCat dashboard. 

[block:api-header]
{
  "title": "1. Configure offer in App Store Connect"
}
[/block]
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
## Subscription Keys
After you've created an offer, you need to make sure you have a subscription key to securely authenticate and validate a subscription request with Apple.

Subscription keys are generated and the *Users and Access* section of App Store Connect, and you can use the same subscription key for all of your offers.
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
Click *Download API Key* and store the file in a safe place, you'll need to upload this to RevenueCat in the next step.
[block:api-header]
{
  "title": "2. Add Subscription Key to RevenueCat"
}
[/block]
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

[block:api-header]
{
  "title": "3. Show Subscription Offer to desired users"
}
[/block]
It's up to you to decide which users you want to present a Subscription Offer to. The only eligibility requirements are that the user had (or currently has) an active subscription. Apple automatically enforces this requirement for you - if it's not met users be shown the regular product regardless of the offer you try to present.

## Fetch product discount
Before you can present a Subscription Offer to a user, you first need to fetch the `SKPaymentDiscount`. This is done by passing the `SKProductDiscount` and `SKProduct` the `.paymentDiscount` method, which uses the Subscription Key from Step 2 to validate the discount.
[block:code]
{
  "codes": [
    {
      "code": "Purchases.shared.paymentDiscount(for: product.discounts[0], product: product, completion: { (discount, error) in\n    \n    if let paymentDiscount = discount {\n        \n        // Payment discount fetched\n    }\n})",
      "language": "swift"
    }
  ]
}
[/block]
## Purchase product discount

After successfully fetching the `SKPaymentDiscount`, you can now display the Subscription Offer to the user however you'd like. If the user chooses to purchase, pass an `SKProduct` and `SKPaymentDiscount` to the `.makePurchase` method.
[block:code]
{
  "codes": [
    {
      "code": "Purchases.shared.makePurchase(product, discount: paymentDiscount, { (transaction, purchaserInfo, error, cancelled) in\n    if let purchaserInfo = purchaserInfo {\n    \n        if purchaserInfo.activeEntitlements.contains(\"my_entitlement_identifier\") {\n            // Unlock that great \"pro\" content\n        }\n        \n    }\n})",
      "language": "swift"
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "Next Steps"
}
[/block]
* For a guided walkthrough of implementing Subscription Offers into a Swift app [check out our blog :fa-arrow-right:](https://www.revenuecat.com/blog)
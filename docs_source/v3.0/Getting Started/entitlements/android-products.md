---
title: "Android Product Setup"
slug: "android-products"
excerpt: "Setting up your in-app purchases in Google Play Billing"
hidden: false
createdAt: "2020-06-26T22:04:24.057Z"
updatedAt: "2020-07-31T22:26:13.027Z"
---
To setup products for Android devices, start by logging into the Google Play Console. Google Play Console is Google's central hub for managing app releases, testing, in-app purchases, and more. 

This guide assumes basic knowledge of Google Play Console, as well as having an app setup and ready for adding in-app purchases. For more information, visit [Google's documentation and guides for Google Play Console](https://support.google.com/googleplay/android-developer/?hl=en#topic=3450769).

## Create an In-App Purchase

To create an in-app purchase, go to Google Play Console's 'All Applications' page and select your app from the list.

In the sidebar, select the 'In-app products' dropdown. Depending on your in-app product type, you will either choose Managed Products or Subscriptions.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/fa71cd8-2020-07-01_16.15.00_play.google.com_d8681aeae168.png",
        "2020-07-01_16.15.00_play.google.com_d8681aeae168.png",
        925,
        1095,
        "#f7f2f2"
      ]
    }
  ]
}
[/block]
After clicking Create, you will need to provide some metadata to Google about your in-app product:

- **Title**: A short name of the item, up to 55 characters
- **Description**: A long description of the item, up to 80 characters
- **Price**: Enter a price in your local currency, or choose a template
characters.
- **Product ID:** The product Id is a unique alphanumeric ID that is used for accessing your product in development and syncing with RevenueCat. After you use a Product ID for one product in App Store Connect, **it can’t be used again across any of your apps, even if the product is deleted**. It helps to be a little organized here from the beginning - we recommend using a consistent naming scheme across all of your product identifiers such as:

>**`<app>_<price>_<duration>_<intro duration><intro price>`** 

- **app:** Some prefix that will be unique to your app, since the same product Id cannot but used in any future apps you create. 
- **price:** The price you plan to charge for the product in your default currency.
- **duration:** The duration of the normal subscription period.
- **intro duration:** The duration of the introductory period, if any.
- **intro price:** The price of the introductory period in your default currency, if any.

For example, using this format the identifier for a product that has a yearly subscription with a one week trial for $39.99 USD would be:
>**`rc_3999_1y_1w0`**
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/d0d9b07-2020-07-01_16.25.00_play.google.com_c5fcf7023a10.png",
        "2020-07-01_16.25.00_play.google.com_c5fcf7023a10.png",
        1284,
        2065,
        "#f8f9f9"
      ]
    }
  ]
}
[/block]
# Next Steps

### Cross Platform

If your app is cross-platform, check out our guides for setting up products for [App Store Connect](doc:ios-products) or [Stripe](doc:stripe-products).

### Integrate with RevenueCat

If you're ready to integrate your new Google Play in-app product with RevenueCat, continue our [product setup guide :fa-arrow-right:](doc:entitlements).
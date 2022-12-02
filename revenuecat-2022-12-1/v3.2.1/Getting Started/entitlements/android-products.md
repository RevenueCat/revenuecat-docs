---
title: "Android Product Setup"
slug: "android-products"
excerpt: "Setting up your in-app purchases in Google Play Billing"
hidden: false
metadata: 
  title: "Android in-app purchase product set up – RevenueCat"
  description: "To setup products for Android devices, start by logging into the Google Play Console. Google Play Console is Google's central hub for managing app releases, testing, in-app purchases, and more."
  image: 
    0: "https://files.readme.io/0fe306f-OG_image.png"
    1: "OG image.png"
    2: 1200
    3: 627
    4: "#e9acb0"
createdAt: "2020-06-26T22:04:24.057Z"
updatedAt: "2021-06-10T23:21:22.801Z"
---
To set up products for Android devices, start by logging into the Google Play Console. Google Play Console is Google's central hub for managing app releases, testing, in-app purchases, and more. 

This guide assumes basic knowledge of Google Play Console, as well as having an app set up and ready for adding in-app purchases. For more information, visit [Google's documentation and guides for Google Play Console](https://support.google.com/googleplay/android-developer/?hl=en#topic=3450769).

# Create an In-App Purchase
[block:callout]
{
  "type": "info",
  "body": "You'll need to have an APK uploaded before you can create in-app products. Check out our guide on [sandbox testing on Android](doc:google-play-store) for details on how to upload an APK and roll out a release on a closed test track."
}
[/block]
To create an in-app purchase, go to Google Play Console's 'All Applications' page and select your app from the list.

In the sidebar, select the **Products** dropdown. Depending on your in-app product type, you will either choose **In-app products** or **Subscriptions**.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/1bbcf2f-2020-10-09_18.02.44_play.google.com_16c50bed37ae.png",
        "2020-10-09 18.02.44 play.google.com 16c50bed37ae.png",
        729,
        542,
        "#faf7f6"
      ]
    }
  ]
}
[/block]
After clicking Create, there are several pieces of metadata you have to provide to Google about your in-app product:
[block:parameters]
{
  "data": {
    "h-0": "Metadata",
    "h-1": "Description",
    "0-0": "Product ID",
    "0-1": "The product ID is a unique alphanumeric ID that is used for accessing your product in development and syncing with RevenueCat. After you use a Product ID for one product in Google Play Console, **it can’t be used again across any of your apps, even if the product is deleted**.",
    "1-0": "Name",
    "2-0": "Description",
    "3-0": "Billing period (subscriptions only)",
    "4-0": "Default price",
    "1-1": "A short name of the item, up to 55 characters. This will be displayed on your Google Play Store listing.",
    "2-1": "A long description of the item, up to 80 characters. This will be displayed on your Google Play Store listing.",
    "3-1": "The billing period of the subscription (weekly, monthly, etc.)",
    "4-1": "Enter a price in your local currency, or choose a template."
  },
  "cols": 2,
  "rows": 5
}
[/block]
## Tips for creating robust product IDs

After you use a Product ID for one product in Google Play Console, **it can’t be used again across any of your apps, even if the product is deleted**. It helps to be a little organized here from the beginning - we recommend using a consistent naming scheme across all of your product identifiers such as:

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
        "https://files.readme.io/a3032dd-2020-10-09_18.22.14_play.google.com_84bde56e1557.png",
        "2020-10-09 18.22.14 play.google.com 84bde56e1557.png",
        1179,
        1742,
        "#fbfbfb"
      ],
      "caption": "Sample configuration of a 1-month subscription with a free trial."
    }
  ]
}
[/block]
# Next Steps

### Cross Platform

If your app is cross-platform, check out our guides for setting up products for [App Store Connect](doc:ios-products) or [Stripe](doc:stripe-products).

### Integrate with RevenueCat

If you're ready to integrate your new Google Play in-app product with RevenueCat, continue our [product setup guide :fa-arrow-right:](doc:entitlements).
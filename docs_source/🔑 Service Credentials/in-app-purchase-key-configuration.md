---
title: In-App Purchase Key Configuration
slug: in-app-purchase-key-configuration
excerpt: Guide on how to set up iOS in-app purchase keys.
hidden: false
metadata:
  title: In-App Purchase Key Configuration – RevenueCat
  image:
    0: https://files.readme.io/88bf693-RevenueCat_Docs_OG.png
    1: RevenueCat Docs OG.png
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: '2022-02-02T00:31:49.564Z'
updatedAt: '2022-11-21T19:35:21.638Z'
category: 640a7bf3494876005757685e
---
For RevenueCat to securely authenticate and validate a [Subscription Offer](https://docs.revenuecat.com/docs/ios-subscription-offers) request with Apple, you'll need to upload an in-app purchase key. In order to enable [customer lookup](https://docs.revenuecat.com/docs/customer-lists#find-an-individual-customer) via Order ID for iOS apps, you'll also need to provide an Issuer ID.


## 1. Generating an In-App Purchase Key

In-app purchase keys are generated in the *Users and Access* section of App Store Connect. You can use the same in-app purchase key for all of your offers.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/3b3a6dc-Screenshot_at_Feb_01_11-37-28.png",
        "Screenshot at Feb 01 11-37-28.png",
        1394,
        295,
        "#f3f3f5"
      ]
    }
  ]
}
[/block]
Select *Generate In-App Purchase Key*, or – if you've generated an In-App Purchase Key in the past – click on the "+" symbol behind the *Active* header. You'll be prompted to enter a name for the key. 

Once your key is generated, it will appear in *Active Keys* and you get one shot to download it. 

Select *Download API Key* and store the file in a safe place, you'll need to upload this to RevenueCat in the next step.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/55a58f1-Screenshot_at_Feb_01_11-51-45.png",
        "Screenshot at Feb 01 11-51-45.png",
        911,
        151,
        "#f7f5f6"
      ]
    }
  ]
}
[/block]
## 2. Uploading the In-App Purchase Key to RevenueCat

Once everything is set up in App Store Connect, you need to upload the In-App Purchase Key from the previous step to RevenueCat. RevenueCat will handle all the server-side authentication and validation of the Subscription Offers.

In the RevenueCat dashboard, select your iOS app from the **Apps** tab in your project settings.

Within your app settings, under the tab **In-app purchase key configuration**, you'll see an area to upload your In-App Purchase Key .p8 file that you downloaded from App Store Connect.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/1a74841-Screenshot_at_Feb_01_11-43-56.png",
        "Screenshot at Feb 01 11-43-56.png",
        933,
        751,
        "#f7f8f7"
      ]
    }
  ]
}
[/block]
## 3. Providing the Issuer ID to RevenueCat
Once you uploaded the in-app purchase .p8 file, you'll see an area to input 'Issuer ID'.

You can find this Issuer ID in App Store Connect, under Keys > App Store Connect API.

If you haven't done so yet, you'll need to request access to the App Store Connect API. In that case, you will also need to generate a random App Store Connect API key. Access level or name of the key here doesn't matter, but the Issuer ID will not show unless a key has been generated.

Copy the Issuer ID, which is now shown at the top of the page, and paste into the RevenueCat 'Issuer ID' field. 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/ab962c9-Screenshot_at_Feb_01_12-02-57.png",
        "Screenshot at Feb 01 12-02-57.png",
        2742,
        460,
        "#000000"
      ]
    }
  ]
}
[/block]

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/6b5df1b-issuer_id.png",
        "issuer_id.png",
        893,
        346,
        "#f9f8f8"
      ]
    }
  ]
}
[/block]
Remember to select 'Save changes'.
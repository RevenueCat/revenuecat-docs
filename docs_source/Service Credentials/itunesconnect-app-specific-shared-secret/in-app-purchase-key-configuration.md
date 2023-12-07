---
title: In-App Purchase Key Configuration
slug: in-app-purchase-key-configuration
excerpt: Guide on how to set up iOS in-app purchase keys.
hidden: false
parentDoc: 649983b4c31b2e000a3c1859
---
For RevenueCat to securely validate purchases through Apple Store Kit 2, authenticate and validate [Subscription Offers](https://docs.revenuecat.com/docs/ios-subscription-offers) request with Apple and enable [customer lookup](https://docs.revenuecat.com/docs/customer-lists#find-an-individual-customer) via Order ID for iOS apps you need to upload an in-app purchase key, Key ID and Issuer ID. Find instructions on how to do it below. 

## 1. Generating an In-App Purchase Key

In-app purchase keys are generated in the _Users and Access_ section of App Store Connect. You can use the same in-app purchase key for all of your offers.

![](https://files.readme.io/3b3a6dc-Screenshot_at_Feb_01_11-37-28.png "Screenshot at Feb 01 11-37-28.png")



Select _Generate In-App Purchase Key_, or – if you've generated an In-App Purchase Key in the past – click on the "+" symbol behind the _Active_ header. You'll be prompted to enter a name for the key. 

Once your key is generated, it will appear in _Active Keys_ and you get one shot to download it. 

Select _Download API Key_ and store the file in a safe place, you'll need to upload this to RevenueCat in the next step.

![](https://files.readme.io/55a58f1-Screenshot_at_Feb_01_11-51-45.png "Screenshot at Feb 01 11-51-45.png")



## 2. Uploading the In-App Purchase Key to RevenueCat

Once everything is set up in App Store Connect, you need to upload the In-App Purchase Key from the previous step to RevenueCat. RevenueCat will handle all the server-side authentication and validation of the Subscription Offers.

In the RevenueCat dashboard, select your iOS app from the **Apps** tab in your project settings.

Within your app settings, under the tab **In-app purchase key configuration**, you'll see an area to upload your In-App Purchase Key .p8 file that you downloaded from App Store Connect.

![](https://files.readme.io/29734b9-app.revenuecat.com_projects_85ff18c7_apps_appefe5647c50_2.png)



## 3. Providing the Issuer ID to RevenueCat

Once you uploaded the in-app purchase .p8 file, you'll see an area to input 'Issuer ID'.

You can find this Issuer ID in App Store Connect, under Keys > App Store Connect API.

If you haven't done so yet, you'll need to request access to the App Store Connect API. In that case, you will also need to generate a random App Store Connect API key. Access level or name of the key here doesn't matter, but the Issuer ID will not show unless a key has been generated.

Copy the Issuer ID, which is now shown at the top of the page, and paste into the RevenueCat 'Issuer ID' field. 

![](https://files.readme.io/ab962c9-Screenshot_at_Feb_01_12-02-57.png "Screenshot at Feb 01 12-02-57.png")



![](https://files.readme.io/6b5df1b-issuer_id.png "issuer_id.png")



Remember to select 'Save changes'.

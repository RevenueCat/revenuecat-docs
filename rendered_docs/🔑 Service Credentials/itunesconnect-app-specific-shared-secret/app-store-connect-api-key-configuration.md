---
title: App Store Connect API Key Configuration
slug: app-store-connect-api-key-configuration
hidden: false
parentDocSlug: itunesconnect-app-specific-shared-secret
categorySlug: service-credentials
order: 4
parentDoc: 649983b4c31b2e000a3c1859
---
You may upload an App Store Connect API key for RevenueCat to import products and prices from App Store Connect. 

# 1. Create an App Store Connect API key

On App Store Connect, [create a new App Store Connect API key](https://developer.apple.com/documentation/appstoreconnectapi/creating_api_keys_for_app_store_connect_api) under Users and Access → Keys → App Store Connect API:

![](https://files.readme.io/de40cd6-Screenshot_2023-01-03_at_21.55.39.png "Screenshot 2023-01-03 at 21.55.39.png")



The newly created key needs to have at least the access level **Developer**:

![](https://files.readme.io/0f8e598-Screenshot_2023-01-03_at_22.00.26.png "Screenshot 2023-01-03 at 22.00.26.png")



Download the generated key. You will receive a .p8 key file. Also take note of the **Issuer ID** (shown above the "Active" table).

# 2. Upload the App Store Connect API key to RevenueCat

Once everything is set up in App Store Connect, you need to upload the App Store Connect API key from the previous step to RevenueCat. 

In the RevenueCat dashboard, select your iOS app from the Apps tab in your project settings.

Within your app settings, under the tab App Store Connect API, you'll see an area to upload your App Store Connect .p8 file that you downloaded from App Store Connect. 

Once you uploaded the in-app purchase .p8 file, you'll see an area to input the Issuer ID that is shown in App Store Connect above the table with the API keys.

Remember to select 'Save Changes'.

---
title: "Google Subscriptions and Backwards Compatibility"
slug: "google-subscriptions-and-backwards-compatibility"
hidden: false
createdAt: "2023-01-26T09:43:22.898Z"
updatedAt: "2023-02-02T17:15:33.638Z"
---
# RevenueCat compatibility with Google May 2022 Subscription Changes

In May 2022, Google introduced several [new features for subscription products](https://developer.android.com/google/play/billing/compatibility). These features are not supported in old versions of the RevenueCat SDK ([see table below](#revenuecat-sdk-version-support)). To ensure that apps using previous versions of the SDKs remain operational, you have to set up products as “backwards compatible” in Google Play Console. If you use RevenueCat Offerings, RevenueCat allows setting up a backwards compatible fallback product that will only be used for apps using old versions of the SDK.
[block:callout]
{
  "type": "warning",
  "title": "Private beta for Android SDK v6",
  "body": "Support for Google's May 2022 subscription changes in RevenueCat using the purchases-android SDK v6 is currently in private beta. If you are interested, please get in touch [via our community](https://community.revenuecat.com/revenuecat-announcements-2/looking-for-beta-testers-for-a-our-new-android-sdk-that-has-support-for-google-billing-library-5-2298)."
}
[/block]
# Migration of existing products to SDK v6+

In order to support the new Google Play features through the RevenueCat Android SDK v6+ and above, any existing products set up in your app were automatically migrated. This step does not impact compatibility with previous versions of the SDK. Old SDK versions will continue to work as before, regardless of whether or not the migration was successful. 

In some cases, the migration might have failed. This could be due to invalid Play Store service credentials,  a product identifier being mistyped in RevenueCat, or the product having been deleted in Google Play Console in the meantime. In these cases, a warning will be displayed in the products page and when attempting to attach such a product to an Offering:
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/e465cfc-Screenshot_2023-01-30_at_12.18.01.png",
        "Screenshot 2023-01-30 at 12.18.01.png",
        1486,
        252,
        "#000000"
      ]
    }
  ]
}
[/block]
Since we are lacking required data to purchase this product in the RevenueCat Android SDK v6+, it will not work with this version of the SDK. In addition, products that couldn't be migrated prevent the creation or import of new products with the same identifier to prevent conflicts.

To fix this problem, you can try one of the following:
- Delete the product in RevenueCat side and re-create or import it.
- Update your [Play Store service credentials](https://www.revenuecat.com/docs/creating-play-service-credentials) in the app's settings in RevenueCat. This will re-trigger the migration. Please allow a few minutes for the migration to complete, and then check the product status again.
- Create a new product with a new identifier.

If neither of these helps, please contact our [support team](https://www.revenuecat.com/support).

# RevenueCat SDK version support

The following table shows which SDK versions require backwards compatible products and which versions support all Google Play products:
[block:parameters]
{
  "data": {
    "h-0": "RevenueCat SDK",
    "h-1": "Version requiring backwards compatible product",
    "h-2": "Versions supporting all products",
    "0-0": "purchases-android",
    "0-1": "v5 and below",
    "0-2": "v6 and above (private beta)",
    "1-0": "purchases-react-native",
    "1-1": "v5 and below",
    "1-2": "*not yet supported*",
    "2-0": "purchases-flutter",
    "3-0": "purchases-unity",
    "4-0": "cordova-plugin-purchases",
    "2-1": "v4 and below",
    "3-1": "v4 and below",
    "4-1": "v3 and below",
    "2-2": "*not yet supported*",
    "3-2": "*not yet supported*",
    "4-2": "*not yet supported*"
  },
  "cols": 3,
  "rows": 5
}
[/block]
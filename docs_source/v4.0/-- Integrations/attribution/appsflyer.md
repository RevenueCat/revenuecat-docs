---
title: "AppsFlyer"
slug: "appsflyer"
excerpt: "Integrate Purchases SDK with AppsFlyer for precise revenue tracking"
hidden: false
metadata: 
  title: "AppsFlyer In-App Purchase Integration – RevenueCat"
  description: "With our AppsFlyer integration, you can accurately track subscriptions generated from AppsFlyer campaigns, allowing you to know precisely how much revenue your campaigns generate."
  image: 
    0: "https://files.readme.io/ffdf926-RevenueCat_Docs_OG.png"
    1: "RevenueCat Docs OG.png"
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: {}
updatedAt: "2023-02-06T18:34:34.580Z"
---
With our AppsFlyer integration you can:
* Accurately track subscriptions generated from AppsFlyer campaigns, allowing you to know precisely how much revenue your campaigns generate.
* Send trial conversions and renewals directly from RevenueCat to AppsFlyer, allowing for tracking without an app open.
* Continue to follow your cohorts for months to know the long tail revenue generated by your campaigns.

# 1. Install Appsflyer SDK

Before RevenueCat can integrate with Appsflyer, your app should be running the latest Appsflyer SDK. Refer to the [Appsflyer developer documentation](https://support.appsflyer.com/hc/en-us/sections/6551164458257-Integrate-the-AppsFlyer-SDK) for the latest installation instructions.

# 2. Send device data to RevenueCat

The Appsflyer integration requires some device-specific data. RevenueCat will only send events into Appsflyer if the below [Subscriber Attributes](doc:subscriber-attributes) keys have been set for the device.
[block:parameters]
{
  "data": {
    "h-0": "Key",
    "h-1": "Description",
    "h-2": "Required",
    "1-0": "`$idfa`",
    "2-0": "`$gpsAdId`",
    "3-0": "`$androidId`",
    "1-2": "✅ (recommended)",
    "2-2": "✅ (recommended)",
    "3-2": "✅ (recommended)",
    "5-2": "❌ (optional)",
    "5-0": "`$ip`",
    "1-1": "iOS [advertising identifier](https://developer.apple.com/documentation/adsupport/asidentifiermanager/1614151-advertisingidentifier) UUID",
    "2-1": "Google [advertising identifier](https://developers.google.com/android/reference/com/google/android/gms/ads/identifier/AdvertisingIdClient.Info)",
    "5-1": "The IP address of the device",
    "3-1": "Android [device identifier](https://developer.android.com/reference/android/provider/Settings.Secure#ANDROID_ID)",
    "4-0": "`$idfv`",
    "4-1": "iOS [vender identifier](https://developer.apple.com/documentation/uikit/uidevice/1620059-identifierforvendor) UUID",
    "4-2": "✅ (recommended)",
    "0-0": "`$appsflyerId`",
    "0-1": "Appsflyer Id. The unique Appsflyer identifier for the user",
    "0-2": "✅ (required)"
  },
  "cols": 3,
  "rows": 6
}
[/block]
These properties can be set manually, like any other [Subscriber Attributes](doc:subscriber-attributes), or through the helper methods to `collectDeviceIdentifiers()` and `setAppsflyerId()`. 
[block:code]
{
  "codes": [
    {
      "code": "import AdSupport\n// ...\nPurchases.configure(withAPIKey: \"public_sdk_key\")\n// ...\n\n// Automatically collect the $idfa, $idfv, and $ip values\nPurchases.shared.attribution.collectDeviceIdentifiers() \n\n// Set the Appsflyer Id\nPurchases.shared.attribution.setAppsflyerID(AppsFlyerLib.shared().getAppsFlyerUID())",
      "language": "swift",
      "name": "Swift"
    },
    {
      "code": "//..\nPurchases.configure(this, \"public_sdk_key\")\n//..\n  \n// Automatically collect the $gpsAdId, $androidId, and $ip values\nPurchases.sharedInstance.collectDeviceIdentifiers()\n  \n// Set the Appsflyer Id\nPurchases.sharedInstance.setAppsflyerID(AppsFlyerLib.getInstance().getAppsFlyerUID(this));",
      "language": "kotlin"
    }
  ]
}
[/block]
You should make sure to set attributes after the *Purchases SDK* is configured, and before the first purchase occurs. It's safe to set this multiple times, as only the new/updated values will be sent to RevenueCat.
[block:callout]
{
  "type": "danger",
  "title": "Device identifiers with iOS App Tracking Transparency (iOS 14.5+)",
  "body": "If you are requesting the App Tracking permission through ATT to access the IDFA, you can call `.collectDeviceIdentifiers()` *again* if the customer accepts the permission to update the `$idfa` attribute in RevenueCat."
}
[/block]

[block:callout]
{
  "type": "info",
  "title": "Import AdSupport Framework (iOS)",
  "body": "The AdSupport framework is required to access the IDFA parameter on iOS. Don't forget to import this into your project."
}
[/block]

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/caf9cda-Screen_Shot_2020-09-14_at_7.09.36_PM.png",
        "Screen Shot 2020-09-14 at 7.09.36 PM.png",
        649,
        155,
        "#2b292b"
      ]
    }
  ]
}
[/block]

[block:callout]
{
  "type": "danger",
  "body": "Make sure to remove all client-side tracking of revenue. Since RevenueCat will be sending events for all revenue actions, tracking purchases with the Appsflyer SDK directly can lead to double counting of revenue in Appsflyer.",
  "title": "Remove any client-side purchase tracking"
}
[/block]
## (Optional) Send campaign data to RevenueCat
RevenueCat itself is not an attribution network, and can't determine which specific ad drove an install/conversion. However, if you're able to collect this information from another source, such as Appsflyer, it's possible to attach it to a user in RevenueCat using [Subscriber Attributes](doc:subscriber-attributes)  as well.
The below reserved key names can be used to optionally attach campaign data to a user. This data will then be sent through to other downstream analytics integrations and accessible via APIs and webhooks.
[block:parameters]
{
  "data": {
    "h-0": "Key",
    "0-0": "`$mediaSource`",
    "1-0": "`$campaign`",
    "2-0": "`$adGroup`",
    "3-0": "`$ad`",
    "4-0": "`$keyword`",
    "5-0": "`$creative`"
  },
  "cols": 1,
  "rows": 6
}
[/block]
## (Optional) Block sharing of events
To fulfill regulatory requirements like GDPR and CCPA, comply with user opt-out mechanisms, and other business reasons, you can limit sharing events with AppsFlyer's integrated partners and other third-party integrations. This is accomplished by setting the `$appsflyerSharingFilter` [Subscriber Attribute](doc:subscriber-attributes), which will block the sharing of S2S events via postbacks/API with the specified partners.

This Subscriber Attribute accepts the following formats:
- String with the word `all`
- Array in the format `["partner_1", "partner_2"]`;  stringify’ed as `"[\"partner_1\", \"partner_2\"]"`

If you are setting or editing the list of partner IDs through the [dashboard](https://www.revenuecat.com/docs/subscriber-attributes#reading-attributes), use the format `partner_1,partner_2`

For a list of partner IDs, please contact your AppsFlyer CSM or AppsFlyer support.
[block:callout]
{
  "type": "info",
  "title": "AppsFlyer Sharing Filter Resctrictions",
  "body": "The `$appsflyerSharingFilter` has a limit of 50 partner IDs. If your team encounters issues with this limit, please reach out to our RevenueCat Support via the dashboard [Contact Us](https://app.revenuecat.com/settings/support) form in your account settings."
}
[/block]
# 3. Send RevenueCat events into AppsFlyer

After you've set up the *Purchases SDK* to send attribution data from AppsFlyer to RevenueCat, you can "turn on" the integration and configure the event names from the RevenueCat dashboard.

1. Navigate to your project in the RevenueCat dashboard and find the *Integrations* card in the left menu. Select **+ New** 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/7cf2c27-Screen_Shot_2021-12-01_at_12.23.10_PM.png",
        "Screen Shot 2021-12-01 at 12.23.10 PM.png",
        332,
        410,
        "#f5f6f5"
      ]
    }
  ]
}
[/block]
2. Choose **AppsFlyer** from the Integrations menu
3. Add your generic developer key if you use one AppsFlyer project for both iOS and android in the Developer Key field **OR** If you have specific developer keys for iOS and/or Android, add those in the associated UI fields
4. If you have specific sandbox developer keys for iOS and/or Android, add those in the associated UI fields
4. Enter the event names that RevenueCat will send or choose the default event names
5. Select whether you want sales reported as gross revenue (before app store commission), or after store commission and/or estimated taxes.


[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/974687c-AppsFlyer_Integration.png",
        "AppsFlyer Integration.png",
        1683,
        4323,
        "#000000"
      ],
      "caption": "AppsFlyer configuration screen"
    }
  ]
}
[/block]
# 4. Testing the Appsflyer integration

You can test the Appsflyer integration end-to-end before going live. It's recommended that you test the integration is working properly for new users, and any existing users that may update their app to a new version.

## Add a sandbox API key in the RevenueCat dashboard
Before you test the integration, make sure you have an Appsflyer API key set in the "Sandbox developer key" field in RevenueCat. This is required if you want the integration to trigger for sandbox purchases.

## Make a sandbox purchase with a new user
Simulate a new user installing your app, and go through your app flow to complete a sandbox purchase.

## Check that the required device data is collected
Navigate the the [Customer View](doc:customers) for the test user that just made a purchase. Make sure that all of the required data from step 1 above is listed as attributes for the user.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/a74e628-Screen_Shot_2020-07-29_at_5.31.46_PM.png",
        "Screen Shot 2020-07-29 at 5.31.46 PM.png",
        366,
        342,
        "#f7f4f3"
      ]
    }
  ]
}
[/block]
## Check that the Appsflyer  event delivered successfully
While still on the Customer View, click into the test purchase event in the [Customer History](doc:customer-history) and make sure that the AppsFlyer integration event exists and was delivered successfully. 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/a555888-Screen_Shot_2020-09-16_at_12.45.45_PM.png",
        "Screen Shot 2020-09-16 at 12.45.45 PM.png",
        942,
        225,
        "#f8f3f3"
      ]
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "title": "AppsFlyer reports events by install date",
  "body": "Under the Events view, AppsFlyer displays in-app events according to the install date of the user. This means if you select Jan 1 through Jan 8, you'll see the events that were performed by users who *installed* within the selected date range.\n\nRefer to [AppsFlyer's docs](https://support.appsflyer.com/hc/en-us/articles/207034486-Server-to-server-events-API-for-mobile-S2S-mobile-#troubleshooting) for more information about this."
}
[/block]

[block:callout]
{
  "type": "success",
  "title": "You've done it!",
  "body": "You should start seeing events from RevenueCat appear in AppsFlyer"
}
[/block]
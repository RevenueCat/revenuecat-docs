---
title: "Apple Search Ads"
slug: "apple-search-ads"
excerpt: "Collect and view Apple Search Ads attribution in RevenueCat using AdServices"
hidden: false
createdAt: "2022-05-23T14:12:29.055Z"
updatedAt: "2022-09-15T14:15:17.313Z"
---
[block:callout]
{
  "type": "success",
  "body": "The Apple Search Ads (AdServices) integration is available on the [Pro](https://www.revenuecat.com/pricing) plan, Enterprise plan, and legacy Grow plan."
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "Looking for the legacy iAd docs instead of AdServices? [Click here](https://docs.revenuecat.com/docs/apple-search-ads-legacy)"
}
[/block]
With our Apple Search Ads integration you can:
* Continue to follow your campaign's install base for months to understand the long-tail revenue generated from subscriptions, even without an app open.
* Filter and segment RevenueCat charts by Apple Search Ads campaigns or ad groups.

Collecting Apple Search Ads data is a two part process: first, you must collect the user's attribution token and send it to RevenueCat, then RevenueCat will request attribution data from Apple directly within a 24 hour period. 

Once attribution data is collected from Apple, it will be available via Charts and other integrations.

# 1. Configure Integration
[block:callout]
{
  "type": "danger",
  "title": "Basic vs Advanced",
  "body": "Apple Search Ads offer two products, **Search Ads Basic** and **Search Ads Advanced**. The RevenueCat Apple Search Ads integrations supports both Basic and Advanced. However, Advanced will require more configuration than Basic."
}
[/block]
## Basic

- Navigate to your project in the RevenueCat dashboard and choose 'Apple Ads Services' from the Integrations menu.
- Click on **Add Apple Search Ads integration** to add the integration.

## Advanced


- Navigate to your project in the RevenueCat dashboard and choose 'Apple Ads Services' from the Integrations menu.
- Click on **Add Apple Search Ads integration** to add the integration.
- Go to **Account Settings** > **API** in your Search Ads dashboard, and paste your public key in the **Client Credentials** section in settings of your **API User**.
[block:callout]
{
  "type": "warning",
  "title": "Saving your public key may require Safari",
  "body": "Apple Search Ads may reject the public key with an 'invalid' error message if you're using a browser other than Safari. If you get this error, try switching to Safari to save the key."
}
[/block]

[block:callout]
{
  "type": "info",
  "title": "Apple Search Ads API User",
  "body": "RevenueCat uses the Campaign Management API to access the campaign data from Apple Search Ads. This API requires access through a separate Apple ID that with one of the following roles: **API Account Manager**, **API Account Read Only**, or **Limited Access API Read** & **Write or API Read Only**.\n\nMore info about creating these users can be found [here](https://searchads.apple.com/help/campaigns/0022-use-the-campaign-management-api).\n\nPlease make sure you **do not use an incognito window** when creating a new Apple ID for the API user as we have seen it cause difficulties for other developers."
}
[/block]

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/99a42cb-Screen_Shot_2022-06-28_at_3.44.24_PM.png",
        "Screen Shot 2022-06-28 at 3.44.24 PM.png",
        2012,
        1074,
        "#f8f9fa"
      ],
      "sizing": "full",
      "border": true
    }
  ]
}
[/block]
- Then, copy the provided `clientId`, `teamId` and `keyId` from the Search Ads page to your RevenueCat Dashboard.
- Click the 'Save' button in the top right corner.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/14fc09e-Screen_Shot_2022-07-13_at_8.44.31_PM.png",
        "Screen Shot 2022-07-13 at 8.44.31 PM.png",
        1876,
        1348,
        "#fafafa"
      ],
      "border": true
    }
  ]
}
[/block]
# 2. Send attribution token to RevenueCat 
[block:callout]
{
  "type": "info",
  "title": "Compatibility",
  "body": "Using AdServices to collect Apple Search Ads data requires iOS 14.3+, and is not supported on earlier versions of iOS. If you need to continue collecting Apple Search Ads data for older versions of iOS, follow our legacy Apple Search Ads instructions."
}
[/block]
Apple Search Ads provides two different types of attribution data, one a Standard view and one a Detailed view. Attribution fields vary between the two types of data, which may affect downstream integrations, and will require a different client-side implementation.
[block:parameters]
{
  "data": {
    "h-0": "",
    "h-1": "Standard",
    "h-2": "Detailed",
    "1-0": "`attribution`",
    "8-0": "`adId`",
    "7-0": "`keywordId`",
    "6-0": "`countryOrRegion`",
    "5-0": "`adGroupId`",
    "4-0": "`clickDate`",
    "3-0": "`conversionType`",
    "2-0": "`campaignId`",
    "4-1": "❌",
    "4-2": "✅",
    "3-2": "✅",
    "2-2": "✅",
    "1-2": "✅",
    "5-2": "✅",
    "6-2": "✅",
    "7-2": "✅",
    "8-2": "✅",
    "8-1": "✅",
    "7-1": "✅",
    "6-1": "✅",
    "5-1": "✅",
    "3-1": "✅",
    "2-1": "✅",
    "1-1": "✅",
    "0-0": "App Tracking Consent Required",
    "0-1": "No",
    "0-2": "Yes"
  },
  "cols": 3,
  "rows": 9
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "Note that this is the same data that is sent to other downstream integrations that receive Apple Search Ads data (like SplitMetrics Acquire). If you need fields that are unavailable in the Standard data, use Detailed instead.",
  "title": ""
}
[/block]
## Standard
The standard attribution data collection does not require user consent and can be enabled by calling `Purchases.shared.attribution.enableAdServicesAttributionTokenCollection()` after calling `configure`:
[block:code]
{
  "codes": [
    {
      "code": "func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {\n\t\t\n    Purchases.configure(withAPIKey: \"public_sdk_key\", appUserID: \"my_app_user_id\")\n    Purchases.shared.attribution.enableAdServicesAttributionTokenCollection()\n    \n    return true\n}",
      "language": "swift",
      "name": "Swift"
    },
    {
      "code": "- (BOOL)application:(UIApplication *)application \n  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {\n  \n  RCPurchases *purchases = [RCPurchases configureWithAPIKey:@\"public_sdk_key\" appUserID:@\"my_app_user_id\"];\n  [purchases.attribution enableAdServicesAttributionTokenCollection];\n\n}",
      "language": "objectivec",
      "name": "Objective-C"
    },
    {
      "code": "Future<void> initPlatformState() async {\n  await Purchases.setDebugLogsEnabled(true);\n  \n  if (Platform.isAndroid) {\n    await Purchases.setup(\"public_google_sdk_key\");\n  } else if (Platform.isIOS) {\n    await Purchases.setup(\"public_ios_sdk_key\");\n    \n    // OR: if building for Amazon, be sure to follow the installation instructions then:\n    await Purchases.setup(\"public_amazon_sdk_key\", useAmazon: true);\n  }\n\n  await Purchases.enableAdServicesAttributionTokenCollection();\n  \n}",
      "language": "javascript",
      "name": "Flutter"
    },
    {
      "code": "export default class App extends React.Component {\n \n  componentDidMount() {\n    Purchases.setDebugLogsEnabled(true);\n    \n    if (Platform.OS === 'ios') {\n    \tawait Purchases.setup(\"public_ios_sdk_key\");\n    } else if (Platform.OS === 'android') {\n    \tawait Purchases.setup(\"public_google_sdk_key\");\n      \n      // OR: if building for Amazon, be sure to follow the installation instructions then:\n    \tawait Purchases.setup({ apiKey: \"public_amazon_sdk_key\", useAmazon: true });\n    }\n    \n    await Purchases.enableAdServicesAttributionTokenCollection();\n    \n  }\n}",
      "language": "javascript",
      "name": "React Native"
    },
    {
      "code": "function onDeviceReady() {\n    Purchases.setDebugLogsEnabled(true);\n    if (window.cordova.platformId === 'ios') {\n        Purchases.setup(\"public_ios_sdk_key\");\n    } else if (window.cordova.platformId === 'android') {\n        Purchases.setup(\"public_google_sdk_key\");\n    }\n  \n    Purchases.enableAdServicesAttributionTokenCollection();\n}",
      "language": "javascript",
      "name": "Cordova"
    }
  ]
}
[/block]
That's it! The Purchases SDK will collect the attribution token and send it to RevenueCat in the background.

## Detailed

To collect Detailed attribution data, you'll need to first request consent from your users by using the [App Tracking Transparency](https://developer.apple.com/documentation/apptrackingtransparency) framework.

If the user rejects tracking, the Standard attribution data can still be collected.

To request consent from a user, implement the `requestTrackingAuthorization` method before enabling automatic collection:
[block:code]
{
  "codes": [
    {
      "code": "import AdServices\n...\nfunc application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {\n\n     Purchases.configure(withAPIKey: \"public_sdk_key\", appUserID: \"my_app_user_id\")\n  \n     if ATTrackingManager.trackingAuthorizationStatus != .notDetermined {\n     // The user has previously seen a tracking request, so enable automatic collection\n     // before configuring in order to to collect whichever token is available \n     Purchases.shared.attribution.enableAdServicesAttributionTokenCollection()\n    }\n    \n    return true\n}\n\n// Later in your app's lifecycle, ask consent for tracking\nif ATTrackingManager.trackingAuthorizationStatus == .notDetermined {\n    ATTrackingManager.requestTrackingAuthorization { _ in\n        Purchases.shared.attribution.enableAdServicesAttributionTokenCollection()\n    }\n}",
      "language": "swift",
      "name": "Swift"
    }
  ]
}
[/block]
After automatic collection is enabled, Purchases will sync the attribution token with the RevenueCat backend. Please note that if you enable automatic collection *before* requesting authorization, the attribution token will only be valid for Standard and not Detailed attribution data.
[block:image]
{
  "images": [
    {
      "image": []
    }
  ]
}
[/block]
# 3. View attribution data in RevenueCat

After the *Purchases SDK* has collected attribution for some users, you'll be able to segment and view charts for those conversions.

## Choose conversion level
In the 'Select Segment' dropdown choose *Apple search ads group* or *Apple search ads campaign* from the Segment section.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/d5697be-asa_segment.png",
        "asa_segment.png",
        672,
        1040,
        "#000000"
      ]
    }
  ]
}
[/block]
## View charts
Apple Search Ad attribution is available as segments and filters in the following charts:
- Active Subscriptions
- Churn
- Refund Rate
- Annual Recurring Revenue (ARR)
- Monthly Recurring Revenue (MRR)
- Revenue
- Active Trials
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/230537e-asa_chart.png",
        "asa_chart.png",
        1414,
        933,
        "#f9fafa"
      ]
    }
  ]
}
[/block]
## Filter chart to compare individual campaigns or ad groups
Select and deselect rows to compare individual campaigns or ad sets
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/3719b43-asa_rows.png",
        "asa_rows.png",
        223,
        268,
        "#f5f0f1"
      ]
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "The value of `Unspecified` is used to group transactions that are attributed to an Apple Search Ads ad, but do not have a specified Campaign Name or Ad Group Name. This is almost always because the ad has been delivered through an Apple Search Ads Basic account, where campaign names and ad group names are not specified."
}
[/block]

[block:callout]
{
  "type": "info",
  "title": "",
  "body": "The value of `Organic` is used to group transactions that are not attributed to an Apple Search Ads campaign. This means it was an organic install or users with limit ad tracking enabled."
}
[/block]

[block:callout]
{
  "type": "warning",
  "title": "Allow up to 7 days to gather attribution data",
  "body": "If your campaigns are new or you recently set up the Apple Search Ads integration, allow some time for RevenueCat to collect attribution and purchase data."
}
[/block]
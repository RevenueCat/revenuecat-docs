---
title: Apple Search Ads & RevenueCat Integration
slug: apple-search-ads
excerpt: Collect and view Apple Search Ads attribution in RevenueCat using AdServices
hidden: false
categorySlug: integrations
order: 1
parentDoc: 649983b4c31b2e000a3c1860
---
> 👍 
> 
> The Apple Search Ads (AdServices) integration is available to all users signed up after September '23, the legacy Grow and Pro plans, and Enterprise plans. If you're on a legacy Free or Starter plan and want to access this integration, migrate to our new pricing via your [billing settings](https://app.revenuecat.com/settings/billing). Apple Search Ads is supported in iOS SDK version 4.10.0 and up

With our Apple Search Ads integration you can:

- Continue to follow your campaign's install base for months to understand the long-tail revenue generated from subscriptions, even without an app open.
- Filter and segment RevenueCat charts by Apple Search Ads campaigns or ad groups.

Collecting Apple Search Ads data is a two part process: first, you must collect the user's attribution token and send it to RevenueCat, then RevenueCat will request attribution data from Apple directly within a 24 hour period. 

Once attribution data is collected from Apple, it will be available via Charts and other integrations.

# 1. Configure Integration

> ❗️ Basic vs Advanced
> 
> Apple Search Ads offer two products, **Search Ads Basic** and **Search Ads Advanced**. The RevenueCat Apple Search Ads integrations supports both Basic and Advanced. However, Advanced will require more configuration than Basic.

## Basic

- Navigate to your project in the RevenueCat dashboard and choose 'Apple Ads Services' from the Integrations menu.
- Click on **Add Apple Search Ads integration** to add the integration.

## Advanced

- Navigate to your project in the RevenueCat dashboard and choose 'Apple Ads Services' from the Integrations menu.
- Click on **Add Apple Search Ads integration** to add the integration.
- Go to **Account Settings** > **API** in your Search Ads dashboard, and paste your public key in the **Client Credentials** section in settings of your **API User**.

> 🚧 Saving your public key may require Safari
> 
> Apple Search Ads may reject the public key with an 'invalid' error message if you're using a browser other than Safari. If you get this error, try switching to Safari to save the key.

> 📘 Apple Search Ads API User
> 
> RevenueCat uses the Campaign Management API to access the campaign data from Apple Search Ads. This API requires access through a separate Apple ID that with one of the following roles: **API Account Manager**, **API Account Read Only**, or **Limited Access API Read** & **Write or API Read Only**.
> 
> More info about creating these users can be found [here](https://searchads.apple.com/help/campaigns/0022-use-the-campaign-management-api).
> 
> Please make sure you **do not use an incognito window** when creating a new Apple ID for the API user as we have seen it cause difficulties for other developers.

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/99a42cb-Screen_Shot_2022-06-28_at_3.44.24_PM.png",
        "Screen Shot 2022-06-28 at 3.44.24 PM.png",
        2012
      ],
      "align": "center",
      "sizing": "100",
      "border": true
    }
  ]
}
[/block]

> 👍 
> 
> If you're having trouble finding the screen where you can add upload your public key to Client Credentials, ensure that you're logged in as the client Apple ID, and not your primary Apple ID. 

- Then, copy the provided `clientId`, `teamId` and `keyId` from the Search Ads page to your RevenueCat Dashboard.
- Click the 'Save' button in the top right corner.

![](https://files.readme.io/3fd8c12-app.revenuecat.com_projects_85ff18c7_integrations_adjust_2.png)

# 2. Send attribution token to RevenueCat

> 📘 Compatibility
> 
> Using AdServices to collect Apple Search Ads data requires iOS 14.3+, and is not supported on earlier versions of iOS. If you need to continue collecting Apple Search Ads data for older versions of iOS, follow our legacy Apple Search Ads instructions.

Apple Search Ads provides two different types of attribution data, one a Standard view and one a Detailed view. Attribution fields vary between the two types of data, which may affect downstream integrations, and will require a different client-side implementation.

|                               | Standard | Detailed |
| :---------------------------- | :------- | :------- |
| App Tracking Consent Required | No       | Yes      |
| `attribution`                 | ✅        | ✅        |
| `campaignId`                  | ✅        | ✅        |
| `conversionType`              | ✅        | ✅        |
| `clickDate`                   | ❌        | ✅        |
| `adGroupId`                   | ✅        | ✅        |
| `countryOrRegion`             | ✅        | ✅        |
| `keywordId`                   | ✅        | ✅        |
| `adId`                        | ✅        | ✅        |

> 📘 
> 
> Note that this is the same data that is sent to other downstream integrations that receive Apple Search Ads data (like SplitMetrics Acquire). If you need fields that are unavailable in the Standard data, use Detailed instead.

## Standard

The standard attribution data collection does not require user consent and can be enabled by calling `Purchases.shared.attribution.enableAdServicesAttributionTokenCollection()` after calling `configure`:

```swift Swift
func application(_ application: UIApplication,
                 didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

    Purchases.configure(withAPIKey: "public_sdk_key", appUserID: "my_app_user_id")
    Purchases.shared.attribution.enableAdServicesAttributionTokenCollection()

    return true
}
```
```objectivec Objective-C
- (BOOL)application:(UIApplication *)application 
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
  RCPurchases *purchases = [RCPurchases configureWithAPIKey:@"public_sdk_key" appUserID:@"my_app_user_id"];
  [purchases.attribution enableAdServicesAttributionTokenCollection];

}
```
```dart Flutter
// ...
await Purchases.configure(PurchasesConfiguration(<public_api_key>));
// ...
await Purchases.enableAdServicesAttributionTokenCollection();
```
```javascript React Native
// ...
await Purchases.configure({apiKey: <public_api_key>});
// ...
Purchases.enableAdServicesAttributionTokenCollection();
```
```javascript Cordova
// ...
Purchases.configureWith({apiKey: <public_api_key>});
// ...
Purchases.enableAdServicesAttributionTokenCollection();
```

That's it! The Purchases SDK will collect the attribution token and send it to RevenueCat in the background.

## Detailed

To collect Detailed attribution data, you'll need to first request consent from your users by using the [App Tracking Transparency](https://developer.apple.com/documentation/apptrackingtransparency) framework.

If the user rejects tracking, the Standard attribution data can still be collected.

To request consent from a user, implement the `requestTrackingAuthorization` method before enabling automatic collection:

```swift Swift
import AdServices

func application(_ application: UIApplication,
                 didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

     Purchases.configure(withAPIKey: "public_sdk_key", appUserID: "my_app_user_id")

     if ATTrackingManager.trackingAuthorizationStatus != .notDetermined {
     // The user has previously seen a tracking request, so enable automatic collection
     // before configuring in order to to collect whichever token is available
     Purchases.shared.attribution.enableAdServicesAttributionTokenCollection()
    }

    return true
}

// Later in your app's lifecycle, ask consent for tracking
if ATTrackingManager.trackingAuthorizationStatus == .notDetermined {
    ATTrackingManager.requestTrackingAuthorization { _ in
        Purchases.shared.attribution.enableAdServicesAttributionTokenCollection()
    }
}
```

After automatic collection is enabled, Purchases will sync the attribution token with the RevenueCat backend. Please note that if you enable automatic collection _before_ requesting authorization, the attribution token will only be valid for Standard and not Detailed attribution data.

# 3. View attribution data in RevenueCat

After the _Purchases SDK_ has collected attribution for some users, you'll be able to segment and view charts for those conversions.

## Choose conversion level

In the 'Select Segment' dropdown choose _Apple search ads group_ or _Apple search ads campaign_ from the Segment section.

![](https://files.readme.io/e566bfe-Screenshot_2023-03-28_at_2.09.54_PM.png)

## View charts

Apple Search Ad attribution is available as segments and filters in the following charts:

- Active Subscriptions
- Churn
- Refund Rate
- Annual Recurring Revenue (ARR)
- Monthly Recurring Revenue (MRR)
- Revenue
- Active Trials

![](https://files.readme.io/230537e-asa_chart.png "asa_chart.png")

## Filter chart to compare individual campaigns or ad groups

Select and deselect rows to compare individual campaigns or ad sets

![](https://files.readme.io/3719b43-asa_rows.png "asa_rows.png")

> 📘 
> 
> The value of `Unspecified` is used to group transactions that are attributed to an Apple Search Ads ad, but do not have a specified Campaign Name or Ad Group Name. This is almost always because the ad has been delivered through an Apple Search Ads Basic account, where campaign names and ad group names are not specified.

> 📘 
> 
> The value of `Organic` is used to group transactions that are not attributed to an Apple Search Ads campaign. This means it was an organic install or users with limit ad tracking enabled.

> 🚧 Allow up to 7 days to gather attribution data
> 
> If your campaigns are new or you recently set up the Apple Search Ads integration, allow some time for RevenueCat to collect attribution and purchase data.

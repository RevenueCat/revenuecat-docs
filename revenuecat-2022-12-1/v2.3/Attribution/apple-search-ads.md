---
title: "Apple Search Ads"
slug: "apple-search-ads"
excerpt: "Collect and view Apple Search Ads attribution in RevenueCat"
hidden: false
createdAt: "2018-12-13T18:49:08.572Z"
updatedAt: "2019-09-03T23:55:08.566Z"
---
With our Apple Search Ad integration you can:
* Continue to follow your campaign's install base for months to understand the long-tail revenue generated from subscriptions, even without an app open.
* Filter and segment RevenueCat charts by Apple Search Ad campaigns or ad groups.
[block:api-header]
{
  "title": "1. Send attribution data to RevenueCat"
}
[/block]
## Option 1: Automatic attribution collection

The *Purchases SDK* can automatically collect Apple Search Ad attribution data as long as you include the iAd framework to your Xcode project and set `automaticAttributionCollection = true`.

[block:code]
{
  "codes": [
    {
      "code": "import iAd\n...\nfunc application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {\n\t\t\n    Purchases.automaticAppleSearchAdsAttributionCollection = true\n    Purchases.configure(withAPIKey: \"public_sdk_key\", appUserID: \"my_app_user_id\")\n    \n    return true\n}",
      "language": "swift",
      "name": "Swift"
    },
    {
      "code": "#import <iAd/iAd.h>\n... \n- (BOOL)application:(UIApplication *)application \n  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {\n  \n  RCPurchases.automaticAttributionCollection = YES;\n  [RCPurchases configureWithAPIKey:@\"public_sdk_key\" appUserID:@\"my_app_user_id\"];\n\n}",
      "language": "objectivec",
      "name": "Objective-C"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "danger",
  "title": "Automatic attribution is collected for the configured App User Id",
  "body": "If you're changing the App User Id after configuration, you should manually collect the Apple Search Ad attribution **after** you've set the correct App User ID as shown below."
}
[/block]
## Option 2: Manual attribution collection

You can also send Apple Search Ad attribution to RevenueCat manually with the `addAttribution` method. This may be preferable if you are changing the App User Id after configuration.
[block:code]
{
  "codes": [
    {
      "code": "import iAd\n...\nfunc application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {\n\t\t\n    Purchases.configure(withAPIKey: \"public_sdk_key\")\n    \n    //... set the correct App User Id somewhere here\n    \n    ADClient.shared().requestAttributionDetails { (details, error) in\n        if let details = details {\n            Purchases.addAttributionData(details, from: .appleSearchAds)\n        }\n    }\n    \n    return true\n}",
      "language": "swift"
    },
    {
      "code": "#import <iAd/iAd.h>\n... \n- (BOOL)application:(UIApplication *)application \n  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {\n  \n  [RCPurchases configureWithAPIKey:@\"public_sdk_key\"];\n    \n  //... set the correct App User Id somewhere here\n    \n  [[ADClient sharedClient] \n   requestAttributionDetailsWithBlock:^(\n     NSDictionary *details, \n     NSError *error) { \n     if (error == nil) {\n       [RCPurchases addAttributionData:details\n                              fromNetwork:RCAttributionSourceAppleSearchAds];\n     }\n   }];\n\n}",
      "language": "objectivec"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "title": "Disable Automatic Attribution Collection",
  "body": "If you're collecting Apple Search Ad attribution manually, be sure `automaticAppleSearchAdsAttributionCollection ` is set to `false` (default)."
}
[/block]

[block:api-header]
{
  "title": "2. View attribution data in RevenueCat"
}
[/block]
After the *Purchases SDK* has collected attribution for some users, you'll be able to segment and view charts for those conversions.

## Choose conversion level
In the 'Select Segment' dropdown choose *Campaign* or *Ad Group* from the Apple Search Ads section.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/b3b496a-Screen_Shot_2019-05-23_at_5.11.56_PM.png",
        "Screen Shot 2019-05-23 at 5.11.56 PM.png",
        234,
        598,
        "#ebecea"
      ]
    }
  ]
}
[/block]
## View charts
Apple Search Ad attribution is available as segments and filters in the following charts:
- Monthly Recurring Revenue
- Revenue
- New Purchases and Trials
- Active Subscriptions and Trials
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/edec313-Screen_Shot_2019-05-23_at_5.20.12_PM.png",
        "Screen Shot 2019-05-23 at 5.20.12 PM.png",
        1005,
        889,
        "#edeee5"
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
        "https://files.readme.io/a208a0a-Screen_Shot_2019-05-23_at_5.21.42_PM.png",
        "Screen Shot 2019-05-23 at 5.21.42 PM.png",
        381,
        330,
        "#eae6e6"
      ]
    }
  ]
}
[/block]
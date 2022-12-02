---
title: "Apple Search Ads"
slug: "apple-search-ads"
excerpt: "Collect and view Apple Search Ads attribution in RevenueCat"
hidden: false
metadata: 
  title: "Apple Search Ads Attribution | RevenueCat"
  description: "Precisely measure long-tail revenue driven from Apple Search Ad campaigns. With our Apple Search Ad integration, you can follow your campaign's install base for months even without an app open."
  image: 
    0: "https://files.readme.io/730e5e3-Reddit__E.jpg"
    1: "Reddit – E.jpg"
    2: 1200
    3: 630
    4: "#fbabaf"
createdAt: {}
updatedAt: "2020-06-09T21:51:28.387Z"
---
With our Apple Search Ad integration you can:
* Continue to follow your campaign's install base for months to understand the long-tail revenue generated from subscriptions, even without an app open.
* Filter and segment RevenueCat charts by Apple Search Ad campaigns or ad groups.
[block:api-header]
{
  "title": "1. Send attribution data to RevenueCat"
}
[/block]
The *Purchases SDK* can automatically collect Apple Search Ad attribution data as long as you embed the iAd framework to your Xcode project and set `automaticAttributionCollection = true`.

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
Don't forget to import the iAd framework to your XCode project.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/188bdd6-Screen_Shot_2020-04-06_at_8.36.42_PM.png",
        "Screen Shot 2020-04-06 at 8.36.42 PM.png",
        598,
        176,
        "#29282a"
      ]
    }
  ]
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
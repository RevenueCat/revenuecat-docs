---
title: Apple Search Ads (Legacy)
slug: apple-search-ads-legacy
excerpt: Collect and view Apple Search Ads attribution in RevenueCat using iAd
hidden: true
metadata:
  title: Apple Search Ads Attribution – RevenueCat
  description: Precisely measure long-tail revenue driven from Apple Search Ad campaigns.
    With our Apple Search Ad integration, you can follow your campaign's install base
    for months even without an app open.
  image:
    0: https://files.readme.io/93beec0-RevenueCat_Docs_OG.png
    1: RevenueCat Docs OG.png
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: '2022-08-08T18:37:59.872Z'
updatedAt: '2022-08-08T18:37:59.872Z'
category: 640a7bf1c7bae2004235517b
---
[block:callout]
{
  "type": "info",
  "body": "Looking for AdServices docs instead of the legacy iAd? [Click here](https://docs.revenuecat.com/docs/apple-search-ads)"
}
[/block]
With our Apple Search Ads integration you can:
* Continue to follow your campaign's install base for months to understand the long-tail revenue generated from subscriptions, even without an app open.
* Filter and segment RevenueCat charts by Apple Search Ads campaigns or ad groups.

# 1. Send attribution data to RevenueCat 

The *Purchases SDK* can automatically collect Apple Search Ads attribution data as long as you import the iAd framework to your Xcode project and set `automaticAttributionCollection = true`.

```swift
import iAd
...
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		
    Purchases.automaticAppleSearchAdsAttributionCollection = true
    Purchases.configure(withAPIKey: "public_sdk_key", appUserID: "my_app_user_id")
    
    return true
}
```
```objectivec
#import <iAd/iAd.h>
... 
- (BOOL)application:(UIApplication *)application 
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
  RCPurchases.automaticAppleSearchAdsAttributionCollection = YES;
  [RCPurchases configureWithAPIKey:@"public_sdk_key" appUserID:@"my_app_user_id"];

}
```
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

[block:callout]
{
  "type": "danger",
  "title": "Must request tracking permission in iOS 14.5+",
  "body": "**On iOS 14.5+, you must be running the latest RevenueCat SDK and request authorization via the [App Tracking Transparency](https://developer.apple.com/documentation/apptrackingtransparency) framework before Apple Search Ads data can be collected by RevenueCat**. \n\nRevenueCat does not automatically request this permission from users."
}
[/block]
# 2. View attribution data in RevenueCat

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
  "title": "(not set)",
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
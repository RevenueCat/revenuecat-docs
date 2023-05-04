---
title: "Overview (v1)"
slug: "basic"
hidden: false
createdAt: "2018-10-01T11:03:55.483Z"
updatedAt: "2023-04-12T02:00:14.160Z"
---
## About RevenueCat’s REST API

Certain endpoints require secret keys, which should be kept out of any publicly accessible areas such as GitHub, client-side code, and so forth. See our [Authentication guide](doc:authentication) for more information.

[block:code]
{
"codes": [
{
"code": "func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {\n    purchases = RCPurchases(apiKey: \"my_app_api_key\")\n    purchases!.delegate = self\n\n    ADClient.shared().requestAttributionDetails { (details, error) in\n        if let details = details {\n            self.purchases?.addAttributionData(details, from: .appleSearchAds)\n        }\n    }\n\n    return true\n}",
"language": "swift",
"name": "Search Ads - Swift"
},
{
"code": "extension AppDelegate: AdjustDelegate {\n    func adjustAttributionChanged(_ attribution: ADJAttribution?) {\n        if let data = attribution?.dictionary() {\n            purchases?.addAttributionData(data, from: .adjust)\n        }\n    }\n}",
"language": "swift",
"name": "Adjust - Swift"
},
{
"code": "extension AppDelegate: AppsFlyerTrackerDelegate {\n    func onConversionDataReceived(_ installData: [AnyHashable : Any]!) {\n        \n        if var data = installData {\n            data[\"rc_appsflyer_id\"] = AppsFlyerTracker.shared().getAppsFlyerUID()\n            \n            purchases?.addAttributionData(data, from: .appsFlyer)\n        }\n    }\n}",
"language": "swift",
"name": "AppsFlyer - Swift"
},
{
"code": "Branch.getInstance().initSession(launchOptions: launchOptions) { (data, error) in\n    if let data = data {\n        self.purchases?.addAttributionData(data, from: .branch)\n    }\n}",
"language": "swift",
"name": "Branch - Swift"
},
{
"code": "@interface AppDelegate : UIResponder <UIApplicationDelegate>\n \n- (BOOL)application:(UIApplication *)application \n  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {\n  \n  self.purchases = [[RCPurchases alloc] initWithAPIKey:@\"my_app_api_key\"];\n\tself.purchases.delegate = self;\n    \n  [[ADClient sharedClient] \n   requestAttributionDetailsWithBlock:^(\n     NSDictionary *details, \n     NSError *error) { \n     if (error == nil) {\n       [self.purchases addAttributionData:details\n                              fromNetwork:RCAttributionSourceAppleSearchAds];\n     }\n   }];\n}\n\n@end",
"language": "objectivec",
"name": "Search Ads - ObjC"
},
{
"code": "@interface AppDelegate : UIResponder <UIApplicationDelegate, AdjustDelegate>\n  \n- (void)adjustAttributionChanged:(ADJAttribution *)attribution {\n  [self.purchases addAttributionData:attribution.dictionary\n                         fromNetwork:RCAttributionNetworkAdjust];\n}\n\n@end",
"language": "objectivec",
"name": "Adjust - ObjC"
},
{
"code": "@interface AppDelegate : UIResponder <UIApplicationDelegate, AppsFlyerTrackerDelegate>\n\n- (void)onConversionDataReceived:(NSDictionary *)installData {\n  NSMutableData *data = [NSMutableDictionary dictionaryWithDictionary:installData];\n  \n  data[@\"rc_appsflyer_id\"] = [[AppsFlyerTracker sharedTracker] getAppsFlyerUID];\n  \n  [self.purchases addAttributionData:data fromNetwork:RCAttributionSourceAppsFlyer];\n}\n\n@end",
"language": "objectivec",
"name": "AppsFlyer - ObjC"
},
{
"code": "[[Branch getInstance] initSessionWithLaunchOptions:launchOptions\n                        andRegisterDeepLinkHandler:^(NSDictionary *data,\n                                                     NSError *error) {\n  // do stuff with deep link data (nav to page, display content, etc\n  [self.purchases addAttributionData:data \n                         fromNetwork:RCAttributionNetworkBranch];\n}];",
"language": "objectivec",
"name": "Branch - ObjC"
}
]
}
[/block]

```text Authorization Header
Authorization: Bearer YOUR_REVENUECAT_API_KEY_2
```

[block:callout]
{
  "type": "warning",
  "title": "Encode Your URL Params",
  "body": "For URL params, such as the `app_user_id`, make sure you URL encode them before using them."
}
[/block]
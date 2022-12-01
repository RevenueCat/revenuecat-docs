---
title: "Attribution"
slug: "attribution"
hidden: false
createdAt: "2018-07-13T21:56:56.163Z"
updatedAt: "2018-12-11T00:23:32.869Z"
---
[block:api-header]
{
  "title": "Providing Attribution Data to RevenueCat"
}
[/block]
RevenueCat can help you understand the cost effectiveness of your paid acquisition campaigns much more accurately by attributing purchases and subscriptions to specific ad campaigns.

Most attribution SDKs provide a way to report revenue from the device, but this completely fails to capture recurring revenue that occurs while a user is not using the app. With RevenueCat, you receive a full picture.

Attribution requires the following SDK versions:
  * iOS: >= `1.1.0`
  * Android: >= `1.3.1`
  * React Native: >= `1.2.0`

[block:api-header]
{
  "title": "Supported Networks"
}
[/block]
RevenueCat can track attribution from the following networks:

  * [Apple Search Ads](https://searchads.apple.com/advanced/help/measure-results/#attribution-api)
  * [Adjust](https://www.adjust.com/)
  * [AppsFlyer](https://www.appsflyer.com/) 
  * [Branch](http://branch.io/)
[block:api-header]
{
  "title": "API"
}
[/block]
When you receive your attribution callback you can use one of the following methods for passing the attribution data dictionary:

### iOS

#### Attaching attribution data to a user
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
#### IDFA
In order for most networks to forward revenue information to 3rd party partners, you need the iOS IDFA. To forward this to RevenueCat, add the `rc_idfa` key to the attribution params *before* calling the `addAttributionData` method:
[block:code]
{
  "codes": [
    {
      "code": "var data = dataFromAttributionNetwork\n\nlet idfa = ASIdentifierManager.shared().advertisingIdentifier.uuidString\ndata[\"rc_idfa\"] = idfa",
      "language": "swift"
    },
    {
      "code": "NSDictionary *attributionData = dataFromNetworkCallback;\nNSString *idfa = ASIdentifierManager.sharedManager.advertisingIdentifier.UUIDString;\nif (idfa) {\n  NSMutableDictionary *newData = [NSMutableDictionary dictionaryWithDictionary:attributionData];\n  newData[@\"rc_idfa\"] = idfa;\n  attributionData = [NSDictionary dictionaryWithDictionary:newData];\n}\n",
      "language": "objectivec"
    }
  ]
}
[/block]
###Android 
[block:code]
{
  "codes": [
    {
      "code": "config.setOnAttributionChangedListener(new OnAttributionChangedListener() {\n    @Override\n    public void onAttributionChanged(AdjustAttribution attribution) {\n    \tMap<String, String> data = new HashMap<String, String>();\n      \n      data.put(\"trackerToken\", attribution.trackerToken);\n      data.put(\"trackerName\", attribution.trackerName);\n      data.put(\"network\", attribution.network);\n      data.put(\"campaign\", attribution.campaign);      \n      data.put(\"adgroup\", attribution.adgroup);\n      data.put(\"creative\", attribution.creative);\n      data.put(\"clickLabel\", attribution.clickLabel);\n      data.put(\"adid\", attribution.adid);\n      \n      purchases.addAttributionData(data, Purchases.AttributionNetwork.ADJUST);\n    }\n});",
      "language": "java",
      "name": "Adjust"
    },
    {
      "code": "@Override\npublic void onInstallConversionDataLoaded(Map<String, String> conversionData) {\n  String appsFlyerId = AppsFlyerLib.getInstance().getAppsFlyerUID(this);\n  conversionData.put(\"rc_appsflyer_id\", appsFlyerId);\n  purchases.addAttributionData(conversionData, Purchases.AttributionNetwork.APPSFLYER);\n}\n",
      "language": "java",
      "name": "AppsFlyer"
    },
    {
      "code": "Branch branch = Branch.getInstance(getApplicationContext());\nbranch.initSession(new BranchReferralInitListener(){\n    @Override\n    public void onInitFinished(JSONObject referringParams, BranchError error) {\n        if (error == null) {\n          purchases.addAttributionData(conversionData, \n                                       Purchases.AttributionNetwork.BRANCH);\n        } else {\n            Log.i(\"MyApp\", error.getMessage());\n        }\n    }\n}, this.getIntent().getData(), this);",
      "language": "java",
      "name": "Branch"
    }
  ]
}
[/block]
### React Native
[block:code]
{
  "codes": [
    {
      "code": "// Psuedo Example\nlet attributionData = await Attribution.getConversionData();\nPurchases.addAttributionData(data, Purchases.ATTRIBUTION_NETWORKS.APPSFLYER);",
      "language": "javascript"
    }
  ]
}
[/block]
### Unity
[block:code]
{
  "codes": [
    {
      "code": "void SendAttribution()\n{\n  Purchases purchases = GetComponent<Purchases>();\n  Purchases.AdjustData data = new Purchases.AdjustData();\n\n  data.adid = \"test\";\n  data.network = \"network\";\n  data.adgroup = \"adgroup\";\n  data.campaign = \"campaign\";\n  data.creative = \"creative\";\n  data.clickLabel = \"clickLabel\";\n  data.trackerName = \"trackerName\";\n  data.trackerToken = \"trackerToken\";\n\n  purchases.AddAdjustAttributionData(data);\n}",
      "language": "csharp"
    }
  ]
}
[/block]
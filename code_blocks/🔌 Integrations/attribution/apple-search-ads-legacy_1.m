#import <iAd/iAd.h>
... 
- (BOOL)application:(UIApplication *)application 
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
  RCPurchases.automaticAppleSearchAdsAttributionCollection = YES;
  [RCPurchases configureWithAPIKey:@"public_sdk_key" appUserID:@"my_app_user_id"];

}
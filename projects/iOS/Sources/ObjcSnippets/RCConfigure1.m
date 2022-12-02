//
//  RCConfigure.m
//  
//
//  Created by Andrés Boedo on 12/2/22.
//

#import <Foundation/Foundation.h>
#import "RCConfigure1.h"
@import UIKit;
@import RevenueCat;

@implementation RCConfigure1 : NSObject

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    RCPurchases.logLevel = RCLogLevelDebug;
    RCConfigurationBuilder *configuration = [RCConfiguration builderWithAPIKey:@"public_sdk_key"];
    configuration = [configuration withAppUserID:@"<app_user_id>"];
    [RCPurchases configureWithConfiguration:[configuration build]];

    return YES;
}

@end

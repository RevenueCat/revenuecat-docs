RCPurchases.logLevel = RCLogLevelDebug;
RCConfigurationBuilder *configuration = [RCConfiguration builderWithAPIKey:@<public_sdk_key>];
// If your app uses StoreKit 2, you must enable it in the SDK
configuration = [configuration withObserverMode:YES, storeKit2:NO];
configuration = [configuration withAppUserID:@<app_user_id>];
[RCPurchases configureWithConfiguration:[configuration build]];
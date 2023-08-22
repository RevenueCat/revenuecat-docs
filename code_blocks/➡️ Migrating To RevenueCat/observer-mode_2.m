RCPurchases.logLevel = RCLogLevelDebug;
RCConfigurationBuilder *configuration = [RCConfiguration builderWithAPIKey:@<public_sdk_key>];
configuration = [configuration withObserverMode:YES];
configuration = [configuration withAppUserID:@<app_user_id>];
// If your app uses StoreKit 2, you must enable it in the SDK
configuration = [configuration withUsesStoreKit2IfAvailable:YES];
[RCPurchases configureWithConfiguration:[configuration build]];
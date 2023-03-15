import iAd
...
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		
    Purchases.automaticAppleSearchAdsAttributionCollection = true
    Purchases.configure(withAPIKey: "public_sdk_key", appUserID: "my_app_user_id")
    
    return true
}
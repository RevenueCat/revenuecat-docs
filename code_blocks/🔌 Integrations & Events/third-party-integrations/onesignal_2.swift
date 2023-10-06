class AppDelegate: UIResponder, UIApplicationDelegate, OSSubscriptionObserver {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        Purchases.configure(withAPIKey: "<revenuecat_api_key>", appUserID: nil)

        OneSignal.initialize("<onesignal_app_id>", withLaunchOptions: launchOptions)
        OneSignal.add(self as OSSubscriptionObserver)

        // If you've already set up OneSignal, then users should already have
        // a OneSignal Id. We can check if it's available and send it to RevenueCat
        if let onesignalUserId = OneSignal.User.onesignal_id {
            Purchases.shared.attribution.setOnesignalUserID(onesignalUserId)
        }

        return true
    }

    // Add this method to update the $onesignalUserId in RevenueCat whenever it changes
    // This code should be sufficient to capture all new users if you're setting
    // up OneSignal for the first time.
    func onOSSubscriptionChanged(_ stateChanges: OSSubscriptionStateChanges!) {
        if !stateChanges.from.subscribed && stateChanges.to.subscribed {
            // The user is subscribed
            // Either the user subscribed for the first time
            Purchases.shared.attribution.setOnesignalUserID(stateChanges.to.userId)
        }
    }
}

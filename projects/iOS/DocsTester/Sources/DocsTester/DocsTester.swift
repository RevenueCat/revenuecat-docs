import RevenueCat

final class Container {

    func observerModeConfiguration() {
        // MARK: Observer mode configuration
        Purchases.logLevel = .debug
        Purchases.configure(
            with: Configuration.Builder(withAPIKey: Constants.apiKey)
                .with(observerMode: true)
                // Optionally set an app user ID for the user
                .with(appUserID: UserManager.appUserID)
                // If your app uses StoreKit 2, you must enable it in the SDK
                .with(usesStoreKit2IfAvailable: true)
                .build()
        )
        // END
    }

}

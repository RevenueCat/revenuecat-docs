import RevenueCat

final class Container {
    func observerModeConfiguration() {
        // MARK: Observer mode configuration
        Purchases.logLevel = .debug
        Purchases.configure(
            with: Configuration.Builder(withAPIKey: Constants.apiKey)
                .with(appUserID: "app_user_id")
                .with(observerMode: true)
                .build()
        )
        // END
    }
    
}

Whatever other code we don't care about
//MARK: Observer mode configuration
Purchases.logLevel = .debug
Purchases.configure(
  with: Configuration.Builder(withAPIKey: Constants.apiKey)
    .with(appUserID: <app_user_id>)
    .with(observerMode: true)
    .build()
)
//END
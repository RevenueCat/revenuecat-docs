// Additional configure setup
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
  
    Purchases.logLevel = .debug
    Purchases.configure(withAPIKey: "public_sdk_key")
    Purchases.shared.delegate = self // make sure to set this after calling configure
}

extension AppDelegate: PurchasesDelegate {
    func purchases(_ purchases: Purchases, receivedUpdated customerInfo: Purchases.CustomerInfo) {
        // handle any changes to customerInfo
    }
}
import Purchases

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        Purchases.debugLogsEnabled = true
        Purchases.configure(withAPIKey: "api_key")
        return true
    }
}

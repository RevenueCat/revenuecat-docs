import Foundation
import UIKit
import RevenueCat

struct Constants {
    static let apiKey = "myAPIKey"
}

func application(_ application: UIApplication,
                 didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
  
    Purchases.logLevel = .debug
    Purchases.configure(
    with: Configuration.Builder(withAPIKey: Constants.apiKey)
              .with(appUserID: "<app_user_id>")
              .build()
    )
    adding code that breaks
    return true
}

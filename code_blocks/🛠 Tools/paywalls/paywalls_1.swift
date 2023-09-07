import SwiftUI

import RevenueCat
import RevenueCatUI

struct App: View {
    var body: some View {
        ContentView()
            .presentPaywallIfNeeded(requiredEntitlementIdentifier: "pro") { customerInfo in
                print("Purchase completed: \(customerInfo.entitlements)")
            }
    }
}

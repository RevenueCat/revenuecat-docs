import SwiftUI

import RevenueCat
import RevenueCatUI

struct App: View {
    @State
    var displayPaywall = false

    var body: some View {
        ContentView()
            .sheet(isPresented: self.$displayPaywall) {
                PaywallView(displayCloseButton: true)
                    .onPurchaseCompleted { _ in
                        // When presenting paywalls manually, it's also 
                        // your responsponsibility to dismiss it when desired,
                        // like when a purchase is completed.
                        self.displayPaywall = nil
                    }
            }
    }
}

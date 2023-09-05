import SwiftUI

import RevenueCat
import RevenueCatUI

struct App: View {
    @State
    var displayPaywall = false

    var body: some View {
        ContentView()
            .sheet(isPresented: self.$displayPaywall) {
                PaywallView()
                // PaywallView does not have a close button 
                // Manually add one to match your app's style 
                .toolbar {
                    ToolbarItem(placement: .destructiveAction) {
                        Button {
                            self.displayPaywall = false
                        } label: {
                            Image(systemName: "xmark")
                        }
                    }
                }
            }
    }
}

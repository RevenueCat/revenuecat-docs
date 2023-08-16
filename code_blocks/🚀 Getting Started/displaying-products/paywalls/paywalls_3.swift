import RevenueCatUI

struct App: View {
    @State
    var displayPaywall = false

    var body: some View {
        ContentView()
            .sheet(self.$displayPaywall) {
                PaywallView()
            }
    }
}

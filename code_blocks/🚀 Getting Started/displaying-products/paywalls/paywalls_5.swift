import RevenueCatUI

struct App: View {

    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    // Your custom paywall design content
                }.frame(maxWidth: .infinity)
            }

            Spacer()

            PaywallView(mode: .condensedCard) // or .card
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color(white: 0.8)
                .edgesIgnoringSafeArea(.all)
        )
    }

}

import Purchases

@main
struct SampleApp: App {
    init() {
        Purchases.logLevel = .debug
        Purchases.configure(withAPIKey: "api_key")
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
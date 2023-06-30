// Using PurchasesDelegate:
Purchases.logLevel = .debug
Purchases.configure(withAPIKey: <public_sdk_key>)
Purchases.shared.delegate = self // make sure to set this after calling configure

extension AppDelegate: PurchasesDelegate {
    func purchases(_ purchases: Purchases, receivedUpdated customerInfo: Purchases.CustomerInfo) {
        // handle any changes to customerInfo
    }
}

// Using Swift Concurrency:
for try await customerInfo in Purchases.shared.customerInfoStream {
    // handle any changes to customerInfo
}
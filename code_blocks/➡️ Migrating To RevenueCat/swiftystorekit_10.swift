Purchases.shared.restorePurchases { (customerInfo, error) in
    if let error = error {
        print("Restore Failed: \(error.localizedDescription)")
    } else {
        print("Restore Success: \(customerInfo?.activeEntitlements)")
    }
}

Purchases.shared.restorePurchases { (customerInfo, error) in
    if let e = error {
        print("Restore Failed: \(e.localizedDescription)")
    } else {
        print("Restore Success: \(customerInfo?.activeEntitlements)")
    }
}
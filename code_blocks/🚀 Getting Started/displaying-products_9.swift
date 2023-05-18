Purchases.shared.getOfferings { (offerings, error) in
    if let packages = offerings?.offering(identifier: "experiment_group").availablePackages {
        // Display packages for sale
    }
}
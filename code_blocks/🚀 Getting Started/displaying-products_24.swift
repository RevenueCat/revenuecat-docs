// Accessing the monthly product

Purchases.shared.getOfferings { (offerings, error) in
    if let package = offerings?.current?.monthly?.storeProduct {
        // Get the price and introductory period from the StoreProduct
    }
}

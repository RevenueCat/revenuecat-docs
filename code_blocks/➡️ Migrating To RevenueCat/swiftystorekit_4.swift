Purchases.shared.getOfferings { (offerings, error) in
    if let e = error {
        print(e.localizedDescription)
    }
    
    guard let offering = offerings?.current else {
        print("No current offering configured")
        return
    }
    
    for package in offering.availablePackages {
        print("Product: \(package.product.localizedDescription), price: \(package.localizedPriceString())")
    }
}
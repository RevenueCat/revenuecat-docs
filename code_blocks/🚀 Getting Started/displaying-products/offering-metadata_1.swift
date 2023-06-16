Purchases.shared.getOfferings { (offerings, error) in
    if let offering = offerings?.current {
        let paywallTitle = offering.getMetadataValue(for: "title", default: "Get Pro")
        let paywallSubtitle = offering.getMetadataValue(for: "subtitle", default: "Unlock all the features")
        let paywallButton = offering.getMetadataValue(for: "button", default: "Redeem Trial")
    }
}
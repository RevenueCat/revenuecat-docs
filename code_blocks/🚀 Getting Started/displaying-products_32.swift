Purchases.shared.getOfferings { (offerings, error) in
    var packages : [Package]?
    
    if user.isPaidDownload {
        packages = offerings?.offering(identifier: "paid_download_offer")?.availablePackages
    } else if user.signedUpOver30DaysAgo {
        packages = offerings?.offering(identifier: "long_term_offer")?.availablePackages
    } else if user.recentlyChurned {
        packages = offerings?.offering(identifier: "ios_subscription_offer")?.availablePackages
    }
    
    // Present your paywall
}
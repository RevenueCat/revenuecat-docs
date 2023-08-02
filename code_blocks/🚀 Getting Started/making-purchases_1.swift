// Using Offerings/Packages
Purchases.shared.purchase(package: package) { (transaction, customerInfo, error, userCancelled) in
  if customerInfo.entitlements["your_entitlement_id"]?.isActive == true {
    // Unlock that great "pro" content              
  }
}

// -----
// If you are NOT using Offerings/Packages:
Purchases.shared.purchase(product: product) { (transaction, customerInfo, error, userCancelled) in
  if customerInfo.entitlements["your_entitlement_id"]?.isActive == true {
    // Unlock that great "pro" content              
  }
}
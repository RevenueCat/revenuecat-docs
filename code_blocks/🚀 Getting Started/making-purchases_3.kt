// Using Offerings/Packages
Purchases.sharedInstance.purchaseWith(
  PurchaseParams.Builder(this, aPackage).build(),
  onError = { error, userCancelled -> /* No purchase */ },
  onSuccess = { product, customerInfo ->
    if (customerInfo.entitlements["my_entitlement_identifier"]?.isActive == true) {
      // Unlock that great "pro" content
    }
  }
)

// -----
// If you are NOT using Offerings/Packages:
Purchases.sharedInstance.purchaseWith(
  PurchaseParams.Builder(this, aProduct).build(),
  onError = { error, userCancelled -> /* No purchase */ },
  onSuccess = { product, customerInfo ->
    if (customerInfo.entitlements["my_entitlement_identifier"]?.isActive == true) {
      // Unlock that great "pro" content
    }
  }
)
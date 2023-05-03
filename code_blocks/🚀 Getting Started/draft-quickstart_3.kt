Purchases.sharedInstance.purchasePackageWith(
  this,
  package,
  onError = { error, userCancelled -> /* No purchase */ },
  onSuccess = { product, purchaserInfo ->
    if (purchaserInfo.entitlements["my_entitlement_identifier"]?.isActive == true) {
    // Unlock that great "pro" content
  }
})
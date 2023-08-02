// Using Offerings/Packages
try {
  const {customerInfo, productIdentifier} = await Purchases.purchasePackage(package);
  if (typeof customerInfo.entitlements.active.my_entitlement_identifier !== "undefined") {
    // Unlock that great "pro" content
  }
} catch (e) {
  if (!e.userCancelled) {
  	showError(e);
  }
}

// -----
// If you are NOT using Offerings/Packages:
try {
  const {customerInfo, productIdentifier} = await Purchases.purchaseStoreProduct(product);
  if (typeof customerInfo.entitlements.active.my_entitlement_identifier !== "undefined") {
    // Unlock that great "pro" content
  }
} catch (e) {
  if (!e.userCancelled) {
  	showError(e);
  }
}
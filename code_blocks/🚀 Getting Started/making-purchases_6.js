// Using Offerings/Packages
try {
  const {customerInfo, productIdentifier} = await Purchases.purchasePackage(package);
  if (typeof purchaseResult.customerInfo.entitlements.active['my_entitlement_identifier'] !== "undefined") {
    // Unlock that great "pro" content
  }
} catch (e) {
  if (!e.userCancelled) {
  	showError(e);
  }
}

// Note: if you are not using offerings/packages to purchase In-app products, you can use purchaseStoreProduct and getProducts

try {
  const {customerInfo, productIdentifier} = await Purchases.purchaseStoreProduct(productToBuy);
  if (typeof purchaseResult.customerInfo.entitlements.active['my_entitlement_identifier'] !== "undefined") {
    // Unlock that great "pro" content
  }
} catch (e) {
  if (!e.userCancelled) {
    showError(e);
  }
}

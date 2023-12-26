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
// If you are NOT using Offerings/Packages, first fetch the store products
const products: PurchasesStoreProduct[] = await Purchases.getProducts(
    ["product_id"],
    PURCHASE_TYPE.INAPP
);
await Purchases.purchaseStoreProduct(products[0]);

// Using Offerings/Packages
[[RCPurchases sharedPurchases] purchasePackage:package withCompletion:^(RCStoreTransaction *transaction, RCCustomerInfo *customerInfo, NSError *error, BOOL cancelled) {
  if (customerInfo.entitlements[@"your_entitlement_id"].isActive) {
    // Unlock that great "pro" content
  }
}];

// -----
// If you are NOT using Offerings/Packages:
[[RCPurchases sharedPurchases] purchaseProduct:product withCompletion:^(RCStoreTransaction *transaction, RCCustomerInfo *customerInfo, NSError *error, BOOL cancelled) {
  if (customerInfo.entitlements[@"your_entitlement_id"].isActive) {
    // Unlock that great "pro" content
  }
}];
// Using Offerings/Packages
Purchases.getSharedInstance().purchase(
	new PurchaseParams.Builder(requireActivity(), aPackage).build(), 
	new PurchaseCallback() {
    @Override
    public void onCompleted(@NonNull StoreTransaction storeTransaction, @NonNull CustomerInfo customerInfo) {
			if (customerInfo.getEntitlements().get(<my_entitlement_identifier>).isActive()) {
				// Unlock that great "pro" content
			}
		}

		@Override
		public void onError(@NonNull PurchasesError purchasesError, boolean b) {
			// No purchase
		}
	}
);

// -----
// If you are NOT using Offerings/Packages:
// Using Offerings/Packages
Purchases.getSharedInstance().purchase(
	new PurchaseParams.Builder(requireActivity(), aProduct).build(), 
	new PurchaseCallback() {
    @Override
    public void onCompleted(@NonNull StoreTransaction storeTransaction, @NonNull CustomerInfo customerInfo) {
			if (customerInfo.getEntitlements().get(<my_entitlement_identifier>).isActive()) {
				// Unlock that great "pro" content
			}
		}

		@Override
		public void onError(@NonNull PurchasesError purchasesError, boolean b) {
			// No purchase
		}
	}
);
Purchases.getSharedInstance().purchasePackage(
    this,
    aPackage,
    new MakePurchaseListener() {
        @Override
        public void onCompleted(@NonNull Purchase purchase, @NonNull CustomerInfo customerInfo) {
            if (customerInfo.getEntitlements().get("my_entitlement_identifier").isActive()) {
              // Unlock that great "pro" content
            }
        }

        @Override
        public void onError(@NonNull PurchasesError error, Boolean userCancelled) {
          // No purchase
        }
    }
);
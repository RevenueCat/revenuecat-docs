Purchases.sharedInstance.purchase(
    PurchaseParams.Builder(requireActivity(), pkg)
        .oldProductId("old_product_id")
        .googleProrationMode(GoogleProrationMode.IMMEDIATE_WITHOUT_PRORATION)
        .build(),
    object : PurchaseCallback {
        override fun onCompleted(storeTransaction: StoreTransaction, customerInfo: CustomerInfo) {
            val entitlement = customerInfo.entitlements["my_entitlement_identifier"]
            if (entitlement != null && entitlement.isActive) {
                // Unlock that great "pro" content
            }
        }

        override fun onError(purchasesError: PurchasesError, b: Boolean) {
            // No purchase
        }
    }
)
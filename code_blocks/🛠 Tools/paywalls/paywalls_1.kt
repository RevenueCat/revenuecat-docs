@Composable
private fun LockedScreen() {
    YourContent()

    PaywallDialog(
        PaywallDialogOptions.Builder()
            .setRequiredEntitlementIdentifier(Constants.ENTITLEMENT_ID)
            .setListener(
                object : PaywallViewListener {
                    override fun onPurchaseCompleted(customerInfo: CustomerInfo, storeTransaction: StoreTransaction) {}
                    override fun onRestoreCompleted(customerInfo: CustomerInfo) {}
                }
            )
            .build()
    )
}

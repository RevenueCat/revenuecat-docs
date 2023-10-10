@Composable
private fun NavGraph(navController: NavHostController) {
    NavHost(
        navController = navController,
        startDestination = Screen.Main.route,
    ) {
        composable(route = Screen.Main.route) {
            MainScreen()

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
    }
}
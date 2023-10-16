@Composable
private fun PaywallScreen(offering: Offering) {
    PaywallFooter(
        options = PaywallOptions.Builder()
            .setOffering(offering)
            .build()
    ) {
        CustomPaywallContent()        
    }
}
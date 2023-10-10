@Composable
private fun PaywallScreen(offering: Offering) {
    PaywallFooter(
        options = PaywallViewOptions.Builder()
            .setOffering(offering)
            .build()
    ) {
        CustomPaywallContent()        
    }
}
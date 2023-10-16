class MainActivity : AppCompatActivity(), PaywallResultHandler {
    private lateinit var paywallActivityLauncher: PaywallActivityLauncher
    private lateinit var root: View

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        paywallActivityLauncher = PaywallActivityLauncher(this, this)
    }

    private fun performMagic() {
        Purchases.sharedInstance.getCustomerInfoWith { 
            if (it.entitlements[Constants.ENTITLEMENT_ID]?.isActive != true) {
                paywallActivityLauncher.launch()
            }
        }
    }

    override fun onActivityResult(result: PaywallResult) {}
}
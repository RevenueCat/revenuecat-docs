class AppFragment : Fragment(), PaywallResultHandler {
    private lateinit var paywallActivityLauncher: PaywallActivityLauncher
    private lateinit var root: View

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?,
    ): View {
        paywallActivityLauncher = PaywallActivityLauncher(this, this)

        root = inflater.inflate(R.layout.fragment, container, false)

        return root
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
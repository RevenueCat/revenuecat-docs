@OptIn(markerClass = ExperimentalPreviewRevenueCatUIPurchasesAPI.class)
public class MainActivity extends AppCompatActivity implements PaywallResultHandler {
    private PaywallActivityLauncher launcher;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        launcher = new PaywallActivityLauncher(this, this);
    }

    @Override
    public void onActivityResult(PaywallResult result) {
        // Handle result
    }
}

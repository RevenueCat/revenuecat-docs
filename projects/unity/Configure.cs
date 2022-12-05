// The SDK can be configured through the Unity Editor.
// See Unity installation instructions https://docs.revenuecat.com/docs/unity

// If you'd like to configure the SDK programmatically,
// make sure to check "Use runtime setup" in the Unity Editor, and then:

Purchases.PurchasesConfiguration.Builder builder = Purchases.PurchasesConfiguration.Builder.Init("api_key");
Purchases.PurchasesConfiguration purchasesConfiguration =
    .SetAppUserId(appUserId)
    .Build();
purchases.Configure(purchasesConfiguration);
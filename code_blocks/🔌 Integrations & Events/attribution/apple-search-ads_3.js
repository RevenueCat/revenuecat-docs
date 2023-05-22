Future<void> initPlatformState() async {
  await Purchases.setDebugLogsEnabled(true);
  
  if (Platform.isAndroid) {
    await Purchases.setup("public_google_sdk_key");
  } else if (Platform.isIOS) {
    await Purchases.setup("public_ios_sdk_key");
    
    // OR: if building for Amazon, be sure to follow the installation instructions then:
    await Purchases.setup("public_amazon_sdk_key", useAmazon: true);
  }

  await Purchases.enableAdServicesAttributionTokenCollection();
  
}
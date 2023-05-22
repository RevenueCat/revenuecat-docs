function onDeviceReady() {
    Purchases.setDebugLogsEnabled(true);
    if (window.cordova.platformId === 'ios') {
        Purchases.setup("public_ios_sdk_key");
    } else if (window.cordova.platformId === 'android') {
        Purchases.setup("public_google_sdk_key");
    }
  
    Purchases.enableAdServicesAttributionTokenCollection();
}
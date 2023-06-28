document.addEventListener("deviceready", onDeviceReady, false);

function onDeviceReady() {
  Purchases.setLogLevel(LOG_LEVEL.DEBUG);
  if (window.cordova.platformId === 'ios') {
    Purchases.configureWith({apiKey: "<public_apple_api_key>"});
  } else if (window.cordova.platformId === 'android') {
    Purchases.configureWith({apiKey: "<public_google_api_key>"});
    // OR: if building for Amazon, be sure to follow the installation instructions then:
    Purchases.configureWith({apiKey: "<public_amazon_api_key>", useAmazon: true});
  }

  Purchases.enableAdServicesAttributionTokenCollection();
}

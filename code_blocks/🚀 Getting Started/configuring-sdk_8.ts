document.addEventListener("deviceready", onDeviceReady, false);

async function onDeviceReady() {
    await Purchases.setLogLevel(LOG_LEVEL.DEBUG);
    if (window.cordova.platformId === 'ios') {
        await Purchases.configure({ apiKey: <public_apple_api_key> });
    } else if (window.cordova.platformId === 'android') {
        await Purchases.configure({ apiKey: <public_google_api_key> });
    }
    // OR: if building for Amazon, be sure to follow the installation instructions then:
    await Purchases.configure({ apiKey: <public_amazon_api_key>, useAmazon: true });
}
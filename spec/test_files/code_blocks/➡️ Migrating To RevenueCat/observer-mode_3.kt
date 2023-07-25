// region Observer mode configuration
// If you're targeting only Google Play Store
class MainApplication: Application() {
    override fun onCreate() {
        super.onCreate()
        Purchases.logLevel = LogLevel.DEBUG
        Purchases.configure(PurchasesConfiguration.Builder(this, <public_google_sdk_key>).observerMode(true).build())
    }
}

// If you're building for the Amazon Appstore, you can use flavors to determine which keys to use
// In your build.gradle:
flavorDimensions "store"
productFlavors {
    amazon {
        buildConfigField "String", "STORE", "\"amazon\""
    }

    google {
        buildConfigField "String", "STORE", "\"google\""
    }       
}

///...

class MainApplication: Application() {
    override fun onCreate() {
        super.onCreate()
        Purchases.logLevel = LogLevel.DEBUG
          
        if (BuildConfig.STORE.equals("amazon")) {
            Purchases.configure(AmazonConfiguration.Builder(this, <public_amazon_sdk_key>).observerMode(true).build())
        } else if (BuildConfig.STORE.equals("google")) {
            Purchases.configure(PurchasesConfiguration.Builder(this, <public_google_sdk_key>).observerMode(true).build())
        }
    }
}
// endregion
package com.revenuecat.docstester

import android.app.Application
import com.revenuecat.purchases.LogLevel
import com.revenuecat.purchases.Purchases
import com.revenuecat.purchases.PurchasesConfiguration

// region Observer mode configuration
// If you're targeting only Google Play Store
class MainApplicationOnlyPlayStoreObserverMode : Application() {
    override fun onCreate() {
        super.onCreate()

        Purchases.logLevel = LogLevel.DEBUG
        val builder = PurchasesConfiguration.Builder(this, "public_google_sdk_key")
            .observerMode(true)
        Purchases.configure(builder.build())
    }
}
// endregion
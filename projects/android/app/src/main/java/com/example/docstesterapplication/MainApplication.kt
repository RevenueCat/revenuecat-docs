package com.example.docstesterapplication

import android.app.Application
import com.revenuecat.purchases.Purchases
import com.revenuecat.purchases.PurchasesConfiguration
import com.revenuecat.purchases.amazon.AmazonConfiguration

class MainApplication: Application() {
    override fun onCreate() {
        super.onCreate()
        Purchases.debugLogsEnabled = true

        if (BuildConfig.STORE == "amazon") {
            Purchases.configure(AmazonConfiguration.Builder(this, "public_amazon_sdk_key").build())
        } else if (BuildConfig.STORE == "google") {
            Purchases.configure(PurchasesConfiguration.Builder(this, "public_google_sdk_key").build())
        }
    }
}

package com.example.docstesterapplication;

import android.app.Application;

import com.revenuecat.purchases.Purchases;
import com.revenuecat.purchases.PurchasesConfiguration;

// If you're targeting only Google Play Store
public class MainApplicationJava extends Application {
    @Override
    public void onCreate() {
        super.onCreate();
        Purchases.setDebugLogsEnabled(true);
        Purchases.configure(new PurchasesConfiguration.Builder(this, "public_google_sdk_key").build());
    }
}

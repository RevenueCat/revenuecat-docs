package com.example.docstesterapplication;

import android.app.Application;

import com.example.docstesterapplication.BuildConfig.STORE;
import com.revenuecat.purchases.Purchases;
import com.revenuecat.purchases.PurchasesConfiguration;
import com.revenuecat.purchases.amazon.AmazonConfiguration;

// If you're targeting only Google Play Store
public class MainApplication extends Application {
    @Override
    public void onCreate() {
        super.onCreate();
        Purchases.setDebugLogsEnabled(true);
        Purchases.configure(new PurchasesConfiguration.Builder(this, "public_google_sdk_key").build());
    }
}

// If you're building for the Amazon Appstore,
// click the Kotlin tab to see how to set up flavors in your build.gradle:
///...

public class MainApplication extends Application {
    @Override
    public void onCreate() {
        super.onCreate();
        Purchases.setDebugLogsEnabled(true);


        if (STORE.equals("amazon")) {
            AmazonConfiguration.Builder builder = new AmazonConfiguration.Builder(this, "public_amazon_sdk_key");
        } else if (STORE.equals("google")) {
            PurchasesConfiguration.Builder builder = new PurchasesConfiguration.Builder(this, "public_google_sdk_key");
            Purchases.configure(builder.build());
        }

    }
}

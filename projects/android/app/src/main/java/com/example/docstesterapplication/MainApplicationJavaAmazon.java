package com.example.docstesterapplication;

import android.app.Application;

import com.revenuecat.purchases.Purchases;
import com.revenuecat.purchases.PurchasesConfiguration;
import com.revenuecat.purchases.amazon.AmazonConfiguration;

public class MainApplicationJavaAmazon extends Application {
    @Override
    public void onCreate() {
        super.onCreate();
        Purchases.setDebugLogsEnabled(true);

        if (BuildConfig.STORE.equals("amazon")) {
            AmazonConfiguration.Builder builder = new AmazonConfiguration.Builder(this, "public_amazon_sdk_key");
        } else if (BuildConfig.STORE.equals("google")) {
            PurchasesConfiguration.Builder builder = new PurchasesConfiguration.Builder(this, "public_google_sdk_key");
            Purchases.configure(builder.build());
        }
    }
}

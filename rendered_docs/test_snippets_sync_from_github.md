---
title: Test Snippets Synced from GitHub
excerpt: Update your docs automatically with `rdme`, ReadMe's official CLI and GitHub Action!
category: 61e6d1c8dc645600539687c7
hidden: true
---

###  Test Snippets synced from local code

This was synced from GitHub actions when merging to main

Here is the code to configure the SDK:

```swift
func application(_ application: UIApplication,
                 didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
  
    Purchases.logLevel = .debug
    Purchases.configure(
    with: Configuration.Builder(withAPIKey: Constants.apiKey)
              .with(appUserID: "<app_user_id>")
              .build()
    )
    return true
}

```
```kotlin
class MainApplicationOnlyPlayStore: Application() {
    override fun onCreate() {
        super.onCreate()
        Purchases.debugLogsEnabled = true
        Purchases.configure(PurchasesConfiguration.Builder(this, "public_google_sdk_key").build())
    }
}
```

If you're building for the Amazon Appstore, you can use flavors to determine which keys to use. In your build.gradle:

```kotlin
flavorDimensions "store"
productFlavors {
    amazon {
        buildConfigField "String", "STORE", "\"amazon\""
    }

    google {
        buildConfigField "String", "STORE", "\"google\""
    }
}
```
```kotlin
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

```


Test image (relative path):
![alt text](/assets/img.png)

Test image (absolute path):
~[alt text](https://github.com/RevenueCat/revenuecat-docs/blob/main/assets/img.png)


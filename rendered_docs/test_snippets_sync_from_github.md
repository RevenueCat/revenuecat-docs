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
// ../code_snippets/Swift/configure-1.swift

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
  
    Purchases.logLevel = .debug
    Purchases.configure(
     with: Configuration.Builder(withAPIKey: Constants.apiKey)
              .with(appUserID: "<app_user_id>")
              .build()
     )
  
}
```

```kotlin
// ../projects/android/app/src/main/java/com/example/docstesterapplication/MainApplicationOnlyPlayStore.kt#L8-L14

class MainApplicationOnlyPlayStore: Application() {
    override fun onCreate() {
        super.onCreate()
        Purchases.debugLogsEnabled = true
        Purchases.configure(PurchasesConfiguration.Builder(this, "public_google_sdk_key").build())
    }
}
```

If you're building for the Amazon Appstore, you can use flavors to determine which keys to use. In your build.gradle:

```txt
// ../projects/android/app/build.gradle#L37-L47

    flavorDimensions "store"
    productFlavors {
        amazon {
            buildConfigField "String", "STORE", "\"amazon\""
        }

        google {
            buildConfigField "String", "STORE", "\"google\""
        }
    }
}
```

```kotlin
// ../projects/android/app/src/main/java/com/example/docstesterapplication/MainApplication.kt#L9-L20

class MainApplication: Application() {
    override fun onCreate() {
        super.onCreate()
        Purchases.debugLogsEnabled = true

        if (STORE == "amazon") {
            Purchases.configure(AmazonConfiguration.Builder(this, "public_amazon_sdk_key").build())
        } else if (STORE == "google") {
            Purchases.configure(PurchasesConfiguration.Builder(this, "public_google_sdk_key").build())
        }
    }
}
```

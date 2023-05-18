---
title: Test Snippets Synced from GitHub
slug: test_snippets_sync_from_github
excerpt: Update your docs automatically with `rdme`, ReadMe's official CLI and GitHub
  Action!
hidden: true
createdAt: '2022-12-01T15:38:57.843Z'
updatedAt: '2023-02-06T19:37:56.393Z'
category: 646582bc33592e0017008a31
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
![alt text](https://github.com/RevenueCat/revenuecat-docs/blob/main/assets/img.png)

Test image (github share link/drag and drop):
![offerings](https://user-images.githubusercontent.com/110489217/217067941-269a5db7-5dc6-41d3-b2b6-860363afb23a.png)
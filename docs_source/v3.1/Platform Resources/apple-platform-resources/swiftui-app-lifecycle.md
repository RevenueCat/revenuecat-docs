---
title: "SwiftUI App Lifecycle"
slug: "swiftui-app-lifecycle"
excerpt: "Initializing the Purchases SDK in SwiftUI"
hidden: true
metadata: 
  title: "SwiftUI App Lifecycle – RevenueCat"
  description: "Without traditional delegate methods commonly used to initialize the SDK, it can seem a little confusing as to where the *Purchases* SDK should be initialized."
  image: 
    0: "https://files.readme.io/31cb629-OG_image.png"
    1: "OG image.png"
    2: 1200
    3: 627
    4: "#e9acb0"
createdAt: "2020-06-30T18:43:10.805Z"
updatedAt: "2021-05-17T17:33:58.593Z"
---
With the next iteration of SwiftUI announced at WWDC 2020, entire apps can be created with just a simple struct conforming to the new `App` protocol, like so:

```swift
@main
struct SampleApp: App {    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

Without traditional delegate methods commonly used to initialize the SDK, it can seem a little confusing as to where the *Purchases* SDK should be initialized.

# Option 1: App Init

For basic initialization without delegate methods, you can implement the App `init` method:

```swift
import Purchases

@main
struct SampleApp: App {
    init() {
        Purchases.configure(withAPIKey: "api_key")
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

# Option 2: App Delegate

Another method of initialization is to use the new `@UIApplicationDelegateAdaptor` property wrapper to configure the Purchases SDK. The `@UIApplicationDelegateAdaptor` gives the option of using UIApplicationDelegate methods that are traditionally used in UIKit applications.

### Creating a Delegate

Begin by creating a delegate class and initializing the *Purchases* SDK like the following:

```swift
import Purchases

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        Purchases.debugLogsEnabled = true
        Purchases.configure(withAPIKey: "api_key")
        return true
    }
}
```

### Attaching the Delegate

As previously mentioned, the new `@UIApplicationDelegateAdaptor` property attaches the delegate to the new SwiftUI App struct. Add the property wrapper like the following:

```swift
@main
struct SampleApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

Build and run the app, and *Purchases* will be initialized on app launch.

For more information on configuring the *Purchases* SDK, check out the [Configuring SDK](https://docs.revenuecat.com/docs/configuring-sdk) guide.
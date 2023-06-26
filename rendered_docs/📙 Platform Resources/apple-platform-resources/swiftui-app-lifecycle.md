---
title: SwiftUI App Lifecycle
slug: swiftui-app-lifecycle
excerpt: Initializing the Purchases SDK in SwiftUI
hidden: true
categorySlug: resources
order: 2
parentDoc: 649983b4c31b2e000a3c18c4
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

Without traditional application delegate methods commonly used to initialize the SDK, it can seem a little confusing as to where the SDK should be initialized.

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

For more information on configuring the SDK, check out the [Configuring SDK](https://docs.revenuecat.com/docs/configuring-sdk) guide.
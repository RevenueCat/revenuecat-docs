---
title: Using RevenueCat with SwiftUI
slug: swiftui-helpers
excerpt: Implementing the Purchases SDK in SwiftUI
hidden: false
---

# Debugging

The Purchases SDK includes a debug overlay that allows developers to see various configuration details while running an app. You can read more about the debug overlay in our [Debugging](https://www.revenuecat.com/docs/debugging#debug-ui) guide.

# SwiftUI Previews

SwiftUI Previews allow developers to preview their views directly in Xcode without building and running your app. The Purchases SDK includes convenience types for displaying mock products and offerings to avoid having to build and run your app to test your paywall.

[block:file]
[
  {
    "language": "swift",
    "name": "",
    "file": "code_blocks/📙 Platform Resources/apple-platform-resources/swiftui-app-lifecycle_1.swift"
  }
]
[/block]

# SDK Initialization

We recommend following our [guide](https://www.revenuecat.com/docs/configuring-sdk) for more information on configuring the Purchases SDK. However, we detail multiple methods for configuring the SDK in SwiftUI below.

## Option 1: App Init

For basic initialization without delegate methods, you can implement the App `init` method:

[block:file]
[
  {
    "language": "swift",
    "name": "",
    "file": "code_blocks/📙 Platform Resources/apple-platform-resources/swiftui-app-lifecycle_2.swift"
  }
]
[/block]

## Option 2: App Delegate

Another method of initialization is to use the `@UIApplicationDelegateAdaptor` property wrapper to configure the Purchases SDK. The `@UIApplicationDelegateAdaptor` gives the option of using UIApplicationDelegate methods that are traditionally used in UIKit applications.

### Creating a Delegate

Begin by creating a delegate class and initializing the *Purchases* SDK like the following:

[block:file]
[
  {
    "language": "swift",
    "name": "",
    "file": "code_blocks/📙 Platform Resources/apple-platform-resources/swiftui-app-lifecycle_3.swift"
  }
]
[/block]

### Attaching the Delegate

As previously mentioned, the new `@UIApplicationDelegateAdaptor` property attaches the delegate to the new SwiftUI App struct. Add the property wrapper like the following:

[block:file]
[
  {
    "language": "swift",
    "name": "",
    "file": "code_blocks/📙 Platform Resources/apple-platform-resources/swiftui-app-lifecycle_4.swift"
  }
]
[/block]

Build and run the app, and *Purchases* will be initialized on app launch.

For more information on configuring the SDK, check out the [Configuring SDK](https://docs.revenuecat.com/docs/configuring-sdk) guide.

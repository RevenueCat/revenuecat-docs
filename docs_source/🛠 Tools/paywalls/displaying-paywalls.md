---
title: Displaying Paywalls
slug: displaying-paywalls
hidden: false
---

# Displaying Paywalls

## iOS

### How to display a fullscreen Paywall in your app

RevenueCat Paywalls will, by default, show paywalls fullscreen and there are multiple ways to do this with SwiftUI and UIKit.

- Depending on an entitlement with `presentPaywallIfNeeded`
- Custom logic with `presentPaywallIfNeeded`
- Manually with `PaywallView` or `PaywallViewController`

[block:file]
[
  {
    "language": "swift",
    "name": "Entitlement",
    "file": "code_blocks/🛠 Tools/paywalls/paywalls_1.swift"
  },
  {
    "language": "swift",
    "name": "Custom Logic",
    "file": "code_blocks/🛠 Tools/paywalls/paywalls_2.swift"
  },
  {
    "language": "swift",
    "name": "Manually",
    "file": "code_blocks/🛠 Tools/paywalls/paywalls_3.swift"
  },
  {
    "language": "swift",
    "name": "Manually (UIKit)",
    "file": "code_blocks/🛠 Tools/paywalls/paywalls_4.swift"
  }
]
[/block]

### Close Button

Paywalls displayed with `presentPaywallIfNeeded` will have a close button on the presented sheet. However, a `PaywallView` will not have a close button. This gives you full control on how to to navigate to and from your `PaywallView`. You can push it onto an existing navigation stack or show it in a sheet with a custom dismiss button using SwiftUI toolbar.

### How to display a footer Paywall on your custom paywall

RevenueCatUI also has a paywall variation that can be displayed as a footer below your custom paywall. This allows you to design your paywall exactly as you want with native components while still using RevenueCat UI to handle it. This is done by adding the `.paywallFooter()` view modifier to your view.

The footer paywall mainly consists of the following:
- Purchase button
- Package details text
- Package selection (if there are any multiple packages configured)

This is all remotely configured and RevenueCatUI handles all the intro offer eligibility and purchase logic.

[block:file]
[
  {
    "language": "swift",
    "name": "Current Offering",
    "file": "code_blocks/🛠 Tools/paywalls/paywalls_5.swift"
  },
  {
    "language": "swift",
    "name": "Specific Offering",
    "file": "code_blocks/🛠 Tools/paywalls/paywalls_6.swift"
  }
]
[/block]

### How to use custom fonts

Paywalls can be configured to use the same font as your app using a `PaywallFontProvider`. A `PaywallFontProvider` can be passed as an argument into all methods for displaying the paywall.

By default, a paywall will use the `DefaultPaywallFontProvider`. This uses the system default font which supports dynamic type.

We also offer a `CustomPaywallFontProvider` which requires a font name that could be something like "Arial" or "Papyrus".

If you need more control over your font preferences, you can create your own `PaywallFontProvider`. One of the following examples will use a rounded system font in the paywall.

[block:file]
[
  {
    "language": "swift",
    "name": "By Font Name",
    "file": "code_blocks/🛠 Tools/paywalls/paywalls_7.swift"
  },
  {
    "language": "swift",
    "name": "Manual PaywallFontProvider",
    "file": "code_blocks/🛠 Tools/paywalls/paywalls_8.swift"
  }
]
[/block]

## Android (Beta)

### How to display a fullscreen Paywall in your app

RevenueCat Paywalls will, by default, show paywalls fullscreen and there are multiple ways to do this with `Activity`s and Jetpack Compose.

- Depending on an entitlement with `PaywallDialog`
- Custom logic with `PaywallDialog`
- Manually with `PaywallView`, `PaywallDialog`, or `PaywallActivityLauncher`

[block:file]
[
  {
    "language": "kotlin",
    "name": "Entitlement",
    "file": "code_blocks/🛠 Tools/paywalls/paywalls_1.kt"
  },
  {
    "language": "kotlin",
    "name": "Custom Logic",
    "file": "code_blocks/🛠 Tools/paywalls/paywalls_2.kt"
  },
  {
    "language": "kotlin",
    "name": "Manually",
    "file": "code_blocks/🛠 Tools/paywalls/paywalls_3.kt"
  },
  {
    "language": "kotlin",
    "name": "Manually (Activity)",
    "file": "code_blocks/🛠 Tools/paywalls/paywalls_4.kt"
  }
]
[/block]

### How to display a footer Paywall on your custom paywall

RevenueCatUI also has a paywall variation that can be displayed as a footer below your custom paywall. This allows you to design your paywall exactly as you want with native components while still using RevenueCat UI to handle it.
This is done by using the `PaywallFooter` composable.

The footer paywall mainly consists of the following:
- Purchase button
- Package details text
- Package selection (if there are any multiple packages configured)

This is all remotely configured and RevenueCatUI handles all the intro offer eligibility and purchase logic.

[block:file]
[
  {
    "language": "kotlin",
    "name": "Current Offering",
    "file": "code_blocks/🛠 Tools/paywalls/paywalls_5.kt"
  },
  {
    "language": "kotlin",
    "name": "Specific Offering",
    "file": "code_blocks/🛠 Tools/paywalls/paywalls_6.kt"
  }
]
[/block]

## Default Paywall

If you attempt to display a Paywall for an Offering that doesn't have one configured, the RevenueCatUI SDK will display a default Paywall.
The default paywall displays all packages in the offering.

On iOS it uses the app's `accentColor` for styling.
On Android, it uses the app's `Material3`'s `ColorScheme`.


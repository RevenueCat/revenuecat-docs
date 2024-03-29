---
title: Displaying Paywalls
slug: displaying-paywalls
hidden: false
---

# iOS

## How to display a fullscreen Paywall in your app

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

## Close Button

Paywalls displayed with `presentPaywallIfNeeded` will have a close button on the presented sheet.
However, a `PaywallView` will not have a close button by default. This gives you full control on how to to navigate to and from your `PaywallView`. You can push it onto an existing navigation stack or show it in a sheet with a custom dismiss button using SwiftUI toolbar.

If desired, you can pass `displayCloseButton: true` when creating `PaywallView` to display a close button automatically.
This close button will automatically take the color of your app's tint color. You can also override it by using [`View.tintColor`](https://developer.apple.com/documentation/swiftui/view/tint(_:)-23xyq): `PaywallView(...).tintColor(Color.red)`.

## How to display a footer Paywall on your custom paywall

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

## How to use custom fonts

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

# Android

## How to display a fullscreen Paywall in your app

RevenueCat Paywalls will, by default, show paywalls fullscreen and there are multiple ways to do this with `Activity`s and Jetpack Compose.

- Depending on an entitlement with `PaywallDialog`
- Custom logic with `PaywallDialog`
- Manually with `Paywall`, `PaywallDialog`, or `PaywallActivityLauncher`

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
  },
  {
    "language": "java",
    "name": "Manually (Activity) (Java)",
    "file": "code_blocks/🛠 Tools/paywalls/paywalls_activity_java.java"
  }
]
[/block]

## Close Button

Paywalls displayed with `PaywallDialog` will have a close button on the presented sheet.
However, a `Paywall` will not have a close button by default. This gives you full control over how to navigate to and from your `Paywall` composable. You can push this to the existing navigation stack or display it in a sheet with a custom dismiss button using Android's navigation components and fragments.
When presenting the paywall using the `PaywallActivityLauncher`, the close button will be shown by default since the paywall will be displayed as a new activity on top of the current stack.

If desired, you can use `PaywallOptions.Builder`'s `setShouldDisplayDismissButton(true)` method when creating a `Paywall` to display a close button automatically.

## How to display a footer Paywall on your custom paywall

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

## How to use custom fonts

Paywalls can be configured to use the same font as your app using a `FontProvider` when using Compose or `ParcelizableFontProvider` when using `PaywallActivityLauncher`. These can be passed to the `PaywallOptions` or `PaywallDialogOptions` builders or directly to the `launch` method in `PaywallActivityLauncher` into all methods for displaying the paywall.

By default, a paywall will not use a font provider. This uses the current Material3 theme's Typography by default.

We offer a `CustomFontProvider` and `CustomParcelizableFontProvider` which receives a single font family to use by all text styles in the paywall, if you don't need extra granularity control.

If you need more control over your font preferences, you can create your own `FontProvider`. See the following examples for some common use cases:

[block:file]
[
  {
    "language": "kotlin",
    "name": "Compose single font",
    "file": "code_blocks/🛠 Tools/paywalls/paywalls_compose_single_font.kt"
  },
  {
    "language": "kotlin",
    "name": "Compose font per style",
    "file": "code_blocks/🛠 Tools/paywalls/paywalls_compose_font_per_style.kt"
  },
  {
    "language": "kotlin",
    "name": "Activity single resource font",
    "file": "code_blocks/🛠 Tools/paywalls/paywalls_activity_single_resource_font.kt"
  },
  {
    "language": "kotlin",
    "name": "Activity single Google font",
    "file": "code_blocks/🛠 Tools/paywalls/paywalls_activity_single_google_font.kt"
  }
]
[/block]

# React Native

## How to display a fullscreen Paywall in your app

There are several ways to present paywalls:

- Using `RevenueCatUI.presentPaywall`: this will display a paywall when invoked.
- Using `RevenueCatUI.presentPaywallIfNeeded`: this will present a paywall only if the customer does not have an unlocked entitlement.
- Manually presenting `<RevenueCatUI.Paywall>`: this gives you more flexibility on how the paywall is presented.

[block:file]
[
  {
    "language": "typescript",
    "name": "RevenueCatUI.presentPaywall",
    "file": "code_blocks/🛠 Tools/paywalls/paywalls_rn_1.ts"
  },
  {
    "language": "typescript",
    "name": "RevenueCatUI.Paywall",
    "file": "code_blocks/🛠 Tools/paywalls/paywalls_rn_2.tsx"
  }
]
[/block]

## How to display a footer Paywall on your custom paywall

RevenueCatUI also has a paywall variation that can be displayed as a footer below your custom paywall.
This allows you to design your paywall exactly as you want with native components while still using RevenueCat UI to handle it.
This is done by using `<RevenueCatUI.PaywallFooterContainerView>`.

The footer paywall mainly consists of the following:
- Purchase button
- Package details text
- Package selection (if there are any multiple packages configured)

This is all remotely configured and RevenueCatUI handles all the intro offer eligibility and purchase logic.

[block:file]
[
  {
    "language": "typescript",
    "name": "RevenueCatUI.PaywallFooterContainerView",
    "file": "code_blocks/🛠 Tools/paywalls/paywalls_rn_3.tsx"
  }
]
[/block]

# Flutter

## How to display a fullscreen Paywall in your app

There are two ways to present paywalls:

- Using `RevenueCatUI.presentPaywall`: this will display a paywall when invoked.
- Using `RevenueCatUI.presentPaywallIfNeeded`: this will present a paywall only if the customer does not have an unlocked entitlement.

[block:file]
[
  {
    "language": "typescript",
    "name": "RevenueCatUI.presentPaywall",
    "file": "code_blocks/🛠 Tools/paywalls/paywalls_flutter_1.dart"
  }
]
[/block]

# Default Paywall

If you attempt to display a Paywall for an Offering that doesn't have one configured, the RevenueCatUI SDK will display a default Paywall.
The default paywall displays all packages in the offering.

On iOS it uses the app's `accentColor` for styling.
On Android, it uses the app's `Material3`'s `ColorScheme`.


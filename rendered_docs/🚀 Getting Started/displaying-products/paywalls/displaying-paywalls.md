---
title: Displaying Paywalls
slug: displaying-paywalls
hidden: true
parentDocSlug: paywalls
categorySlug: documentation
---

## How to display a fullscreen Paywall in your app

RevenueCat Paywalls will, by default, show paywalls fullscreen and there are multiple ways to do this with SwiftUI and UIKit.

- Depending on an entitlement with `presentPaywallIfNeeded`
- Custom logic with `presentPaywallIfNeeded`
- Manually with `PaywallView` or `PaywallViewController`

```swift Entitlement
import SwiftUI

import RevenueCat
import RevenueCatUI

struct App: View {
    var body: some View {
        ContentView()
            .presentPaywallIfNeeded(requiredEntitlementIdentifier: "pro") { customerInfo in
                print("Purchase completed: \(customerInfo.entitlements)")
            }
    }
}
```
```swift Custom Logic
import SwiftUI

import RevenueCat
import RevenueCatUI

struct App: View {
    var body: some View {
        ContentView()
            .presentPaywallIfNeeded { customerInfo in
                // Returning `true` will present the paywall
                return customerInfo.entitlements.active.keys.contains("pro")
            } purchaseCompleted: { customerInfo in
                print("Purchase completed: \(customerInfo.entitlements)")
            }
    }
}
```
```swift Manually
import SwiftUI

import RevenueCat
import RevenueCatUI

struct App: View {
    @State
    var displayPaywall = false

    var body: some View {
        ContentView()
            .sheet(self.$displayPaywall) {
                PaywallView()
            }
    }
}
```
```swift Manually (UIKit)
import UIKit

import RevenueCat
import RevenueCatUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func presentPaywall() {
        let controller = PaywallViewController()
        controller.delegate = self

        present(controller, animated: true, completion: nil)
    }
}

extension ViewController: PaywallViewControllerDelegate {

    func paywallViewController(_ controller: PaywallViewController,
                               didFinishPurchasingWith customerInfo: CustomerInfo) {

    }

}
```

## How to display a footer Paywall on your custom paywall

RevenueCatUI also has a paywall variation that can be displayed as a footer below your custom paywall. This allows you to design your paywall exactly as you want with native components while still using RevenueCat UI to handle. This is done by adding the `.paywallFooter()` view modifier to your view.

The footer paywall mainly consists of:
- Purchase button
- Package details text
- Package selection (if there are any multiple packages configured)

This is all remotely configured and RevenueCatUI handles all the intro offer eligibility and purchase logic.

```swift Current Offering
import SwiftUI

import RevenueCat
import RevenueCatUI

struct YourPaywall: View {

    var body: some View {
        ScrollView {
            // Your custom paywall design content
        }
        .paywallFooter()
    }

}
```
```swift Specific Offering
import SwiftUI

import RevenueCat
import RevenueCatUI

struct YourPaywall: View {

    let offering: Offering

    var body: some View {
        ScrollView {
            // Your custom paywall design content
        }
        .paywallFooter(offering: offering, condensed: true) { customerInfo in
            // Purchase completed! Thank your user and dismiss your paywall
        }
    }

}
```


## How to use custom fonts

Paywalls can be configured to use the same font as your app using a `PaywallFontProvider`. A `PaywallFontProvider` can be passed as an argument into all methods for displaying paywall.

By default, paywalls will use the `DefaultPaywallFontProvider`. This uses the system default font which supports dynamic type.

We also offer a `CustomPaywallFontProvider` which requires a font name which could be something like "Arial" or "Papyrus".

If you need more control for your font preferences, you can create your own `PaywallFontProvider`. One of following examples will use a rounded system font in the paywall.

```swift By Font Name
import SwiftUI

import RevenueCat
import RevenueCatUI

struct App: View {
    var body: some View {
        ContentView()
            .presentPaywallIfNeeded(
                fonts: CustomPaywallFontProvider(fontName: "Arial")
            ) { customerInfo in
                // Returning `true` will present the paywall
                return customerInfo.entitlements.active.keys.contains("pro")
            }
    }
}
```
```swift Manual PaywallFontProvider
import SwiftUI

import RevenueCat
import RevenueCatUI

struct App: View {
    var body: some View {
        ContentView()
            .presentPaywallIfNeeded(
                fonts: RoundedSystemFontProvider()
            ) { customerInfo in
                // Returning `true` will present the paywall
                return customerInfo.entitlements.active.keys.contains("pro")
            }
    }
}

class RoundedSystemFontProvider: PaywallFontProvider {
    func font(for textStyle: Font.TextStyle) -> Font {
        return Font.system(textStyle, design: .rounded)
    }
}
```
---
title: Displaying Paywalls
slug: displaying-paywalls
hidden: false
categorySlug: tools
order: 1
parentDoc: 64d0f9bdc52aeb0058f5ec3d
---

# Displaying Paywalls

## iOS

### How to display a fullscreen Paywall in your app

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
            .presentPaywallIfNeeded(
                requiredEntitlementIdentifier: "pro",
                purchaseCompleted: { customerInfo in
                    print("Purchase completed: \(customerInfo.entitlements)")
                },
                restoreCompleted: { customerInfo in
                    // Paywall will be dismissed automatically if "pro" is now active.
                    print("Purchases restored: \(customerInfo.entitlements)")
                }
            )
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
            } restoreCompleted: {
                // Paywall will be dismissed automatically if "pro" is now active.
                print("Purchases restored: \(customerInfo.entitlements)")
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
            .sheet(isPresented: self.$displayPaywall) {
                PaywallView()
                // PaywallView does not have a close button 
                // Manually add one to match your app's style 
                .toolbar {
                    ToolbarItem(placement: .destructiveAction) {
                        Button {
                            self.displayPaywall = false
                        } label: {
                            Image(systemName: "xmark")
                        }
                    }
                }
            }
    }
}
```
```swift Manually (UIKit)
import UIKit

import RevenueCat
import RevenueCatUI

class ViewController: UIViewController {

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

### Close Button

Paywalls displayed with `presentPaywallIfNeeded` will have a close button on the presented sheet. However, a `PaywallView` will not have a close button. This gives you full control on how to to navigate to and from your `PaywallView`. You can push it onto an existing navigation stack or show it in a sheet with a custom dismiss button using SwiftUI toolbar.

### How to display a footer Paywall on your custom paywall

RevenueCatUI also has a paywall variation that can be displayed as a footer below your custom paywall. This allows you to design your paywall exactly as you want with native components while still using RevenueCat UI to handle it. This is done by adding the `.paywallFooter()` view modifier to your view.

The footer paywall mainly consists of the following:
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

### How to use custom fonts

Paywalls can be configured to use the same font as your app using a `PaywallFontProvider`. A `PaywallFontProvider` can be passed as an argument into all methods for displaying the paywall.

By default, a paywall will use the `DefaultPaywallFontProvider`. This uses the system default font which supports dynamic type.

We also offer a `CustomPaywallFontProvider` which requires a font name that could be something like "Arial" or "Papyrus".

If you need more control over your font preferences, you can create your own `PaywallFontProvider`. One of the following examples will use a rounded system font in the paywall.

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

## Android (Beta)

### How to display a fullscreen Paywall in your app

RevenueCat Paywalls will, by default, show paywalls fullscreen and there are multiple ways to do this with `Activity`s and Jetpack Compose.

- Depending on an entitlement with `PaywallDialog`
- Custom logic with `PaywallDialog`
- Manually with `PaywallView`, `PaywallDialog`, or `PaywallActivityLauncher`

```kotlin Entitlement
@Composable
private fun LockedScreen() {
    YourContent()

    PaywallDialog(
        PaywallDialogOptions.Builder()
            .setRequiredEntitlementIdentifier(Constants.ENTITLEMENT_ID)
            .setListener(
                object : PaywallListener {
                    override fun onPurchaseCompleted(customerInfo: CustomerInfo, storeTransaction: StoreTransaction) {}
                    override fun onRestoreCompleted(customerInfo: CustomerInfo) {}
                }
            )
            .build()
    )
}
```
```kotlin Custom Logic
@Composable
private fun NavGraph(navController: NavHostController) {
    NavHost(
        navController = navController,
        startDestination = Screen.Main.route,
    ) {
        composable(route = Screen.Main.route) {
            MainScreen()

            PaywallDialog(
                PaywallDialogOptions.Builder()
                    .setShouldDisplayBlock { !it.entitlements.active.isEmpty() }
                    .setListener(
                        object : PaywallListener {
                            override fun onPurchaseCompleted(customerInfo: CustomerInfo, storeTransaction: StoreTransaction) {}
                            override fun onRestoreCompleted(customerInfo: CustomerInfo) {}
                        }
                    )
                    .build()
            )
        }
    }
}
```
```kotlin Manually
@Composable
private fun NavGraph(navController: NavHostController) {
    NavHost(
        navController = navController,
        startDestination = Screen.Main.route,
    ) {
        composable(route = Screen.Main.route) {
            MainScreen()
        }

        composable(route = Screen.Paywall.route) {
            Paywall(
                options = PaywallOptions.Builder()
                    .setListener(
                        object : PaywallListener {
                            override fun onPurchaseCompleted(customerInfo: CustomerInfo, storeTransaction: StoreTransaction) {}
                            override fun onRestoreCompleted(customerInfo: CustomerInfo) {}
                        }
                    )
                    .build()
            )
        }
    }
}
```
```kotlin Manually (Activity)
class MainActivity : AppCompatActivity(), PaywallResultHandler {
    private lateinit var paywallActivityLauncher: PaywallActivityLauncher
    private lateinit var root: View

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        paywallActivityLauncher = PaywallActivityLauncher(this, this)
    }

    private fun performMagic() {
        Purchases.sharedInstance.getCustomerInfoWith { 
            if (it.entitlements[Constants.ENTITLEMENT_ID]?.isActive != true) {
                paywallActivityLauncher.launch()
            }
        }
    }

    override fun onActivityResult(result: PaywallResult) {}
}
```

### How to display a footer Paywall on your custom paywall

RevenueCatUI also has a paywall variation that can be displayed as a footer below your custom paywall. This allows you to design your paywall exactly as you want with native components while still using RevenueCat UI to handle it.
This is done by using the `PaywallFooter` composable.

The footer paywall mainly consists of the following:
- Purchase button
- Package details text
- Package selection (if there are any multiple packages configured)

This is all remotely configured and RevenueCatUI handles all the intro offer eligibility and purchase logic.

```kotlin Current Offering
@Composable
private fun PaywallScreen() {
    PaywallFooter() {
        CustomPaywallContent()        
    }
}
```
```kotlin Specific Offering
@Composable
private fun PaywallScreen(offering: Offering) {
    PaywallFooter(
        options = PaywallOptions.Builder()
            .setOffering(offering)
            .build()
    ) {
        CustomPaywallContent()        
    }
}
```

## Default Paywall

If you attempt to display a Paywall for an Offering that doesn't have one configured, the RevenueCatUI SDK will display a default Paywall.
The default paywall displays all packages in the offering.

On iOS it uses the app's `accentColor` for styling.
On Android, it uses the app's `Material3`'s `ColorScheme`.


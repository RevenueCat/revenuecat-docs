---
title: Displaying Paywalls
slug: displaying-paywalls
hidden: false
categorySlug: tools
order: 1
parentDoc: 64d0f9bdc52aeb0058f5ec3d
---

# iOS

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
                PaywallView(displayCloseButton: true)
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

# Android

## How to display a fullscreen Paywall in your app

RevenueCat Paywalls will, by default, show paywalls fullscreen and there are multiple ways to do this with `Activity`s and Jetpack Compose.

- Depending on an entitlement with `PaywallDialog`
- Custom logic with `PaywallDialog`
- Manually with `Paywall`, `PaywallDialog`, or `PaywallActivityLauncher`

```kotlin Entitlement
@OptIn(ExperimentalPreviewRevenueCatUIPurchasesAPI::class)
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
@OptIn(ExperimentalPreviewRevenueCatUIPurchasesAPI::class)
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
@OptIn(ExperimentalPreviewRevenueCatUIPurchasesAPI::class)
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
                options = PaywallOptions.Builder(
                    onDismiss = { navController.popBackStack() }
                )
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
@OptIn(ExperimentalPreviewRevenueCatUIPurchasesAPI::class)
class MainActivity : AppCompatActivity(), PaywallResultHandler {
    private lateinit var paywallActivityLauncher: PaywallActivityLauncher
    private lateinit var root: View

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        paywallActivityLauncher = PaywallActivityLauncher(this, this)
    }

    private fun launchPaywallActivity() {
        paywallActivityLauncher.launchIfNeeded(requiredEntitlementIdentifier = Constants.ENTITLEMENT_ID)
    }

    override fun onActivityResult(result: PaywallResult) {}
}
```
```java Manually (Activity) (Java)
@OptIn(markerClass = ExperimentalPreviewRevenueCatUIPurchasesAPI.class)
public class MainActivity extends AppCompatActivity implements PaywallResultHandler {
    private PaywallActivityLauncher launcher;
    private static final String requiredEntitlementIdentifier = "MY_ENTITLEMENT_ID";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        launcher = new PaywallActivityLauncher(this, this);
    }

    private void launchPaywallActivity() {
        // This will launch the paywall only if the user doesn't have the given entitlement id active.
        launcher.launchIfNeeded(requiredEntitlementIdentifier);
        // or if you want to launch it without any conditions
        launcher.launch();
    }

    @Override
    public void onActivityResult(PaywallResult result) {
        // Handle result
    }
}
```

## How to display a footer Paywall on your custom paywall

RevenueCatUI also has a paywall variation that can be displayed as a footer below your custom paywall. This allows you to design your paywall exactly as you want with native components while still using RevenueCat UI to handle it.
This is done by using the `PaywallFooter` composable.

The footer paywall mainly consists of the following:
- Purchase button
- Package details text
- Package selection (if there are any multiple packages configured)

This is all remotely configured and RevenueCatUI handles all the intro offer eligibility and purchase logic.

```kotlin Current Offering
@OptIn(ExperimentalPreviewRevenueCatUIPurchasesAPI::class)
@Composable
private fun PaywallScreen(dismissRequest: () -> Unit) {
    PaywallFooter(
        options = PaywallOptions.Builder(dismissRequest).build()
    ) {
        CustomPaywallContent()        
    }
}
```
```kotlin Specific Offering
@OptIn(ExperimentalPreviewRevenueCatUIPurchasesAPI::class)
@Composable
private fun PaywallScreen(offering: Offering, dismissRequest: () -> Unit) {
    PaywallFooter(
        options = PaywallOptions.Builder(
            options = PaywallOptions.Builder(dismissRequest).build()
        )
            .setOffering(offering)
            .build()
    ) {
        CustomPaywallContent()        
    }
}
```

## How to use custom fonts

Paywalls can be configured to use the same font as your app using a `FontProvider` when using Compose or `ParcelizableFontProvider` when using `PaywallActivityLauncher`. These can be passed to the `PaywallOptions` or `PaywallDialogOptions` builders or directly to the `launch` method in `PaywallActivityLauncher` into all methods for displaying the paywall.

By default, a paywall will not use a font provider. This uses the current Material3 theme's Typography by default.

We offer a `CustomFontProvider` and `CustomParcelizableFontProvider` which receives a single font family to use by all text styles in the paywall, if you don't need extra granularity control.

If you need more control over your font preferences, you can create your own `FontProvider`. See the following examples for some common use cases:

```kotlin Compose single font
@OptIn(ExperimentalPreviewRevenueCatUIPurchasesAPI::class)
@Composable
fun MyComposable() {
    PaywallDialog(
        PaywallDialogOptions.Builder { /* on dismiss */ }
            .setFontProvider(CustomFontProvider(myFontFamily))
            .build()
    )
}
```
```kotlin Compose font per style
@OptIn(ExperimentalPreviewRevenueCatUIPurchasesAPI::class)
@Composable
fun MyComposable() {
    PaywallDialog(
        PaywallDialogOptions.Builder { /* on dismiss */ }
            .setFontProvider(object : FontProvider {
                override fun getFont(type: TypographyType): FontFamily? {
                    return when (type) {
                        TypographyType.HEADLINE_LARGE -> headlineFontFamily
                        TypographyType.BODY_LARGE -> bodyFontFamily
                        else -> null // Will use default font
                    }
                }
            })
            .build()
    )
}
```
```kotlin Activity single resource font
@OptIn(ExperimentalPreviewRevenueCatUIPurchasesAPI::class)
class MyActivity : ComponentActivity(), PaywallResultHandler {
    private lateinit var paywallActivityLauncher: PaywallActivityLauncher
    private val fontFamily = PaywallFontFamily(
        fonts = listOf(
            PaywallFont.ResourceFont(R.font.my_font)
        )
    )

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        paywallActivityLauncher = PaywallActivityLauncher(this, this)
    }

    fun launchPaywall(offering: Offering? = null) {
        paywallActivityLauncher.launch(
            offering, 
            CustomParcelizableFontProvider(fontFamily)
        )
    }
}
```
```kotlin Activity single Google font
@OptIn(ExperimentalPreviewRevenueCatUIPurchasesAPI::class)
class MyActivity : ComponentActivity(), PaywallResultHandler {
    private lateinit var paywallActivityLauncher: PaywallActivityLauncher
    private val googleFontProvider = GoogleFontProvider(R.array.com_google_android_gms_fonts_certs)
    private val fontFamily = PaywallFontFamily(
        fonts = listOf(
            PaywallFont.GoogleFont("GOOGLE_FONT_NAME", googleFontProvider)
        )
    )

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        paywallActivityLauncher = PaywallActivityLauncher(this, this)
    }

    fun launchPaywall(offering: Offering? = null) {
        paywallActivityLauncher.launch(
            offering,
            CustomParcelizableFontProvider(fontFamily)
        )
    }
}
```

# React Native

## How to display a fullscreen Paywall in your app

There are several ways to present paywalls:

- Using `RevenueCatUI.presentPaywall`: this will display a paywall when invoked.
- Using `RevenueCatUI.presentPaywallIfNeeded`: this will present a paywall only if the customer does not have an unlocked entitlement.
- Manually presenting `<RevenueCatUI.Paywall>`: this gives you more flexibility on how the paywall is presented.

```typescript RevenueCatUI.presentPaywall
import RevenueCatUI, { PAYWALL_RESULT } from "react-native-purchases-ui";

async function presentPaywall(): Promise<boolean> {
    const paywallResult: PAYWALL_RESULT = await RevenueCatUI.presentPaywall();

    switch (paywallResult) {
        case PAYWALL_RESULT.NOT_PRESENTED:
        case PAYWALL_RESULT.ERROR:
        case PAYWALL_RESULT.CANCELLED:
            return false;
        case PAYWALL_RESULT.PURCHASED:
        case PAYWALL_RESULT.RESTORED:
            return true;
        default:
            return false;
    }
}

async function presentPaywallIfNeeded() {
    const paywallResult: PAYWALL_RESULT = await RevenueCatUI.presentPaywallIfNeeded({
        requiredEntitlementIdentifier: "pro"
    });
}
```
```typescript RevenueCatUI.Paywall
import React from 'react';
import { View } from 'react-native';

import RevenueCatUI from 'react-native-purchases-ui';

return (
    <View style={{ flex: 1 }}>
        <RevenueCatUI.Paywall />
    </View>
);
```

## How to display a footer Paywall on your custom paywall

RevenueCatUI also has a paywall variation that can be displayed as a footer below your custom paywall.
This allows you to design your paywall exactly as you want with native components while still using RevenueCat UI to handle it.
This is done by using `<RevenueCatUI.PaywallFooterContainerView>`.

The footer paywall mainly consists of the following:
- Purchase button
- Package details text
- Package selection (if there are any multiple packages configured)

This is all remotely configured and RevenueCatUI handles all the intro offer eligibility and purchase logic.

```typescript RevenueCatUI.PaywallFooterContainerView
import React from 'react';
import { Text } from 'react-native';

import RevenueCatUI from 'react-native-purchases-ui';

return (
    <RevenueCatUI.PaywallFooterContainerView style={{ backgroundColor: '#f8f8f8' }}>
        <Text>
            Your Custom Paywall Design
        </Text>
    </RevenueCatUI.PaywallFooterContainerView>
);
```

# Flutter

## How to display a fullscreen Paywall in your app

There are two ways to present paywalls:

- Using `RevenueCatUI.presentPaywall`: this will display a paywall when invoked.
- Using `RevenueCatUI.presentPaywallIfNeeded`: this will present a paywall only if the customer does not have an unlocked entitlement.

```typescript RevenueCatUI.presentPaywall
import 'dart:async';
import 'dart:developer';

import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';

void presentPaywall() async {
  final paywallResult = await RevenueCatUI.presentPaywall();
  log('Paywall result: $paywallResult');
}

void presentPaywallIfNeeded() async {
  final paywallResult = await RevenueCatUI.presentPaywallIfNeeded("pro");
  log('Paywall result: $paywallResult');
}
```

# Default Paywall

If you attempt to display a Paywall for an Offering that doesn't have one configured, the RevenueCatUI SDK will display a default Paywall.
The default paywall displays all packages in the offering.

On iOS it uses the app's `accentColor` for styling.
On Android, it uses the app's `Material3`'s `ColorScheme`.


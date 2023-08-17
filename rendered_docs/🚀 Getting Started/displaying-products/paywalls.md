---
title: Paywalls (beta)
slug: paywalls
hidden: true
categorySlug: documentation
order: 999
---
RevenueCat's Paywalls allow you to to remotely configure your entire paywall view without any code changes or app updates. Whether you’re building a new app, exploring new paywall concepts, or diving into experimentation; RevenueCat’s Paywalls make it easy to get started.

## How Paywalls work

### Overview

Our paywall templates use native code to deliver smooth, intuitive experiences to your customers when you’re ready to deliver them an Offering; and you can use our Dashboard to pick the right template and configuration to meet your needs.

To use RevenueCat Paywalls on iOS, simply:

1. Create a Paywall on the Dashboard for the [Offering](doc:entitlements) you intend to serve to your customers
2. Update your RevenueCat SDK to version 4.27
3. Add the RevenueCatUI SPM dependency to your project

<img width="400" alt="Add paywall" src="https://files.readme.io/9140485-Screenshot_2023-08-04_at_12.08.07.png">

4. Import RevenueCatUI at the point in the user experience when you want to display a paywall (see below)

> 📘 
> 
> RevenueCat Paywalls are only available on our iOS SDK and require version >= 4.27.
> 
> Android support is coming soon.

### Offerings and Paywalls

You can think of a Paywall as an optional feature of your Offering. An Offering is the collection of Products which are organized into Packages to be displayed to your customers as a single "offer" across platforms. Now, with Paywalls, you can control the actual view that is used to display that "offer" in addition to controlling the products that are offered.

Therefore, you can create a unique Paywall for each of your Offerings, and can create an unlimited number of Offerings & Paywalls for each variation you want to test with Experiments.

## How to create a Paywall

### Select an Offering

First, click on **Paywalls** in the **Products and pricing** section of the Project you’re working on.

<img width="250" alt="Products and pricing" src="https://files.readme.io/73e1721-Products_and_pricing.png">

Then, click **+ Add paywall** next to the Offering that you want to create a Paywall for.

<img width="600" alt="Add paywall" src="https://files.readme.io/5dba69c-Add_pricing.png">


> 📘 
> 
> If you’re looking to experiment with a new paywall, consider duplicating your current Offering and attaching your new paywall to the duplicated Offering.

### Select a template

The first thing to do when creating a new Paywall is to select the template you’ll use as the starting point. Templates may support different package setups, content layouts, image sizes, and much more; so we recommend browsing each template to pick the one that’s best suited for what you’re looking to accomplish with your paywall.

For example, if you’re trying to draw contrast between a few different packages you’re offering, try the **#2 - Sphynx** template. Or, if you want to try your own version of the [Blinkist Free Trial Paywall](https://uxplanet.org/how-solving-our-biggest-customer-complaint-at-blinkist-led-to-a-23-increase-in-conversion-b60ad514134b) start with the **#3 - Leopard** template.

### Configure your Paywall

Once you’ve selected a template, you can configure any of its properties on the right side of the screen and see the change previewed immediately.

#### Packages

Packages represent the individual products you want to serve a customer on your Paywall. You don’t necessarily need to display every package that’s available in your Offering, and some templates may only support displaying one or a limited number of packages, so be sure to choose a template that reflects the options you want to offer your customers.

For templates that support multiple packages, you should select packages in the order that you’d like them to display. Then, you can separately choose which package should be preselected for your customers by default.

> 📘 
> 
> To test the impact of that choice, you can duplicate your Offering, preselect a different package, and run an Experiment between the two Offerings to see how it influences customer behavior on your Paywall.

#### Strings

How you describe your product has a huge impact on how likely a customer is to subscribe to it. Every descriptive string on our Paywall templates is fully configurable so you have control over exactly how you pitch your product


> 📘 
> 
> Try using markdown formatting in any string property to add custom styling to your Paywall.

#### Variables

For some Paywall strings you may want to set values based on the package that’s being displayed instead of hardcoding a single value, such as when quoting a price, or describing the duration of an Introductory Offer.

To make this easier and ensure accuracy, we recommend using **Variables** for these values that are package-specific.

For example, to show a CTA like “Try 7 Days Free & Subscribe”, you should instead use the **{{ sub_offer_duration }}** variable, and enter “Try {{ sub_offer_duration }} Free & Subscribe” to ensure the string is accurate for any product you use, even if you make changes to the nature of the offer in the future.

We support the following variables:

| Variable                  | Description                                                                                                     | Example Value     |
| :------------------------ | :-------------------------------------------------------------------------------------------------------------- | :---------------- |
| product_name              | The name of the product from the store (e.g. product localized title from StoreKit) for a given package         | CatGPT        |
| price                     | The localized price of a given package                                                                          | $39.99            |
| price_per_period          | The localized price of a given package with its period length if applicable                                     | $39.99/yr         |
| total_price_and_per_month | The localized price of a given package with its monthly equivalent price if it is not already a monthly package | $39.99 ($1.67/mo) |
| sub_price_per_month       | The localized price of a given package converted to a monthly equivalent price                                  | $3.33             |
| sub_duration              | The duration of the subscription; '1 month', '3 months', etc.                                                   | 1 month           |
| sub_period                | The length of each period of the standard offer on a given package                                              | Monthly           |
| sub_offer_duration        | The period of the introductory offer on a given package                                                         | 7 days            |
| sub_offer_price           | The localized price of the introductory offer of a given package                                                | $4.99             |

> 📘 
> 
> Click the **Show preview values** checkbox to see your Paywall with example preview values instead of the raw variables.

#### Intro offer eligibility

RevenueCat Paywalls automatically check for Introductory Offer eligibility, and therefore for applicable fields like the **Call to action** and **Offer details** you can enter distinct strings based on the nature of the offer. For example, you may want to highlight the length of your free trial for a customer who is eligible for that Introductory Offer.

#### Uploading images

Use the **Select a file** button for the applicable image to upload your own to use for your Paywall. We’ll center and scale the image to fit, regardless of its aspect ratio, so we recommend using source images that are appropriate for the area of the template they cover. We support .jpg, jpeg, and .png files up to 5MB.

#### Colors

Use your own hex codes, select a custom color, or use our color picker to select background and text colors for each element that reflect your app’s branding.

> 📘 
> 
> The color picker can be used outside of your browser window as well if you need to grab colors from assets in other applications.

## How to display a fullscreen Paywall in your app

RevenueCat Paywalls will, by default, show paywalls fullscreen and there are multiple ways to do this with SwiftUI and UIKit.

### SwiftUI

1. Option 1: `presentPaywallIfNeeded` depending on an entitlement
```swift 
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

2. Option 2: `presentPaywallIfNeeded` with custom logic
```swift 
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

3. Option 3: present manually
```swift 
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

### UIKIt

1. Option 1: manually present `PaywallViewController`
```swift 
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

## How to embed a Paywall into your views

RevenueCatUI also has smaller paywalls for you to embed or overlay in your app. You could display these as inline banners in your app, overlay your app as a sheet promoting an upgrade, or as a footer in a custom paywall.

This can all be done by passing `PaywallViewMode` into `PaywallView`. The options are:
- `PaywallViewMode.fullScreen`
- `PaywallViewMode.card`
- `PaywallViewMode.condensedCard`

### SwiftUI

1. Option 1: `PaywallView` in `UIHostingController`
```swift 
import SwiftUI

import RevenueCat
import RevenueCatUI

struct App: View {

    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    // Your custom paywall design content
                }.frame(maxWidth: .infinity)
            }

            Spacer()

            PaywallView(mode: .condensedCard) // or .card
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color(white: 0.8)
                .edgesIgnoringSafeArea(.all)
        )
    }

}
```

### UIKit

1. Option 1: `PaywallView` in `UIHostingController`
```swift 
import UIKit

import RevenueCat
import RevenueCatUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let paywallView = PaywallView(mode: .condensedCard) // or .card
        paywall.delegate = self

        let hostingController = UIHostingController(rootView: paywallView)

        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
    }

}

extension ViewController: PaywallViewControllerDelegate {

    func paywallViewController(_ controller: PaywallViewController,
                               didFinishPurchasingWith customerInfo: CustomerInfo) {

    }

}
```


## Limitations

#### Platforms (support for more coming)
* ✅  iOS 16.0 and higher
* ❌ tvOS
* ❌ watchOS
* ❌ macOS
* ❌ visionOS
* ❌ Android



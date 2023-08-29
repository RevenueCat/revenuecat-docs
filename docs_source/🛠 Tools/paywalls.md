---
title: Paywalls (beta)
slug: paywalls
hidden: true
---
RevenueCat's Paywalls allow you to remotely configure your entire paywall view without any code changes or app updates. Whether you’re building a new app, exploring new paywall concepts, or diving into experimentation; RevenueCat’s Paywalls make it easy to get started.

> ❗️
> 
> Paywalls are only available for iOS 15.0+ and Mac Catalyst 15.0+, but support for Android, tvOS, watchOS, and other platforms is coming soon!

# How Paywalls work

## Overview

Our paywall templates use native code to deliver smooth, intuitive experiences to your customers when you’re ready to deliver them an Offering; and you can use our Dashboard to pick the right template and configuration to meet your needs.

To use RevenueCat Paywalls on iOS, simply:

1. Create a Paywall on the Dashboard for the [Offering](doc:entitlements) you intend to serve to your customers
2. Update your RevenueCat SDK to version 4.26
3. Add the RevenueCatUI SPM dependency to your project

<img width="400" alt="Add paywall" src="https://files.readme.io/9140485-Screenshot_2023-08-04_at_12.08.07.png">

4. Import RevenueCatUI at the point in the user experience when you want to display a paywall (see below)

> 📘 
> 
> RevenueCat Paywalls are only available on our iOS SDK and require version >= 4.26.
> 
> Android support is coming soon.

## Offerings and Paywalls

You can think of a Paywall as an optional feature of your Offering. An Offering is the collection of Products which are organized into Packages to be displayed to your customers as a single "offer" across platforms. Now, with Paywalls, you can control the actual view that is used to display that "offer" in addition to controlling the products that are offered.

Therefore, you can create a unique Paywall for each of your Offerings, and can create an unlimited number of Offerings & Paywalls for each variation you want to test with Experiments.

# Limitations

## Platforms (support for more coming)
* ✅  iOS 15.0 and higher
* ✅  Mac Catalyst 15.0 and higher
* ❌ tvOS
* ❌ watchOS
* ❌ macOS
* ❌ visionOS
* ❌ Android

# Next Steps

* Now that you know how our paywalls work, read about [creating paywalls](doc:creating-paywalls)
* Once you're ready to see your paywalls in action, you can follow our guides on [displaying paywalls](doc:displaying-paywalls)

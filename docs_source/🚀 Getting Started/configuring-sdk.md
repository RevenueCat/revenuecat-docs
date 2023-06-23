---
title: Configuring the SDK
slug: configuring-sdk
hidden: false
---
If this is your first time integrating RevenueCat into your app, we recommend following our [Quickstart](https://docs.revenuecat.com/docs/getting-started) guide.

# Basic Configuration

## Initialization

Once you've [installed](https://docs.revenuecat.com/docs/installation) the SDK for your app, it's time to initialize and configure it.

You should only configure _Purchases_ once, usually early in your application lifecycle. After configuration, the same instance is shared throughout your app by accessing the `.shared` instance in the SDK.

Make sure you configure _Purchases_ with your public SDK key only. You can read more about the different API keys available in our [Authentication guide](https://docs.revenuecat.com/docs/authentication).

[block:file]
{"language":"swift","name":"","file":"code_blocks/🚀 Getting Started/configuring-sdk_1.swift"}
[/block]
[block:file]
{"language":"objectivec","name":"","file":"code_blocks/🚀 Getting Started/configuring-sdk_2.m"}
[/block]
[block:file]
{"language":"kotlin","name":"","file":"code_blocks/🚀 Getting Started/configuring-sdk_3.kt"}
[/block]
[block:file]
{"language":"java","name":"","file":"code_blocks/🚀 Getting Started/configuring-sdk_4.java"}
[/block]
[block:file]
{"language":"javascript","name":"Flutter","file":"code_blocks/🚀 Getting Started/configuring-sdk_5.js"}
[/block]
[block:file]
{"language":"javascript","name":"React Native","file":"code_blocks/🚀 Getting Started/configuring-sdk_6.js"}
[/block]
[block:file]
{"language":"javascript","name":"Cordova","file":"code_blocks/🚀 Getting Started/configuring-sdk_7.js"}
[/block]
[block:file]
{"language":"csharp","name":"Unity","file":"code_blocks/🚀 Getting Started/configuring-sdk_8.cs"}
[/block]

> ❗️ iOS 15+ Prewarming
> 
> In certain cases, calling `configure` in `application:didFinishLaunchingWithOptions:` should be avoided. See [Identifying Users](https://docs.revenuecat.com/docs/user-ids#provide-app-user-id-on-configuration) for more information.

> 📘 SwiftUI App Protocol
> 
> Using SwiftUI's App protocol? Check out our [resource](https://docs.revenuecat.com/docs/swiftui-app-lifecycle) on setting up the _Purchases_ SDK with SwiftUI.

## Enabling Debug Logs

Be sure to enable and view debug logs before filing a ticket with RevenueCat Support.

As detailed in the sample code above, debug logs can be enabled or disabled by setting the `Purchases.logLevel` property before configuring _Purchases_.

Debug logs will provide detailed log output in Xcode or LogCat for what is going on behind the scenes and should be the first thing you check if your app is behaving unexpectedly, and also to confirm there aren't any unhandled warnings or errors.

## Additional Configuration Options

The SDK allows additional configuration on first setup:

- **API Key (required)**: The public API key that corresponds to your app, found via **Project Settings > API keys > App specific keys** in the RevenueCat dashboard.
- **App User ID (optional)**: An identifier for the current user. Pass `null` if you don't have a user identifier at the time of configuration and RevenueCat will generate an anonymous Id for you. See our [guide on identifying users](https://docs.revenuecat.com/docs/user-ids) for more information.
- **Observer Mode (optional)**: A boolean value to set _Purchases_ in [Observer Mode](https://docs.revenuecat.com/docs/observer-mode). Only pass true if you're using RevenueCat for analytics purposes, and you're handling making purchases and checking subscription status yourself.
- **User Defaults (optional, iOS only)**: A key to override the standard user defaults used to cache `CustomerInfo`. This is required if you need to access `CustomerInfo` in an [iOS App Extension](https://developer.apple.com/app-extensions/).

If you're planning to use RevenueCat alongside your existing purchase code, check out our guide on [Observer Mode](https://docs.revenuecat.com/docs/observer-mode).

# Advanced Configuration

Additional configuration options on the `.shared` instance of _Purchases_.

## iOS

***

**Delegates**

`DELEGATE` `purchases:receivedUpdated`

Called whenever _Purchases_ receives an updated `CustomerInfo` object. This may happen periodically throughout the life of the app if new information becomes available (e.g. after making a purchase).

> 📘 
> 
> Note: RevenueCat doesn't push new data to the SDK, so this method is only called when <<glossary:CustomerInfo>> is updated from another SDK method or after a purchase is made.

***

`DELEGATE` `purchases:readyForPromotedProduct`

Called when a user initiates a promoted in-app purchase from the App Store. If your app is able to handle a purchase at the current time, run the `defermentBlock` in this method. If the app is not in a state to make a purchase: cache the `defermentBlock`, then call the `defermentBlock` when the app is ready to make the promoted purchase. If the purchase should never be made, you don't need to ever call the `defermentBlock` and _Purchases_ will not proceed with promoted purchases.

## Android

***

**Listeners**

`LISTENER` `UpdatedCustomerInfoListener`

Called whenever _Purchases_ receives an updated `CustomerInfo` object. This may happen periodically throughout the life of the app if new information becomes available (e.g. after making a purchase).

> 📘 
> 
> Note: RevenueCat doesn't push new data to the SDK, so this method is only called when <<glossary:CustomerInfo>> is updated from another SDK method or after a purchase is made.

> 🚧 NodeJS
> 
> There is no way to import RevenueCat into NodeJS, we don't make any such modules or sdks. The best option is to use our APIs directly using Node fetch. In our API docs you should use our JavaScript language to do so.

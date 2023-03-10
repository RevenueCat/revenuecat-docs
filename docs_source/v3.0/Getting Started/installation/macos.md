---
title: "macOS / Catalyst"
slug: "macos"
excerpt: "Instructions for installing Purchases SDK for macOS / Catalyst"
hidden: false
metadata: 
  title: "macOS / Catalyst Purchases SDK | RevenueCat"
  description: "The RevenueCat Purchases SDK handles the pain points of in-app purchases and subscriptions, so you can get back to building your app."
  image: 
    0: "https://files.readme.io/42f2137-Reddit__E.jpg"
    1: "Reddit – E.jpg"
    2: 1200
    3: 630
    4: "#fbabaf"
createdAt: {}
updatedAt: "2020-08-13T20:44:16.325Z"
---
###What is RevenueCat?

RevenueCat is an in-app subscription platform that makes it easy to build and manage IAPs on any platform. With the RevenueCat SDK, you can build and manage your app business on any platform without having to maintain purchase infrastructure. You can read more about [how RevenueCat fits into your app](https://www.revenuecat.com/blog/where-does-revenuecat-fit-in-your-app) or you can [sign up free](https://app.revenuecat.com/signup) to start building.

As of March 2020, RevenueCat only supports [universal purchases](https://developer.apple.com/support/universal-purchase/) for macOS apps. This allows you to seamlessly share purchases between iOS, tvOS, watchOS, and macOS versions of your apps. If you need support for the legacy Mac App Store purchases, contact support. 
[block:api-header]
{
  "title": "Requirements"
}
[/block]
Xcode 10.2+
Minimum target: macOS 10.12+
[block:api-header]
{
  "title": "Installation"
}
[/block]
The Purchases iOS SDK is also compatible with macOS, and can be installed either via [CocoaPods](doc:macos#section-install-via-cocoapods) or [Swift Package Manager](macos#section-install-via-swift-package-manager). 
[block:callout]
{
  "type": "warning",
  "title": "Carthage is currently uncompatible with Catalyst",
  "body": "Once Carthage is updated to support Catalyst, installing with Carthage will be restored. The recommended way to install the Purchases iOS SDK for Catalyst projects is to use [Swift Package Manager](macos#section-install-via-swift-package-manager)."
}
[/block]

[block:api-header]
{
  "title": "Install via CocoaPods"
}
[/block]
Add the following to your Podfile:
[block:code]
{
  "codes": [
    {
      "code": "pod 'Purchases', '3.5.2'",
      "language": "ruby",
      "name": "Podfile"
    }
  ]
}
[/block]
And then run:
[block:code]
{
  "codes": [
    {
      "code": "pod install",
      "language": "shell",
      "name": "Terminal"
    }
  ]
}
[/block]
This will add `Purchases.framework` to your workspace.
[block:api-header]
{
  "title": "Install via Swift Package Manager"
}
[/block]
You can use Swift Package Manager to add Purchases to your Xcode project. Select `File » Swift Packages » Add Package Dependency...` and specify the repository URL of the `Purchases` library: https://github.com/RevenueCat/purchases-ios.git. Set the version to `Up to next major` and choose the target where you want to use it. The library should have been added to the Swift Package Dependencies section and you should be able to import it now.
[block:api-header]
{
  "title": "Importing Purchases"
}
[/block]
You should now be able `import Purchases`
[block:code]
{
  "codes": [
    {
      "code": "import Purchases",
      "language": "swift"
    },
    {
      "code": "#import \"RCPurchases.h\"",
      "language": "objectivec"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "title": "Enable In-App Purchase for your project",
  "body": "Don't forget to enable the In-App Purchase capability for your project under `Project Target -> Capabilities -> In-App Purchase`"
}
[/block]

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/65db383-Screen_Shot_2018-12-18_at_9.15.09_AM.png",
        "Screen Shot 2018-12-18 at 9.15.09 AM.png",
        668,
        107,
        "#fafafc"
      ]
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "Next Steps"
}
[/block]
* Now that you've installed the Purchases SDK in your macOS app, get started by [configuring an instance of Purchases :fa-arrow-right:](doc:getting-started-1#section-configure-purchases)
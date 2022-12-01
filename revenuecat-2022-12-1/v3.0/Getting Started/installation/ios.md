---
title: "iOS"
slug: "ios"
excerpt: "Instructions for installing Purchases SDK for iOS"
hidden: false
metadata: 
  title: "iOS Purchases SDK | RevenueCat"
  description: "RevenueCat handles the pain points of in-app purchases and subscriptions for iOS, so you can get back to building your app. All you need to get started is a free API key."
  image: 
    0: "https://files.readme.io/a272c25-Reddit__E.jpg"
    1: "Reddit – E.jpg"
    2: 1200
    3: 630
    4: "#fbabaf"
createdAt: {}
updatedAt: "2020-08-29T00:01:36.510Z"
---
[block:api-header]
{
  "title": "What is RevenueCat?"
}
[/block]
RevenueCat is an in-app subscription platform that makes it easy to build and manage IAPs on any platform. With the RevenueCat SDK, you can build and manage your app business on any platform without having to maintain purchase infrastructure. You can read more about [how RevenueCat fits into your app](https://www.revenuecat.com/blog/where-does-revenuecat-fit-in-your-app) or you can [sign up free](https://app.revenuecat.com/signup) to start building.


[block:api-header]
{
  "title": "Requirements"
}
[/block]
Xcode 10.2+
Minimum target: iOS 9.0+
[block:api-header]
{
  "title": "Installation"
}
[/block]
Purchases for iOS can be installed either via [CocoaPods](doc:ios#section-install-via-cocoapods), [Carthage](ios#section-install-via-carthage), or [Swift Package Manager](doc:ios#section-install-via-swift-package-manager). 
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
  "title": "Install via Carthage"
}
[/block]
Add the following to your Cartfile:
[block:code]
{
  "codes": [
    {
      "code": "github \"revenuecat/purchases-ios\" \"3.5.2\"",
      "language": "text",
      "name": "Cartfile"
    }
  ]
}
[/block]
And then run:
[block:code]
{
  "codes": [
    {
      "code": "carthage update --no-use-binaries",
      "language": "shell",
      "name": "Terminal"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "`--no-use-binaries` is optional, but it might be helpful if you're using a different version of the Swift compiler than the one in the binary version."
}
[/block]

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
      "code": "#import \"Purchases.h\"",
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
* Now that you've installed the Purchases SDK in your iOS app, get started by [configuring an instance of Purchases :fa-arrow-right:](doc:getting-started-1#section-configure-purchases)
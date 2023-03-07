---
title: "iOS"
slug: "ios"
excerpt: "Instructions for installing Purchases SDK for iOS"
hidden: false
createdAt: "2018-06-11T03:48:40.275Z"
updatedAt: "2019-11-13T20:55:26.760Z"
---
[block:api-header]
{
  "title": "Requirements"
}
[/block]
XCode 10.2+
Minimum target: iOS 9.0+
[block:callout]
{
  "type": "warning",
  "title": "New version available",
  "body": "Our version 3.0 SDK is available for iOS with a more powerful way to organize and configure products remotely.\n\n[**Go to the new docs :fa-arrow-right:**](https://docs.revenuecat.com/v3.0/docs)"
}
[/block]

[block:api-header]
{
  "title": "Installation"
}
[/block]
Purchases for iOS can be installed either via [CocoaPods](doc:ios#section-install-via-cocoapods) or [Carthage](ios#section-install-via-carthage). 
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
      "code": "pod 'Purchases', '~> 2.6'",
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
      "code": "github \"revenuecat/purchases-ios\" \"2.6.0\"",
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
  "body": "Make sure to include the `--no-use-binaries` to work around a bug in the most recent Carthage release."
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
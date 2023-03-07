---
title: "macOS / Catalyst"
slug: "macos"
excerpt: "Instructions for installing Purchases SDK for macOS / Catalyst"
hidden: false
createdAt: "2019-04-22T20:36:03.464Z"
updatedAt: "2019-11-13T20:55:54.901Z"
---
[block:api-header]
{
  "title": "Requirements"
}
[/block]
XCode 10.2+
Minimum target: macOS 10.12+

[block:callout]
{
  "type": "warning",
  "title": "New version available",
  "body": "Our version 3.0 SDK is available for macOS with a more powerful way to organize and configure products remotely. \n\n[**Go to the new docs :fa-arrow-right:**](https://docs.revenuecat.com/v3.0/docs)"
}
[/block]

[block:callout]
{
  "type": "info",
  "title": "Sharing subscriptions with iOS",
  "body": "iOS and macOS (including Catalyst) use different bundle Ids, meaning any purchase on either platform completely separate from each other. To share a subscription across both platforms a consistent [user identifier](doc:user-ids) needs to be set in the *Purchases SDK*."
}
[/block]

[block:api-header]
{
  "title": "Installation"
}
[/block]
The Purchases iOS SDK is also compatible with macOS, and can be installed either via [CocoaPods](doc:macos#section-install-via-cocoapods) or [Carthage](macos#section-install-via-carthage). 
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
---
title: "iOS"
slug: "ios"
excerpt: "Instructions for installing Purchases SDK for iOS"
hidden: false
createdAt: "2018-06-11T03:48:40.275Z"
updatedAt: "2019-01-16T00:16:00.862Z"
---
[block:callout]
{
  "type": "success",
  "title": "Feeling Frisky? 😻",
  "body": "We have a public beta ready of our **new and improved Purchases SDK v2**. We've simplified a  lot of the methods, and think you'll like it.\n\n[**Send me to the new v2 Purchases documentation :fa-arrow-right:**](https://docs.revenuecat.com/v2.0/docs/ios)"
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
      "code": "pod 'Purchases'",
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
      "code": "github \"revenuecat/purchases-ios\"",
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
  "type": "warning",
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
  "type": "warning",
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
* Now that you've installed the Purchases SDK in your iOS app, get started by [initializing an instance of Purchases :fa-arrow-right:](doc:getting-started-1#section-4-initialize-purchases)
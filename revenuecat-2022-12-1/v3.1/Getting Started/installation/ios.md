---
title: "iOS"
slug: "ios"
excerpt: "Instructions for installing Purchases SDK for iOS"
hidden: false
metadata: 
  title: "iOS Purchases SDK – RevenueCat"
  description: "RevenueCat handles the pain points of in-app purchases and subscriptions for iOS, so you can get back to building your app. All you need to get started is a free API key."
  image: 
    0: "https://files.readme.io/c8ecba5-OG_image.png"
    1: "OG image.png"
    2: 1200
    3: 627
    4: "#e9acb0"
createdAt: {}
updatedAt: "2021-06-01T22:18:04.533Z"
---
# What is RevenueCat?

RevenueCat is a secure, reliable, and free to use in-app purchase server with cross-platform support. With the RevenueCat SDK, you can build and manage your app business on any platform without having to maintain purchase infrastructure. You can read more about [how RevenueCat fits into your app](https://www.revenuecat.com/blog/where-does-revenuecat-fit-in-your-app) or you can [sign up free](https://app.revenuecat.com/signup) to start building.

# Requirements

Xcode 12+
Minimum target: iOS 9.0+

# Installation

Purchases for iOS can be installed either via [CocoaPods](doc:ios#section-install-via-cocoapods), [Carthage](ios#section-install-via-carthage), or [Swift Package Manager](doc:ios#section-install-via-swift-package-manager). 

## Install via CocoaPods

To always use the latest release, add the following to your Podfile:
[block:code]
{
  "codes": [
    {
      "code": "pod 'Purchases'",
      "language": "ruby",
      "name": "Podfile"
    },
    {
      "code": "",
      "language": "text"
    }
  ]
}
[/block]
Alternatively, pin to a specific minor version (e.g. 3.10):
[block:code]
{
  "codes": [
    {
      "code": "pod 'Purchases', '~> 3.11.1'",
      "language": "ruby"
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
      "language": "ruby",
      "name": "Terminal"
    }
  ]
}
[/block]
This will add `Purchases.framework` to your workspace.
[block:embed]
{
  "html": "<iframe class=\"embedly-embed\" src=\"//cdn.embedly.com/widgets/media.html?src=https%3A%2F%2Fwww.youtube.com%2Fembed%2FQS7BTorY4-U%3Fstart%3D12%26feature%3Doembed%26start%3D12&display_name=YouTube&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DQS7BTorY4-U&image=https%3A%2F%2Fi.ytimg.com%2Fvi%2FQS7BTorY4-U%2Fhqdefault.jpg&key=f2aa6fc3595946d0afc3d76cbbd25dc3&type=text%2Fhtml&schema=youtube\" width=\"854\" height=\"480\" scrolling=\"no\" title=\"YouTube embed\" frameborder=\"0\" allow=\"autoplay; fullscreen\" allowfullscreen=\"true\"></iframe>",
  "url": "https://www.youtube.com/watch?v=QS7BTorY4-U&feature=youtu.be&t=12",
  "title": "Set up RevenueCat Purchases SDK for iOS",
  "favicon": "https://www.youtube.com/s/desktop/c57d8126/img/favicon.ico",
  "image": "https://i.ytimg.com/vi/QS7BTorY4-U/hqdefault.jpg"
}
[/block]
## Install via Carthage

To always use the latest release, add the following to your Cartfile:
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
Alternatively, pin to a specific minor version (e.g. 3.10):
[block:code]
{
  "codes": [
    {
      "code": "github \"revenuecat/purchases-ios\" ~> 3.11.1",
      "language": "text"
    }
  ]
}
[/block]
And then run:
[block:code]
{
  "codes": [
    {
      "code": "carthage update",
      "language": "shell",
      "name": "Terminal"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "warning",
  "body": "Note: We recommend using Carthage versions >= 0.37. \nCarthage versions < 0.37 have a bug which makes using `carthage update --no-use-binaries` produce build issues on Xcode 12. More information on this issue is available here http://github.com/Carthage/Carthage/issues/3019."
}
[/block]
### Carthage with XCFrameworks

If you're using Carthage version >= 0.37, you can use Purchases as an XCFramework instead of a Universal Framework. This makes setup easier, since you don't have to set up build phases at all. 
To use XCFrameworks with Carthage, you need to pass in `--use-xcframeworks` and `--no-use-binaries`.
[block:code]
{
  "codes": [
    {
      "code": "carthage update --no-use-binaries --use-xcframeworks",
      "language": "text"
    }
  ]
}
[/block]
More information on using XCFrameworks with Carthage is available at https://github.com/carthage/Carthage/#building-platform-independent-xcframeworks-xcode-12-and-above

[block:embed]
{
  "html": "<iframe class=\"embedly-embed\" src=\"//cdn.embedly.com/widgets/media.html?src=https%3A%2F%2Fwww.youtube.com%2Fembed%2FQS7BTorY4-U%3Fstart%3D125%26feature%3Doembed%26start%3D125&display_name=YouTube&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DQS7BTorY4-U&image=https%3A%2F%2Fi.ytimg.com%2Fvi%2FQS7BTorY4-U%2Fhqdefault.jpg&key=f2aa6fc3595946d0afc3d76cbbd25dc3&type=text%2Fhtml&schema=youtube\" width=\"854\" height=\"480\" scrolling=\"no\" title=\"YouTube embed\" frameborder=\"0\" allow=\"autoplay; fullscreen\" allowfullscreen=\"true\"></iframe>",
  "url": "https://www.youtube.com/watch?v=QS7BTorY4-U&feature=youtu.be&t=125",
  "title": "Set up RevenueCat Purchases SDK for iOS",
  "favicon": "https://www.youtube.com/s/desktop/c57d8126/img/favicon.ico",
  "image": "https://i.ytimg.com/vi/QS7BTorY4-U/hqdefault.jpg"
}
[/block]
## Install via Swift Package Manager

You can use Swift Package Manager to add Purchases to your Xcode project. Select `File » Swift Packages » Add Package Dependency...` and specify the repository URL of the `Purchases` library: https://github.com/RevenueCat/purchases-ios.git. Set the version to `Up to next major` and choose the target where you want to use it. The library should have been added to the Swift Package Dependencies section and you should be able to import it now.

# Import Purchases

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

[block:embed]
{
  "html": "<iframe class=\"embedly-embed\" src=\"//cdn.embedly.com/widgets/media.html?src=https%3A%2F%2Fwww.youtube.com%2Fembed%2FQS7BTorY4-U%3Fstart%3D290%26feature%3Doembed%26start%3D290&display_name=YouTube&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DQS7BTorY4-U&image=https%3A%2F%2Fi.ytimg.com%2Fvi%2FQS7BTorY4-U%2Fhqdefault.jpg&key=f2aa6fc3595946d0afc3d76cbbd25dc3&type=text%2Fhtml&schema=youtube\" width=\"854\" height=\"480\" scrolling=\"no\" title=\"YouTube embed\" frameborder=\"0\" allow=\"autoplay; fullscreen\" allowfullscreen=\"true\"></iframe>",
  "url": "https://www.youtube.com/watch?v=QS7BTorY4-U&feature=youtu.be&t=290",
  "title": "Set up RevenueCat Purchases SDK for iOS",
  "favicon": "https://www.youtube.com/s/desktop/c57d8126/img/favicon.ico",
  "image": "https://i.ytimg.com/vi/QS7BTorY4-U/hqdefault.jpg"
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
# Next Steps

* Now that you've installed the Purchases SDK in your iOS app, get started by [configuring an instance of Purchases :fa-arrow-right:](doc:getting-started-1#section-configure-purchases)
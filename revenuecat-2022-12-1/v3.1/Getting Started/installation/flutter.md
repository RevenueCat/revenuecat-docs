---
title: "Flutter"
slug: "flutter"
excerpt: "Instructions for installing Purchases SDK for Flutter"
hidden: false
metadata: 
  title: "Flutter Purchases SDK – RevenueCat"
  description: "The RevenueCat Purchases SDK handles the pain points of in-app purchases and subscriptions for Flutter, so you can get back to building your app."
  image: 
    0: "https://files.readme.io/f71d575-Reddit__E.jpg"
    1: "Reddit – E.jpg"
    2: 1200
    3: 630
    4: "#fbabaf"
createdAt: {}
updatedAt: "2021-06-01T20:49:22.807Z"
---
# What is RevenueCat?

RevenueCat is a secure, reliable, and free to use in-app purchase server with cross-platform support. With the RevenueCat SDK, you can build and manage your app business on any platform without having to maintain purchase infrastructure. You can read more about [how RevenueCat fits into your app](https://www.revenuecat.com/blog/where-does-revenuecat-fit-in-your-app) or you can [sign up free](https://app.revenuecat.com/signup) to start building.

# Requirements

Xcode 10.2+
Minimum target: iOS 9.0+

# Installation

To use this plugin, add `purchases_flutter` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/)  (and run an implicit dart pub get):
[block:code]
{
  "codes": [
    {
      "code": "dependencies:\n  purchases_flutter: ^3.0.0",
      "language": "yaml",
      "name": "pubspec.yaml"
    }
  ]
}
[/block]
Alternatively run this command:

```
 $ flutter pub add purchases_flutter
```

## iOS Deployment Target 
RevenueCat is compatible with iOS 9.0 or higher. Flutter does not automatically set the iOS deployment target for your project. You need to make sure that the deployment target is set to 9.0 or higher. To do that, simply edit `ios/Podfile` and add the following line if it's not already there:

```
platform :ios, '9.0'
```
Set it to 9.0 or a higher version for RevenueCat to work.

## iOS Swift Version
RevenueCat requires Swift >= 5.0 to work. If the `Podfile` in your project's `ios` folder specifies a Swift version, make sure that it's at least 5.0, otherwise you may run into build issues.  

# Import Purchases

You should now be able import `purchases_flutter`
[block:code]
{
  "codes": [
    {
      "code": "import 'package:purchases_flutter/purchases_flutter.dart';",
      "language": "kotlin",
      "name": "Import Purchases"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "title": "Enable In-App Purchase for iOS projects in Xcode",
  "body": "Don't forget to enable the In-App Purchase capability for your iOS project under `Project Target -> Capabilities -> In-App Purchase`"
}
[/block]

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/08d0721-Screen_Shot_2021-05-28_at_12.32.08_PM.png",
        "Screen Shot 2021-05-28 at 12.32.08 PM.png",
        396,
        303,
        "#eff2f8"
      ]
    }
  ]
}
[/block]

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/66c301a-65db383-Screen_Shot_2018-12-18_at_9.15.09_AM.png",
        "65db383-Screen_Shot_2018-12-18_at_9.15.09_AM.png",
        668,
        107,
        "#fafafc"
      ]
    }
  ]
}
[/block]
# Next Steps

* Now that you've installed the Purchases SDK in Flutter, get started by [configuring an instance of Purchases :fa-arrow-right:](doc:getting-started-1#section-configure-purchases)
---
title: "Flutter"
slug: "flutter"
excerpt: "Instructions for installing Purchases SDK for Flutter"
hidden: false
metadata: 
  title: "Flutter Purchases SDK | RevenueCat"
  description: "The RevenueCat Purchases SDK handles the pain points of in-app purchases and subscriptions for Flutter, so you can get back to building your app."
  image: 
    0: "https://files.readme.io/f71d575-Reddit__E.jpg"
    1: "Reddit – E.jpg"
    2: 1200
    3: 630
    4: "#fbabaf"
createdAt: {}
updatedAt: "2020-09-01T20:12:43.883Z"
---
###What is RevenueCat?

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
To use this plugin, add `purchases_flutter` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).
[block:code]
{
  "codes": [
    {
      "code": "dependencies:\n  purchases_flutter: ^1.2.1",
      "language": "yaml",
      "name": "pubspec.yaml"
    }
  ]
}
[/block]
#### iOS Deployment Target 
RevenueCat is compatible with iOS 9.0 or higher. Flutter does not automatically set the iOS deployment target for your project. You need to make sure that the deployment target is set to 9.0 or higher. To do that, simply edit `ios/Podfile` and add the following line if it's not already there:

```
platform :ios, '9.0'
```
Set it to 9.0 or a higher version for RevenueCat to work. 
[block:api-header]
{
  "title": "Importing Purchases"
}
[/block]
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
  "title": "Enable In-App Purchase for iOS projects",
  "body": "Don't forget to enable the In-App Purchase capability for your iOS project under `Project Target -> Capabilities -> In-App Purchase`"
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

[block:api-header]
{
  "title": "Next Steps"
}
[/block]
* Now that you've installed the Purchases SDK in Flutter, get started by [configuring an instance of Purchases :fa-arrow-right:](doc:getting-started-1#section-configure-purchases)
---
title: "Flutter"
slug: "flutter"
excerpt: "Instructions for installing Purchases SDK for Flutter"
hidden: false
createdAt: "2019-06-11T18:33:05.363Z"
updatedAt: "2019-12-03T00:31:48.580Z"
---
[block:api-header]
{
  "title": "Requirements"
}
[/block]
XCode 10.2+
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
      "code": "dependencies:\n  purchases_flutter: ^0.3.2",
      "language": "yaml",
      "name": "pubspec.yaml"
    }
  ]
}
[/block]

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

[block:callout]
{
  "type": "info",
  "title": "Include BILLING permission for Android projects",
  "body": "Don't forget to include the `BILLING` permission in your AndroidManifest.xml file"
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "<uses-permission android:name=\"com.android.vending.BILLING\" />",
      "language": "xml",
      "name": "AndroidManifest.xml"
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
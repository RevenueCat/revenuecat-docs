---
title: Ionic
slug: ionic
excerpt: Instructions for Installing Purchases SDK for Ionic
hidden: false
metadata:
  title: Install Ionic SDK – RevenueCat
  description: The RevenueCat Purchases SDK handles the pain points of in-app purchases
    and subscriptions for Ionic, so you can get back to building your app.
  image:
    0: https://files.readme.io/8d46db6-RevenueCat_Docs_OG.png
    1: RevenueCat Docs OG.png
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: '2020-04-07T20:32:01.037Z'
---
Please refer to our [documentation](https://ionicframework.com/docs/native/purchases) in Ionic Native Plugin documentation for installation instructions.
[block:file]
{"language":"text","name":"Cordova","file":"code_blocks/🚀 Getting Started/installation/ionic_1.txt"}
[/block]
[block:file]
{"language":"text","name":"Capacitor","file":"code_blocks/🚀 Getting Started/installation/ionic_2.txt"}
[/block]


[block:callout]
{
  "type": "warning",
  "body": "If you run into issues when running on Android, try going to Android Studio -> File -> Sync project with Gradle files.",
  "title": "Note:"
}
[/block]

[block:api-header]
{
  "title": "Angular"
}
[/block]
Angular apps can use either Cordova or Capacitor to build native mobile apps. For Angular, the import path should end with `/ngx`.
[block:file]
{"language":"typescript","name":"","file":"code_blocks/🚀 Getting Started/installation/ionic_3.ts"}
[/block]


[block:api-header]
{
  "title": "React"
}
[/block]
Import the plugin object then use its static methods:
[block:file]
{"language":"typescript","name":"","file":"code_blocks/🚀 Getting Started/installation/ionic_4.ts"}
[/block]

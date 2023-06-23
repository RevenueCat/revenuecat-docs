---
title: Ionic
slug: ionic
excerpt: Instructions for Installing Purchases SDK for Ionic
hidden: false
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

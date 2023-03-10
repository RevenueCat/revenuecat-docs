---
title: "Cordova"
slug: "cordova"
excerpt: "Instructions for installing Purchases SDK for Cordova"
hidden: false
createdAt: "2019-04-04T23:37:28.309Z"
updatedAt: "2019-08-07T18:37:52.217Z"
---
[block:api-header]
{
  "title": "Installation"
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "cordova plugin add cordova-plugin-purchases --save",
      "language": "shell"
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
  "title": "Additional iOS Setup"
}
[/block]
## Add Strip Frameworks Phase
The App Store, in its infinite wisdom, still rejects fat frameworks, so we need to strip our framework before it is deployed. To do this, add the following script phase to your build.
1. In Xcode, in project manager, select your app target.
2. Open the `Build Phases` tab
3. Add a new `Run Script`, name it `Strip Frameworks`
4. Add the following command `"${PROJECT_DIR}/../../node_modules/cordova-plugin-purchases/src/ios/strip-frameworks.sh"` (quotes included)

![](https://media.giphy.com/media/39zTmnsW1CIrJNk5AM/giphy.gif)
[block:api-header]
{
  "title": "Next Steps"
}
[/block]
* Now that you've installed the Purchases SDK in your Cordova app, get started by [initializing an instance of Purchases :fa-arrow-right:](doc:getting-started-1#section-configure-purchases)
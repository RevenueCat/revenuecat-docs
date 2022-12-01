---
title: "React Native"
slug: "reactnative"
excerpt: "Instructions for installing Purchases SDK for React Native"
hidden: false
metadata: 
  title: "React Native Purchases SDK | RevenueCat"
  description: "The RevenueCat Purchases SDK handles the pain points of in-app purchases and subscriptions for React Native, so you can get back to building your app."
  image: 
    0: "https://files.readme.io/ea9c3c4-Reddit__E.jpg"
    1: "Reddit – E.jpg"
    2: 1200
    3: 630
    4: "#fbabaf"
createdAt: {}
updatedAt: "2020-06-22T23:11:02.377Z"
---
###What is RevenueCat?

RevenueCat is an in-app subscription platform that makes it easy to build and manage IAPs on any platform. With the RevenueCat SDK, you can build and manage your app business on any platform without having to maintain purchase infrastructure. You can read more about [how RevenueCat fits into your app](https://www.revenuecat.com/blog/where-does-revenuecat-fit-in-your-app) or you can [sign up free](https://app.revenuecat.com/signup) to start building.
[block:api-header]
{
  "title": "Installation"
}
[/block]
Purchases for React Native can be installed either via npm or yarn.
[block:code]
{
  "codes": [
    {
      "code": "npm install --save react-native-purchases",
      "language": "shell",
      "name": "npm"
    },
    {
      "code": "yarn add react-native-purchases",
      "language": "shell",
      "name": "yarn"
    }
  ]
}
[/block]
After that, you should link the library to the native projects by doing:
[block:code]
{
  "codes": [
    {
      "code": "react-native link react-native-purchases\n",
      "language": "shell"
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "Additional iOS Setup"
}
[/block]
Purchases.framework also needs to be added to your iOS project. The npm install will download the correct framework version and the link command will add `libRNPurchases.a` to the _Linked Frameworks and Libraries_ of your app target in the iOS project.
[block:callout]
{
  "type": "info",
  "body": "If you choose to install the framework via [CocoaPods](ios#section-install-via-cocoapods) you can skip steps 1 through 4 below."
}
[/block]
## 1. Create a Framework Reference in your project
1. Drag `Purchases.framework` and `PurchasesHybridCommon.framework` from the `RNPurchases`sub-project under the libraries section to the outer project and create a reference. 

![](https://media.giphy.com/media/W6LvZkQnvc3QnnPza7/giphy.gif)

## 2. Add iOS Framework to Embedded Binaries

1. In Xcode, in project manager, select your app target.
1. Select the general tab
1. Drag `Purchases.framework` and `PurchasesHybridCommon.framework` from your project to the Embedded Binaries section

![](https://media.giphy.com/media/iIdIuEkAzlntxANSiV/giphy.gif)

Add `$(PROJECT_DIR)/../node_modules/react-native-purchases/ios` to Framework Search paths in build settings

![](https://media.giphy.com/media/1pAbuARm4TLfZKdfx3/giphy.gif)

## 3. Add Strip Frameworks Phase
The App Store, in it's infinite wisdom, still rejects fat frameworks, so we need to strip our framework before it is deployed. To do this, add the following script phase to your build.

1. In Xcode, in project manager, select your app target.
2. Open the `Build Phases` tab
3. Add a new `Run Script`, name it `Strip Frameworks`
4. Add the following command `"${PROJECT_DIR}/../node_modules/react-native-purchases/ios/strip-frameworks.sh"` (quotes included)

![](https://media.giphy.com/media/39zTmnsW1CIrJNk5AM/giphy.gif)

## 4. Link static library
The `react-native link` command should have added the `libRNPurchases.a` library to the Linked Frameworks and Libraries section of your app target. If it hasn't add it like this:

![](https://media.giphy.com/media/U2MMgrdYlkRhEcy80J/giphy.gif)

## 5. Installing with Cocoapods / ExpoKit

If your project already uses Cocoapods to install iOS dependencies, common in ExpoKit projects, linking the library should have added it to the podfile. If it hasn't, add the following to your project's podfile to reference the library from your node_modules folder:
[block:code]
{
  "codes": [
    {
      "code": "pod 'RNPurchases', :path => '../node_modules/react-native-purchases'\n\t:inhibit_warnings => true",
      "language": "yaml",
      "name": "Podfile"
    }
  ]
}
[/block]
In your ios folder, run pod install. If you've just upgraded ExpoKit, you might need to upgrade cocoapods to the newest version: sudo gem install cocoapods.

[block:api-header]
{
  "title": "Import Purchases"
}
[/block]
You should now be able to import `Purchases`
[block:code]
{
  "codes": [
    {
      "code": "import Purchases from 'react-native-purchases';",
      "language": "javascript"
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

[block:callout]
{
  "type": "info",
  "title": "Enable In-App Purchase for your iOS project",
  "body": "Don't forget to enable the In-App Purchase capability for your project under `Project Target -> Capabilities -> In-App Purchase`"
}
[/block]

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/91edf94-65db383-Screen_Shot_2018-12-18_at_9.15.09_AM.png",
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
  "title": "ExpoKit special instructions"
}
[/block]
ExpoKit projects of version 33 or higher can successfully use react-native-purchases. If you haven't upgraded, you can follow the instructions here to upgrade.

If you're planning on ejecting from Expo, upgrade your expo version first, THEN eject. It'll save you a whole lot of hassle.
[block:api-header]
{
  "title": "Next Steps"
}
[/block]
* Now that you've installed the Purchases SDK in your React Native app, get started by [initializing an instance of Purchases :fa-arrow-right:](doc:getting-started-1#section-configure-purchases)
---
title: "React Native"
slug: "reactnative"
excerpt: "Instructions for installing Purchases SDK for React Native"
hidden: false
metadata: 
  title: "In-App Purchase Installation for React Native – RevenueCat"
  description: "The RevenueCat Purchases SDK handles the pain points of in-app purchases and subscriptions for React Native, so you can get back to building your app."
  image: 
    0: "https://files.readme.io/3fd171c-60993e3c40039b67596bcc8c_slack-preview.png"
    1: "60993e3c40039b67596bcc8c_slack-preview.png"
    2: 1200
    3: 627
    4: "#f45476"
createdAt: {}
updatedAt: "2021-12-08T05:23:19.489Z"
---
# What is RevenueCat?

RevenueCat provides a backend and a wrapper around StoreKit and Google Play Billing to make implementing in-app purchases and subscriptions easy. With our SDK, you can build and manage your app business on any platform without having to maintain IAP infrastructure. You can read more about [how RevenueCat fits into your app](https://www.revenuecat.com/blog/where-does-revenuecat-fit-in-your-app) or you can [sign up free](https://app.revenuecat.com/signup) to start building.

# Installation

Purchases for React Native can be installed either via npm or yarn.
We recommend using the latest version of React Native, or making sure that the version is at least greater than 0.64. 

## Option 1: Using auto-linking

Recent versions of React Native will automatically link the SDK, so all that's needed is to install the library.
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
## Option 2: Manual linking
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
# Additional iOS Setup

**Important: ** Make sure that the deployment target for iOS is set to at least 11.0 [as defined here](https://github.com/facebook/react-native#-requirements), both in the project and in the Podfile if you're using Cocoapods. 

## Option 1. Installing with Cocoapods / ExpoKit (with Auto-linking)

If you've installed the library using Auto-linking, then all you need to do is to run `pod install` from your iOS folder. 

That's it! [You can skip ahead to importing the framework](https://docs.revenuecat.com/docs/reactnative#import-purchases)

## Option 2. Installing with Cocoapods / ExpoKit (Manual linking only)

If your project already uses Cocoapods to install iOS dependencies, common in ExpoKit projects, linking the library should have added it to the podfile. If it hasn't, add the following to your project's podfile to reference the library from your node_modules folder:
[block:code]
{
  "codes": [
    {
      "code": "pod 'RNPurchases', :path => '../node_modules/react-native-purchases', :inhibit_warnings => true, :modular_headers => false",
      "language": "yaml",
      "name": "Podfile"
    }
  ]
}
[/block]

In your iOS folder, run `pod install`. If you've just upgraded ExpoKit, you might need to upgrade cocoapods to the newest version: `sudo gem install cocoapods`.

That's it! [You can skip ahead to importing the framework](https://docs.revenuecat.com/docs/reactnative#import-purchases)

## Option 3. Manually adding the framework (if you're not using Cocoapods)

If you are not using Cocoapods to manage dependencies, Purchases.framework also needs to be added to your iOS project. The `npm install` will download the correct framework version and the link command will add `libRNPurchases.a` to the _Linked Frameworks and Libraries_ of your app target in the iOS project.
[block:callout]
{
  "type": "info",
  "body": "If you choose to install the framework via [CocoaPods](ios#section-install-via-cocoapods), you can skip ahead to [importing the framework](https://docs.revenuecat.com/docs/reactnative#import-purchases)"
}
[/block]
### Create a Framework Reference in your project
1. Drag `Purchases.framework` and `PurchasesHybridCommon.framework` from the `RNPurchases`sub-project under the libraries section to the outer project and create a reference. 

![](https://media.giphy.com/media/W6LvZkQnvc3QnnPza7/giphy.gif)

### Add iOS Framework to Embedded Binaries

1. In Xcode, in project manager, select your app target.
1. Select the general tab
1. Drag `Purchases.framework` and `PurchasesHybridCommon.framework` from your project to the Embedded Binaries section

![](https://media.giphy.com/media/iIdIuEkAzlntxANSiV/giphy.gif)

Add `$(PROJECT_DIR)/../node_modules/react-native-purchases/ios` to Framework Search paths in build settings

![](https://media.giphy.com/media/1pAbuARm4TLfZKdfx3/giphy.gif)

### Add Strip Frameworks Phase
The App Store, in its infinite wisdom, still rejects fat frameworks, so we need to strip our framework before it is deployed. To do this, add the following script phase to your build.

1. In Xcode, in project manager, select your app target.
2. Open the `Build Phases` tab
3. Add a new `Run Script`, name it `Strip Frameworks`
4. Add the following command `"${PROJECT_DIR}/../node_modules/react-native-purchases/ios/strip-frameworks.sh"` (quotes included)

![](https://media.giphy.com/media/39zTmnsW1CIrJNk5AM/giphy.gif)

### Link static library
The `react-native link` command should have added the `libRNPurchases.a` library to the Linked Frameworks and Libraries section of your app target. If it hasn't add it like this:

![](https://media.giphy.com/media/U2MMgrdYlkRhEcy80J/giphy.gif)


# Import Purchases

You should now be able to import `Purchases`.
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
  "title": "Enable In-App Purchase capability for your iOS project",
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
# ExpoKit special instructions


ExpoKit projects of version 33 or higher can successfully use react-native-purchases. If you haven't upgraded, you can follow the instructions [here](https://docs.expo.io/workflow/upgrading-expo-sdk-walkthrough/#sdk-33) to upgrade.

`react-native-purchases` currently doesn't work in the managed workflow for Expo, due to some limitations on Expo's side: 

- https://docs.expo.io/introduction/why-not-expo/
- https://expo.canny.io/feature-requests/p/in-app-purchases

If you want to do in-app purchases in your Expo app, you'll have to [use the bare workflow](https://docs.expo.io/workflow/customizing/). 

If you're planning on ejecting from Expo, upgrade your expo version first, THEN eject. It'll save you a whole lot of hassle.

# Next Steps

* Now that you've installed the Purchases SDK in your React Native app, get started by [initializing an instance of Purchases :fa-arrow-right:](doc:getting-started-1#section-configure-purchases)
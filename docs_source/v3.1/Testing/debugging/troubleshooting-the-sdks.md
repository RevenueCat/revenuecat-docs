---
title: "Troubleshooting the SDKs"
slug: "troubleshooting-the-sdks"
hidden: false
createdAt: "2021-05-03T18:10:34.020Z"
updatedAt: "2021-07-22T13:43:48.909Z"
---
Having trouble with our SDKs? This guide covers common issues and solutions. Go through each topic and see if it matches your issue. If you went through this guide and you're still having problems, reach out to us in any of the following channels:

- [RevenueCat Developer Community](https://community.revenuecat.com) for general inquiries about the SDK and best practices
- [StackOverflow](https://stackoverflow.com/questions/tagged/revenuecat) for help on specific questions about your code

# All SDKs

Make sure that you're using the latest version of the Purchases SDK, and have installed the SDK according to our [Installation](doc:installation) guides. 

We update our SDKs very often. If you run into an issue with our SDK, it might already have been fixed in an update. 

You can find the latest version of our SDKs here: 

- [iOS](https://github.com/revenuecat/purchases-ios/releases/latest)
- [Android](https://github.com/revenuecat/purchases-android/releases/latest)
- [Flutter](https://github.com/revenuecat/purchases-flutter/releases/latest)
- [React-Native](https://github.com/revenuecat/react-native-purchases/releases/latest)
- [Cordova](https://github.com/revenuecat/cordova-plugin-purchases/releases/latest)
- [Unity](https://github.com/revenuecat/purchases-unity/releases/latest)
- [Ionic Native](https://ionicframework.com/docs/native/purchases)

# Issues when compiling or archiving

## iOS

** 1. Clean derived data:**  in Xcode, go to Product -> Clean Build Data. 
** 2. Make sure Swift support is enabled in the project:** check that Swift Language Version is defined as at least "Swift 5" in Build Settings for your target.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/3820503-d483907-Screen_Shot_2021-05-03_at_3.28.13_PM.png",
        "d483907-Screen_Shot_2021-05-03_at_3.28.13_PM.png",
        1462,
        198,
        "#272525"
      ]
    }
  ]
}
[/block]
** 3. Make sure that the deployment target is set correctly:** it should be set to `9.0` or newer for iOS or tvOS, `10.12` or newer for macOS and `6.2` or newer for watchOS. 

### If you're using CocoaPods: 
**1. Make sure you're using the latest version of CocoaPods.** You can see your version by running `pod --version`, and find the [latest version here](https://github.com/CocoaPods/CocoaPods/releases/latest). 
** 2. Re-install pods:** run `pod deintegrate` and then `pod install`, then try running / archiving the project again. 
** 3. Make sure that the deployment target is set correctly:** it should be set to `9.0` or newer for iOS or tvOS, `10.12` or newer for macOS and `6.2` or newer for watchOS. The requirements might be higher if you're using other frameworks, such as React-Native. You should check this value both in the `Podfile`, and by going into the Project settings, then select the target, and look for the value in the general tab: 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/2ad05a4-43c42c6-Screen_Shot_2021-05-03_at_3.43.57_PM.png",
        "43c42c6-Screen_Shot_2021-05-03_at_3.43.57_PM.png",
        1058,
        258,
        "#2a292a"
      ]
    }
  ]
}
[/block]
** 4. Check the Swift version: ** Check that the value for [`SWIFT_VERSION` isn't overridden by the `Podfile`](https://github.com/RevenueCat/purchases-flutter/issues/168#issuecomment-796468415).
** 5. Enable Swift support: ** If you're getting errors when compiling Swift files after this, try adding a single, empty Swift file to the project. 

### If you're using Carthage: 
** 1. ** Make sure you're using the latest version of Carthage. 
** 2. ** If you're using XCFrameworks with Carthage, make sure you [follow our installation guide](https://docs.revenuecat.com/docs/ios#carthage-with-xcframeworks). 

## Flutter
** 1. ** Upgrade to the latest version of [purchases-flutter](https://github.com/revenuecat/purchases-flutter/releases/latest)
** 2. ** Upgrade to the [latest version of Flutter](https://flutter.dev/docs/development/tools/sdk/upgrading)
** 3. ** Run `pub cache clean`
** 4 **. Follow the [troubleshooting steps for iOS](doc:troubleshooting-the-sdks#ios)
** 5. ** [Check that Flutter doesn't override the minimum deployment version on iOS](https://github.com/RevenueCat/purchases-flutter/issues/189#issuecomment-824189586)

## React-Native
** 1. ** Upgrade to the latest version of [react-native-purchases](https://github.com/revenuecat/react-native-purchases/releases/latest)
** 1. ** Upgrade to the [latest version of React-Native](https://reactnative.dev/docs/upgrading). 
** 1. ** Follow the [troubleshooting steps for iOS](doc:troubleshooting-the-sdks#ios)

# Common Issues

- [Products are empty](https://support.revenuecat.com/hc/en-us/articles/360041793174-Why-are-products-empty-)
- [Active entitlements are empty with an active subscription](https://support.revenuecat.com/hc/en-us/articles/360045538973-Why-are-active-entitlements-empty-with-an-active-subscription-) 
- [I get a "there is a problem with the App store" and nothing else.](https://support.revenuecat.com/hc/en-us/articles/360044864393-I-get-a-there-is-a-problem-with-the-App-store-and-nothing-else-)
- [My app crashes with...](https://support.revenuecat.com/hc/en-us/articles/360050588373-My-app-crashes-with-NSInvalidArgumentException-NSCFConstantString-stringByAppendingString-nil-argument)
- **"Purchases / PurchasesHybridCommon required a higher minimum deployment target": ** see [troubleshooting steps for iOS](doc:troubleshooting-the-sdks#ios).
- ** "ld: symbol(s) not found for architecture x86_64": ** see [troubleshooting steps for iOS](doc:troubleshooting-the-sdks#ios). 
- ** "declaration of 'RCPurchases' must be imported from module 'Purchases' before it is required": ** see [troubleshooting steps for iOS](doc:troubleshooting-the-sdks#ios).
- ** "Module 'Purchases' not found": ** see [troubleshooting steps for iOS](doc:troubleshooting-the-sdks#ios).
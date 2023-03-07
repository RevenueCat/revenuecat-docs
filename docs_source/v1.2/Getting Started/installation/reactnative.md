---
title: "React Native"
slug: "reactnative"
excerpt: "Instructions for installing Purchases SDK for React Native"
hidden: false
createdAt: "2018-06-11T03:51:44.513Z"
updatedAt: "2019-01-15T06:24:16.990Z"
---
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

[block:api-header]
{
  "title": "Additional iOS Setup"
}
[/block]
Purchases.framework also needs to be added to your iOS project. The npm install will download the correct framework version. 

Alternatively you can install the framework via [CocoaPods](ios#section-install-via-cocoapods).

## Create a Framework Reference in your project
1. Drag `Purchases.framework` from the `RNPurchases`sub-project under the libraries section to the outer project and create a reference

## Add iOS Framework to Embedded Binaries
1. In Xcode, in project manager, select your app target.
1. Select the general tab
1. Drag `Purchases.framework` from your project to the Embedded Binaries section
1. Add `$(PROJECT_DIR)/../node_modules/react-native-purchases/ios` to Framework Search paths in build settings

## Add Strip Frameworks Phase
The App Store, in it's infinite wisdom, still rejects fat frameworks, so we need to strip our framework before it is deployed. To do this, add the following script phase to your build.
1. In Xcode, in project manager, select your app target.
2. Open the `Build Phases` tab
3. Add a new `Run Script`, name it `Strip Frameworks`
4. Add the following command `"${PROJECT_DIR}/../node_modules/react-native-purchases/ios/strip-frameworks.sh"` (quotes included)
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

[block:api-header]
{
  "title": "Next Steps"
}
[/block]
* Now that you've installed the Purchases SDK in your React Native app, get started by [initializing an instance of Purchases :fa-arrow-right:](doc:getting-started-1#section-4-initialize-purchases)
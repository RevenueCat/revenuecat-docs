---
title: Cordova
slug: cordova
excerpt: Instructions for installing Purchases SDK for Cordova
hidden: false
metadata:
  title: Install Cordova SDK – RevenueCat
  description: The RevenueCat Purchases SDK handles the pain points of in-app purchases
    and subscriptions for Cordova, so you can get back to building your app.
  image:
    0: https://files.readme.io/b5c8b69-RevenueCat_Docs_OG.png
    1: RevenueCat Docs OG.png
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: '2023-03-20T17:32:08.635Z'
updatedAt: '2023-06-09T17:19:45.568Z'
category: 6483560b2e0a290051a971d8
order: 4
parentDoc: 6483560b2e0a290051a97300
---
# What is RevenueCat?

RevenueCat provides a backend and a wrapper around StoreKit and Google Play Billing to make implementing in-app purchases and subscriptions easy. With our SDK, you can build and manage your app business on any platform without having to maintain IAP infrastructure. You can read more about [how RevenueCat fits into your app](https://www.revenuecat.com/blog/growth/where-does-revenuecat-fit-in-your-app/) or you can [sign up free](https://app.revenuecat.com/signup) to start building.

# Installation
```shell 
cordova plugin add cordova-plugin-purchases --save
```

# Additional iOS Setup

## Add In-app Purchase Capability to Project
The In-app Purchase capability isn't required to install the SDK, but it is required to make purchases.
1. In Xcode, in project manager, select your app target.
2. Open the `Signing and Capabilities` tab.
3. Click the `+ Capability` button and double-click on In-App Purchase.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/75574fc-Screen_Shot_2020-02-19_at_4.43.13_PM.png",
        "Screen Shot 2020-02-19 at 4.43.13 PM.png",
        2968,
        1924,
        "#ecebeb"
      ]
    }
  ]
}
[/block]

## Add Strip Frameworks Phase if using cordova-plugin-purchases 1.1.0 or lower

The App Store, in its infinite wisdom, still rejects fat frameworks, so we need to strip our framework before it is deployed. To do this, add the following script phase to your build.
1. In Xcode, in project manager, select your app target.
2. Open the `Build Phases` tab
3. Add a new `Run Script`, name it `Strip Frameworks`
4. Add the following command `"${PROJECT_DIR}/../../node_modules/cordova-plugin-purchases/src/ios/strip-frameworks.sh"` (quotes included)

![](https://media.giphy.com/media/39zTmnsW1CIrJNk5AM/giphy.gif)


## Set `SWIFT_LANGUAGE_VERSION`

You have to make sure that the `SWIFT_LANGUAGE_VERSION` is set if it's not already. `cordova-plugin-purchases` needs Swift >= 5.0. 

You can either set it in the project yourself, or use an external plugin like https://www.npmjs.com/package/cordova-plugin-add-swift-support. 
In order to set it yourself:
1. In Xcode, in project manager, select your app target.
2. Open the `Build Settings` tab
3. Look for the `Swift Language Version` setting. 
4. Set it to 5.0.


# Next Steps

* Now that you've installed the Purchases SDK in your Cordova app, get started by [initializing an instance of Purchases :fa-arrow-right:](https://www.revenuecat.com/docs/getting-started#4-using-revenuecats-purchases-sdk)
---
title: "Cordova"
slug: "cordova"
excerpt: "Instructions for installing Purchases SDK for Cordova"
hidden: false
metadata: 
  title: "Cordova Purchases SDK | RevenueCat"
  description: "The RevenueCat Purchases SDK handles the pain points of in-app purchases and subscriptions for Cordova, so you can get back to building your app."
  image: 
    0: "https://files.readme.io/8fc59c5-Reddit__E.png"
    1: "Reddit – E.png"
    2: 2400
    3: 1260
    4: "#fbabb0"
createdAt: {}
updatedAt: "2020-07-20T20:19:50.279Z"
---
###What is RevenueCat?

RevenueCat is an in-app subscription platform that makes it easy to build and manage IAPs on any platform. With the RevenueCat SDK, you can build and manage your app business on any platform without having to maintain purchase infrastructure. You can read more about [how RevenueCat fits into your app](https://www.revenuecat.com/blog/where-does-revenuecat-fit-in-your-app) or you can [sign up free](https://app.revenuecat.com/signup) to start building.
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

[block:api-header]
{
  "title": "Additional iOS Setup"
}
[/block]
![](https://media.giphy.com/media/39zTmnsW1CIrJNk5AM/giphy.gif)

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
[block:api-header]
{
  "title": "Next Steps"
}
[/block]
* Now that you've installed the Purchases SDK in your Cordova app, get started by [initializing an instance of Purchases :fa-arrow-right:](doc:getting-started-1#section-configure-purchases)
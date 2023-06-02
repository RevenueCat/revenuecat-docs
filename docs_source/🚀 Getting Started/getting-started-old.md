---
title: Quickstart (old)
slug: getting-started-old
excerpt: Get up and running with mobile subscriptions
hidden: true
metadata:
  title: Quickstart – RevenueCat
  description: This guide will walk you through a practical example to get you up
    and running with subscriptions and the Purchases SDK with only a few lines of
    code.
  image:
    0: https://files.readme.io/02a97df-RevenueCat_Docs_OG.png
    1: RevenueCat Docs OG.png
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: '2022-12-09T20:31:16.384Z'
updatedAt: '2022-12-09T20:31:16.384Z'
---
This guide will walk you through how to get up and running with subscriptions and RevenueCat's SDK with only a few lines of code.

# 1. Setting Up Your Account
We recommend using a company account when registering for RevenueCat and setting up your app within a project. You'll be able to invite the rest of your team as [collaborators](doc:collaborators) to your project, but only the project owner can manage billing. Note that there is no mechanism for transferring apps or projects between accounts, but you can change the account owner's email address. If you intend on selling an app, you should create a separate account.

# 2. Create a Project 
Navigate to the RevenueCat dashboard and [add a new project :fa-arrow-right:](https://app.revenuecat.com/overview) from the dropdown in the top navigation menu called *Projects*.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/eb2161b-Screen_Shot_2021-12-01_at_9.48.58_AM.png",
        "Screen Shot 2021-12-01 at 9.48.58 AM.png",
        838,
        610,
        "#e5e7e7"
      ]
    }
  ]
}
[/block]
# 3. Register Your App

From **Project Settings > Apps** in the left menu of the project dashboard, select the platform for the app you will be adding.  
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/a97e002-Screen_Shot_2021-12-01_at_9.51.06_AM.png",
        "Screen Shot 2021-12-01 at 9.51.06 AM.png",
        1732,
        1276,
        "#f9f9f9"
      ],
      "caption": "Project dashboard for selecting the app platform"
    }
  ]
}
[/block]
The field **App name** is required to add your app to RevenueCat. The rest of the configuration fields can be added later. 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/c169e89-Screen_Shot_2021-12-01_at_9.55.28_AM.png",
        "Screen Shot 2021-12-01 at 9.55.28 AM.png",
        1254,
        1088,
        "#fbfbfb"
      ],
      "caption": "App configuration page"
    }
  ]
}
[/block]
After registering your app, we recommend setting up [Platform Server Notifications](doc:server-notifications). These notifications aren't required but will speed up [webhooks](doc:webhooks) and integration delivery times and reduce lag time updating your subscribers. 
[block:callout]
{
  "type": "info",
  "body": "RevenueCat itself does not have separate environments for staging and production. Any RevenueCat app can make both sandbox and production purchases from the stores. If you do have separate apps for staging and production, you can create multiple projects in RevenueCat to mirror your setup.",
  "title": "Staging vs. Production apps"
}
[/block]
# 4. Store Setup 
Before you can start using RevenueCat to fetch products, you must configure your products in the respective stores. See the following guides for [App Store Connect](doc:ios-products), [Google Play Console](doc:android-products), [Amazon Appstore](doc:amazon-product-setup), and [Stripe](doc:stripe-products) for help navigating through this process.

Service credentials need to be set up for RevenueCat to communicate with the app stores on your behalf. See our guides [App Store Connect Shared Secret](doc:itunesconnect-app-specific-shared-secret ), [Play Service Credentials](doc:creating-play-service-credentials), and [Amazon Appstore Shared Secret](doc:amazon-appstore) for more information. Note that Play service credentials can take up to 36 hours to propagate throughout Google's servers.

If you are selling iOS products, be sure to sign your 'Paid Applications Agreement' and fill out your bank and tax information in **App Store Connect > Agreements, Tax, and Banking**. **This needs to be completed before you can test any purchases**.

# 5. Configure Your Products

Once your in-app products have been configured in  [App Store Connect](doc:ios-products), [Google Play Console](doc:android-products), [Amazon Appstore](doc:amazon-product-setup), or [Stripe](doc:stripe-products), you'll need to copy that configuration into the RevenueCat dashboard. RevenueCat uses an Entitlements system to control access to premium features, and Offerings to manage the set of products you offer to customers. 

Entitlements are the level of access that a customer is "entitled" to after purchasing a specific product, and Offerings is a simple way for you to organize the in-app products you wish to "offer" on your paywall and configure them remotely. We **recommend** utilizing these features to simplify your code and enable you to change products without releasing an app update.

See [Configuring Products](doc:entitlements) to set up your products and then organize them into Offerings or Entitlements.

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/55e2667-1628274-Entitlements_2.0.png",
        "1628274-Entitlements_2.0.png",
        1154,
        1254,
        "#f6f6f5"
      ]
    }
  ]
}
[/block]
# 6. Install the SDK

Our SDK seamlessly implements purchases and subscriptions across platforms while syncing tokens with the RevenueCat server.

* [iOS Installation :fa-arrow-right:](doc:ios) 
* [Android Installation :fa-arrow-right:](doc:android)
* [React Native Installation :fa-arrow-right:](doc:reactnative) 
* [Flutter Installation :fa-arrow-right:](doc:flutter)
* [Cordova Installation :fa-arrow-right:](doc:cordova) 
* [Ionic Installation :fa-arrow-right:](doc:ionic)
* [Unity Installation :fa-arrow-right:](doc:unity) 
* [macOS / Catalyst Installation :fa-arrow-right:](doc:macos)

If you run into issues with the SDK, see [Troubleshooting the SDKs](doc:troubleshooting-the-sdks) for guidance.

# 7. Configure the SDK
[block:callout]
{
  "type": "info",
  "body": "You can get your public SDK key from the **API keys** tab under **Project settings** in the dashboard.",
  "title": "Only use your public SDK key to configure Purchases"
}
[/block]
You should only configure the shared instance of *Purchases* once, usually on app launch. After that, the same instance is shared throughout your app by accessing the `.shared` instance in the SDK.

See our guide on [Configuring SDK](https://docs.revenuecat.com/docs/configuring-sdk) for more information and best practices.

Make sure you configure *Purchases* with your public SDK key only. You can read more about the different API keys available in our [Authentication guide](doc:authentication).

[block:file]
{"language":"swift","name":"","file":"code_blocks/🚀 Getting Started/getting-started-old_1.swift"}
[/block]
[block:file]
{"language":"objectivec","name":"","file":"code_blocks/🚀 Getting Started/getting-started-old_2.m"}
[/block]
[block:file]
{"language":"kotlin","name":"","file":"code_blocks/🚀 Getting Started/getting-started-old_3.kt"}
[/block]
[block:file]
{"language":"java","name":"","file":"code_blocks/🚀 Getting Started/getting-started-old_4.java"}
[/block]
[block:file]
{"language":"javascript","name":"Flutter","file":"code_blocks/🚀 Getting Started/getting-started-old_5.js"}
[/block]
[block:file]
{"language":"typescript","name":"React Native","file":"code_blocks/🚀 Getting Started/getting-started-old_6.ts"}
[/block]
[block:file]
{"language":"javascript","name":"Cordova","file":"code_blocks/🚀 Getting Started/getting-started-old_7.js"}
[/block]
[block:file]
{"language":"text","name":"Unity","file":"code_blocks/🚀 Getting Started/getting-started-old_8.txt"}
[/block]

When in development, we recommend enabling more verbose debug logs. For more information about these logs, see our [Debugging](doc:debugging) guide.  

If you're planning to use RevenueCat alongside your existing purchase code, check out our guide on [Observer Mode](doc:observer-mode).
[block:callout]
{
  "type": "info",
  "title": "Configuring Purchases with User IDs",
  "body": "If you have a user authentication system in your app, you can provide a user identifier at the time of configuration or at a later date with a call to `.logIn()`. To learn more, check out our guide on [Identifying Users](user-ids)."
}
[/block]
# 8. Displaying Available Products

The SDK will automatically fetch the [configured Offerings](doc:entitlements#offerings) and retrieve the product information from Apple, Google, or Amazon. Thus, available products will already be loaded when customers launch your purchase screen.

Below is an example of fetching Offerings. You can utilize Offerings to organize your paywall screen. See our guide on [Displaying Products](doc:displaying-products) for more information and best practices.
[block:file]
{"language":"swift","name":"","file":"code_blocks/🚀 Getting Started/getting-started-old_9.swift"}
[/block]
[block:file]
{"language":"objectivec","name":"","file":"code_blocks/🚀 Getting Started/getting-started-old_10.m"}
[/block]
[block:file]
{"language":"kotlin","name":"","file":"code_blocks/🚀 Getting Started/getting-started-old_11.kt"}
[/block]
[block:file]
{"language":"java","name":"","file":"code_blocks/🚀 Getting Started/getting-started-old_12.java"}
[/block]
[block:file]
{"language":"javascript","name":"Flutter","file":"code_blocks/🚀 Getting Started/getting-started-old_13.js"}
[/block]
[block:file]
{"language":"javascript","name":"React Native","file":"code_blocks/🚀 Getting Started/getting-started-old_14.js"}
[/block]
[block:file]
{"language":"javascript","name":"Cordova","file":"code_blocks/🚀 Getting Started/getting-started-old_15.js"}
[/block]
[block:file]
{"language":"csharp","name":"Unity","file":"code_blocks/🚀 Getting Started/getting-started-old_16.cs"}
[/block]
[block:file]
{"language":"curl","name":"Web","file":"code_blocks/🚀 Getting Started/getting-started-old_17.curl"}
[/block]


[block:html]
{
  "html": "<body>\n  <h3> See it in action </h3>\n  <a href=\"https://github.com/RevenueCat/purchases-ios/blob/main/Examples/MagicWeather/MagicWeather/Sources/Controllers/PaywallViewController.swift#L24-L35\" target=\"_blank\" class=\"button-text\">Swift</a>\n  <a href=\"https://github.com/RevenueCat/purchases-android/blob/main/examples/MagicWeather/app/src/main/java/com/revenuecat/sample/ui/paywall/PaywallFragment.kt#L48-L53\" target=\"_blank\" class=\"button-text\">Kotlin</a>\n  <a href=\"https://github.com/RevenueCat/purchases-flutter/blob/main/revenuecat_examples/MagicWeather/lib/src/views/weather.dart#L41-L79\" target=\"_blank\" class=\"button-text\">Flutter</a>\n  <a href=\"https://github.com/RevenueCat/react-native-purchases/blob/main/examples/MagicWeather/src/screens/PaywallScreen/index.js#L24-L33\" target=\"_blank\"  class=\"button-text\">React Native</a>\n</body>"
}
[/block]

If fetching your [Offerings](doc:entitlements#offerings), [products](doc:entitlements#products), or available [packages](doc:entitlements#adding-packages) are empty, it's due to some configuration issue in the respective store. 

The most common reasons for this in App Store Connect are an out-of-date 'Paid Applications Agreement' or products not at least in the 'Ready To Submit' state. In Google Play this usually occurs when the app is not published on a closed track and a valid test user added.

You can find more info about troubleshooting this issue in our [Help Center](https://support.revenuecat.com/hc/en-us/articles/360041793174).

# 9. Make a Purchase

The SDK includes a simple method for facilitating purchases. The `purchase:package` takes a package from the fetched Offering and processes the transaction with the respective app store.

The code sample below shows the process of purchasing a package and confirming it unlocks the "your_entitlement_id" content. More detail about the `purchase:package` method can be found in our guide on [Making Purchases](doc:making-purchases).

[block:file]
{"language":"swift","name":"","file":"code_blocks/🚀 Getting Started/getting-started-old_18.swift"}
[/block]
[block:file]
{"language":"objectivec","name":"","file":"code_blocks/🚀 Getting Started/getting-started-old_19.m"}
[/block]
[block:file]
{"language":"kotlin","name":"","file":"code_blocks/🚀 Getting Started/getting-started-old_20.kt"}
[/block]
[block:file]
{"language":"java","name":"","file":"code_blocks/🚀 Getting Started/getting-started-old_21.java"}
[/block]
[block:file]
{"language":"javascript","name":"Flutter","file":"code_blocks/🚀 Getting Started/getting-started-old_22.js"}
[/block]
[block:file]
{"language":"javascript","name":"React Native","file":"code_blocks/🚀 Getting Started/getting-started-old_23.js"}
[/block]
[block:file]
{"language":"javascript","name":"Cordova","file":"code_blocks/🚀 Getting Started/getting-started-old_24.js"}
[/block]
[block:file]
{"language":"csharp","name":"Unity","file":"code_blocks/🚀 Getting Started/getting-started-old_25.cs"}
[/block]
[block:file]
{"language":"curl","name":"Web","file":"code_blocks/🚀 Getting Started/getting-started-old_26.curl"}
[/block]


[block:html]
{
  "html": "<body>\n  <h3> See it in action </h3>\n  <a href=\"https://github.com/RevenueCat/purchases-ios/blob/main/Examples/MagicWeather/MagicWeather/Sources/Controllers/PaywallViewController.swift#L78-L95\" target=\"_blank\" class=\"button-text\">Swift</a>\n  <a href=\"https://github.com/RevenueCat/purchases-android/blob/main/examples/MagicWeather/app/src/main/java/com/revenuecat/sample/ui/paywall/PaywallFragment.kt#L55-L66\" target=\"_blank\" class=\"button-text\">Kotlin</a>\n  <a href=\"https://github.com/RevenueCat/purchases-flutter/blob/main/revenuecat_examples/MagicWeather/lib/src/views/paywall.dart#L53-L61\" target=\"_blank\" class=\"button-text\">Flutter</a>\n  <a href=\"https://github.com/RevenueCat/react-native-purchases/blob/main/examples/MagicWeather/src/components/PackageItem/index.js#L15-L31\" target=\"_blank\"  class=\"button-text\">React Native</a>\n</body>\n"
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "`purchase:package` handles the underlying framework interaction and automatically validates purchases with the respective store through our secure servers. This helps reduce in-app purchase fraud and decreases the complexity of your app. Receipt tokens are stored remotely and always kept up to date by RevenueCat."
}
[/block]
# 10. Get Subscription Status

The SDK makes it easy to check what active subscriptions the current customer has, too. This can be done by checking if a specific Entitlement is active, or by checking if the active Entitlements array contains a specific Entitlement ID.

If you're not using Entitlements (you probably should be!) you can check the array of active subscriptions to see what product IDs from the respective store it contains.
[block:file]
{"language":"swift","name":"","file":"code_blocks/🚀 Getting Started/getting-started-old_27.swift"}
[/block]
[block:file]
{"language":"objectivec","name":"","file":"code_blocks/🚀 Getting Started/getting-started-old_28.m"}
[/block]
[block:file]
{"language":"kotlin","name":"","file":"code_blocks/🚀 Getting Started/getting-started-old_29.kt"}
[/block]
[block:file]
{"language":"java","name":"","file":"code_blocks/🚀 Getting Started/getting-started-old_30.java"}
[/block]
[block:file]
{"language":"javascript","name":"Flutter","file":"code_blocks/🚀 Getting Started/getting-started-old_31.js"}
[/block]
[block:file]
{"language":"javascript","name":"React Native","file":"code_blocks/🚀 Getting Started/getting-started-old_32.js"}
[/block]
[block:file]
{"language":"javascript","name":"Cordova","file":"code_blocks/🚀 Getting Started/getting-started-old_33.js"}
[/block]
[block:file]
{"language":"csharp","name":"Unity","file":"code_blocks/🚀 Getting Started/getting-started-old_34.cs"}
[/block]
[block:file]
{"language":"curl","name":"Web","file":"code_blocks/🚀 Getting Started/getting-started-old_35.curl"}
[/block]


[block:html]
{
  "html": "<body>\n  <h3> See it in action </h3>\n  <a href=\"https://github.com/RevenueCat/purchases-ios/blob/main/Examples/MagicWeather/MagicWeather/Sources/Controllers/UserViewController.swift#L37-L45\" target=\"_blank\" class=\"button-text\">Swift</a>\n  <a href=\"https://github.com/RevenueCat/purchases-android/blob/main/examples/MagicWeather/app/src/main/java/com/revenuecat/sample/ui/weather/WeatherFragment.kt#L69-L84\" target=\"_blank\" class=\"button-text\">Kotlin</a>\n  <a href=\"https://github.com/RevenueCat/purchases-flutter/blob/main/revenuecat_examples/MagicWeather/lib/src/views/weather.dart#L31-L39\" target=\"_blank\" class=\"button-text\">Flutter</a>\n  <a href=\"https://github.com/RevenueCat/react-native-purchases/blob/main/examples/MagicWeather/src/screens/WeatherScreen/index.js#L29-L46\" target=\"_blank\"  class=\"button-text\">React Native</a>\n</body>\n"
}
[/block]

You can use this method whenever you need to get the latest status, and it's safe to call this repeatedly throughout the lifecycle of your app. *Purchases* automatically caches the latest <<glossary:CustomerInfo>> whenever it updates — so in most cases, this method pulls from the cache and runs very fast.

It's typical to call this method when deciding which UI to show the user and whenever the user performs an action that requires a certain entitlement level.
[block:callout]
{
  "type": "info",
  "body": "You can access a lot more information about a subscription than simply whether it's active or not. See our guide on [Subscription Status](doc:purchaserinfo) to learn if subscription is set to renew, if there's an issue detected with the user's credit card, and more."
}
[/block]
# 11. Restoring Purchases

RevenueCat enables your users to restore their in-app purchases, reactivating any content that they previously purchased from the **same store account** (Apple, Google, or Amazon account). We recommend that all apps have some way for users to trigger the restore method. Note that Apple does require a restore mechanism in the event a user loses access to their purchases (e.g: uninstalling/reinstalling the app, losing their account information, etc).
[block:file]
{"language":"swift","name":"","file":"code_blocks/🚀 Getting Started/getting-started-old_36.swift"}
[/block]
[block:file]
{"language":"objectivec","name":"","file":"code_blocks/🚀 Getting Started/getting-started-old_37.m"}
[/block]
[block:file]
{"language":"kotlin","name":"","file":"code_blocks/🚀 Getting Started/getting-started-old_38.kt"}
[/block]
[block:file]
{"language":"java","name":"","file":"code_blocks/🚀 Getting Started/getting-started-old_39.java"}
[/block]
[block:file]
{"language":"javascript","name":"Flutter","file":"code_blocks/🚀 Getting Started/getting-started-old_40.js"}
[/block]
[block:file]
{"language":"javascript","name":"React Native","file":"code_blocks/🚀 Getting Started/getting-started-old_41.js"}
[/block]
[block:file]
{"language":"javascript","name":"Cordova","file":"code_blocks/🚀 Getting Started/getting-started-old_42.js"}
[/block]
[block:file]
{"language":"csharp","name":"Unity","file":"code_blocks/🚀 Getting Started/getting-started-old_43.cs"}
[/block]


[block:html]
{
  "html": "<body>\n  <h3> See it in action </h3>\n  <a href=\"https://github.com/RevenueCat/purchases-ios/blob/main/Examples/MagicWeather/MagicWeather/Sources/Controllers/UserViewController.swift#L107-L123\" target=\"_blank\" class=\"button-text\">Swift</a>\n  <a href=\"https://github.com/RevenueCat/purchases-android/blob/main/examples/MagicWeather/app/src/main/java/com/revenuecat/sample/ui/user/UserFragment.kt#L78-L85\" target=\"_blank\" class=\"button-text\">Kotlin</a>\n  <a href=\"https://github.com/RevenueCat/purchases-flutter/blob/main/revenuecat_examples/MagicWeather/lib/src/views/user.dart#L29-L55\" target=\"_blank\" class=\"button-text\">Flutter</a>\n  <a href=\"https://github.com/RevenueCat/react-native-purchases/blob/main/examples/MagicWeather/src/components/RestorePurchasesButton/index.js#L11-L18\" target=\"_blank\"  class=\"button-text\">React Native</a>\n</body>\n"
}
[/block]
If two different [App User IDs](doc:user-ids) restore transactions from the same underlying store account (Apple, Google, or Amazon account) RevenueCat may attempt to create an alias between the two App User IDs and count them as the same user going forward. See our guide on [Restoring Purchases](doc:restoring-purchases) for more information on the different configurable restore behaviors.


# (optional) Listening For CustomerInfo Updates

Since the SDK works seamlessly on any platform, changes to a user's purchase info may come from a variety of sources. You can respond to any changes in a customer's <<glossary:CustomerInfo>> by conforming to an optional delegate method, `purchases:receivedUpdated:`. This will fire whenever the SDK receives an updated customer info object from calls to `getCustomerInfo()`, `purchase(package:)`, `purchase(product:)`, or `restorePurchases()`. 

<<glossary:CustomerInfo>> updates are *not* pushed to your app from the RevenueCat backend, updates can only happen from an outbound network request to RevenueCat.

Depending on your app, it may be sufficient to ignore the delegate and simply handle changes to customer information the next time your app is launched or in the completion blocks of the SDK methods.
[block:file]
{"language":"swift","name":"","file":"code_blocks/🚀 Getting Started/getting-started-old_44.swift"}
[/block]
[block:file]
{"language":"objectivec","name":"","file":"code_blocks/🚀 Getting Started/getting-started-old_45.m"}
[/block]
[block:file]
{"language":"kotlin","name":"","file":"code_blocks/🚀 Getting Started/getting-started-old_46.kt"}
[/block]
[block:file]
{"language":"java","name":"","file":"code_blocks/🚀 Getting Started/getting-started-old_47.java"}
[/block]
[block:file]
{"language":"javascript","name":"Flutter","file":"code_blocks/🚀 Getting Started/getting-started-old_48.js"}
[/block]
[block:file]
{"language":"javascript","name":"React Native","file":"code_blocks/🚀 Getting Started/getting-started-old_49.js"}
[/block]
[block:file]
{"language":"javascript","name":"Cordova","file":"code_blocks/🚀 Getting Started/getting-started-old_50.js"}
[/block]
[block:file]
{"language":"csharp","name":"Unity","file":"code_blocks/🚀 Getting Started/getting-started-old_51.cs"}
[/block]


[block:html]
{
  "html": "<body>\n  <h3> See it in action </h3>\n  <a href=\"https://github.com/RevenueCat/purchases-ios/blob/main/Examples/MagicWeather/MagicWeather/Sources/Lifecycle/AppDelegate.swift#L49-L59\" target=\"_blank\" class=\"button-text\">Swift</a>\n  <a href=\"https://github.com/RevenueCat/purchases-android/blob/main/examples/MagicWeather/app/src/main/java/com/revenuecat/sample/MainApplication.kt#L26-L51\" target=\"_blank\" class=\"button-text\">Kotlin</a>\n  <a href=\"https://github.com/RevenueCat/purchases-flutter/blob/main/revenuecat_examples/MagicWeather/lib/src/views/home.dart#L40-L50\" target=\"_blank\" class=\"button-text\">Flutter</a>\n  <a href=\"https://github.com/RevenueCat/react-native-purchases/blob/main/examples/MagicWeather/src/screens/UserScreen/index.js#L35-L41\" target=\"_blank\"  class=\"button-text\">React Native</a>\n</body>\n"
}
[/block]

[block:callout]
{
  "type": "success",
  "title": "You did it!",
  "body": "You have now implemented a fully-featured subscription purchasing system without spending a month writing server code. Congrats!"
}
[/block]
# Sample Apps

To download more complete examples of integrating the SDK, head over to our sample app resources.

**[View Samples :fa-arrow-right:](doc:sample-apps)**

# Next Steps

* If you haven't already, make sure your products are configured correctly by checking out our [guide on entitlements :fa-arrow-right:](doc:entitlements).
* If you want to use your own user identifiers, read about [setting app user IDs :fa-arrow-right:](doc:user-ids).
* If you're moving to RevenueCat from another system, see our guide on [migrating your existing subscriptions :fa-arrow-right:](doc:migrating-existing-subscriptions).
* Once you're ready to test your integration, you can follow our guides on [testing and debugging :fa-arrow-right:](doc:debugging).
* If you qualify for the App Store Small Business Program, check out our guide on [how to apply and inform RevenueCat :fa-arrow-right:](doc:app-store-small-business-program)
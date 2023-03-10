---
title: "iOS App Extensions"
slug: "ios-app-extensions"
hidden: false
metadata: 
  title: "iOS App Extensions – RevenueCat"
  description: "App Extensions in iOS are an important component of the iOS ecosystem that are supported by RevenueCat. The most popular use of App Extensions for subscription apps are Today Widgets and iMessage apps."
  image: 
    0: "https://files.readme.io/8c8e35b-RevenueCat_Docs_OG.png"
    1: "RevenueCat Docs OG.png"
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: "2020-06-29T17:38:11.890Z"
updatedAt: "2023-02-21T18:39:49.309Z"
---
[App Extensions](https://developer.apple.com/app-extensions/) in iOS are an important component of the iOS ecosystem that are supported by RevenueCat. The most popular use of App Extensions for subscription apps are Today Widgets and iMessage apps.

# Configuring for App Extensions

To enable data sharing between the main app and extensions, you'll need to use Xcode or the Developer portal to [enable app groups for the containing app and its contained app extensions](https://developer.apple.com/library/archive/documentation/General/Conceptual/ExtensibilityPG/ExtensionScenarios.html#//apple_ref/doc/uid/TP40014214-CH21-SW1). Then, [register the app group in the portal](https://developer.apple.com/library/archive/documentation/Miscellaneous/Reference/EntitlementKeyReference/Chapters/EnablingAppSandbox.html#//apple_ref/doc/uid/TP40011195-CH4-SW19) and specify the app group to use in the containing app.

After you enable app groups, you will be able to access a user's active subscriptions in your App Extension by configuring *Purchases* with a custom UserDefaults that's shared across your App Extension.
[block:code]
{
  "codes": [
    {
      "code": "Purchases.configure(withAPIKey: <your_api_key>, \n                    appUserID: <my_app_user_id>, \n                     userDefaults: UserDefaults(suiteName: <group.your.bundle.here>))",
      "language": "swift"
    }
  ]
}
[/block]
Now the app extension and parent app can both use the a shared UserDefaults suite.
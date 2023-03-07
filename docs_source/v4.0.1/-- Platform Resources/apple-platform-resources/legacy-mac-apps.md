---
title: "Legacy Mac Apps"
slug: "legacy-mac-apps"
excerpt: "Configuring legacy Mac apps with RevenueCat"
hidden: false
metadata: 
  title: "Legacy Mac Apps – RevenueCat"
  image: 
    0: "https://files.readme.io/c1e4bb3-RevenueCat_Docs_OG.png"
    1: "RevenueCat Docs OG.png"
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: "2021-04-22T00:21:12.343Z"
updatedAt: "2022-10-05T14:01:20.981Z"
---
For newer Mac apps, in-app purchases can be shared across Mac and iOS apps. This is called [Universal Purchases](https://developer.apple.com/support/universal-purchase/). 
[block:callout]
{
  "type": "success",
  "title": "Mac apps with Universal Purchases don't require this setup",
  "body": "If your Mac app uses Universal Purchases (meaning your Mac app is part of the same app record as your iOS app) or it was created after March 2020, you don't need to follow this guide. RevenueCat will just work for your app!"
}
[/block]

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/43e6ecf-2021-04-21_20.38.18_appstoreconnect.apple.com_11f477bb0d80.png",
        "2021-04-21 20.38.18 appstoreconnect.apple.com 11f477bb0d80.png",
        520,
        325,
        "#f1f1f1"
      ],
      "caption": "This Mac app is part of the same app record as the iOS app, which means it uses Universal Purchases. It also has the same bundle ID as the iOS app. **No special setup is required in RevenueCat for this Mac app if you already have your iOS app set up.**"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "If you have an existing Mac app that you want to migrate to universal purchases, you will have to follow the steps found Apple's documentation: https://developer.apple.com/support/universal-purchase/"
}
[/block]
Since most Mac apps released today on RevenueCat's platform use universal purchases, by default the Mac configuration options on the dashboard are hidden. If you want to set up a Mac app in RevenueCat, follow the following steps:

# 1. Contact RevenueCat support

Contact RevenueCat support to enable legacy Mac app configuration for your app. Provide the name of your RevenueCat app. After RevenueCat support enables Mac app configuration options, your dashboard will show the new options, like this:
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/b55a6c3-2021-04-21_22.19.23_app.revenuecat.com_ddcdba140b92.png",
        "2021-04-21 22.19.23 app.revenuecat.com ddcdba140b92.png",
        1237,
        1985,
        "#f7f7f8"
      ],
      "caption": "After contacting support, the macOS Configuration section appears in the dashboard."
    }
  ]
}
[/block]
# 2. Enter your Mac App Store shared secret

If you are going to add an iOS app, enter the iOS/universal Mac app's bundle ID and shared secret.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/b15da06-2021-04-21_22.04.33_app.revenuecat.com_85bb0ec5fd5c.png",
        "2021-04-21 22.04.33 app.revenuecat.com 85bb0ec5fd5c.png",
        1237,
        1985,
        "#f6f6f7"
      ],
      "caption": "In this example we added the Mac app store shared secret and updated the App Store configuration with the details for our universal app."
    }
  ]
}
[/block]
# 3. Update your universal app code

This step is only required if you have both a legacy Mac app and an iOS/universal Mac app. In the **universal Mac app**, add this line of code right before `Purchases.configure`:
[block:code]
{
  "codes": [
    {
      "code": "Purchases.setForceUniversalAppStore(true)\nPurchases.configure()\n// ...",
      "language": "swift"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "success",
  "title": "You're done 🎉",
  "body": "You've successfully configured your Mac app in RevenueCat!"
}
[/block]
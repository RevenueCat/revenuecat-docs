---
title: Paywalls (beta)
slug: paywalls
hidden: false
---
RevenueCat's Paywalls allow you to remotely configure your entire paywall view without any code changes or app updates. Whether you’re building a new app, exploring new paywall concepts, or diving into experimentation; RevenueCat’s Paywalls make it easy to get started.

> ❗️
> 
> Paywalls are available on the following platforms:
> - iOS 15.0+
> - visionOS 1.0+
> - Mac Catalyst 15.0+
> - Android 7.0 (API level 24) - on Beta!
>
> Support for more platforms is coming soon: watchOS, macOS, tvOS, and others!

[block:embed]
{
  "html": "<iframe class=\"embedly-embed\" src=\"//cdn.embedly.com/widgets/media.html?src=https%3A%2F%2Fwww.youtube.com%2Fembed%2Fh_1PDVAj4QQ%3Ffeature%3Doembed&display_name=YouTube&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3Dh_1PDVAj4QQ&image=https%3A%2F%2Fi.ytimg.com%2Fvi%2Fh_1PDVAj4QQ%2Fhqdefault.jpg&key=7788cb384c9f4d5dbbdbeffd9fe4b92f&type=text%2Fhtml&schema=youtube\" width=\"854\" height=\"480\" scrolling=\"no\" title=\"YouTube embed\" frameborder=\"0\" allow=\"autoplay; fullscreen; encrypted-media; picture-in-picture;\" allowfullscreen=\"true\"></iframe>",
  "url": "https://www.youtube.com/watch?v=h_1PDVAj4QQ",
  "title": "Introducing RevenueCat Paywalls",
  "favicon": "https://www.google.com/favicon.ico",
  "image": "https://i.ytimg.com/vi/h_1PDVAj4QQ/hqdefault.jpg",
  "provider": "https://www.youtube.com/",
  "href": "https://www.youtube.com/watch?v=h_1PDVAj4QQ",
  "typeOfEmbed": "youtube"
}
[/block]


# How Paywalls work

## iOS Installation

#### If you already have `RevenueCat` in your project:

> 📘 
> 
> `RevenueCatUI` support on CocoaPods will come later: https://github.com/RevenueCat/purchases-ios/issues/3152
> For now, you can follow the instructions below to add `RevenueCatUI` through SPM instead.

1. Open your project settings and select "Package Dependencies":
<img width="783" alt="Change version" src="https://github.com/RevenueCat/purchases-ios/assets/685609/d317fd33-8270-4d9b-9b38-8f5f14342b04">

2. Double-click and make sure version is at least `4.26.0`:
<img width="400" alt="Configure version" src="https://github.com/RevenueCat/purchases-ios/assets/685609/f537a1e1-a1ab-4e6f-986c-05abdcf1dd9f">

3. Open your target settings and find "Frameworks, Libraries, and Embedded Content":
<img width="328" alt="Find frameworks in your target" src="https://github.com/RevenueCat/purchases-ios/assets/685609/af078e9a-4b98-42c6-8ca7-6f79aebdf3e0">

4. Add `RevenueCatUI`:
<img width="512" alt="Add RevenueCatUI dependency" src="https://github.com/RevenueCat/purchases-ios/assets/685609/c2a3498c-b80d-405c-bdf6-75de927ea58e">

#### First time integrating the RevenueCat SDK:

1. Click File -> Add Packages...

2. Search for `git@github.com:RevenueCat/purchases-ios.git` and make sure version is at least `4.26.0`:
<img width="1196" alt="Adding purchases-ios dependency" src="https://github.com/RevenueCat/purchases-ios/assets/685609/18291043-5710-4944-ba12-7d6d83bde240">

3. Add `RevenueCat` and `RevenueCatUI` SPM dependency to your project:
<img width="400" alt="Add paywall" src="https://files.readme.io/9140485-Screenshot_2023-08-04_at_12.08.07.png">

## Android Installation

1. Add `RevenueCatUI`:
```groovy build.gradle
implementation 'com.revenuecat.purchases:purchases-ui:7.1.0-beta.2'
```

## Overview

Our paywall templates use native code to deliver smooth, intuitive experiences to your customers when you’re ready to deliver them an Offering; and you can use our Dashboard to pick the right template and configuration to meet your needs.

To use RevenueCat Paywalls, simply:

1. [Create a Paywall](doc:creating-paywalls) on the Dashboard for the [Offering](doc:entitlements) you intend to serve to your customers

2. See [displaying paywalls](doc:displaying-paywalls) for how to display it into your app.

> 📘 
> 
> RevenueCat Paywalls are available on the following SDK versions:
> - iOS: version >= 4.26.0
> - Android: version >= 7.1.0 (beta)

## Offerings and Paywalls

You can think of a Paywall as an optional feature of your Offering. An Offering is the collection of Products which are organized into Packages to be displayed to your customers as a single "offer" across platforms. Now, with Paywalls, you can control the actual view that is used to display that "offer" in addition to controlling the products that are offered.

Therefore, you can create a unique Paywall for each of your Offerings, and can create an unlimited number of Offerings & Paywalls for each variation you want to test with Experiments.

# Limitations

## Platforms (support for more coming)
* ✅  iOS 15.0 and higher
* ✅  visionOS 1.0 and higher
* ✅  Mac Catalyst 15.0 and higher
* ✅ Android 7.0 (API level 24)
* ❌ watchOS
* ❌ macOS
* ❌ tvOS

# Next Steps

* Now that you know how our paywalls work, read about [creating paywalls](doc:creating-paywalls)
* Once you're ready to see your paywalls in action, you can follow our guides on [displaying paywalls](doc:displaying-paywalls)
* If you need inspiration with some paywall examples, you can try our [Paywalls Tester app](https://github.com/RevenueCat/purchases-ios/tree/main/Tests/TestingApps/PaywallsTester)

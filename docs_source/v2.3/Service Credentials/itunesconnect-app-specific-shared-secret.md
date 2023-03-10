---
title: "App Store"
slug: "itunesconnect-app-specific-shared-secret"
excerpt: "Setting up your iOS, iPadOS, or macOS app"
hidden: false
createdAt: "2018-05-10T18:31:10.805Z"
updatedAt: "2019-09-30T18:23:47.114Z"
---
[block:api-header]
{
  "title": "Getting Your App Connect App-Specific Shared Secret"
}
[/block]
The App-Specific Shared Secret allows RevenueCat to connect with Apple on your behalf. 

1. Log in to [App Store Connect](https://appstoreconnect.apple.com/)

2. Navigate to "My Apps" and select your app

3. Navigate to Features in the top bar

4. Select "In-App Purchases" from the left side menu

5. Select App-Specific Share Secret from the right side above your in-app products.

6. Generate and copy your shared secret



[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/995483e-shared_secret_instructions.png",
        "shared_secret_instructions.png",
        2716,
        1382,
        "#e7e8ea"
      ]
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "title": "Subscription Status URL",
  "body": "RevenueCat periodically polls App Store Connect on each individual receipt your app uploads to our servers. Because that’s the most reliable way to get App Store receipt data, RevenueCat does not currently support server to server status updates via the “Subscription Status URL” field in App Store Connect."
}
[/block]
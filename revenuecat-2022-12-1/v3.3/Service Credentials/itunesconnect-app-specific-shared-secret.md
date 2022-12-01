---
title: "Apple App Store"
slug: "itunesconnect-app-specific-shared-secret"
excerpt: "Getting your App Store Connect App-Specific Shared Secret"
hidden: false
metadata: 
  title: "Generating an App-Specific Shared Secret – RevenueCat"
  description: "The App-Specific Shared Secret allows RevenueCat to connect with Apple on your behalf. Here is where to find it in App Store Connect."
  image: 
    0: "https://files.readme.io/32fa825-60993e3c40039b67596bcc8c_slack-preview.png"
    1: "60993e3c40039b67596bcc8c_slack-preview.png"
    2: 1200
    3: 627
    4: "#f45476"
createdAt: {}
updatedAt: "2021-12-09T14:22:21.328Z"
---
The App-Specific Shared Secret allows RevenueCat to connect with Apple on your behalf. 

# Setup
## 1. Generating an App-Specific Shared Secret

1. Log in to [App Store Connect](https://appstoreconnect.apple.com/)
2. Navigate to "My Apps" and select your app
3. Select "Manage" under the "In-App Purchases" section from the left side menu
4. Select App-Specific Share Secret from the right side above your in-app products.
5. Generate and copy your shared secret

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/a2ae52e-Screen_Shot_2020-06-19_at_11.57.16_AM.png",
        "Screen Shot 2020-06-19 at 11.57.16 AM.png",
        2768,
        936,
        "#f9f9fa"
      ],
      "border": true
    }
  ]
}
[/block]
## 2. Enter the Shared Secret in RevenueCat

In your app settings for your IOS app in RevenueCat enter the key in the App Store configuration section:
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/ffe47d6-Screen_Shot_2021-12-02_at_10.58.17_AM.png",
        "Screen Shot 2021-12-02 at 10.58.17 AM.png",
        934,
        342,
        "#fbfbfb"
      ]
    }
  ]
}
[/block]
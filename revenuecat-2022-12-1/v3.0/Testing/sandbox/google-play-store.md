---
title: "Google Play Store"
slug: "google-play-store"
excerpt: "Testing purchases in Play Store Sandbox"
hidden: false
metadata: 
  title: "Testing purchases in Play Store Sandbox | RevenueCat"
  description: "Follow this guide to start making test purchases in your Android app. It'll walk you through creating a test user, publishing to a closed test track, making a sandbox purchase, and viewing it in your RevenueCat dashboard."
  image: 
    0: "https://files.readme.io/c31c640-Reddit__E.jpg"
    1: "Reddit – E.jpg"
    2: 1200
    3: 630
    4: "#fbabaf"
createdAt: {}
updatedAt: "2020-08-29T00:02:04.688Z"
---
[block:callout]
{
  "type": "success",
  "body": "This section assumes you've followed our [Quickstart](doc:getting-started-1) section of our Getting Started guide to install and configure our SDK."
}
[/block]

[block:api-header]
{
  "title": "Use a real device"
}
[/block]
We have been testing on emulators successfully but Google recommends using a real device. If you are using an emulator, make sure it has Google Play Services installed.
[block:api-header]
{
  "title": "Create a test user and configure licensing testing"
}
[/block]
In order to be able to test the app in the next steps of the development you are going to need to use a test user. This test user will be the user that you logged in first in your Android testing device. Note that the only way to changing the primary account on a device is to do a factory reset. 

Access the Account Details again in the Settings of the Google Play Console account  [https://play.google.com/apps/publish/?#ProfilePlace](https://play.google.com/apps/publish/?#ProfilePlace). Scroll down and you will see a License Testing section. Add here the account you are using in your real device (the account you are logged in with).
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/395fa66-image_preview.png",
        "image_preview.png",
        1586,
        788,
        "#f8f8f9"
      ]
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "Create a closed track and add a tester to it"
}
[/block]
You are going to need to publish a signed version of the app into a closed track. If you haven’t created a closed track yet, you can create one in the App Releases section of the Release Management menu. 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/c046ffc-image_preview_1.png",
        "image_preview (1).png",
        1612,
        1214,
        "#ecedee"
      ]
    }
  ]
}
[/block]
When creating the closed track, you are given the chance to create a list of testers. Go ahead and create a list and name it Testers.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/f86f921-image_preview_2.png",
        "image_preview (2).png",
        1022,
        550,
        "#f6f6f6"
      ]
    }
  ]
}
[/block]
Add again the email account you are using in your testing device to the list of tester emails.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/27f869a-image_preview_3.png",
        "image_preview (3).png",
        1224,
        868,
        "#fbfbfb"
      ]
    }
  ]
}
[/block]
Open the Opt-in URL in your testing device (or any browser that’s logged in with that testing user) to make the user a tester. You can send the URL to your device via email, for example. 
[block:callout]
{
  "type": "warning",
  "title": "You Must Open the Opt-in URL",
  "body": "Opening the opt-in URL marks your Play account for testing. If you don't complete this step, products will not load."
}
[/block]

[block:callout]
{
  "type": "warning",
  "title": "Check Your Application ID",
  "body": "Often developers will use a different application ID for their test builds. This will cause you problems since Google Play Services uses the application ID to find your in-app purchases."
}
[/block]

[block:callout]
{
  "type": "warning",
  "title": "Add a PIN to the test device if needed",
  "body": "There are cases where a test user may be allowed to purchase consumables, but not subscriptions, if the test device does not have a PIN. This may manifest in a cryptic \"Something went wrong\" message. \nMake sure that the test device has a PIN, and that the device is logged into Google Play Store."
}
[/block]

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/68e01d8-image_preview_4.png",
        "image_preview (4).png",
        994,
        1138,
        "#f7f7f7"
      ]
    }
  ]
}
[/block]
Opening the link in the browser will show a web similar to this, with a become tester button. Press that button and your user will be able to make testing purchases on your testing device.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/db85b0e-image_preview_5.png",
        "image_preview (5).png",
        1610,
        916,
        "#f3f3f3"
      ]
    }
  ]
}
[/block]
If you need more help setting this up, you can refer to Googles guide on creating testers [here](https://developer.android.com/google/play/billing/billing_testing#testing-purchases).
[block:api-header]
{
  "title": "Upload a signed apk to the closed track"
}
[/block]
Generate a signed APK or use Android App Bundle to upload a signed APK to the alpha track you just created. You don’t even need to roll out the release. Just upload the APK. You can find more information about this in this support article [https://support.google.com/googleplay/android-developer/answer/7159011](https://support.google.com/googleplay/android-developer/answer/7159011) 
[block:api-header]
{
  "title": "Make a purchase"
}
[/block]
Build and run your app on your test device (you don't need to sign it). You should be able to complete all purchases.
[block:api-header]
{
  "title": "Verify transaction appears in dashboard"
}
[/block]
After a purchase is successful, you should be able to view the transaction immediately in the RevenueCat dashboard. If the purchase does not appear in the dashboard, it's **not** being tracked by RevenueCat.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/e9b4aa7-20ebf40-Screen_Shot_2019-01-18_at_12.32.52_PM.png",
        "20ebf40-Screen_Shot_2019-01-18_at_12.32.52_PM.png",
        756,
        316,
        "#f8f9f9"
      ]
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "Make sure the the *View Sandbox Data* toggle is enabled in the navigation bar.",
  "title": "Make sure Sandbox Data is enabled"
}
[/block]

[block:api-header]
{
  "title": "Sandbox specific logic"
}
[/block]
If latest subscription has expired in sandbox and a new App User Id attempts to purchase or restore, RevenueCat will move the purchases around between users. This logic exists to simplify sandbox testing so you don’t need to create new sandbox users all the time to avoid hitting `RECEIPT_ALREADY_IN_USE ` errors frequently.
[block:api-header]
{
  "title": "Working with subscriptions"
}
[/block]
In the the sandbox environment, subscription renewals happen at an accelerated rate, and auto-renewable subscriptions renew a maximum of six times. This enables you to test how your app handles a subscription renewal, a subscription lapse, and a subscription history that includes gaps.

Because of the accelerated expiration and renewal rates, sometimes not all renewals are reflected in the RevenueCat customer dashboard.
[block:parameters]
{
  "data": {
    "h-0": "Production subscription period",
    "h-1": "Sandbox subscription renewal",
    "0-0": "1 week",
    "1-0": "1 month",
    "3-0": "6 months",
    "2-0": "3 months",
    "4-0": "1 year",
    "0-1": "5 minutes",
    "1-1": "5 minutes",
    "2-1": "10 minutes",
    "3-1": "15 minutes",
    "4-1": "30 minutes"
  },
  "cols": 2,
  "rows": 5
}
[/block]

[block:api-header]
{
  "title": "Deleting test users"
}
[/block]
When testing, it may be helpful to delete a customer and all their receipts from RevenueCat to simulate a new installation. You can delete a specific user from the customer dashboard in RevenueCat. See our [docs on deleting users](doc:customers#section-delete-users) for more information.
[block:api-header]
{
  "title": "Next Steps"
}
[/block]
For more information, take a look at the official Google documentation:
**[Google Play Store: Testing Google Play Billing](https://developer.android.com/google/play/billing/billing_testing)**
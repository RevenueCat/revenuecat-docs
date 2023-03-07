---
title: "Platform Server Notifications"
slug: "server-notifications"
excerpt: "Sending App Store, Play Store, and Stripe server notifications to RevenueCat"
hidden: false
metadata: 
  title: "Platform server notifications | RevenueCat"
  description: "RevenueCat does not require server notifications from the App Store or Play Store, however doing so can speed up webhook and integration delivery times and reduce lag time for Charts."
  image: 
    0: "https://files.readme.io/19333fb-OG_image.png"
    1: "OG image.png"
    2: 1200
    3: 627
    4: "#e9acb0"
createdAt: {}
updatedAt: "2020-09-29T21:51:53.517Z"
---
RevenueCat does not require server notifications from the App Store, Play Store, or Stripe, however doing so can speed up webhook and integration delivery times and reduce lag time for [Charts](doc:charts).
[block:api-header]
{
  "title": "Setup Instructions"
}
[/block]
* [Apple Server-to-Server Notification Setup :fa-arrow-right:](doc:apple-server-notifications) 
* [Google Real-Time Developer Notification Setup :fa-arrow-right:](doc:google-server-notifications)
* [Stripe Server Notification Setup :fa-arrow-right:](doc:stripe-server-notifications) 
[block:api-header]
{
  "title": "Confirming Connection"
}
[/block]
You can confirm the Apple, Google, and/or Stripe notifications are being delivered properly to RevenueCat by observing the '*Last received*' timestamp next to the section header. If you've had subscription activity in your app but this value is missing or stale double check the configuration steps above.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/0caa7be-Screen_Shot_2020-06-23_at_10.55.59_AM.png",
        "Screen Shot 2020-06-23 at 10.55.59 AM.png",
        807,
        117,
        "#eae8e8"
      ]
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "Billing"
}
[/block]
Enabling Platform Server Notifications will not affect billing. If you haven't shipped yet and you are on the Analyze (Sandbox) or Grow (Sandbox) plans, platform server notifications alone **will not** trigger your app to be "shipped".
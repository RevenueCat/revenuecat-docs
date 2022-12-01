---
title: "Platform Server Notifications"
slug: "server-notifications"
excerpt: "Sending App Store, Play Store, and Stripe server notifications to RevenueCat"
hidden: false
metadata: 
  title: "Platform server notifications | RevenueCat"
  description: "RevenueCat does not require server notifications from the App Store or Play Store, however doing so can speed up webhook and integration delivery times and reduce lag time for Charts."
  image: 
    0: "https://files.readme.io/970d6df-60993e3c40039b67596bcc8c_slack-preview.png"
    1: "60993e3c40039b67596bcc8c_slack-preview.png"
    2: 1200
    3: 627
    4: "#f45476"
createdAt: {}
updatedAt: "2021-12-08T05:49:05.560Z"
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
* Amazon Appstore does not currently support server notifications
[block:api-header]
{
  "title": "Confirming Connection"
}
[/block]
You can confirm the Apple, Google, and/or Stripe notifications are being delivered properly to RevenueCat by observing the '*Last received*' timestamp next to the section header. 

If you've had subscription activity in your app but this value is missing or stale, double check the configuration steps above. 
[block:callout]
{
  "type": "warning",
  "body": "If a notification is received for a subscription not currently tracked by RevenueCat, we will return a **200** status code indicating we received the event, but this label will not be updated. Once an event is received for a tracked subscription, the label will be updated as expected.",
  "title": "'No notifications received' Message"
}
[/block]

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/bffdf75-Screen_Shot_2021-12-01_at_11.07.08_AM.png",
        "Screen Shot 2021-12-01 at 11.07.08 AM.png",
        1208,
        122,
        "#efedee"
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
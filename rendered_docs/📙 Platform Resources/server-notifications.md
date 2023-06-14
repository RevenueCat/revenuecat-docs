---
title: Platform Server Notifications
slug: server-notifications
excerpt: Informing RevenueCat of updates to user purchases
hidden: false
metadata:
  title: Platform server notifications – RevenueCat
  description: RevenueCat does not require server notifications from the App Store
    or Play Store, however doing so can speed up webhook and integration delivery
    times and reduce lag time for Charts.
  image:
    0: https://files.readme.io/6d0399f-RevenueCat_Docs_OG.png
    1: RevenueCat Docs OG.png
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: '2022-09-15T19:16:00.342Z'
updatedAt: '2023-06-14T14:26:37.238Z'
category: 6483560b2e0a290051a971e6
order: 7
---
Platform Server Notifications are notifications sent from **supported stores _to_ RevenueCat**, and are configured in the dashboards of each store. These notifications are intended to inform RevenueCat of updates to purchases, so we can ensure we send events in a timely manner.

If you are looking to _consume_ notifications about subscription purchases on your own server, see [Webhooks](doc:webhooks).

RevenueCat does not require Platform Server Notifications from the App Store or Play Store to be configured, however doing so can speed up webhook and integration delivery times and reduce lag time for [Charts](doc:charts).

# Setup Instructions

* Apple App Store Server Notification: [Setup :fa-arrow-right:](doc:apple-server-notifications) (Optional)
* Google Real-Time Developer Notifications: [Setup :fa-arrow-right:](doc:google-server-notifications) (Optional)
* Stripe Server Notifications: [Setup :fa-arrow-right:](doc:stripe-server-notifications) (Required for Stripe)
* Amazon Appstore: Not yet supported in RevenueCat.

# Confirming Connection

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
# Billing

Setting up and receiving Platform Server Notifications does not affect RevenueCat billing.
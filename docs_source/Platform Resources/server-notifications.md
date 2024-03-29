---
title: Platform Server Notifications
slug: server-notifications
excerpt: Informing RevenueCat of updates to user purchases
hidden: false
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

![](https://files.readme.io/bffdf75-Screen_Shot_2021-12-01_at_11.07.08_AM.png "Screen Shot 2021-12-01 at 11.07.08 AM.png")
# Billing

Setting up and receiving Platform Server Notifications does not affect RevenueCat billing.
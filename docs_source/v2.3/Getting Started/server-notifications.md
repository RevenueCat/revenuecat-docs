---
title: "Platform Server Notifications"
slug: "server-notifications"
excerpt: "Sending App Store and Play Store server notifications to RevenueCat"
hidden: false
createdAt: "2019-09-11T23:08:17.965Z"
updatedAt: "2019-11-05T16:36:11.221Z"
---
RevenueCat does not require server notifications from the App Store or Play Store, however doing so can speed up webhook and integration delivery times and reduce lag time for [Charts](doc:charts).
[block:api-header]
{
  "title": "Apple Server-to-Server Notifications"
}
[/block]
[Apple server-to-server notifications](https://developer.apple.com/documentation/storekit/in-app_purchase/enabling_server-to-server_notifications) need to be set up in App Store Connect with the URL provided in the RevenueCat dashboard.

1. Navigate to your **app settings** in the RevenueCat dashboard.
2. Scroll to the **iOS Configuration** section, and copy the entire URL provided under **Apple Server Notification URL**.

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/fad91b4-Screen_Shot_2019-09-12_at_5.33.03_PM.png",
        "Screen Shot 2019-09-12 at 5.33.03 PM.png",
        679,
        124,
        "#eaeceb"
      ]
    }
  ]
}
[/block]
3. Log in to **[App Store Connect](https://appstoreconnect.apple.com/)** and select your app.
4. Under the **App Information** section paste the entire URL from RevenueCat in the **Subscription Status URL** field.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/2b99808-Screen_Shot_2019-09-12_at_5.38.00_PM.png",
        "Screen Shot 2019-09-12 at 5.38.00 PM.png",
        725,
        353,
        "#faf3f3"
      ]
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "title": "Only one server notification URL supported",
  "body": "Apple only supports a single server notification url. If you're already using the notifications on your server, you can still forward the payload to the RevenueCat URL in your app settings."
}
[/block]

[block:api-header]
{
  "title": "Google Real-Time Developer Notifications"
}
[/block]
[Google real-time developer notifications](https://developer.android.com/google/play/billing/realtime_developer_notifications) can be set up directly from the RevenueCat dashboard. This will set up a new subscriber to Google's subscription status notifications, which will not effect any existing subscribers you may already have in place.

1. Navigate to your **app settings** in the RevenueCat dashboard.
2. Scroll to the **Android configuration** section, and click '*Connect to Google*' under **Google Developer Notifications**.
3. You will see a generated Google Cloud Pub/Sub topic ID, as shown below.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/8de30c1-pubsub.png",
        "pubsub.png",
        1206,
        198,
        "#eff2f3"
      ]
    }
  ]
}
[/block]
4. Click the **Copy** button to copy the topic ID to your clipboard.
5. Open the Google Play Console for your app and navigate to **Development Tools** → **Services & APIs**.
6. In the "Real-time developer notifications" section, paste in your topic ID, click on **Save**, and then the **Send Test Notification** button.

If you don't see any errors, the subscription is ready to go.
[block:api-header]
{
  "title": "Confirming Connection"
}
[/block]
You can confirm the Apple and/or Google notifications are being delivered properly to RevenueCat by observing the '*Last received*' timestamp next to the section header. If you've had subscription activity in your app but this value is missing or stale double check the configuration steps above.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/e3bab58-Screen_Shot_2019-09-12_at_5.49.46_PM.png",
        "Screen Shot 2019-09-12 at 5.49.46 PM.png",
        680,
        126,
        "#e8e6e6"
      ]
    }
  ]
}
[/block]
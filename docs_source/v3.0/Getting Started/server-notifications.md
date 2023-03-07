---
title: "Platform Server Notifications"
slug: "server-notifications"
excerpt: "Sending App Store and Play Store server notifications to RevenueCat"
hidden: false
metadata: 
  title: "Server notifications | RevenueCat"
  description: "RevenueCat does not require server notifications from the App Store or Play Store, however doing so can speed up webhook and integration delivery times and reduce lag time for Charts."
  image: 
    0: "https://files.readme.io/8245953-Reddit__E.jpg"
    1: "Reddit – E.jpg"
    2: 1200
    3: 630
    4: "#fbabaf"
createdAt: {}
updatedAt: "2020-09-17T21:00:46.534Z"
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
        "https://files.readme.io/461c19f-Screen_Shot_2020-06-19_at_11.35.34_AM.png",
        "Screen Shot 2020-06-19 at 11.35.34 AM.png",
        781,
        388,
        "#fbf5f4"
      ],
      "border": true
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "title": "Only one server notification URL supported",
  "body": "Apple only supports a single server notification URL. If you're already using the notifications on your server, you can still forward the payload from your server to the RevenueCat URL located in your app settings in the RevenueCat dashboard."
}
[/block]

[block:api-header]
{
  "title": "Google Real-Time Developer Notifications"
}
[/block]
[Google real-time developer notifications](https://developer.android.com/google/play/billing/realtime_developer_notifications) can be set up directly from the RevenueCat dashboard. This will set up a new subscriber to Google's subscription status notifications, which will not effect any existing subscribers you may already have in place.

1. **Ensure Google Cloud Pub/Sub is enabled for your project**. You can enable it [here](https://console.cloud.google.com/flows/enableapi?apiid=pubsub).
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/87c2164-enable_pubsub.png",
        "enable_pubsub.png",
        496,
        298,
        "#d4e2f4"
      ]
    }
  ]
}
[/block]
2. Navigate to your **app settings** in the RevenueCat dashboard.
3. Scroll to the **Android configuration** section, and click '*Connect to Google*' under **Google Developer Notifications**.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/2737d31-connect_to_google.png",
        "connect_to_google.png",
        819,
        444,
        "#f5f7f7"
      ]
    }
  ]
}
[/block]
4. You will see a generated Google Cloud Pub/Sub topic ID, as shown below.
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
5. Click the **Copy** button to copy the topic ID to your clipboard.
6. Open the Google Play Console for your app and navigate to **Development Tools** → **Services & APIs**.
7. In the "Real-time developer notifications" section, paste in your topic ID, click on **Save**, and then the **Send Test Notification** button.

If you don't see any errors, the subscription is ready to go.
[block:callout]
{
  "type": "warning",
  "title": "Service Credentials take ~36hrs to go into effect",
  "body": "If you receive a credentials error, make sure you've waited at least 36hrs after creating your [Google Service Credentials](creating-play-service-credentials) before connecting to Google Real-Time Developer Notifications."
}
[/block]

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
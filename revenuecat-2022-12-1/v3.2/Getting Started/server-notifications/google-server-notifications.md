---
title: "Google Real-Time Developer Notifications"
slug: "google-server-notifications"
excerpt: "Sending Google Play server notifications to RevenueCat"
hidden: false
metadata: 
  title: "Google Play server notifications – RevenueCat"
  description: "RevenueCat does not require server notifications from Google Play, however doing so can speed up webhook and integration delivery times and reduce lag time for Charts."
  image: 
    0: "https://files.readme.io/0941c39-OG_image.png"
    1: "OG image.png"
    2: 1200
    3: 627
    4: "#e9acb0"
createdAt: "2020-09-29T15:21:39.999Z"
updatedAt: "2021-09-13T15:17:01.013Z"
---
RevenueCat does not require server notifications from Google Play, however doing so can speed up webhook and integration delivery times and reduce lag time for [Charts](doc:charts).

# Setup Instructions

[Google real-time developer notifications](https://developer.android.com/google/play/billing/realtime_developer_notifications) can be set up directly from the RevenueCat dashboard. This will set up a new subscriber to Google's subscription status notifications, which will not affect any existing subscribers you may already have in place.

1. **Ensure Google Cloud Pub/Sub is enabled for your project**. You can enable it [here](https://console.cloud.google.com/flows/enableapi?apiid=pubsub).
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/123bf8c-87c2164-enable_pubsub.png",
        "87c2164-enable_pubsub.png",
        496,
        298,
        "#d4e2f4"
      ],
      "sizing": "smart"
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
        "https://files.readme.io/542d4e2-2737d31-connect_to_google.png",
        "2737d31-connect_to_google.png",
        819,
        444,
        "#f5f7f7"
      ],
      "sizing": "80"
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
        "https://files.readme.io/4fe8f15-8de30c1-pubsub.png",
        "8de30c1-pubsub.png",
        1206,
        198,
        "#eef2f2"
      ],
      "sizing": "80"
    }
  ]
}
[/block]
5. Click the **Copy** button to copy the topic ID to your clipboard.
6. Open the Google Play Console for your app and navigate to **Monetization setup**.
7. In the "Real-time developer notifications" section, paste in your topic ID, click on **Save**, and then the **Send Test Notification** button.

If you don't see any errors, the subscription is ready to go.

# Considerations
[block:callout]
{
  "type": "warning",
  "title": "Service Credentials take ~36hrs to go into effect",
  "body": "If you receive a credentials error, make sure you've waited at least 36hrs after creating your [Google Service Credentials](creating-play-service-credentials) before connecting to Google Real-Time Developer Notifications."
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "If you need to use an existing Pub/Sub topic with RevenueCat, [contact support](https://support.revenuecat.com/)."
}
[/block]
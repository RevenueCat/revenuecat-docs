---
title: "Stripe Server Notifications"
slug: "stripe-server-notifications"
excerpt: "Sending Stripe server notifications to RevenueCat"
hidden: false
metadata: 
  title: "Stripe server notifications – RevenueCat"
  description: "RevenueCat does not require server notifications from Stripe, however doing so can speed up webhook and integration delivery times and reduce lag time for Charts."
  image: 
    0: "https://files.readme.io/a550744-OG_image.png"
    1: "OG image.png"
    2: 1200
    3: 627
    4: "#e9acb0"
createdAt: "2020-09-29T15:21:50.023Z"
updatedAt: "2021-04-15T18:00:30.294Z"
---
RevenueCat does not require server notifications from Stripe, however doing so can speed up webhook and integration delivery times and reduce lag time for [Charts](doc:charts).
[block:callout]
{
  "type": "warning",
  "title": "Send Stripe token to RevenueCat",
  "body": "Stripe Server Notifications only work if the receipt exists in RevenueCat when the event is dispatched from Stripe. If the receipt doesn't exist, the event will fail. This includes test events from Stripe.\n\nYou'll need to follow our [Stripe Web Payments](doc:stripe) guide and send your purchase tokens to RevenueCat before proceeding with this guide."
}
[/block]
# Setup Instructions

1. Navigate to your **app settings** in the RevenueCat dashboard.
2. Scroll to the **Stripe Configuration** section and copy the endpoint provided under **Stripe Webhook Endpoint**.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/fdd3c3a-Screen_Shot_2020-09-29_at_11.49.40_AM.png",
        "Screen Shot 2020-09-29 at 11.49.40 AM.png",
        1610,
        224,
        "#eaeeee"
      ],
      "sizing": "80"
    }
  ]
}
[/block]
3. Log in to Stripe and go to the [Webhooks dashboard](https://dashboard.stripe.com/webhooks).
4. Click **Add endpoint**, paste the URL in the endpoint URL field and select the "customer.subscription.updated" event. It's very important to only select this specific event, since it's the only one that contains information relevant to RevenueCat.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/dd53abd-91b9d29-image1.png",
        "91b9d29-image1.png",
        1268,
        1596,
        "#f3f6f8"
      ],
      "sizing": "80"
    }
  ]
}
[/block]
5. Click **Add endpoint**. You might be asked to enter your password.
6. Copy the **Signing Secret** value and go back to your app settings in the **RevenueCat Dashboard**.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/3a87ff5-8db7d64-Screen_Shot_2020-09-23_at_17.44.04.png",
        "8db7d64-Screen_Shot_2020-09-23_at_17.44.04.png",
        2806,
        966,
        "#f8f8f9"
      ],
      "sizing": "80"
    }
  ]
}
[/block]
7. Paste it in the **Stripe Webhook Secret** input field and save.

# Considerations
[block:callout]
{
  "type": "warning",
  "title": "Ensure you are sending only the **customer.subscription.updated** event",
  "body": "The only event for this webhook should be the **customer.subscription.updated** event. If you choose other events, our API will respond with an error, and Stripe will eventually disable the webhook."
}
[/block]
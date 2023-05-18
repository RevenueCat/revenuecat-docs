---
title: Stripe Server Notifications
slug: stripe-server-notifications
excerpt: Sending Stripe server notifications to RevenueCat
hidden: false
metadata:
  title: Stripe server notifications – RevenueCat
  description: RevenueCat does not require server notifications from Stripe, however
    doing so can speed up webhook and integration delivery times and reduce lag time
    for Charts.
  image:
    0: https://files.readme.io/88e607a-RevenueCat_Docs_OG.png
    1: RevenueCat Docs OG.png
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: '2020-09-29T15:21:50.023Z'
updatedAt: '2023-04-24T16:59:56.932Z'
category: 646582c48cebdb000ba32f10
---
RevenueCat does not require server notifications from Stripe, however doing so can speed up webhook and integration delivery times and reduce lag time for [Charts](doc:charts).

> 🚧 Send Stripe token to RevenueCat
> 
> Stripe Server Notifications only work if the receipt exists in RevenueCat when the event is dispatched from Stripe. If the receipt doesn't exist, the event will fail. This includes test events from Stripe.
> 
> You'll need to follow our [Stripe Web Payments](doc:stripe) guide and send your purchase tokens to RevenueCat before proceeding with this guide.

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/98a0f1c-stripe_notifications.png",
        null,
        "stripe notifications"
      ],
      "align": "center",
      "sizing": "700px",
      "caption": "Required and optional notifications from Stripe"
    }
  ]
}
[/block]

# Setup Instructions

1. Navigate to your **app settings** in the RevenueCat dashboard by selecting your app from **Project Settings > Apps**.
2. Expand the **Webhook Configuration** section and copy the endpoint provided under **Stripe Webhook Endpoint**.

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/85899d3-Screen_Shot_2021-12-01_at_6.01.02_PM.png",
        "Screen Shot 2021-12-01 at 6.01.02 PM.png",
        1778
      ],
      "align": "center",
      "sizing": "80"
    }
  ]
}
[/block]



3. Log in to Stripe and go to the [Webhooks dashboard](https://dashboard.stripe.com/webhooks).
4. Click **Add endpoint**, paste the URL in the **Endpoint URL** field and select the following events:

- customer.subscription.updated
- customer.subscription.deleted
- charge.refunded
- invoice.updated

It's important to only select these events.

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/c1f3542-Screen_Shot_2022-08-08_at_2.24.58_PM.png",
        "Screen Shot 2022-08-08 at 2.24.58 PM.png",
        1518
      ],
      "align": "center",
      "sizing": "80"
    }
  ]
}
[/block]



> 🚧 
> 
> If you choose other events besides what's listed above, our API will respond with an error, and Stripe will eventually disable the webhook.

5. Click **Add endpoint**. You might be asked to enter your password.
6. Copy the **Signing Secret** value and go back to your app settings in the **RevenueCat Dashboard** (select your app under **Project Settings > Apps**).

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/3a87ff5-8db7d64-Screen_Shot_2020-09-23_at_17.44.04.png",
        "8db7d64-Screen_Shot_2020-09-23_at_17.44.04.png",
        2806
      ],
      "align": "center",
      "sizing": "80"
    }
  ]
}
[/block]



7. Paste it in the **Stripe Webhook Secret** input field and save. The input field should now look like this:

![](https://files.readme.io/44eb66c-Screen_Shot_2021-12-01_at_5.57.29_PM.png "Screen Shot 2021-12-01 at 5.57.29 PM.png")



# Stripe Webhook 400 Errors

Sometimes you may experience 400 errors when connecting to Stripe. Generally these happen when there is something wrong with your configuration or your Stripe account is not properly connected to RevenueCat.

**Configuration**

Two common configuration errors are with events and the webhook secret.  
One webhook endpoint should contain all of the events, not one endpoint per event, and the only events supported are those listed above in step 4. The Stripe Webhook Secret should be properly set in your RevenueCat project settings in the Stripe Webhook Secret field. If this field is missing or not identical to the secret generated in Stripe, 400 errors will occur.

**Reconnecting Stripe**

When debugging connection issues with Stripe, it may be necessary to reconnect Stripe and RevenueCat. Make sure to use the email that owns RevenueCat project. To reconnect, follow these steps:

1. Disconnect from Stripe in the RevenueCat dashboard
2. Uninstall the app from your Stripe account in the [Stripe Dashboard](https://dashboard.stripe.com/settings/apps/com.revenuecat.customer)
3. In the RevenueCat dashboard, click 'Connect to Stripe'
4. Install the RevenueCat app in the Stripe dashboard
5. Ensure the 'test mode' switch is off in Stripe
6. Click 'Sign in with RevenueCat' in Stripe in the RevenueCat app's settings

> 🚧 
> 
> When reconnecting to Stripe, the webhook secret can change so make sure it is the same in both Stripe and RevenueCat.
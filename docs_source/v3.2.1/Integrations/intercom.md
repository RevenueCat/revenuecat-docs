---
title: "Intercom"
slug: "intercom"
excerpt: "Send in-app subscription events from RevenueCat to Intercom"
hidden: false
metadata: 
  title: "Intercom Integration – RevenueCat"
  description: "RevenueCat can automatically send subscription revenue events to Intercom. This can be helpful in understanding what stage a customer is in to react accordingly. With accurate and up-to-date subscription data in Intercom, you'll be set to turbo charge your customer support."
  image: 
    0: "https://files.readme.io/3bc4845-OG_image.png"
    1: "OG image.png"
    2: 1200
    3: 627
    4: "#e9acb0"
createdAt: {}
updatedAt: "2021-11-17T04:08:19.260Z"
---
[block:callout]
{
  "type": "success",
  "body": "The Intercom integration is available on the [Pro](https://www.revenuecat.com/pricing) plan."
}
[/block]
RevenueCat can automatically send subscription events to Intercom. This can be helpful in understanding what stage a customer is in to react accordingly. For example, you might want to:
- Send an onboarding campaign to a user in a free trial
- Allow customer support grant a [promotional subscription](doc:customers#section-granting-promotional-subscriptions) to a loyal user that experienced issues
- Create Intercom filters for users that cancelled free trials

With accurate and up-to-date subscription data in Intercom, you'll be set to turbo charge your customer support ⚡️

# Events

The Intercom integration tracks the following events:
[block:parameters]
{
  "data": {
    "h-0": "Event",
    "h-1": "Description",
    "0-0": "Initial Purchase",
    "1-0": "Trial Started",
    "2-0": "Trial Converted",
    "3-0": "Trial Cancelled",
    "4-0": "Renewal",
    "5-0": "Cancellation",
    "0-1": "The first purchase of an auto-renewing subscription product that does not contain a free trial.",
    "1-1": "The start of an auto-renewing subscription product free trial.",
    "2-1": "When an auto-renewing subscription product converts from a free trial to normal paid period.",
    "3-1": "When a user turns off renewals for an auto-renewing subscription product during a free trial period.",
    "4-1": "When an auto-renewing subscription product renews OR a user repurchases the auto-renewing subscription product after a lapse in their subscription.",
    "5-1": "When a user turns off renewals for an auto-renewing subscription product during the normal paid period.",
    "7-0": "Expiration",
    "7-1": "A subscription has expired and access should be removed.",
    "8-0": "Billing Issues",
    "8-1": "There has been a problem trying to charge the subscriber. \n \nThis does not mean the subscription has expired (in the case of a grace period enabled).\nSubscription paused    A subscription has been paused.",
    "6-0": "Non Subscription Purchase",
    "6-1": "The purchase of any product that's not an auto-renewing subscription."
  },
  "cols": 2,
  "rows": 9
}
[/block]
# Setup

## 1. Connect with Intercom

Go to [RevenueCat's dashboard](https://app.revenuecat.com) and click the Connect with Intercom button in your app's settings.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/25cc36c-Screen_Shot_2019-01-25_at_1.46.51_PM.png",
        "Screen Shot 2019-01-25 at 1.46.51 PM.png",
        899,
        162,
        "#eff4fa"
      ]
    }
  ]
}
[/block]
## 2. Set Event Names

Once your account is connected, you can configure the event names that we'll send to Intercom. If you leave any field blank, we'll just use our default names.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/3536ce3-Screen_Shot_2021-11-16_at_17.00.46.png",
        "Screen Shot 2021-11-16 at 17.00.46.png",
        847,
        1212,
        "#fafbfb"
      ]
    }
  ]
}
[/block]

[block:callout]
{
  "type": "success",
  "title": "You're all set!",
  "body": "That's all there is to it! You'll now be seeing subscription events in Intercom. Woohoo!"
}
[/block]
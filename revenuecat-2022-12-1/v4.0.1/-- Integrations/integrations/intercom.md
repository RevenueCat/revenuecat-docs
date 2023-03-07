---
title: "Intercom"
slug: "intercom"
excerpt: "Send in-app subscription events from RevenueCat to Intercom"
hidden: false
metadata: 
  title: "Intercom Integration – RevenueCat"
  description: "RevenueCat can automatically send subscription revenue events to Intercom. This can be helpful in understanding what stage a customer is in to react accordingly. With accurate and up-to-date subscription data in Intercom, you'll be set to turbo charge your customer support."
  image: 
    0: "https://files.readme.io/043595f-RevenueCat_Docs_OG.png"
    1: "RevenueCat Docs OG.png"
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: {}
updatedAt: "2023-01-03T23:02:22.737Z"
---
[block:callout]
{
  "type": "success",
  "body": "The Intercom integration is available on the [Pro](https://www.revenuecat.com/pricing) plan."
}
[/block]
Intercom can be a helpful integration tool in understanding what stage a customer is in and reacting accordingly. You can use Intercom’s comprehensive communication and engagement system to retain customers.

With our Intercom integration, you can:
- Create Intercom filters for users that canceled free trials.
- Allow customer support to communicate with loyal users with access to all the information they need to solve their problem or even grant them a promotional subscription.
- Send an onboarding campaign to a user in a free trial

With accurate and up-to-date subscription data in Intercom, you'll be set to turbocharge your customer support ⚡️

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
    "0-1": "A new subscription has been purchased or a lapsed user has resubscribed.",
    "1-1": "The start of an auto-renewing subscription product free trial.",
    "2-1": "When an auto-renewing subscription product converts from a free trial to normal paid period.",
    "3-1": "When a user turns off renewals for an auto-renewing subscription product during a free trial period.",
    "4-1": "When an existing subscription has been renewed.",
    "5-1": "When a user turns off renewals for an auto-renewing subscription product during the normal paid period.",
    "7-0": "Expiration",
    "7-1": "A subscription has expired and access should be removed.",
    "8-0": "Billing Issues",
    "8-1": "There has been a problem trying to charge the subscriber. \n \nThis does not mean the subscription has expired (in the case of a grace period enabled).",
    "6-0": "Non Subscription Purchase",
    "6-1": "The purchase of any product that's not an auto-renewing subscription.",
    "9-0": "Product Change",
    "9-1": "When user has changed the product of their subscription.\n\nThis does not mean the new subscription is in effect immediately. See [Managing Subscriptions](doc:managing-subscriptions) for more details on updates, downgrades, and crossgrades."
  },
  "cols": 2,
  "rows": 10
}
[/block]
# Setup

## 1. Connect with Intercom

1. Navigate to your project in the RevenueCat dashboard and find the *Integrations* card in the left menu. Select **+ New** 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/4e92f6f-Screen_Shot_2021-12-01_at_12.23.10_PM.png",
        "Screen Shot 2021-12-01 at 12.23.10 PM.png",
        332,
        410,
        "#f5f6f5"
      ]
    }
  ]
}
[/block]
2. Choose **Intercom** from the Integrations menu
3. Click the **Connect with Intercom** button in your project settings.
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
        "https://files.readme.io/1046464-intercom.png",
        "intercom.png",
        932,
        1416,
        "#fcfcfc"
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
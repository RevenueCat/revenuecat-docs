---
title: Segment
slug: segment
excerpt: Integrate in-app subscription events from RevenueCat with Segment
hidden: false
metadata:
  title: Segment Integration – RevenueCat
  description: RevenueCat can automatically send subscription events into Segment.
    From there, you pass these events on to any of the hundreds of other integrations
    on their platform. This is useful for tracking all events and revenue that occur
    for your app even if it's not active for a period of time.
  image:
    0: https://files.readme.io/fd03751-RevenueCat_Docs_OG.png
    1: RevenueCat Docs OG.png
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: '2022-11-16T23:59:04.460Z'
updatedAt: '2022-11-16T23:59:04.460Z'
category: 640a7bf1c7bae2004235517b
---
[block:callout]
{
  "type": "success",
  "body": "The Segment integration is available on the [Pro](https://www.revenuecat.com/pricing) plan."
}
[/block]
Segment can be a useful integration tool for seeing all events and revenue that occur for your app even if it’s not active for a period of time. You can use Segment to collect data on customer events to create a single view customer portfolio using an API.

With our Segment integration, you can:
- Create an onboarding flow for users who have subscribed but have not yet engaged with the tutorial or first steps of your product.
- Send personalized messages to users who have free trials that are about to expire.

With accurate and up-to-date subscription data in Segment, you'll be set to turbocharge your user engagement ⚡️

# Events

The Segment integration tracks the following events:
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
    "7-0": "Non Subscription Purchase",
    "0-1": "The first purchase of an auto-renewing subscription product that does not contain a free trial.",
    "1-1": "The start of an auto-renewing subscription product free trial.",
    "2-1": "When an auto-renewing subscription product converts from a free trial to normal paid period.",
    "3-1": "When a user turns off renewals for an auto-renewing subscription product during a free trial period.",
    "4-1": "When an auto-renewing subscription product renews OR a user repurchases the auto-renewing subscription product after a lapse in their subscription.",
    "5-1": "When a user turns off renewals for an auto-renewing subscription product during the normal paid period.",
    "7-1": "The purchase of any product that's not an auto-renewing subscription.",
    "6-0": "Uncancellation",
    "6-1": "When a user re-enables the auto-renew status for a subscription.",
    "8-0": "Subscription paused",
    "8-1": "A subscription has been paused.",
    "9-0": "Expiration",
    "9-1": "A subscription has expired and access should be removed.",
    "10-0": "Billing Issues",
    "10-1": "There has been a problem trying to charge the subscriber. \n \nThis does not mean the subscription has expired (in the case of a grace period enabled).",
    "11-0": "Product Change",
    "11-1": "When user has changed the product of their subscription.\n\nThis does not mean the new subscription is in effect immediately. See [Managing Subscriptions](doc:managing-subscriptions) for more details on updates, downgrades, and crossgrades."
  },
  "cols": 2,
  "rows": 12
}
[/block]
For events that have revenue, such as trial conversions and renewals, RevenueCat will automatically record this amount along with the event in Segment.

# Setup

## 1. Set Segment User Identity

If you're using the Segment SDK, you can set the User ID to match the RevenueCat App User Id. This way, events sent from the Segment SDK and events sent from RevenueCat can be synced to the same user.

Use the `.identify()` method on the Segment SDK to set the same App User Id that is set in RevenueCat.
[block:file]
swift->code_blocks/🔌 Integrations/integrations/segment_1.swift
objectivec->code_blocks/🔌 Integrations/integrations/segment_1.m
java->code_blocks/🔌 Integrations/integrations/segment_1.java
[/block]
## 2. Generate a Segment Write Key

In Segment, add a HTTP API as a source and copy the Write Key.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/4ae883d-Screen_Shot_2019-04-19_at_12.22.24_PM.png",
        "Screen Shot 2019-04-19 at 12.22.24 PM.png",
        1282,
        647,
        "#f5f7f8"
      ]
    }
  ]
}
[/block]

## 3. Send RevenueCat events to Segment

After you've set up the *Purchases SDK* and Segment SDK to have the same user identity, you can "turn on" the integration and configure the event names from the RevenueCat dashboard.

1. Navigate to your project in the RevenueCat dashboard and find the *Integrations* card in the left menu. Select **+ New**  
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/0ec7506-Screen_Shot_2021-12-01_at_12.23.10_PM.png",
        "Screen Shot 2021-12-01 at 12.23.10 PM.png",
        332,
        410,
        "#f5f6f5"
      ]
    }
  ]
}
[/block]
2. Choose **Segment** from the integrations menu.
3. Add your **Segment Write Key** from step 2.
4. Enter the event names that RevenueCat will send or choose the default event names.
5. Select whether you want sales reported as gross revenue (before app store commission), or after store commission and/or estimated taxes.
6. Select whether you want RevenueCat to send sandbox events into Segment or not. You can check the `environment` key in the `context` property of the event to determine if it was triggered in a sandbox or production environment.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/c4d258a-Segment.png",
        "Segment.png",
        1795,
        3299,
        "#fbfcfc"
      ],
      "caption": "Segment configuration screen"
    }
  ]
}
[/block]
# Sample Event
Below is sample JSON that is delivered to Segment for a renewal event.
[block:file]
json->code_blocks/🔌 Integrations/integrations/segment_2.json
[/block]
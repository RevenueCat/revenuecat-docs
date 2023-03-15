---
title: Mixpanel
slug: mixpanel
excerpt: Integrate in-app subscription events from RevenueCat with Mixpanel
hidden: false
metadata:
  title: Mixpanel Integration – RevenueCat
  description: RevenueCat can automatically send subscription events into Mixpanel.
    This is useful for seeing all events and revenue that occur for your app even
    if it's not active for a period of time.
  image:
    0: https://files.readme.io/9eb7e2d-RevenueCat_Docs_OG.png
    1: RevenueCat Docs OG.png
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: '2022-08-19T01:36:58.272Z'
updatedAt: '2022-08-19T01:36:58.272Z'
category: 640a7bf1c7bae2004235517b
---
[block:callout]
{
  "type": "success",
  "body": "The Mixpanel integration is available on the [Pro](https://www.revenuecat.com/pricing) plan."
}
[/block]
Mixpanel can be a useful integration tool for seeing all events and revenue that occur for your app even if it’s not active for a period of time. You can use Mixpanel’s array of product analytical tools to help get new customers, and engage and retain old customers.

With our Mixpanel integration, you can:
- Formulate a data model using interactions between a user and your product. 
- Use interactive reports to understand when a user converts and why.

With accurate and up-to-date subscription data in Mixpanel, you'll be set to turbocharge your product analytics ⚡️

# Events

The Mixpanel integration tracks the following events:
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

For events that have revenue, such as trial conversions and renewals, RevenueCat will automatically record this amount along with the event in Mixpanel.

# Setup

## 1. Set Mixpanel User Identity

If you're using the Mixpanel SDK, you can set the Distinct Id to match the RevenueCat App User Id. This way, events sent from the Mixpanel SDK and events sent from RevenueCat can be synced to the same user.

Use the `.identify()` method on the Mixpanel SDK to set the same App User ID that is set in RevenueCat. 

#### Custom Mixpanel Subscriber Attribute
We recommend keeping the Mixpanel SDK identifier the same as RevenueCat's App User ID as described above. Alternatively, if you want Mixpanel events tied to a different identifier, you can set a subscriber attribute for `$mixpanelDistinctId` that is sent with events instead of RevenueCat's App User ID.

If a user has that subscriber attribute set it will be used instead of the RevenueCat App User ID in the Mixpanel events.
[block:file]
swift->code_blocks/🔌 Integrations/integrations/mixpanel_1.swift
objectivec->code_blocks/🔌 Integrations/integrations/mixpanel_1.m
java->code_blocks/🔌 Integrations/integrations/mixpanel_1.java
[/block]
## 2. Send RevenueCat Events to Mixpanel

After you've set up the *Purchases SDK* and Mixpanel SDK, you can "turn on" the integration and configure the event names from the RevenueCat dashboard.

1. Navigate to your project in the RevenueCat dashboard and find the *Integrations* card in the left menu. Select **+ New** 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/67a8d87-Screen_Shot_2021-12-01_at_12.23.10_PM.png",
        "Screen Shot 2021-12-01 at 12.23.10 PM.png",
        332,
        410,
        "#f5f6f5"
      ]
    }
  ]
}
[/block]
2. Choose *Mixpanel* from the Integrations menu
3. Add your Mixpanel token
4. Enter the event names that RevenueCat will send or choose the default event names
5. Select whether you want sales reported as gross revenue (before app store commission), or after store commission and/or estimated taxes.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/99a68c9-Mixpanel.png",
        "Mixpanel.png",
        1814,
        3892,
        "#fbfcfc"
      ],
      "caption": "Mixpanel configuration screen"
    }
  ]
}
[/block]
# Sample Event
Below is the sample JSON that is delivered to Mixpanel for a renewal event.
[block:file]
json->code_blocks/🔌 Integrations/integrations/mixpanel_2.json
[/block]

[block:file]
json->code_blocks/🔌 Integrations/integrations/mixpanel_3.json
[/block]
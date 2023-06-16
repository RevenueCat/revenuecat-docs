---
title: Mixpanel
slug: mixpanel
excerpt: Integrate in-app subscription events from RevenueCat with Mixpanel
hidden: false
createdAt: '2023-04-27T20:08:03.274Z'
---
> 👍 
> 
> The Mixpanel integration is available on the [Pro](https://www.revenuecat.com/pricing) plan.

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
    "h-1": "Default Event Name",
    "h-2": "Description",
    "h-3": "App Store",
    "h-4": "Play Store",
    "h-5": "Amazon",
    "h-6": "Stripe",
    "h-7": "Promo",
    "0-0": "Initial Purchase",
    "0-1": "rc_initial_purchase_event",
    "0-2": "A new subscription has been purchased or a lapsed user has resubscribed.",
    "0-3": "✅",
    "0-4": "✅",
    "0-5": "✅",
    "0-6": "✅",
    "0-7": "❌",
    "1-0": "Trial Started",
    "1-1": "rc_trial_started_event",
    "1-2": "The start of an auto-renewing subscription product free trial.",
    "1-3": "✅",
    "1-4": "✅",
    "1-5": "✅",
    "1-6": "✅",
    "1-7": "❌",
    "2-0": "Trial Converted",
    "2-1": "rc_trial_converted_event",
    "2-2": "When an auto-renewing subscription product converts from a free trial to normal paid period.",
    "2-3": "✅",
    "2-4": "✅",
    "2-5": "✅",
    "2-6": "✅",
    "2-7": "❌",
    "3-0": "Trial Cancelled",
    "3-1": "rc_trial_cancelled_event",
    "3-2": "When a user turns off renewals for an auto-renewing subscription product during a free trial period.",
    "3-3": "✅",
    "3-4": "✅",
    "3-5": "✅",
    "3-6": "✅",
    "3-7": "❌",
    "4-0": "Renewal",
    "4-1": "rc_renewal_event",
    "4-2": "An existing subscription has been renewed.",
    "4-3": "✅",
    "4-4": "✅",
    "4-5": "✅",
    "4-6": "✅",
    "4-7": "❌",
    "5-0": "Cancellation",
    "5-1": "rc_cancellation_event",
    "5-2": "A subscription or non-renewing purchase has been cancelled. See [cancellation reason](https://www.revenuecat.com/docs/event-types-and-fields#cancellation-and-expiration-reasons)s for more details.",
    "5-3": "✅",
    "5-4": "✅",
    "5-5": "✅",
    "5-6": "✅",
    "5-7": "✅",
    "6-0": "Uncancellation",
    "6-1": "rc_uncancellation_event",
    "6-2": "A non-expired cancelled subscription has been re-enabled.",
    "6-3": "✅",
    "6-4": "✅",
    "6-5": "✅",
    "6-6": "❌",
    "6-7": "❌",
    "7-0": "Non Subscription Purchase",
    "7-1": "rc_non_subscription_purchase_event",
    "7-2": "A customer has made a purchase that will not auto-renew.",
    "7-3": "✅",
    "7-4": "✅",
    "7-5": "✅",
    "7-6": "✅",
    "7-7": "✅",
    "8-0": "Subscription paused",
    "8-1": "rc_subscription_paused_event",
    "8-2": "A subscription has been paused.",
    "8-3": "❌",
    "8-4": "✅",
    "8-5": "❌",
    "8-6": "❌",
    "8-7": "❌",
    "9-0": "Expiration",
    "9-1": "rc_expiration_event",
    "9-2": "A subscription has expired and access should be removed.  \n  \nIf you have [Platform Server Notifications](https://www.revenuecat.com/docs/server-notifications) configured, this event will occur as soon as we are notified (within seconds to minutes) of the expiration.  \n  \nIf you do not have notifications configured, delays may be approximately 1 hour.",
    "9-3": "✅",
    "9-4": "✅",
    "9-5": "✅",
    "9-6": "✅",
    "9-7": "✅",
    "10-0": "Billing Issues",
    "10-1": "rc_billing_issue_event",
    "10-2": "There has been a problem trying to charge the subscriber. This does not mean the subscription has expired.  \n  \nCan be safely ignored if listening to CANCELLATION event + cancel_reason=BILLING_ERROR.",
    "10-3": "✅",
    "10-4": "✅",
    "10-5": "✅",
    "10-6": "✅",
    "10-7": "❌",
    "11-0": "Product Change",
    "11-1": "rc_product_change_event",
    "11-2": "A subscriber has changed the product of their subscription.  \n  \nThis does not mean the new subscription is in effect immediately. See [Managing Subscriptions](https://www.revenuecat.com/docs/managing-subscriptions) for more details on updates, downgrades, and crossgrades.",
    "11-3": "✅",
    "11-4": "✅",
    "11-5": "❌",
    "11-6": "✅",
    "11-7": "❌"
  },
  "cols": 8,
  "rows": 12,
  "align": [
    "left",
    "left",
    "left",
    "left",
    "left",
    "left",
    "left",
    "left"
  ]
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
{"language":"swift","name":"","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/mixpanel_1.swift"}
[/block]
[block:file]
{"language":"objectivec","name":"","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/mixpanel_2.m"}
[/block]
[block:file]
{"language":"java","name":"","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/mixpanel_3.java"}
[/block]



## 2. Send RevenueCat Events to Mixpanel

After you've set up the _Purchases SDK_ and Mixpanel SDK, you can "turn on" the integration and configure the event names from the RevenueCat dashboard.

1. Navigate to your project in the RevenueCat dashboard and find the _Integrations_ card in the left menu. Select **+ New** 

![](https://files.readme.io/d237692-app.revenuecat.com_projects_85ff18c7_collaborators_1.png)

2. Choose _Mixpanel_ from the Integrations menu
3. Add your Mixpanel Project token
4. Enter the event names that RevenueCat will send or choose the default event names
5. Select whether you want sales reported as gross revenue (before app store commission), or after store commission and/or estimated taxes.

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/caa6e26-app.revenuecat.com_projects_85ff18c7_integrations_intercom_1.png",
        null,
        "Mixpanel configuration screen"
      ],
      "align": "center",
      "caption": "Mixpanel configuration screen"
    }
  ]
}
[/block]

# Sample Events

Below are sample JSONs that are delivered to Mixpanel for events.

[block:file]
{"language":"json","name":"Initial Purchase","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/mixpanel_4.json"}
[/block]
[block:file]
{"language":"json","name":"Trial Started","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/mixpanel_5.json"}
[/block]
[block:file]
{"language":"json","name":"Trial Converted","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/mixpanel_6.json"}
[/block]
[block:file]
{"language":"json","name":"Trial Cancelled","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/mixpanel_7.json"}
[/block]
[block:file]
{"language":"json","name":"Renewal","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/mixpanel_8.json"}
[/block]
[block:file]
{"language":"json","name":"Cancellation","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/mixpanel_9.json"}
[/block]
[block:file]
{"language":"json","name":"Non Subscription Purchase","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/mixpanel_10.json"}
[/block]
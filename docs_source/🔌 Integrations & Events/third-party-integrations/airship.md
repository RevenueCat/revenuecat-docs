---
title: Airship
slug: airship
excerpt: Integrate in-app purchase events from RevenueCat with Airship
hidden: false
createdAt: '2021-09-30T01:49:47.596Z'
---
> 👍 
> 
> The Airship integration is available on the [Pro](https://www.revenuecat.com/pricing) plan.

Airship can be a helpful integration tool in understanding what stage a customer is in and reacting accordingly. You can design and trigger personalized Airship messages to customers based on purchase behavior.  

Use your RevenueCat events to send Custom Events to trigger messages with Airship. This means you can design personalized Airship [Journeys](https://docs.airship.com/guides/messaging/user-guide/journeys/about/) and [Automations](https://docs.airship.com/guides/messaging/user-guide/messages/automation/about/) based on purchase behavior.

With our Airship Integration, you can:

- Send a message to a user whose subscription experienced a billing issue.
- Send reminders to your app's message center when a user's trial is about to expire.

With accurate and up-to-date subscription data in Airship, you'll be set to turbocharge your users' engagement ⚡️

# Events

The Airship integration tracks the following events:

[block:parameters]
{
  "data": {
    "h-0": "Event Type",
    "h-1": "Default Event Name",
    "h-2": "Description",
    "h-3": "App Store",
    "h-4": "Play Store",
    "h-5": "Amazon",
    "h-6": "Stripe",
    "h-7": "Promo",
    "0-0": "Initial Purchase",
    "0-1": "`rc_initial_purchase_event`",
    "0-2": "A new subscription has been purchased or a lapsed user has resubscribed.",
    "0-3": "✅",
    "0-4": "✅",
    "0-5": "✅",
    "0-6": "✅",
    "0-7": "❌",
    "1-0": "Trial Started",
    "1-1": "`rc_trial_started_event`",
    "1-2": "The start of an auto-renewing subscription product free trial.",
    "1-3": "✅",
    "1-4": "✅",
    "1-5": "✅",
    "1-6": "✅",
    "1-7": "❌",
    "2-0": "Trial Converted",
    "2-1": "`rc_trial_converted_event`",
    "2-2": "When an auto-renewing subscription product converts from a free trial to normal paid period.",
    "2-3": "✅",
    "2-4": "✅",
    "2-5": "✅",
    "2-6": "✅",
    "2-7": "❌",
    "3-0": "Trial Cancelled",
    "3-1": "`rc_trial_cancelled_event`",
    "3-2": "When a user turns off renewals for an auto-renewing subscription product during a free trial period.",
    "3-3": "✅",
    "3-4": "✅",
    "3-5": "✅",
    "3-6": "✅",
    "3-7": "❌",
    "4-0": "Renewal",
    "4-1": "`rc_renewal_event`",
    "4-2": "An existing subscription has been renewed.",
    "4-3": "✅",
    "4-4": "✅",
    "4-5": "✅",
    "4-6": "✅",
    "4-7": "❌",
    "5-0": "Cancellation",
    "5-1": "`rc_cancellation_event`",
    "5-2": "A subscription or non-renewing purchase has been cancelled. See [cancellation reasons](https://www.revenuecat.com/docs/event-types-and-fields#cancellation-and-expiration-reasons) for more details.",
    "5-3": "✅",
    "5-4": "✅",
    "5-5": "✅",
    "5-6": "✅",
    "5-7": "✅",
    "6-0": "Uncancellation",
    "6-1": "`rc_uncancellation_event`",
    "6-2": "A non-expired cancelled subscription has been re-enabled.",
    "6-3": "✅",
    "6-4": "✅",
    "6-5": "✅",
    "6-6": "❌",
    "6-7": "❌",
    "7-0": "Non Subscription Purchase",
    "7-1": "`rc_non_subscription_purchase_event`",
    "7-2": "A customer has made a purchase that will not auto-renew.",
    "7-3": "✅",
    "7-4": "✅",
    "7-5": "✅",
    "7-6": "✅",
    "7-7": "✅",
    "8-0": "Subscription Paused",
    "8-1": "`rc_subscription_paused_event`",
    "8-2": "A subscription has been paused.",
    "8-3": "❌",
    "8-4": "✅",
    "8-5": "❌",
    "8-6": "❌",
    "8-7": "❌",
    "9-0": "Expiration",
    "9-1": "`rc_expiration_event`",
    "9-2": "A subscription has expired and access should be removed.  \n  \nIf you have [Platform Server Notifications](https://www.revenuecat.com/docs/server-notifications) configured, this event will occur as soon as we are notified (within seconds to minutes) of the expiration.  \n  \nIf you do not have notifications configured, delays may be approximately 1 hour.",
    "9-3": "✅",
    "9-4": "✅",
    "9-5": "✅",
    "9-6": "✅",
    "9-7": "✅",
    "10-0": "Billing Issue",
    "10-1": "`rc_billing_issue_event`",
    "10-2": "There has been a problem trying to charge the subscriber. This does not mean the subscription has expired.  \n  \nCan be safely ignored if listening to CANCELLATION event + cancel_reason=BILLING_ERROR.",
    "10-3": "✅",
    "10-4": "✅",
    "10-5": "✅",
    "10-6": "✅",
    "10-7": "❌",
    "11-0": "Product Change",
    "11-1": "`rc_product_change_event`",
    "11-2": "A subscriber has changed the product of their subscription.  \n  \nThis does not mean the new subscription is in effect immediately. See [Managing Subscriptions](doc:managing-subscriptions) for more details on updates, downgrades, and crossgrades.",
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

For events that have revenue, such as trial conversions and renewals, RevenueCat will automatically record this amount along with the event in Airship.

# Setup

## 1. Set Airship User Identity

If you're using the Airship SDK, you can either send the channel ID to RevenueCat or set an Airship Named User to match the RevenueCat app user ID. The preferred method is to send the channel ID to RevenueCat. Either method you use will allow events sent from the Airship SDK and events sent from RevenueCat to be synced to the same user.

### Set Airship User Identity Using Channel ID

Setting the Airship channel ID in RevenueCat is the preferred way for identifying users in Airship. Call `setAirshipChannelID` on the Purchases SDK to have RevenueCat use the channel ID to send events to Airship.

[block:file]
{"language":"swift","name":"","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/airship_1.swift"}
[/block]
[block:file]
{"language":"objectivec","name":"","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/airship_2.m"}
[/block]
[block:file]
{"language":"kotlin","name":"","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/airship_3.kt"}
[/block]
[block:file]
{"language":"java","name":"","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/airship_4.java"}
[/block]



### [Advanced Alternative] Set Airship User Identity Using Named Users

**Setting the Airship channel ID in RevenueCat is preferred over using Named Users, even if you have a user authentication system.** However, if you're already using Named Users in your Airship integration, you have the option to set the Named User in the Airship SDK as the same app user ID as RevenueCat. Ensure [Named Users is enabled in your Airship dashboard](https://docs.airship.com/guides/messaging/user-guide/project/enable-features/#named-users).

[block:file]
{"language":"swift","name":"","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/airship_5.swift"}
[/block]
[block:file]
{"language":"objectivec","name":"","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/airship_6.m"}
[/block]
[block:file]
{"language":"kotlin","name":"","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/airship_7.kt"}
[/block]
[block:file]
{"language":"java","name":"","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/airship_8.java"}
[/block]



## 2. Send RevenueCat Events to Airship

After you've set up the _Purchase_ SDK and Airship SDK to have the same user identity, you can "turn on" the integration and configure the event names from the RevenueCat dashboard.

1. Navigate to your app in the RevenueCat dashboard and choose 'Airship' from the integrations menu
2. Add your [Airship app key and token](https://docs.airship.com/guides/wallet/user-guide/admin/security/app-keys-secrets/)
3. Select the location of your Airship cloud site
4. Enter the event names that RevenueCat will send or choose the default event names
5. Select whether you want sales reported as gross revenue (before app store commission), or after store commission and/or estimated taxes.

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/fd69e5f-app.revenuecat.com_projects_85ff18c7_integrations_branch_6.png",
        null,
        "Airship configuration page"
      ],
      "align": "center",
      "caption": "Airship configuration page"
    }
  ]
}
[/block]

# Sample Events

Below are sample JSONs that are delivered to Airship for each event type.

[block:file]
{"language":"json","name":"Initial Purchase","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/airship_9.json"}
[/block]
[block:file]
{"language":"json","name":"Trial Started","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/airship_10.json"}
[/block]
[block:file]
{"language":"json","name":"Trial Converted","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/airship_11.json"}
[/block]
[block:file]
{"language":"json","name":"Trial Cancelled","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/airship_12.json"}
[/block]
[block:file]
{"language":"json","name":"Renewal","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/airship_13.json"}
[/block]
[block:file]
{"language":"json","name":"Cancellation","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/airship_14.json"}
[/block]
[block:file]
{"language":"json","name":"Uncancellation","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/airship_15.json"}
[/block]



[block:file]
{"language":"json","name":"Non Subscription Purchase","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/airship_16.json"}
[/block]
[block:file]
{"language":"json","name":"Expiration","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/airship_17.json"}
[/block]
[block:file]
{"language":"json","name":"Billing Issue","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/airship_18.json"}
[/block]
[block:file]
{"language":"json","name":"Product Change","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/airship_19.json"}
[/block]
---
title: Airship
slug: airship
excerpt: Integrate in-app purchase events from RevenueCat with Airship
hidden: false
metadata:
  title: Airship Integration – RevenueCat
  description: RevenueCat can automatically sync subscription events with Airship.
    This is useful for pairing customer lifecycle events and revenue with Airship's
    features.
  image:
    0: https://files.readme.io/62b5dcd-RevenueCat_Docs_OG.png
    1: RevenueCat Docs OG.png
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: '2021-09-30T01:49:47.596Z'
updatedAt: '2023-01-03T22:45:41.831Z'
category: 640a7bf1c7bae2004235517b
---
[block:callout]
{
  "type": "success",
  "body": "The Airship integration is available on the [Pro](https://www.revenuecat.com/pricing) plan."
}
[/block]
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
    "h-2": "Description",
    "0-0": "Initial Purchase",
    "1-0": "Trial Started",
    "2-0": "Trial Converted",
    "3-0": "Trial Cancelled",
    "4-0": "Renewal",
    "5-0": "Cancellation",
    "7-0": "Non Subscription Purchase",
    "0-2": "A new subscription has been purchased or a lapsed user has resubscribed.",
    "1-2": "The start of an auto-renewing subscription product free trial.",
    "2-2": "When an auto-renewing subscription product converts from a free trial to normal paid period.",
    "3-2": "When a user turns off renewals for an auto-renewing subscription product during a free trial period.",
    "4-2": "An existing subscription has been renewed.",
    "5-2": "When a user turns off renewals for an auto-renewing subscription product during the normal paid period.",
    "7-2": "The purchase of any product that's not an auto-renewing subscription.",
    "6-0": "Uncancellation",
    "6-2": "When a user re-enables the auto-renew status for a subscription.",
    "8-0": "Subscription Paused",
    "8-2": "When a subscription is paused. Available for Google Play subscriptions only.",
    "9-0": "Expiration",
    "9-2": "When a subscription expires.",
    "10-0": "Billing Issue",
    "10-2": "When a billing issue is detected.",
    "h-1": "Default Event Name",
    "0-1": "`rc_initial_purchase_event`",
    "1-1": "`rc_trial_started_event`",
    "2-1": "`rc_trial_converted_event`",
    "3-1": "`rc_trial_cancelled_event`",
    "4-1": "`rc_renewal_event`",
    "5-1": "`rc_cancellation_event`",
    "6-1": "`rc_uncancellation_event`",
    "7-1": "`rc_non_subscription_purchase_event`",
    "8-1": "`rc_subscription_paused_event`",
    "9-1": "`rc_expiration_event`",
    "10-1": "`rc_billing_issue_event`",
    "11-0": "Product Change",
    "11-1": "`rc_product_change_event`",
    "11-2": "When user has changed the product of their subscription.\n\nThis does not mean the new subscription is in effect immediately. See [Managing Subscriptions](doc:managing-subscriptions) for more details on updates, downgrades, and crossgrades."
  },
  "cols": 3,
  "rows": 12
}
[/block]

For events that have revenue, such as trial conversions and renewals, RevenueCat will automatically record this amount along with the event in Airship.

# Setup

## 1. Set Airship User Identity

If you're using the Airship SDK, you can either send the channel ID to RevenueCat or set an Airship Named User to match the RevenueCat app user ID. The preferred method is to send the channel ID to RevenueCat. Either method you use will allow events sent from the Airship SDK and events sent from RevenueCat to be synced to the same user.

### Set Airship User Identity Using Channel ID

Setting the Airship channel ID in RevenueCat is the preferred way for identifying users in Airship. Call `setAirshipChannelID` on the Purchases SDK to have RevenueCat use the channel ID to send events to Airship.
[block:file]
swift->code_blocks/🔌 Integrations/integrations/airship_1.swift
objectivec->code_blocks/🔌 Integrations/integrations/airship_1.m
kotlin->code_blocks/🔌 Integrations/integrations/airship_1.kt
java->code_blocks/🔌 Integrations/integrations/airship_1.java
[/block]
### [Advanced Alternative] Set Airship User Identity Using Named Users

**Setting the Airship channel ID in RevenueCat is preferred over using Named Users, even if you have a user authentication system.** However, if you're already using Named Users in your Airship integration, you have the option to set the Named User in the Airship SDK as the same app user ID as RevenueCat. Ensure [Named Users is enabled in your Airship dashboard](https://docs.airship.com/guides/messaging/user-guide/project/enable-features/#named-users).
[block:file]
swift->code_blocks/🔌 Integrations/integrations/airship_2.swift
objectivec->code_blocks/🔌 Integrations/integrations/airship_2.m
kotlin->code_blocks/🔌 Integrations/integrations/airship_2.kt
java->code_blocks/🔌 Integrations/integrations/airship_2.java
[/block]
## 2. Send RevenueCat Events to Airship

After you've set up the *Purchase* SDK and Airship SDK to have the same user identity, you can "turn on" the integration and configure the event names from the RevenueCat dashboard.

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
        "https://files.readme.io/bdf76ec-Airship.png",
        "Airship.png",
        1793,
        4213,
        "#fcfcfc"
      ],
      "caption": "Airship configuration page"
    }
  ]
}
[/block]
# Sample Events
Below are sample JSONs that are delivered to Airship for each event type.
[block:file]
json->code_blocks/🔌 Integrations/integrations/airship_3.json
[/block]
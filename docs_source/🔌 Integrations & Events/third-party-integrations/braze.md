---
title: Braze
slug: braze
excerpt: Integrate in-app subscription events from RevenueCat with Braze
hidden: false
---
> 👍 
> 
> The Braze integration is available to all users signed up after September '23, the legacy Grow and Pro plans, and Enterprise plans. If you're on a legacy Free or Starter plan and want to access this integration, migrate to our new pricing via your [billing settings](https://app.revenuecat.com/settings/billing).

Braze can be a helpful integration tool in understanding what stage a customer is in and reacting accordingly. Using Braze can help you to create content that understands the context of your customers and their actions. 

With our Braze integration, you can:

- Send an onboarding campaign to a user towards the end of their free trial.
- Allow customer support to grant a promotional subscription to a loyal user that experience issues.
- Send campaigns to users who canceled their subscription or didn’t pursue after their free trial.

With accurate and up-to-date subscription data in Braze, you'll be set to turbocharge your campaigns ⚡️

## Integration at a Glance
| Includes Revenue | Supports Negative Revenue |  Sends Sandbox Events | Includes Subscriber Attributes | Sends Transfer Events |                                     Optional Event Types                                     |
|:----------------:|:-------------------------:|:---------------------:|:------------------------------:|:---------------------:|:---------------------------------------------------------------------------------------:|
|         ✅        |             ✅             | Requires API key |    Reserved Attributes Only    |           ❌           | uncancellation_event<br>expiration_event<br>billing_issue_event<br>product_change_event |

# Events

The Braze integration tracks the following events:

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
    "0-2": "A new subscription has been purchased.",
    "0-3": "✅",
    "0-4": "✅",
    "0-5": "✅",
    "0-6": "✅",
    "0-7": "❌",
    "1-0": "Trial Started",
    "1-1": "rc_trial_started_event",
    "1-2": "The start of an auto-renewing subscription product free trial",
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
    "4-2": "An existing subscription has been renewed or a lapsed user has resubscribed.",
    "4-3": "✅",
    "4-4": "✅",
    "4-5": "✅",
    "4-6": "✅",
    "4-7": "❌",
    "5-0": "Cancellation",
    "5-1": "rc_cancellation_event",
    "5-2": "A subscription or non-renewing purchase has been cancelled. See [cancellation reasons](https://www.revenuecat.com/docs/event-types-and-fields#cancellation-and-expiration-reasons) for more details.",
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
    "11-7": "❌",
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

For events that have revenue, such as trial conversions and renewals, RevenueCat will automatically record this amount along with the event in Braze.

RevenueCat subscriber attributes will be dispatched to Braze with the events detailed above and will populate in Braze's [custom attributes](https://www.braze.com/docs/user_guide/data_and_analytics/custom_data/custom_attributes/) for a customer as `rc_customer_attribute_*` (where `*` is replaced by the attribute name) and the value is set to that key (e.g: `rc_customer_attribute_naps_logged: "123”`). If you are setting the optional Braze User Alias Object fields in RevenueCat, these subscriber attributes will be filtered out from the collection before we dispatch the custom attributes to Braze. 

RevenueCat will also send your customer's active entitlement ID(s) as an array of `rc_active_entitlement_ids`.

# Setup

## 1. Set Braze User Identity

If you're using the Braze SDK, you can set the User Id to match the RevenueCat App User Id. This way, events sent from the Braze SDK and events sent from RevenueCat can be synced to the same user.

Configure the Braze SDK with the same App User Id as RevenueCat or use the `.changeUser()` method on the Braze SDK.

[block:file]
[
  {
    "language": "swift",
    "name": "",
    "file": "code_blocks/🔌 Integrations & Events/third-party-integrations/braze_1.swift"
  },
  {
    "language": "objectivec",
    "name": "",
    "file": "code_blocks/🔌 Integrations & Events/third-party-integrations/braze_2.m"
  },
  {
    "language": "java",
    "name": "",
    "file": "code_blocks/🔌 Integrations & Events/third-party-integrations/braze_3.java"
  }
]
[/block]



## (Optional) Send User Alias Object fields to RevenueCat

If you are looking to send an alternative unique user identifier that is different than your App User ID, update users with the below data as [Subscriber Attributes](doc:subscriber-attributes).

| Key                | Description                                                                                                       |
| :----------------- | :---------------------------------------------------------------------------------------------------------------- |
| `$brazeAliasName`  | The Braze 'alias_name' in [User Alias Object](https://www.braze.com/docs/api/objects_filters/user_alias_object/)  |
| `$brazeAliasLabel` | The Braze 'alias_label' in [User Alias Object](https://www.braze.com/docs/api/objects_filters/user_alias_object/) |

Both attributes are required for the [User Alias Object](https://www.braze.com/docs/api/objects_filters/user_alias_object/) to be sent alongside your event data. These properties can be set and removed manually, like any other [Subscriber Attribute](doc:subscriber-attributes). 

RevenueCat will always use the User Alias Object to identify events into Braze, if set, as opposed to the RevenueCat App User ID.

> ❗️ Remove any client-side purchase tracking
> 
> Make sure to remove all client-side tracking of revenue. Since RevenueCat will be sending events for all revenue actions, tracking purchases with the Braze SDK directly can lead to double counting of revenue in Braze.

## 2. Send RevenueCat Events to Braze

After you've set up the _Purchases SDK_ and Braze SDK to have the same user identity, you can "turn on" the integration and configure the event names from the RevenueCat dashboard.

1. Navigate to your project in the RevenueCat dashboard and find the _Integrations_ card in the left menu. Select **+ New** 

![](https://files.readme.io/cf5de31-app.revenuecat.com_projects_85ff18c7_collaborators_1.png)

2. Choose **Braze** from the Integrations menu
3. Add your Braze instance and API key
4. Enter the event names that RevenueCat will send or choose the default event names
5. Select whether you want sales reported as gross revenue (before app store commission), or after store commission and/or estimated taxes.

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/b4afeec-app.revenuecat.com_projects_85ff18c7_integrations_branch_8.png",
        null,
        "Braze configuration page"
      ],
      "align": "center",
      "caption": "Braze configuration page"
    }
  ]
}
[/block]

# Sample events

Below are sample JSONs that are delivered to Braze for most events.

[block:file]
[
  {
    "language": "json",
    "name": "Initial Purchase",
    "file": "code_blocks/🔌 Integrations & Events/third-party-integrations/braze_4.json"
  },
  {
    "language": "json",
    "name": "Trial Started",
    "file": "code_blocks/🔌 Integrations & Events/third-party-integrations/braze_5.json"
  },
  {
    "language": "json",
    "name": "Trial Converted",
    "file": "code_blocks/🔌 Integrations & Events/third-party-integrations/braze_6.json"
  },
  {
    "language": "json",
    "name": "Trial Cancelled",
    "file": "code_blocks/🔌 Integrations & Events/third-party-integrations/braze_7.json"
  },
  {
    "language": "json",
    "name": "Renewal",
    "file": "code_blocks/🔌 Integrations & Events/third-party-integrations/braze_8.json"
  }
]
[/block]



[block:file]
[
  {
    "language": "json",
    "name": "Cancellation",
    "file": "code_blocks/🔌 Integrations & Events/third-party-integrations/braze_9.json"
  },
  {
    "language": "json",
    "name": "Non Subscription Purchase",
    "file": "code_blocks/🔌 Integrations & Events/third-party-integrations/braze_10.json"
  },
  {
    "language": "json",
    "name": "Expiration",
    "file": "code_blocks/🔌 Integrations & Events/third-party-integrations/braze_11.json"
  },
  {
    "language": "json",
    "name": "Billing Issues",
    "file": "code_blocks/🔌 Integrations & Events/third-party-integrations/braze_12.json"
  },
  {
    "language": "json",
    "name": "Product Change",
    "file": "code_blocks/🔌 Integrations & Events/third-party-integrations/braze_13.json"
  }
]
[/block]

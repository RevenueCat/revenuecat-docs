---
title: Intercom
slug: intercom
excerpt: Send in-app subscription events from RevenueCat to Intercom
hidden: false
---
> 👍 
> 
> The Intercom integration is available to all users signed up after September '23, the legacy Grow and Pro plans, and Enterprise plans. If you're on a legacy Free or Starter plan and want to access this integration, migrate to our new pricing via your [billing settings](https://app.revenuecat.com/settings/billing).

Intercom can be a helpful integration tool in understanding what stage a customer is in and reacting accordingly. You can use Intercom’s comprehensive communication and engagement system to retain customers.

With our Intercom integration, you can:

- Create Intercom filters for users that canceled free trials.
- Allow customer support to communicate with loyal users with access to all the information they need to solve their problem or even grant them a promotional subscription.
- Send an onboarding campaign to a user in a free trial

With accurate and up-to-date subscription data in Intercom, you'll be set to turbocharge your customer support ⚡️

## Integration at a Glance
| Includes Revenue | Supports Negative Revenue |       Sends Sandbox Events       | Includes Subscriber Attributes | Sends Transfer Events |                                         Optional Event Types                                        |
|:----------------:|:-------------------------:|:--------------------------------:|:------------------------------:|:---------------------:|:----------------------------------------------------------------------------------------------:|
|         ❌        |             ❌             | Toggle on in Settings |                ❌               |           ❌           | non_subscription_purchase_event<br>expiration_event<br>billing_issue_event<br>product_change_event |

# Events

The Intercom integration tracks the following events:

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
    "6-0": "Non Subscription Purchase",
    "6-1": "rc_non_subscription_purchase_event",
    "6-2": "A customer has made a purchase that will not auto-renew.",
    "6-3": "✅",
    "6-4": "✅",
    "6-5": "✅",
    "6-6": "✅",
    "6-7": "✅",
    "7-0": "Expiration",
    "7-1": "rc_expiration_event",
    "7-2": "A subscription has expired and access should be removed.  \n  \nIf you have [Platform Server Notifications](https://www.revenuecat.com/docs/server-notifications) configured, this event will occur as soon as we are notified (within seconds to minutes) of the expiration.  \n  \nIf you do not have notifications configured, delays may be approximately 1 hour.",
    "7-3": "✅",
    "7-4": "✅",
    "7-5": "✅",
    "7-6": "✅",
    "7-7": "✅",
    "8-0": "Billing Issue",
    "8-1": "rc_billing_issue_event",
    "8-2": "There has been a problem trying to charge the subscriber. This does not mean the subscription has expired.  \n  \nCan be safely ignored if listening to CANCELLATION event + cancel_reason=BILLING_ERROR.",
    "8-3": "✅",
    "8-4": "✅",
    "8-5": "✅",
    "8-6": "✅",
    "8-7": "❌",
    "9-0": "Product Change",
    "9-1": "rc_product_change_event",
    "9-2": "rc_product_change_event\tA subscriber has changed the product of their subscription.  \n  \nThis does not mean the new subscription is in effect immediately. See [Managing Subscriptions](https://www.revenuecat.com/docs/managing-subscriptions) for more details on updates, downgrades, and crossgrades.",
    "9-3": "✅",
    "9-4": "✅",
    "9-5": "❌",
    "9-6": "✅",
    "9-7": "❌"
  },
  "cols": 8,
  "rows": 10,
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

# Setup

## 1. Connect with Intercom

1. Navigate to your project in the RevenueCat dashboard and find the _Integrations_ card in the left menu. Select **+ New** 

![](https://files.readme.io/29eadd0-app.revenuecat.com_projects_85ff18c7_collaborators_1.png)

2. Choose **Intercom** from the Integrations menu
3. Click the **Connect with Intercom** button in your project settings.

![](https://files.readme.io/25cc36c-Screen_Shot_2019-01-25_at_1.46.51_PM.png "Screen Shot 2019-01-25 at 1.46.51 PM.png")

## 2. Set Event Names

Once your account is connected, you can configure the event names that we'll send to Intercom. If you leave any field blank, we'll just use our default names.

![](https://files.readme.io/1046464-intercom.png "intercom.png")

> 👍 You're all set!
> 
> That's all there is to it! You'll now be seeing subscription events in Intercom. Woohoo!

## Sample Events

Below are sample JSONs that are delivered to Intercom for each event.

[block:file]
[
  {
    "language": "json",
    "name": "Initial Purchase",
    "file": "code_blocks/🔌 Integrations & Events/third-party-integrations/intercom_1.json"
  },
  {
    "language": "json",
    "name": "Trial Started",
    "file": "code_blocks/🔌 Integrations & Events/third-party-integrations/intercom_2.json"
  },
  {
    "language": "json",
    "name": "Trial Converted",
    "file": "code_blocks/🔌 Integrations & Events/third-party-integrations/intercom_3.json"
  },
  {
    "language": "json",
    "name": "Trial Cancelled",
    "file": "code_blocks/🔌 Integrations & Events/third-party-integrations/intercom_4.json"
  },
  {
    "language": "json",
    "name": "Renewal",
    "file": "code_blocks/🔌 Integrations & Events/third-party-integrations/intercom_5.json"
  },
  {
    "language": "json",
    "name": "Cancellation",
    "file": "code_blocks/🔌 Integrations & Events/third-party-integrations/intercom_6.json"
  },
  {
    "language": "json",
    "name": "Non Subscription Purchase",
    "file": "code_blocks/🔌 Integrations & Events/third-party-integrations/intercom_7.json"
  },
  {
    "language": "json",
    "name": "Expiration",
    "file": "code_blocks/🔌 Integrations & Events/third-party-integrations/intercom_8.json"
  }
]
[/block]

# Subscription Status Attribute

> 📘 Intercom API V2
> 
> If you created your Intercom integration before February 2024, you may be using the Intercom API V1. If so, you'll need 
> to upgrade to API V2 to receive the `subscription_status` attribute. You can upgrade from your Intercom integration page in RevenueCat.


Whenever RevenueCat sends an event to Intercom, we'll send a `subscription_status` user custom attribute with any applicable changes, using one of the following values:

| Status              | Description                                                                                                                        |
| :------------------ | :--------------------------------------------------------------------------------------------------------------------------------- |
| active              | The customer has an active, paid subscription which is set to renew at their next renewal date.                                    |
| intro               | The customer has an active, paid subscription through a paid introductory offer.                                                   |
| cancelled           | The customer has a paid subscription which is set to expire at their next renewal date.                                            |
| grace_period        | The customer has a paid subscription which has entered a grace period after failing to renew successfully.                         |
| trial               | The customer is in a trial period which is set to convert to paid at the end of their trial period.                                |
| cancelled_trial     | The customer is in a trial period which is set to expire at the end of their trial period.                                         |
| grace_period_trial  | The customer was in a trial period and has now entered a grace period after failing to renew successfully.                         |
| expired             | The customer's subscription has expired.                                                                                           |
| promotional         | The customer has access to an entitlement through a granted RevenueCat promotional subscription.                                   |
| expired_promotional | The customer previously had access to an entitlement through a granted RevenueCat promotional subscription that has since expired. |
| paused              | The customer has a paid subscription which has been paused and is set to resume at some future date.       

For customers with multiple active subscriptions, this attribute will represent the status of only the subscription for which the most recent event occurred.

Please note that since this attribute is set and updated when events are delivered, subscribers with events prior to our release of this attribute (during January 2024) will not have this attribute set until/unless a future event (renewal, cancellation, etc) occurs.


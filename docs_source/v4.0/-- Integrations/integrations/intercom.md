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
updatedAt: "2023-02-28T00:51:22.111Z"
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
    "h-1": "Default Event Name",
    "0-0": "Initial Purchase",
    "1-0": "Trial Started",
    "2-0": "Trial Converted",
    "3-0": "Trial Cancelled",
    "4-0": "Renewal",
    "5-0": "Cancellation",
    "0-1": "rc_initial_purchase_event",
    "1-1": "rc_trial_started_event",
    "2-1": "rc_trial_converted_event",
    "3-1": "rc_trial_cancelled_event",
    "4-1": "rc_renewal_event",
    "5-1": "rc_cancellation_event",
    "7-0": "Expiration",
    "7-1": "rc_expiration_event",
    "8-0": "Billing Issue",
    "8-1": "rc_billing_issue_event",
    "6-0": "Non Subscription Purchase",
    "6-1": "rc_non_subscription_purchase_event",
    "9-0": "Product Change",
    "9-1": "rc_product_change_event",
    "h-2": "Description",
    "h-3": "App Store",
    "h-4": "Play Store",
    "h-5": "Amazon",
    "h-6": "Web",
    "h-7": "Promo",
    "9-2": "rc_product_change_event\tA subscriber has changed the product of their subscription.\n\nThis does not mean the new subscription is in effect immediately. See [Managing Subscriptions](https://www.revenuecat.com/docs/managing-subscriptions) for more details on updates, downgrades, and crossgrades.",
    "9-3": "✅",
    "9-4": "✅",
    "9-6": "✅",
    "9-5": "❌",
    "9-7": "❌",
    "8-2": "There has been a problem trying to charge the subscriber. This does not mean the subscription has expired.\n\nCan be safely ignored if listening to CANCELLATION event + cancel_reason=BILLING_ERROR.",
    "8-3": "✅",
    "8-4": "✅",
    "8-5": "✅",
    "8-6": "✅",
    "8-7": "❌",
    "7-3": "✅",
    "7-4": "✅",
    "7-5": "✅",
    "7-6": "✅",
    "7-7": "✅",
    "7-2": "A subscription has expired and access should be removed.\n\nIf you have [Platform Server Notifications](https://www.revenuecat.com/docs/server-notifications) configured, this event will occur as soon as we are notified (within seconds to minutes) of the expiration.\n\nIf you do not have notifications configured, delays may be approximately 1 hour.",
    "6-2": "A customer has made a purchase that will not auto-renew.",
    "6-3": "✅",
    "6-4": "✅",
    "6-5": "✅",
    "6-6": "✅",
    "6-7": "✅",
    "5-3": "✅",
    "5-4": "✅",
    "5-5": "✅",
    "5-6": "✅",
    "5-7": "✅",
    "5-2": "A subscription or non-renewing purchase has been cancelled. See [cancellation reasons](https://www.revenuecat.com/docs/webhooks#cancellation-and-expiration-reasons) for more details.",
    "4-2": "An existing subscription has been renewed.",
    "4-3": "✅",
    "4-4": "✅",
    "4-5": "✅",
    "4-6": "✅",
    "4-7": "❌",
    "0-7": "❌",
    "3-7": "✅",
    "2-7": "✅",
    "1-7": "✅",
    "1-6": "✅",
    "0-6": "✅",
    "2-6": "✅",
    "3-6": "✅",
    "2-5": "✅",
    "3-5": "✅",
    "1-5": "✅",
    "0-5": "✅",
    "0-4": "✅",
    "1-4": "✅",
    "2-4": "✅",
    "3-4": "✅",
    "3-3": "✅",
    "2-3": "✅",
    "1-3": "✅",
    "0-3": "✅",
    "3-2": "When a user turns off renewals for an auto-renewing subscription product during a free trial period.",
    "2-2": "When an auto-renewing subscription product converts from a free trial to normal paid period.",
    "1-2": "The start of an auto-renewing subscription product free trial.",
    "0-2": "A new subscription has been purchased or a lapsed user has resubscribed."
  },
  "cols": 8,
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
## Sample Events
Below are sample JSONs that are delivered to Intercom for each event.
[block:code]
{
  "codes": [
    {
      "code": "{\n  \"product_identifier\": \"one_week_premium\",\n  \"app_id\": \"app1234567890\",\n  \"user_payload\": {\n    \"user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n    \"custom_attributes\": {\n      \"latest_store\": \"PLAY_STORE\",\n      \"latest_entitlement\": \"pro\",\n      \"expires_at\": 1663252169\n    }\n  },\n  \"event_payload\": {\n    \"event_name\": \"rc_initial_purchase_event\",\n    \"user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n    \"created_at\": 1662992969,\n    \"metadata\": {\n      \"product_identifier\": \"one_week_premium\",\n      \"entitlement\": \"pro\",\n      \"store\": \"PLAY_STORE\",\n      \"expires_at\": 1663252169\n    }\n  }\n}",
      "language": "json",
      "name": "Initial Purchase"
    },
    {
      "code": "{\n  \"app_id\": \"app1234567890\",\n  \"event_payload\": {\n    \"created_at\": 1662992969,\n    \"event_name\": \"rc_trial_started_event\",\n    \"metadata\": {\n      \"app_id\": \"app1234567890\",\n      \"entitlement\": \"premium\",\n      \"environment\": \"production\",\n      \"expires_at\": 1663252169,\n      \"product_identifier\": \"one_week_premium\",\n      \"store\": \"APP_STORE\"\n    },\n    \"user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n  },\n  \"product_identifier\": \"one_week_premium\",\n  \"user_payload\": {\n    \"custom_attributes\": {\n      \"expires_at\": 1663252169,\n      \"latest_entitlement\": \"premium\",\n      \"latest_store\": \"APP_STORE\"\n    },\n    \"user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n  }\n}",
      "language": "json",
      "name": "Trial Started"
    },
    {
      "code": "{\n  \"app_id\": \"app1234567890\",\n  \"event_payload\": {\n    \"created_at\": 1663021598,\n    \"event_name\": \"rc_trial_converted_event\",\n    \"metadata\": {\n      \"app_id\": \"app1234567890\",\n      \"entitlement\": \"premium\",\n      \"environment\": \"production\",\n      \"expires_at\": 1663626398,\n      \"product_identifier\": \"one_week_premium\",\n      \"store\": \"APP_STORE\"\n    },\n    \"user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n  },\n  \"product_identifier\": \"one_week_premium\",\n  \"user_payload\": {\n    \"custom_attributes\": {\n      \"expires_at\": 1663626398,\n      \"latest_entitlement\": \"premium\",\n      \"latest_store\": \"APP_STORE\"\n    },\n    \"user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n  }\n}",
      "language": "json",
      "name": "Trial Converted"
    },
    {
      "code": "{\n  \"app_id\": \"app1234567890\",\n  \"event_payload\": {\n    \"created_at\": 1662993211,\n    \"event_name\": \"rc_trial_cancelled_event\",\n    \"metadata\": {\n      \"app_id\": \"app1234567890\",\n      \"cancellation_reason\": \"UNSUBSCRIBE\",\n      \"entitlement\": \"premium\",\n      \"environment\": \"production\",\n      \"expires_at\": 1663252169,\n      \"product_identifier\": \"premium_sub\",\n      \"store\": \"APP_STORE\"\n    },\n    \"user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n  },\n  \"product_identifier\": \"premium_sub\",\n  \"user_payload\": {\n    \"custom_attributes\": {\n      \"expires_at\": 1663252169,\n      \"latest_entitlement\": \"premium\",\n      \"latest_store\": \"APP_STORE\"\n    },\n    \"user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n  }\n}",
      "language": "json",
      "name": "Trial Cancelled"
    },
    {
      "code": "{\n  \"app_id\": \"app1234567890\",\n  \"event_payload\": {\n    \"created_at\": 1663021649,\n    \"event_name\": \"rc_renewal_event\",\n    \"metadata\": {\n      \"app_id\": \"app1234567890\",\n      \"entitlement\": \"premium\",\n      \"environment\": \"production\",\n      \"expires_at\": 1663626449,\n      \"product_identifier\": \"one_week_premium\",\n      \"store\": \"APP_STORE\"\n    },\n    \"user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n  },\n  \"product_identifier\": \"one_week_premium\",\n  \"user_payload\": {\n    \"custom_attributes\": {\n      \"expires_at\": 1663626449,\n      \"latest_entitlement\": \"premium\",\n      \"latest_store\": \"APP_STORE\"\n    },\n    \"user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n  }\n}",
      "language": "json",
      "name": "Renewal"
    },
    {
      "code": "{\n  \"app_id\": \"app1234567890\",\n  \"event_payload\": {\n    \"created_at\": 1662993557,\n    \"event_name\": \"rc_cancellation_event\",\n    \"metadata\": {\n      \"app_id\": \"app1234567890\",\n      \"cancellation_reason\": \"UNSUBSCRIBE\",\n      \"entitlement\": \"premium\",\n      \"environment\": \"production\",\n      \"expires_at\": 1663529651,\n      \"product_identifier\": \"one_week_premium\",\n      \"store\": \"APP_STORE\"\n    },\n    \"user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n  },\n  \"product_identifier\": \"one_week_premium\",\n  \"user_payload\": {\n    \"custom_attributes\": {\n      \"expires_at\": 1663529651,\n      \"latest_entitlement\": \"premium\",\n      \"latest_store\": \"APP_STORE\"\n    },\n    \"user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n  }\n}",
      "language": "json",
      "name": "Cancellation"
    },
    {
      "code": "{\n  \"product_identifier\": \"100_tokens\",\n  \"app_id\": \"app1234567890\",\n  \"user_payload\": {\n    \"user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n    \"custom_attributes\": {\n      \"latest_store\": \"PLAY_STORE\",\n      \"latest_entitlement\": null,\n      \"expires_at\": null\n    }\n  },\n  \"event_payload\": {\n    \"event_name\": \"rc_non_subscription_purchase_event\",\n    \"user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n    \"created_at\": 1607569472,\n    \"metadata\": {\n      \"product_identifier\": \"100_tokens\",\n      \"entitlement\": null,\n      \"store\": \"PLAY_STORE\",\n      \"expires_at\": null,\n      \"environment\": \"production\"\n    }\n  }\n}",
      "language": "json",
      "name": "Non Subscription Purchase"
    },
    {
      "code": "{\n  \"product_identifier\": \"one_month_pro\",\n  \"app_id\": \"app1234567890\",\n  \"user_payload\": {\n    \"user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n    \"custom_attributes\": {\n      \"latest_store\": \"APP_STORE\",\n      \"latest_entitlement\": \"pro\",\n      \"expires_at\": 1652444925\n    }\n  },\n  \"event_payload\": {\n    \"event_name\": \"rc_expiration_event\",\n    \"user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n    \"created_at\": 1652444925,\n    \"metadata\": {\n      \"product_identifier\": \"one_month_pro\",\n      \"entitlement\": \"pro\",\n      \"store\": \"APP_STORE\",\n      \"expires_at\": 1652444925,\n      \"environment\": \"production\",\n      \"expiration_reason\": \"UNSUBSCRIBE\"\n    }\n  }\n}",
      "language": "json",
      "name": "Expiration"
    }
  ]
}
[/block]
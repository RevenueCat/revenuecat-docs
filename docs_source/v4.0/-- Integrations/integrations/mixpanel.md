---
title: "Mixpanel"
slug: "mixpanel"
excerpt: "Integrate in-app subscription events from RevenueCat with Mixpanel"
hidden: false
metadata: 
  title: "Mixpanel Integration – RevenueCat"
  description: "RevenueCat can automatically send subscription events into Mixpanel. This is useful for seeing all events and revenue that occur for your app even if it's not active for a period of time."
  image: 
    0: "https://files.readme.io/9eb7e2d-RevenueCat_Docs_OG.png"
    1: "RevenueCat Docs OG.png"
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: {}
updatedAt: "2023-02-28T01:49:13.287Z"
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
    "h-1": "Default Event Name",
    "0-0": "Initial Purchase",
    "1-0": "Trial Started",
    "2-0": "Trial Converted",
    "3-0": "Trial Cancelled",
    "4-0": "Renewal",
    "5-0": "Cancellation",
    "7-0": "Non Subscription Purchase",
    "0-1": "rc_initial_purchase_event",
    "1-1": "rc_trial_started_event",
    "2-1": "rc_trial_converted_event",
    "3-1": "rc_trial_cancelled_event",
    "4-1": "rc_renewal_event",
    "5-1": "rc_cancellation_event",
    "7-1": "rc_non_subscription_purchase_event",
    "6-0": "Uncancellation",
    "6-1": "rc_uncancellation_event",
    "8-0": "Subscription paused",
    "8-1": "rc_subscription_paused_event",
    "9-0": "Expiration",
    "9-1": "rc_expiration_event",
    "10-0": "Billing Issues",
    "10-1": "rc_billing_issue_event",
    "11-0": "Product Change",
    "11-1": "rc_product_change_event",
    "h-2": "Description",
    "h-3": "App Store",
    "h-4": "Play Store",
    "h-5": "Amazon",
    "h-6": "Web",
    "h-7": "Promo",
    "11-3": "✅",
    "11-4": "✅",
    "11-6": "✅",
    "11-5": "❌",
    "11-7": "❌",
    "10-7": "❌",
    "8-7": "❌",
    "8-6": "❌",
    "8-5": "❌",
    "8-3": "❌",
    "6-6": "❌",
    "6-7": "❌",
    "4-7": "❌",
    "0-7": "❌",
    "0-3": "✅",
    "1-3": "✅",
    "2-3": "✅",
    "3-3": "✅",
    "4-3": "✅",
    "5-3": "✅",
    "5-4": "✅",
    "5-5": "✅",
    "5-6": "✅",
    "5-7": "✅",
    "3-7": "✅",
    "2-7": "✅",
    "1-7": "✅",
    "0-6": "✅",
    "1-6": "✅",
    "2-6": "✅",
    "3-6": "✅",
    "4-6": "✅",
    "4-5": "✅",
    "4-4": "✅",
    "3-4": "✅",
    "2-4": "✅",
    "1-4": "✅",
    "0-4": "✅",
    "0-5": "✅",
    "1-5": "✅",
    "2-5": "✅",
    "3-5": "✅",
    "6-5": "✅",
    "6-4": "✅",
    "6-3": "✅",
    "7-3": "✅",
    "8-4": "✅",
    "7-4": "✅",
    "7-5": "✅",
    "7-6": "✅",
    "7-7": "✅",
    "9-7": "✅",
    "9-6": "✅",
    "10-6": "✅",
    "10-5": "✅",
    "9-5": "✅",
    "9-4": "✅",
    "10-4": "✅",
    "10-3": "✅",
    "9-3": "✅",
    "11-2": "A subscriber has changed the product of their subscription.\n\nThis does not mean the new subscription is in effect immediately. See [Managing Subscriptions](https://www.revenuecat.com/docs/managing-subscriptions) for more details on updates, downgrades, and crossgrades.",
    "10-2": "There has been a problem trying to charge the subscriber. This does not mean the subscription has expired.\n\nCan be safely ignored if listening to CANCELLATION event + cancel_reason=BILLING_ERROR.",
    "9-2": "A subscription has expired and access should be removed.\n\nIf you have [Platform Server Notifications](https://www.revenuecat.com/docs/server-notifications) configured, this event will occur as soon as we are notified (within seconds to minutes) of the expiration.\n\nIf you do not have notifications configured, delays may be approximately 1 hour.",
    "8-2": "A subscription has been paused.",
    "7-2": "A customer has made a purchase that will not auto-renew.",
    "6-2": "A non-expired cancelled subscription has been re-enabled.",
    "5-2": "A subscription or non-renewing purchase has been cancelled. See [cancellation reason](https://www.revenuecat.com/docs/webhooks#cancellation-and-expiration-reasons)s for more details.",
    "4-2": "An existing subscription has been renewed.",
    "3-2": "When a user turns off renewals for an auto-renewing subscription product during a free trial period.",
    "2-2": "When an auto-renewing subscription product converts from a free trial to normal paid period.",
    "1-2": "The start of an auto-renewing subscription product free trial.",
    "0-2": "A new subscription has been purchased or a lapsed user has resubscribed."
  },
  "cols": 8,
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
[block:code]
{
  "codes": [
    {
      "code": "Purchases.configure(withAPIKey: \"public_sdk_key\", appUserID: \"my_app_user_id\")\n\n// Option 1: Match Mixpanel's SDK identity to RevenueCat's App User ID\nMixpanel.mainInstance().identify(distinctId: \"my_app_user_id\")\n\n// Option 2: Set different Mixpanel identifier in RevenueCat\nPurchases.shared.attribution.setMixpanelDistinctID(Mixpanel.mainInstance().distinctId)",
      "language": "swift"
    },
    {
      "code": "// Configure Purchases SDK\n[RCPurchases configureWithAPIKey:@\"public_sdk_key\" appUserID:@\"my_app_user_id\"];\n\n// Set App User Id in Mixpanel\n[[Mixpanel sharedInstance] identify:@\"my_app_user_id\"];",
      "language": "objectivec"
    },
    {
      "code": "// Configure Purchases SDK\nPurchases.configure(this, \"public_sdk_key\", \"my_app_user_id\");\n\n// Set App User Id in Mixpanel\nMixpanelAPI mixpanel =\n    MixpanelAPI.getInstance(context, MIXPANEL_TOKEN);\n\nmixpanel.identify(\"my_app_user_id\");",
      "language": "java"
    }
  ]
}
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
# Sample Events
Below are sample JSONs that are delivered to Mixpanel for events.
[block:code]
{
  "codes": [
    {
      "code": "{\n    \"track_event\": {\n        \"event\": \"rc_initial_purchase_event\",\n        \"properties\": {\n            \"distinct_id\": \"12345678-1234-1234-1234-123456789012\",\n            \"token\": \"abCdEFg01HiJklMN2OpQ3RStu4v5\",\n            \"time\": 1541012230,\n            \"revenue\": 4.99,\n            \"product_id\": \"monthly_sub\",\n            \"store\": \"APP_STORE\"\n        }\n    },\n    \"engage_event\": {\n        \"$append\": {\n            \"$transactions\": {\n                \"$time\": 1541012230,\n                \"$amount\": 4.99,\n                \"product_id\": \"monthly_sub\",\n                \"store\": \"APP_STORE\"\n            }\n        },\n        \"$token\": \"abCdEFg01HiJklMN2OpQ3RStu4v5\",\n        \"$distinct_id\": \"12345678-1234-1234-1234-123456789012\"\n    }\n}",
      "language": "json",
      "name": "Initial Purchase"
    },
    {
      "code": "{\n    \"track_event\": {\n        \"event\": \"rc_trial_started_event\",\n        \"properties\": {\n            \"distinct_id\": \"12345678-1234-1234-1234-123456789012\",\n            \"token\": \"abCdEFg01HiJklMN2OpQ3RStu4v5\",\n            \"time\": 1541011312,\n            \"revenue\": 0.0,\n            \"product_id\": \"monthly_sub\",\n            \"store\": \"APP_STORE\"\n        }\n    },\n    \"engage_event\": {\n        \"$append\": {\n            \"$transactions\": {\n                \"$time\": 1541011312,\n                \"$amount\": 0.0,\n                \"product_id\": \"monthly_sub\",\n                \"store\": \"APP_STORE\"\n            }\n        },\n        \"$token\": \"abCdEFg01HiJklMN2OpQ3RStu4v5\",\n        \"$distinct_id\": \"12345678-1234-1234-1234-123456789012\"\n    }\n}",
      "language": "json",
      "name": "Trial Started"
    },
    {
      "code": "{\n    \"track_event\": {\n        \"event\": \"rc_trial_converted_event\",\n        \"properties\": {\n            \"distinct_id\": \"12345678-1234-1234-1234-123456789012\",\n            \"token\": \"abCdEFg01HiJklMN2OpQ3RStu4v5\",\n            \"time\": 1541033435,\n            \"revenue\": 44.99,\n            \"product_id\": \"yearly_sub\",\n            \"store\": \"APP_STORE\"\n        }\n    },\n    \"engage_event\": {\n        \"$append\": {\n            \"$transactions\": {\n                \"$time\": 1541033435,\n                \"$amount\": 44.99,\n                \"product_id\": \"yearly_sub\",\n                \"store\": \"APP_STORE\"\n            }\n        },\n        \"$token\": \"abCdEFg01HiJklMN2OpQ3RStu4v5\",\n        \"$distinct_id\": \"12345678-1234-1234-1234-123456789012\"\n    }\n}",
      "language": "json",
      "name": "Trial Converted"
    },
    {
      "code": "{\n    \"track_event\": {\n        \"event\": \"rc_trial_cancelled_event\",\n        \"properties\": {\n            \"distinct_id\": \"12345678-1234-1234-1234-123456789012\",\n            \"token\": \"abCdEFg01HiJklMN2OpQ3RStu4v5\",\n            \"time\": 1541014060,\n            \"revenue\": 0.0,\n            \"product_id\": \"yearly_sub\",\n            \"store\": \"APP_STORE\"\n        }\n    },\n    \"engage_event\": {\n        \"$append\": {\n            \"$transactions\": {\n                \"$time\": 1541014060,\n                \"$amount\": 0.0,\n                \"product_id\": \"yearly_sub\",\n                \"store\": \"APP_STORE\"\n            }\n        },\n        \"$token\": \"abCdEFg01HiJklMN2OpQ3RStu4v5\",\n        \"$distinct_id\": \"12345678-1234-1234-1234-123456789012\"\n    }\n}",
      "language": "json",
      "name": "Trial Cancelled"
    },
    {
      "code": "{\n    \"track_event\": {\n        \"event\": \"rc_renewal_event\",\n        \"properties\": {\n            \"distinct_id\": \"12345678-1234-1234-1234-123456789012\",\n            \"token\": \"abCdEFg01HiJklMN2OpQ3RStu4v5\",\n            \"time\": 1541026947,\n            \"revenue\": 4.99,\n            \"product_id\": \"monthly_sub\",\n            \"store\": \"APP_STORE\"\n        }\n    },\n    \"engage_event\": {\n        \"$append\": {\n            \"$transactions\": {\n                \"$time\": 1541026947,\n                \"$amount\": 4.99,\n                \"product_id\": \"monthly_sub\",\n                \"store\": \"APP_STORE\"\n            }\n        },\n        \"$token\": \"abCdEFg01HiJklMN2OpQ3RStu4v5\",\n        \"$distinct_id\": \"12345678-1234-1234-1234-123456789012\"\n    }\n}",
      "language": "json",
      "name": "Renewal"
    },
    {
      "code": "{\n    \"track_event\": {\n        \"event\": \"rc_cancellation_event\",\n        \"properties\": {\n            \"distinct_id\": \"12345678-1234-1234-1234-123456789012\",\n            \"token\": \"abCdEFg01HiJklMN2OpQ3RStu4v5\",\n            \"time\": 1552135741,\n            \"revenue\": 0.0,\n            \"product_id\": \"monthly_sub\",\n            \"store\": \"APP_STORE\"\n        }\n    },\n    \"engage_event\": {\n        \"$append\": {\n            \"$transactions\": {\n                \"$time\": \"2022-12-09T12:49:01\",\n                \"$amount\": 0.0,\n                \"product_id\": \"monthly_sub\",\n                \"store\": \"APP_STORE\"\n            }\n        },\n        \"$token\": \"abCdEFg01HiJklMN2OpQ3RStu4v5\",\n        \"$distinct_id\": \"12345678-1234-1234-1234-123456789012\"\n    }\n}",
      "language": "json",
      "name": "Cancellation"
    },
    {
      "code": "{\n    \"track_event\": {\n        \"event\": \"rc_non_subscription_purchase_event\",\n        \"properties\": {\n            \"distinct_id\": \"12345678-1234-1234-1234-123456789012\",\n            \"token\": \"abCdEFg01HiJklMN2OpQ3RStu4v5\",\n            \"time\": 1559530911,\n            \"$insert_id\": \"12345678\",\n            \"revenue\": 4.99,\n            \"product_id\": \"monthly_sub\",\n            \"store\": \"APP_STORE\"\n        }\n    },\n    \"engage_event\": {\n        \"$append\": {\n            \"$transactions\": {\n                \"$time\": \"2022-12-03T03:01:51\",\n                \"$amount\": 4.99,\n                \"product_id\": \"monthly_sub\",\n                \"store\": \"APP_STORE\"\n            }\n        },\n        \"$token\": \"abCdEFg01HiJklMN2OpQ3RStu4v5\",\n        \"$distinct_id\": \"12345678-1234-1234-1234-123456789012\"\n    }\n}",
      "language": "json",
      "name": "Non Subscription Purchase"
    }
  ]
}
[/block]
---
title: "Braze"
slug: "braze"
excerpt: "Integrate in-app subscription events from RevenueCat with Braze"
hidden: false
metadata: 
  title: "Braze Integration – RevenueCat"
  description: "RevenueCat can automatically send subscription revenue events to Braze. This can be helpful in understanding what stage a customer is in to react accordingly. With accurate and up-to-date subscription data in Braze, you'll be set to turbocharge your campaigns."
  image: 
    0: "https://files.readme.io/5b41162-RevenueCat_Docs_OG.png"
    1: "RevenueCat Docs OG.png"
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: {}
updatedAt: "2023-02-27T20:33:34.770Z"
---
[block:callout]
{
  "type": "success",
  "body": "The Braze integration is available on the [Pro](https://www.revenuecat.com/pricing) plan."
}
[/block]
Braze can be a helpful integration tool in understanding what stage a customer is in and reacting accordingly. Using Braze can help you to create content that understands the context of your customers and their actions. 

With our Braze integration, you can:
- Send an onboarding campaign to a user towards the end of their free trial.
- Allow customer support to grant a promotional subscription to a loyal user that experience issues.
- Send campaigns to users who canceled their subscription or didn’t pursue after their free trial.

With accurate and up-to-date subscription data in Braze, you'll be set to turbocharge your campaigns ⚡️

# Events

The Braze integration tracks the following events:
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
    "8-0": "Expiration",
    "8-1": "rc_expiration_event",
    "9-0": "Billing Issues",
    "9-1": "rc_billing_issue_event",
    "10-1": "rc_product_change_event",
    "10-0": "Product Change",
    "6-0": "Uncancellation",
    "6-1": "rc_uncancellation_event",
    "h-2": "Description",
    "h-3": "App Store",
    "h-4": "Play Store",
    "h-5": "Amazon",
    "h-6": "Web",
    "h-7": "Promo",
    "0-2": "A new subscription has been purchased or a lapsed user has resubscribed.",
    "1-2": "The start of an auto-renewing subscription product free trial",
    "2-2": "When an auto-renewing subscription product converts from a free trial to normal paid period.",
    "3-2": "When a user turns off renewals for an auto-renewing subscription product during a free trial period.",
    "4-2": "An existing subscription has been renewed.",
    "5-2": "A subscription or non-renewing purchase has been cancelled. See [cancellation reasons](https://www.revenuecat.com/docs/webhooks#cancellation-and-expiration-reasons) for more details.",
    "6-2": "A non-expired cancelled subscription has been re-enabled.",
    "7-2": "A customer has made a purchase that will not auto-renew.",
    "8-2": "A subscription has expired and access should be removed.\n\nIf you have [Platform Server Notifications](https://www.revenuecat.com/docs/server-notifications) configured, this event will occur as soon as we are notified (within seconds to minutes) of the expiration.\n\nIf you do not have notifications configured, delays may be approximately 1 hour.",
    "9-2": "There has been a problem trying to charge the subscriber. This does not mean the subscription has expired.\n\nCan be safely ignored if listening to CANCELLATION event + cancel_reason=BILLING_ERROR.",
    "10-2": "A subscriber has changed the product of their subscription.\n\nThis does not mean the new subscription is in effect immediately. See [Managing Subscriptions](https://www.revenuecat.com/docs/managing-subscriptions) for more details on updates, downgrades, and crossgrades.",
    "0-3": "✅",
    "1-3": "✅",
    "2-3": "✅",
    "3-3": "✅",
    "4-3": "✅",
    "5-3": "✅",
    "6-3": "✅",
    "7-3": "✅",
    "8-3": "✅",
    "9-3": "✅",
    "10-3": "✅",
    "10-4": "✅",
    "10-6": "✅",
    "10-5": "❌",
    "10-7": "❌",
    "9-7": "❌",
    "9-6": "✅",
    "9-5": "✅",
    "9-4": "✅",
    "8-4": "✅",
    "8-5": "✅",
    "8-6": "✅",
    "8-7": "✅",
    "7-4": "✅",
    "7-5": "✅",
    "7-6": "✅",
    "7-7": "✅",
    "6-4": "✅",
    "6-5": "✅",
    "6-6": "❌",
    "6-7": "❌",
    "4-7": "❌",
    "0-7": "❌",
    "5-4": "✅",
    "5-5": "✅",
    "5-6": "✅",
    "5-7": "✅",
    "4-6": "✅",
    "4-5": "✅",
    "4-4": "✅",
    "3-4": "✅",
    "3-5": "✅",
    "3-6": "✅",
    "3-7": "✅",
    "2-4": "✅",
    "2-5": "✅",
    "2-6": "✅",
    "2-7": "✅",
    "1-7": "✅",
    "1-6": "✅",
    "1-5": "✅",
    "1-4": "✅",
    "0-4": "✅",
    "0-5": "✅",
    "0-6": "✅"
  },
  "cols": 8,
  "rows": 11
}
[/block]

For events that have revenue, such as trial conversions and renewals, RevenueCat will automatically record this amount along with the event in Braze.

RevenueCat subscriber attributes will be dispatched to Braze with the events detailed above and will populate in Braze's [custom attributes](https://www.braze.com/docs/user_guide/data_and_analytics/custom_data/custom_attributes/) for a customer as `rc_customer_attribute_*` (where `*` is replaced by the attribute name) and the value is set to that key (e.g: `rc_customer_attribute_naps_logged: "123”`). If you are setting the optional Braze User Alias Object fields in RevenueCat, these subscriber attributes will be filtered out from the collection before we dispatch the custom attributes to Braze. 

RevenueCat will also send your customer's active entitlement ID(s) as an array of `rc_active_entitlement_ids`.

# Setup

## 1. Set Braze User Identity

If you're using the Braze SDK, you can set the User Id to match the RevenueCat App User Id. This way, events sent from the Braze SDK and events sent from RevenueCat can be synced to the same user.

Configure the Braze SDK with the same App User Id as RevenueCat or use the `.changeUser()` method on the Braze SDK.
[block:code]
{
  "codes": [
    {
      "code": "// Configure Purchases SDK\nPurchases.configure(withAPIKey: \"public_sdk_key\", appUserID: \"my_app_user_id\")\n\n// Change user in Braze SDK\nAppboy.sharedInstance()?.changeUser(\"my_app_user_id\")\n\n// Optional User Alias Object attributes\nPurchases.shared.attribution.setAttributes([\"$brazeAliasName\" : \"name\", \n                             \"$brazeAliasLabel\" : \"label\"])",
      "language": "swift"
    },
    {
      "code": "// Configure Purchases SDK\n[RCPurchases configureWithAPIKey:@\"public_sdk_key\" appUserID:@\"my_app_user_id\"];\n\n// Change user in Braze SDK\n[[Appboy sharedInstance] changeUser:@\"my_app_user_id\"];\n\n// Optional User Alias Object attributes\n[[RCPurchases sharedPurchases] setAttributes:@{\n    @\"$brazeAliasName\": @\"name\",\n    @\"$brazeAliasLabel\": @\"label\"\n}];",
      "language": "objectivec"
    },
    {
      "code": "// Configure Purchases SDK\nPurchases.configure(this, \"public_sdk_key\", \"my_app_user_id\");\n\n// Change user in Braze SDK\nBraze.getInstance(context).changeUser(my_app_user_id);\n\n// Optional User Alias Object attributes\nMap<String, String> attributes = new HashMap<String, String>();\nattributes.put(\"$brazeAliasName\", \"name\");\nattributes.put(\"$brazeAliasLabel\", \"label\");\n\nPurchases.getSharedInstance().setAttributes(attributes);",
      "language": "java"
    }
  ]
}
[/block]

## (Optional) Send User Alias Object fields to RevenueCat

If you are looking to send an alternative unique user identifier that is different than your App User ID, update users with the below data as [Subscriber Attributes](doc:subscriber-attributes).
[block:parameters]
{
  "data": {
    "h-0": "Key",
    "h-1": "Description",
    "h-2": "Required",
    "0-0": "`$brazeAliasName`",
    "1-0": "`$brazeAliasLabel`",
    "0-1": "The Braze 'alias_name' in [User Alias Object](https://www.braze.com/docs/api/objects_filters/user_alias_object/)",
    "1-1": "The Braze 'alias_label' in [User Alias Object](https://www.braze.com/docs/api/objects_filters/user_alias_object/)"
  },
  "cols": 2,
  "rows": 2
}
[/block]
Both attributes are required for the [User Alias Object](https://www.braze.com/docs/api/objects_filters/user_alias_object/) to be sent alongside your event data. These properties can be set and removed manually, like any other [Subscriber Attribute](doc:subscriber-attributes). 

RevenueCat will always use the User Alias Object to identify events into Braze, if set, as opposed to the RevenueCat App User ID.

[block:callout]
{
  "type": "danger",
  "title": "Remove any client-side purchase tracking",
  "body": "Make sure to remove all client-side tracking of revenue. Since RevenueCat will be sending events for all revenue actions, tracking purchases with the Braze SDK directly can lead to double counting of revenue in Braze."
}
[/block]
## 2. Send RevenueCat Events to Braze

After you've set up the *Purchases SDK* and Braze SDK to have the same user identity, you can "turn on" the integration and configure the event names from the RevenueCat dashboard.

1. Navigate to your project in the RevenueCat dashboard and find the *Integrations* card in the left menu. Select **+ New** 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/6054ab0-Screen_Shot_2021-12-01_at_12.23.10_PM.png",
        "Screen Shot 2021-12-01 at 12.23.10 PM.png",
        332,
        410,
        "#f5f6f5"
      ]
    }
  ]
}
[/block]
2. Choose **Braze** from the Integrations menu
3. Add your Braze instance and API key
4. Enter the event names that RevenueCat will send or choose the default event names
5. Select whether you want sales reported as gross revenue (before app store commission), or after store commission and/or estimated taxes.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/ab99087-Screen_Shot_2022-10-25_at_9.25.49_AM.png",
        "Screen Shot 2022-10-25 at 9.25.49 AM.png",
        773,
        1651,
        "#000000"
      ],
      "caption": "Braze configuration page"
    }
  ]
}
[/block]
# Sample events
Below are sample JSONs that are delivered to Braze for most events.
[block:code]
{
  "codes": [
    {
      "code": "{\n    \"events\": [\n        {\n            \"name\": \"rc_initial_purchase_event\",\n            \"time\": \"2022-09-04T18: 06: 21.000000\",\n            \"properties\": {\n                \"product_id\": \"monthly.sub.1\",\n                \"store\": \"APP_STORE\",\n                \"revenue\": 7.99,\n                \"app_id\": \"1234567890\"\n            },\n            \"external_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\"\n        }\n    ]\n}",
      "language": "json",
      "name": "Initial Purchase"
    },
    {
      "code": "{\n    \"events\": [\n        {\n            \"name\": \"rc_trial_started_event\",\n            \"time\": \"2022-09-13T16: 16: 19.000000\",\n            \"properties\": {\n                \"product_id\": \"weekly.sub\",\n                \"store\": \"APP_STORE\",\n                \"revenue\": 0,\n                \"app_id\": \"1234567890\"\n            },\n            \"external_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\"\n        }\n    ]\n}",
      "language": "json",
      "name": "Trial Started"
    },
    {
      "code": "{\n    \"events\": [\n        {\n            \"name\": \"rc_trial_converted_event\",\n            \"time\": \"2022-09-13T16: 16: 39.000000\",\n            \"properties\": {\n                \"product_id\": \"weekly.sub\",\n                \"store\": \"APP_STORE\",\n                \"revenue\": 2.99,\n                \"app_id\": \"1234567890\"\n            },\n            \"external_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\"\n        }\n    ]\n}",
      "language": "json",
      "name": "Trial Converted"
    },
    {
      "code": "{\n    \"events\": [\n        {\n            \"name\": \"rc_trial_cancelled_event\",\n            \"time\": \"2022-09-13T16: 15: 48.000000\",\n            \"properties\": {\n                \"product_id\": \"monthly.sub.1\",\n                \"store\": \"APP_STORE\",\n                \"revenue\": 0,\n                \"cancel_reason\": \"UNSUBSCRIBE\",\n                \"app_id\": \"1234567890\"\n            },\n            \"external_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\"\n        }\n    ]\n}",
      "language": "json",
      "name": "Trial Cancelled"
    },
    {
      "code": "{\n    \"events\": [\n        {\n            \"name\": \"rc_renewal_event\",\n            \"time\": \"2022-09-14T00: 16: 36.000000\",\n            \"properties\": {\n                \"product_id\": \"monthly.sub.1\",\n                \"store\": \"APP_STORE\",\n                \"revenue\": 6.99,\n                \"app_id\": \"1234567890\"\n            },\n            \"external_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\"\n        }\n    ]\n}",
      "language": "json",
      "name": "Renewal"
    }
  ]
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "{\n    \"events\": [\n        {\n            \"name\": \"rc_cancellation_event\",\n            \"time\": \"2022-09-13T16: 15: 19.000000\",\n            \"properties\": {\n                \"product_id\": \"yearly.sub\",\n                \"store\": \"APP_STORE\",\n                \"revenue\": 0,\n                \"cancel_reason\": \"UNSUBSCRIBE\",\n                \"app_id\": \"1234567890\"\n            },\n            \"external_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\"\n        }\n    ]\n}",
      "language": "json",
      "name": "Cancellation"
    },
    {
      "code": "{\n    \"events\": [\n        {\n            \"name\": \"rc_non_subscription_purchase_event\",\n            \"time\": \"2019-01-21T16: 55: 44.000000\",\n            \"properties\": {\n                \"product_id\": \"tokens.pack.100\",\n                \"store\": \"APP_STORE\",\n                \"revenue\": 4.99,\n                \"app_id\": \"1234567890\"\n            },\n            \"external_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\"\n        }\n    ]\n}",
      "language": "json",
      "name": "Non Subscription Purchase"
    },
    {
      "code": "{\n    \"events\": [\n        {\n            \"name\": \"rc_expiration_event\",\n            \"time\": \"2022-09-13T15: 45: 50.000000\",\n            \"properties\": {\n                \"product_id\": \"monthly.sub.1\",\n                \"store\": \"APP_STORE\",\n                \"revenue\": 0,\n                \"expiration_reason\": \"UNSUBSCRIBE\",\n                \"app_id\": \"1234567890\"\n            },\n            \"external_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\"\n        }\n    ]\n}",
      "language": "json",
      "name": "Expiration"
    },
    {
      "code": "{\n    \"events\": [\n        {\n            \"name\": \"rc_billing_issue_event\",\n            \"time\": \"2022-09-13T16: 18: 06.000000\",\n            \"properties\": {\n                \"product_id\": \"yearly,sub\",\n                \"store\": \"PLAY_STORE\",\n                \"revenue\": 0,\n                \"grace_period_expiration_at\": \"2022-09-27T15: 57: 26.000000\",\n                \"app_id\": \"1234567890\"\n            },\n            \"external_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\"\n        }\n    ]\n}",
      "language": "json",
      "name": "Billing Issues"
    },
    {
      "code": "{\n    \"events\": [\n        {\n            \"name\": \"rc_product_change_event\",\n            \"time\": \"2022-06-09T02: 30: 35.000000\",\n            \"properties\": {\n                \"product_id\": \"monthly.sub.1\",\n                \"store\": \"APP_STORE\",\n                \"revenue\": 0.0,\n                \"new_product_id\": \"yearly.sub\"\n            },\n            \"external_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\"\n        }\n    ]\n}",
      "language": "json",
      "name": "Product Change"
    }
  ]
}
[/block]
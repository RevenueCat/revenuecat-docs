---
title: "Amplitude"
slug: "amplitude"
excerpt: "Integrate in-app subscription events from RevenueCat with Amplitude"
hidden: false
metadata: 
  title: "Amplitude Integration – RevenueCat"
  description: "RevenueCat can automatically send subscription revenue events into Amplitude. This is useful for seeing all events and revenue that occur for your app even if it's not active for a period of time. The Amplitude integration tracks the following events:"
  image: 
    0: "https://files.readme.io/2b7bab7-RevenueCat_Docs_OG.png"
    1: "RevenueCat Docs OG.png"
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: {}
updatedAt: "2023-02-21T15:02:02.649Z"
---
[block:callout]
{
  "type": "success",
  "body": "The Amplitude integration is available on the [Pro](https://www.revenuecat.com/pricing) plan."
}
[/block]
Amplitude can be a useful integration tool for seeing all events and revenue that occur for your app even if it’s not active for a period of time. You can use Amplitude’s product analytics to find patterns in customer behavior and inform marketing strategies.

With our Amplitude integration, you can:
- Create a behavioral cohort of customers based on specific actions, such as watching a specific episode of a show after subscribing.  Follow a cohort throughout their lifecycle to realize overarching trends.
- Measure the path of a user from marketing material to the purchase of a subscription. 

With accurate and up-to-date subscription data in Amplitude, you'll be set to turbocharge your product analytics ⚡️

# Events

The Amplitude integration tracks the following events:
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
    "9-0": "Expiration",
    "9-1": "rc_expiration_event",
    "10-0": "Billing Issues",
    "10-1": "rc_billing_issue_event",
    "8-0": "Subscription paused",
    "8-1": "rc_subscription_paused_event",
    "11-0": "Product Change",
    "11-1": "rc_product_change_event",
    "h-2": "Description",
    "11-2": "A subscriber has changed the product of their subscription.\n\nThis does not mean the new subscription is in effect immediately. See [Managing Subscriptions](doc:managing-subscriptions) for more details on updates, downgrades, and crossgrades.",
    "0-2": "A new subscription has been purchased or a lapsed user has resubscribed.",
    "0-3": "✅",
    "0-4": "✅",
    "0-5": "✅",
    "0-6": "✅",
    "0-7": "❌",
    "h-3": "App Store",
    "h-4": "Play Store",
    "h-5": "Amazon",
    "h-6": "Web",
    "h-7": "Promo",
    "1-2": "The start of an auto-renewing subscription product free trial.",
    "2-2": "When an auto-renewing subscription product converts from a free trial to normal paid period.",
    "3-2": "When a user turns off renewals for an auto-renewing subscription product during a free trial period.",
    "1-3": "✅",
    "2-3": "✅",
    "3-3": "✅",
    "3-4": "✅",
    "2-4": "✅",
    "1-4": "✅",
    "1-5": "✅",
    "1-6": "✅",
    "2-6": "✅",
    "2-5": "✅",
    "3-5": "✅",
    "3-6": "✅",
    "3-7": "✅",
    "2-7": "✅",
    "1-7": "✅",
    "4-2": "An existing subscription has been renewed.",
    "4-3": "✅",
    "4-4": "✅",
    "4-5": "✅",
    "4-6": "✅",
    "4-7": "❌",
    "5-2": "A subscription or non-renewing purchase has been cancelled. See [cancellation reasons](https://www.revenuecat.com/docs/webhooks#cancellation-and-expiration-reasons) for more details.",
    "5-3": "✅",
    "5-4": "✅",
    "5-5": "✅",
    "5-6": "✅",
    "5-7": "✅",
    "6-2": "A non-expired cancelled subscription has been re-enabled.",
    "6-3": "✅",
    "6-4": "✅",
    "6-5": "✅",
    "6-6": "❌",
    "6-7": "❌",
    "7-2": "A customer has made a purchase that will not auto-renew.",
    "7-3": "✅",
    "7-4": "✅",
    "7-5": "✅",
    "7-6": "✅",
    "7-7": "✅",
    "8-4": "✅",
    "8-2": "A subscription has been paused.",
    "8-3": "❌",
    "8-5": "❌",
    "8-6": "❌",
    "8-7": "❌",
    "9-2": "A subscription has expired and access should be removed.\n\nIf you have [Platform Server Notifications](https://www.revenuecat.com/docs/server-notifications) configured, this event will occur as soon as we are notified (within seconds to minutes) of the expiration.\n\nIf you do not have notifications configured, delays may be approximately 1 hour.",
    "9-3": "✅",
    "9-4": "✅",
    "9-5": "✅",
    "9-6": "✅",
    "9-7": "✅",
    "10-2": "There has been a problem trying to charge the subscriber. This does not mean the subscription has expired.\n\nCan be safely ignored if listening to CANCELLATION event + cancel_reason=BILLING_ERROR",
    "10-3": "✅",
    "10-4": "✅",
    "10-5": "✅",
    "10-6": "✅",
    "10-7": "❌",
    "11-3": "✅",
    "11-4": "✅",
    "11-6": "✅",
    "11-5": "❌",
    "11-7": "❌"
  },
  "cols": 8,
  "rows": 12
}
[/block]

For events that have revenue, such as trial conversions and renewals, RevenueCat will automatically record this amount along with the event in Amplitude.

# Setup

## 1. Set Amplitude User Identity

If you're using the Amplitude SDK, you can set the User Id to match the RevenueCat App User Id. This way, events sent from the Amplitude SDK and events sent from RevenueCat can be synced to the same user.

Configure the Amplitude SDK with the same App User Id as RevenueCat or use the `.setUserId()` method on the Amplitude SDK.
[block:code]
{
  "codes": [
    {
      "code": "// Configure Purchases SDK\nPurchases.configure(withAPIKey: \"public_sdk_key\", appUserID: \"my_app_user_id\")\n\n// Configure Amplitude SDK\nAmplitude.instance()?.initializeApiKey(\"amplitude_api_key\", userId: \"my_app_user_id\")\n\n// Optional User Alias Object attributes\nPurchases.shared.attribution.setAttributes([\"$amplitudeDeviceId\" : <AMPLITUDE_DEVICE_ID>])",
      "language": "swift"
    },
    {
      "code": "// Configure Purchases SDK\n[RCPurchases configureWithAPIKey:@\"public_sdk_key\" appUserID:@\"my_app_user_id\"];\n\n// Configure Amplitude SDK\n[[Amplitude] instance] initializeApiKey:@\"amplitude_api_key\" userId:@\"my_app_user_id\"];",
      "language": "objectivec"
    },
    {
      "code": "// Configure Purchases SDK\nPurchases.configure(this, \"public_sdk_key\", \"my_app_user_id\");\n\n// Configure Amplitude SDK\nAmplitude.getInstance().initialize(this, \"amplitude_api_key\", \"my_app_user_id\");",
      "language": "java"
    }
  ]
}
[/block]

## (Optional) Send Amplitude User Identifiers to RevenueCat

If your App User ID in RevenueCat is different than the User ID in Amplitude, you can use the Amplitude User ID and/or Amplitude Device ID to identify events by adding a key in [Subscriber Attributes](doc:subscriber-attributes).
[block:parameters]
{
  "data": {
    "h-0": "Key",
    "h-1": "Description",
    "h-2": "Required",
    "0-0": "`$amplitudeDeviceId`",
    "0-1": "The Amplitude [Device ID](https://developers.amplitude.com/docs/http-api-deprecated#keys-for-the-event-argument)",
    "1-0": "`$amplitudeUserId`",
    "1-1": "The Amplitude [User ID] (https://developers.amplitude.com/docs/http-api-deprecated#keys-for-the-event-argument)"
  },
  "cols": 2,
  "rows": 2
}
[/block]
If both keys are present, RevenueCat will send both the User ID and Device ID to identify events into Amplitude. If only one of the keys are present, RevenueCat will only send the available key. If no keys are present, RevenueCat will send the current RevenueCat App User ID. This property can be set and removed manually, like any other [Subscriber Attribute](doc:subscriber-attributes). For more information how Amplitude tracks unique users, view their docs [here](https://help.amplitude.com/hc/en-us/articles/115003135607-Tracking-unique-users).

## 2. Send RevenueCat Events to Amplitude
[block:callout]
{
  "type": "info",
  "title": "Amplitude EU Data Centre",
  "body": "[Contact RevenueCat support](https://app.revenuecat.com/settings/support) to have RevenueCat send data to Amplitude's EU data centre if your Amplitude account is hosted on EU servers."
}
[/block]
After you've set up the *Purchases SDK* and Amplitude SDK to have the same user identity, you can "turn on" the integration and configure the event names from the RevenueCat dashboard.

1. Navigate to your project in the RevenueCat dashboard and find the *Integrations* card in the left menu. Select **+ New** 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/a786ada-Screen_Shot_2021-12-01_at_12.23.10_PM.png",
        "Screen Shot 2021-12-01 at 12.23.10 PM.png",
        332,
        410,
        "#f5f6f5"
      ]
    }
  ]
}
[/block]
2. Choose **Amplitude** from the Integrations menu
3. Add your Amplitude API key
4. Enter the event names that RevenueCat will send or choose the default event names
5. Select whether you want sales reported as gross revenue (before app store commission), or after store commission and/or estimated taxes.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/1c43a25-Amplitude.png",
        "Amplitude.png",
        1811,
        3405,
        "#fbfcfc"
      ],
      "caption": "Amplitude configuration page"
    }
  ]
}
[/block]
# Sample Event
Below are sample JSONs that are delivered to Amplitude for each event type.
[block:code]
{
  "codes": [
    {
      "code": "{\n    \"api_key\": \"yourAmplitudeAPIKey\",\n    \"event\": {\n        \"event_type\": \"rc_initial_purchase_event\",\n        \"partner_id\": \"revenuecat\",\n        \"insert_id\": \"a12bc3d4-e5fg-678h-91i0-j23klmn45678\",\n        \"time\": 1662493499000,\n        \"platform\": \"iOS\",\n        \"revenue\": 7.61,\n        \"productId\": \"rc_subscription_monthly\",\n        \"event_properties\": {\n            \"subscriber_attributes\": {\n                \"$attConsentStatus\": \"denied\", \n                \"$amplitudeDeviceId\": \"123a4b56-7890-12cd-345e-67f90gh1ij1k\"\n            },\n            \"period_type\": \"NORMAL\",\n            \"purchased_at\": \"2022-09-06T19: 44: 59Z\",\n            \"expiration_at\": \"2022-10-06T19: 44: 59Z\",\n            \"environment\": \"PRODUCTION\",\n            \"entitlement_id\": \"pro\",\n            \"entitlement_ids\": [\n                \"pro\"\n            ],\n            \"presented_offering_id\": null,\n            \"transaction_id\": \"123456789012345\",\n            \"original_transaction_id\": \"011223344556677\",\n            \"aliases\": [\n                \"$RCAnonymousID: 121abc123a4abc123123abc123abc1230\"\n            ],\n            \"original_app_user_id\": \"$RCAnonymousID: 1234567890ab1cd1234a55b6c78910a3\",\n            \"store\": \"APP_STORE\",\n            \"app_user_id\": \"$RCAnonymousID: 1234567890ab1cd1234a55b6c78910a3\",\n            \"product_id\": \"rc_subscription_monthly\",\n            \"currency\": \"EUR\",\n            \"revenue\": 7.61,\n            \"app_id\": \"app1234567890\"\n        },\n    \"user_id\": \"$RCAnonymousID: 1234567890ab1cd1234a55b6c78910a3\"\n    }\n}",
      "language": "json",
      "name": "Initial Purchase"
    },
    {
      "code": "{\n    \"api_key\": \"yourAmplitudeAPIKey\",\n    \"event\": {\n        \"event_type \": \"rc_trial_started_event \",\n        \"partner_id \": \"revenuecat \",\n        \"insert_id \": \"a12bc3d4-e5fg-678h-91i0-j23klmn45678\",\n        \"time \": 1662492770000,\n        \"platform \": \"iOS \",\n        \"revenue \": 0,\n        \"productId \": \"rc_subscription_monthly\",\n        \"event_properties \": {\n            \"subscriber_attributes \": {\n                \"$attConsentStatus\": \"denied\", \n                \"$amplitudeDeviceId\": \"123a4b56-7890-12cd-345e-67f90gh1ij1k\"\n            },\n            \"period_type \": \"TRIAL \",\n            \"purchased_at \": \"2022-09-06T19: 32: 50Z \",\n            \"expiration_at \": \"2022-09-09T19: 32: 50Z \",\n            \"environment \": \"PRODUCTION \",\n            \"entitlement_id\": \"pro\",\n            \"entitlement_ids\": [\n                \"pro\"\n            ],\n            \"presented_offering_id \": null,\n            \"transaction_id \": \"123456789012345 \",\n            \"original_transaction_id \": \"011223344556677 \",\n            \"aliases \": [\n                \"$RCAnonymousID: 121abc123a4abc123123abc123abc1230 \"\n            ],\n            \"original_app_user_id \": \"$RCAnonymousID: 1234567890ab1cd1234a55b6c78910a3 \",\n            \"store \": \"APP_STORE \",\n            \"app_user_id \": \"$RCAnonymousID: 1234567890ab1cd1234a55b6c78910a3 \",\n            \"product_id \": \"rc_subscription_monthly\",\n            \"currency \": \"USD\",\n            \"revenue \": 0,\n            \"app_id \": \"app1234567890\"\n        },\n    \"user_id \": \"$RCAnonymousID: 1234567890ab1cd1234a55b6c78910a3\"\n    }\n}",
      "language": "json",
      "name": "Trial Started"
    },
    {
      "code": "{\n  \"api_key\": \"yourAmplitudeAPIKey\",\n  \"event\": {\n    \"event_type\": \"rc_trial_converted_event\",\n    \"partner_id\": \"revenuecat\", \n    \"insert_id\": \"d61ed8b3-d4ed-436e-80b6-a69dabe44855\", \n    \"time\": 1655322275000, \n    \"platform\": \"iOS\", \n    \"revenue\": 139.993, \n    \"productId\": \"rc_3999_1y_1w0\", \n    \"event_properties\": {\n      \"subscriber_attributes\": {\n        \"$attConsentStatus\": \"denied\", \n        \"$amplitudeDeviceId\": \"123a4b56-7890-12cd-345e-67f90gh1ij1k\"\n       }, \n       \"period_type\": \"NORMAL\", \n       \"purchased_at\": \"2022-06-15T19:44:35Z\", \n       \"expiration_at\": \"2022-06-22T19:44:35Z\", \n       \"environment\": \"SANDBOX\", \n       \"entitlement_id\": null, \n       \"entitlement_ids\": [\"premium\"], \n       \"presented_offering_id\": null, \n       \"transaction_id\": \"2000000080909203\", \n       \"original_transaction_id\": \"2000000080909203\", \n       \"aliases\": [\"$RCAnonymousID:e35dd5b6732f4e1aad8c398d635e83e0\"], \n       \"original_app_user_id\": \"$RCAnonymousID:e35dd5b6732f4e1aad8c398d635e83e0\", \n       \"store\": \"APP_STORE\", \n       \"app_user_id\": \"$RCAnonymousID:e35dd5b6732f4e1aad8c398d635e83e0\", \n       \"product_id\": \"rc_3999_1y_1w0\", \n       \"currency\": \"USD\", \n       \"revenue\": 139.993\n      }, \n    \"user_id\": \"$RCAnonymousID:e35dd5b6732f4e1aad8c398d635e83e0\"\"\n  }\n}",
      "language": "json",
      "name": "Trial Conversion"
    },
    {
      "code": "{\n    \"api_key\": \"yourAmplitudeAPIKey\",\n    \"event\": {\n        \"event_type \": \"rc_trial_cancelled_event\",\n        \"partner_id\": \"revenuecat\",\n        \"insert_id\": \"a12bc3d4-e5fg-678h-91i0-j23klmn45678\",\n        \"time\": 1662493279414,\n        \"platform\": \"iOS\",\n        \"revenue\": 0.0,\n        \"productId\": \"rc_subscription_monthly\",\n        \"event_properties\": {\n            \"subscriber_attributes\": {\n                \"$attConsentStatus\": \"denied\", \n                \"$amplitudeDeviceId\": \"123a4b56-7890-12cd-345e-67f90gh1ij1k\"\n            },\n            \"period_type\": \"TRIAL\",\n            \"purchased_at\": \"2022-09-03T19:41:12Z\",\n            \"expiration_at\": \"2022-09-06T19:41:12Z\",\n            \"environment\": \"PRODUCTION\",\n            \"entitlement_id\": null,\n            \"entitlement_ids\": null,\n            \"presented_offering_id\": null,\n            \"transaction_id\": \"123456789012345\",\n            \"original_transaction_id\": \"011223344556677\",\n            \"aliases\": [\n                \"$RCAnonymousID: 121abc123a4abc123123abc123abc1230\"\n            ],\n            \"original_app_user_id\": \"$RCAnonymousID: 1234567890ab1cd1234a55b6c78910a3\",\n            \"store\": \"APP_STORE\",\n            \"app_user_id\": \"$RCAnonymousID: 1234567890ab1cd1234a55b6c78910a3\",\n            \"product_id\": \"rc_subscription_monthly\",\n            \"currency\": \"USD\",\n            \"revenue\": 0.0,\n            \"cancel_reason\": \"BILLING_ERROR\",\n            \"app_id\": \"app1234567890\"\n        },\n        \"user_id\": \"$RCAnonymousID: 1234567890ab1cd1234a55b6c78910a3\"\n    }\n}",
      "language": "json",
      "name": "Trial Cancelled"
    },
    {
      "code": "{\n    \"api_key\": \"yourAmplitudeAPIKey\",\n    \"event\": {\n        \"event_type\": \"rc_renewal_event\",\n        \"partner_id\": \"revenuecat\",\n        \"insert_id\": \"a12bc3d4-e5fg-678h-91i0-j23klmn45678\",\n        \"time\": 1662524551000,\n        \"platform\": \"iOS\",\n        \"revenue\": 6.99,\n        \"productId\": \"rc_subscription_monthly\",\n        \"event_properties\": {\n            \"subscriber_attributes\": {\n                \"$attConsentStatus\": \"denied\", \n                \"$amplitudeDeviceId\": \"123a4b56-7890-12cd-345e-67f90gh1ij1k\"\n            },\n            \"period_type\": \"NORMAL\",\n            \"purchased_at\": \"2022-09-07T04:22:31Z\",\n            \"expiration_at\": \"2022-10-07T04:22:31Z\",\n            \"environment\": \"PRODUCTION\",\n            \"entitlement_id\": \"pro\",\n            \"entitlement_ids\": [\n                \"pro\"\n            ],\n            \"presented_offering_id\": \"standard\",\n            \"transaction_id\": \"123456789012345\",\n            \"original_transaction_id\": \"011223344556677\",\n            \"aliases\": [\n                \"$RCAnonymousID: 121abc123a4abc123123abc123abc1230\"\n            ],\n            \"original_app_user_id\": \"$RCAnonymousID: 1234567890ab1cd1234a55b6c78910a3\",\n            \"store\": \"APP_STORE\",\n            \"app_user_id\": \"$RCAnonymousID: 1234567890ab1cd1234a55b6c78910a3\",\n            \"product_id\": \"rc_subscription_monthly\",\n            \"currency\": \"EUR\",\n            \"revenue\": 6.99,\n            \"app_id\": \"app1234567890\"\n        },\n        \"user_id\": \"$RCAnonymousID: 1234567890ab1cd1234a55b6c78910a3\"\n    }\n}",
      "language": "json",
      "name": "Renewal"
    },
    {
      "code": "{\n    \"api_key\": \"yourAmplitudeAPIKey\",\n    \"event\": {\n        \"event_type\": \"rc_cancellation_event\",\n        \"partner_id\": \"revenuecat\",\n        \"insert_id\": \"a12bc3d4-e5fg-678h-91i0-j23klmn45678\",\n        \"time\": 1662493540346,\n        \"platform\": \"iOS\",\n        \"revenue\": 0.0,\n        \"productId\": \"rc_subscription_monthly\",\n        \"event_properties\": {\n            \"subscriber_attributes\": {\n                \"$attConsentStatus\": \"denied\", \n                \"$amplitudeDeviceId\": \"123a4b56-7890-12cd-345e-67f90gh1ij1k\"\n            },\n            \"period_type\": \"NORMAL\",\n            \"purchased_at\": \"2021-09-06T19:44:47Z\",\n            \"expiration_at\": \"2022-09-06T19:44:47Z\",\n            \"environment\": \"PRODUCTION\",\n            \"entitlement_id\": null,\n            \"entitlement_ids\": null,\n            \"presented_offering_id\": null,\n            \"transaction_id\": \"123456789012345\",\n            \"original_transaction_id\": \"011223344556677\",\n            \"aliases\": [\n                \"$RCAnonymousID: 121abc123a4abc123123abc123abc1230\"\n            ],\n            \"original_app_user_id\": \"$RCAnonymousID: 1234567890ab1cd1234a55b6c78910a3\",\n            \"store\": \"APP_STORE\",\n            \"app_user_id\": \"$RCAnonymousID: 1234567890ab1cd1234a55b6c78910a3\",\n            \"product_id\": \"rc_subscription_monthly\",\n            \"currency\": \"KZT\",\n            \"revenue\": 0.0,\n            \"cancel_reason\": \"BILLING_ERROR\",\n            \"app_id\": \"app1234567890\"\n        },\n        \"user_id\": \"$RCAnonymousID: 1234567890ab1cd1234a55b6c78910a3\"\n    }\n}",
      "language": "json",
      "name": "Cancellation"
    },
    {
      "code": "{\n    \"api_key\": \"yourAmplitudeAPIKey\",\n    \"event\": {\n        \"event_type\": \"rc_uncancellation_event\",\n        \"partner_id\": \"revenuecat\",\n        \"insert_id\": \"a12bc3d4-e5fg-678h-91i0-j23klmn45678\",\n        \"time\": 1663779027932,\n        \"platform\": \"iOS\",\n        \"revenue\": 0.0,\n        \"productId\": \"rc_subscription_monthly\",\n        \"event_properties\": {\n            \"subscriber_attributes\": {\n                \"$attConsentStatus\": \"denied\", \n                \"$amplitudeDeviceId\": \"123a4b56-7890-12cd-345e-67f90gh1ij1k\"\n            },\n            \"period_type\": \"NORMAL\",\n            \"purchased_at\": \"2022-08-24T23:10:10Z\",\n            \"expiration_at\": \"2023-08-24T23:10:10Z\",\n            \"environment\": \"PRODUCTION\",\n            \"entitlement_id\": \"pro\",\n            \"entitlement_ids\": [\n                \"pro\"\n            ],\n            \"presented_offering_id\": \"Subscription\",\n            \"transaction_id\": \"123456789012345\",\n            \"original_transaction_id\": \"011223344556677\",\n            \"aliases\": [\n                \"$RCAnonymousID: 121abc123a4abc123123abc123abc1230\"\n            ],\n            \"original_app_user_id\": \"$RCAnonymousID: 1234567890ab1cd1234a55b6c78910a3\",\n            \"store\": \"APP_STORE\",\n            \"app_user_id\": \"$RCAnonymousID: 1234567890ab1cd1234a55b6c78910a3\",\n            \"product_id\": \"rc_subscription_monthly\",\n            \"currency\": \"EUR\",\n            \"revenue\": 0.0,\n            \"app_id\": \"app1234567890\"\n        },\n    \"user_id\": \"$RCAnonymousID: 1234567890ab1cd1234a55b6c78910a3\"\n    }\n}",
      "language": "json",
      "name": "Uncancellation"
    }
  ]
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "{\n    \"api_key\": \"yourAmplitudeAPIKey\",\n    \"event\": {\n        \"event_type\": \"rc_non_subscription_purchase_event\",\n        \"partner_id\": \"revenuecat\",\n        \"insert_id\": \"a12bc3d4-e5fg-678h-91i0-j23klmn45678\",\n        \"time\": 1662421921000,\n        \"platform\": \"iOS\",\n        \"revenue\": 9.99,\n        \"productId\": \"rc_coins\",\n        \"event_properties\": {\n            \"subscriber_attributes\": {\n                \"$attConsentStatus\": \"denied\", \n                \"$amplitudeDeviceId\": \"123a4b56-7890-12cd-345e-67f90gh1ij1k\"\n            },\n            \"period_type\": \"NORMAL\",\n            \"purchased_at\": \"2022-09-05T23:52:01Z\",\n            \"expiration_at\": null,\n            \"environment\": \"PRODUCTION\",\n            \"entitlement_id\": null,\n            \"entitlement_ids\": null,\n            \"presented_offering_id\": null,\n            \"transaction_id\": \"123456789012345\",\n            \"original_transaction_id\": \"011223344556677\",\n            \"aliases\": [\n                \"$RCAnonymousID: 121abc123a4abc123123abc123abc1230\"\n            ],\n            \"original_app_user_id\": \"$RCAnonymousID: 1234567890ab1cd1234a55b6c78910a3\",\n            \"store\": \"APP_STORE\",\n            \"app_user_id\": \"$RCAnonymousID: 1234567890ab1cd1234a55b6c78910a3\",\n            \"product_id\": \"rc_subscription_monthly\",\n            \"currency\": \"USD\",\n            \"revenue\": 9.99,\n            \"app_id\": \"app1234567890\"\n        },\n    \"user_id\": \"$RCAnonymousID: 1234567890ab1cd1234a55b6c78910a3\"\n    }\n}",
      "language": "json",
      "name": "Non Subscription Purchase"
    },
    {
      "code": "{\n    \"api_key\": \"yourAmplitudeAPIKey\",\n    \"event\": {\n        \"event_type\": \"rc_subscription_paused_event\",\n        \"partner_id\": \"revenuecat\",\n        \"insert_id\": \"a12bc3d4-e5fg-678h-91i0-j23klmn45678\",\n        \"time\": 1663786195063,\n        \"platform\": \"iOS\",\n        \"revenue\": 0.0,\n        \"productId\": \"rc_subscription_monthly\",\n        \"event_properties\": {\n            \"subscriber_attributes\": {\n                \"$attConsentStatus\": \"denied\", \n                \"$amplitudeDeviceId\": \"123a4b56-7890-12cd-345e-67f90gh1ij1k\"\n            },\n            \"period_type\": \"INTRO\",\n            \"purchased_at\": \"2022-09-19T09:07:33Z\",\n            \"expiration_at\": \"2022-09-26T13:07:20Z\",\n            \"environment\": \"PRODUCTION\",\n            \"entitlement_id\": \"pro\",\n            \"entitlement_ids\": [\n                \"pro\"\n            ],\n            \"presented_offering_id\": \"bold_pricing_modal\",\n            \"transaction_id\": \"123456789012345\",\n            \"original_transaction_id\": \"011223344556677\",\n            \"aliases\": [\n                \"$RCAnonymousID: 121abc123a4abc123123abc123abc1230\"\n            ],\n            \"original_app_user_id\": \"$RCAnonymousID: 1234567890ab1cd1234a55b6c78910a3\",\n            \"store\": \"APP_STORE\",\n            \"app_user_id\": \"$RCAnonymousID: 1234567890ab1cd1234a55b6c78910a3\",\n            \"product_id\": \"rc_subscription_monthly\",\n            \"currency\": \"USD\",\n            \"revenue\": 0.0,\n            \"auto_resume_at\": \"2022-10-03T11:07:20Z\",\n            \"app_id\": \"app1234567890\"\n        },\n    \"user_id\": \"$RCAnonymousID: 1234567890ab1cd1234a55b6c78910a3\"\n    }\n}",
      "language": "json",
      "name": "Subscription Paused"
    },
    {
      "code": "{\n    \"api_key\": \"yourAmplitudeAPIKey\",\n    \"event\": {\n        \"event_type\": \"rc_expiration_event\",\n        \"partner_id\": \"revenuecat\",\n        \"insert_id\": \"a12bc3d4-e5fg-678h-91i0-j23klmn45678\",\n        \"time\": 1662414172000,\n        \"platform\": \"iOS\",\n        \"revenue\": 0.0,\n        \"productId\": \"rc_subscription_monthly\",\n        \"event_properties\": {\n            \"subscriber_attributes\": {\n                \"$attConsentStatus\": \"denied\", \n                \"$amplitudeDeviceId\": \"123a4b56-7890-12cd-345e-67f90gh1ij1k\"\n            },\n            \"period_type\": \"NORMAL\",\n            \"purchased_at\": \"2021-09-05T21:42:52Z\",\n            \"expiration_at\": \"2022-09-05T21:42:52Z\",\n            \"environment\": \"PRODUCTION\",\n            \"entitlement_id\": null,\n            \"entitlement_ids\": null,\n            \"presented_offering_id\": null,\n            \"transaction_id\": \"123456789012345\",\n            \"original_transaction_id\": \"011223344556677\",\n            \"aliases\": [\n                \"$RCAnonymousID: 121abc123a4abc123123abc123abc1230\"\n            ],\n            \"original_app_user_id\": \"$RCAnonymousID: 1234567890ab1cd1234a55b6c78910a3\",\n            \"store\": \"APP_STORE\",\n            \"app_user_id\": \"$RCAnonymousID: 1234567890ab1cd1234a55b6c78910a3\",\n            \"product_id\": \"rc_subscription_monthly\",\n            \"currency\": \"USD\",\n            \"revenue\": 0.0,\n            \"expiration_reason\": \"UNSUBSCRIBE\",\n            \"app_id\": \"app1234567890\"\n        },\n        \"user_id\": \"$RCAnonymousID:1234567890ab1cd1234a55b6c78910a3\"\n    }\n}",
      "language": "json",
      "name": "Expiration"
    },
    {
      "code": "{\n    \"api_key\": \"yourAmplitudeAPIKey\",\n    \"event\": {\n        \"event_type\": \"rc_billing_issue_event\",\n        \"partner_id\": \"revenuecat\",\n        \"insert_id\": \"a12bc3d4-e5fg-678h-91i0-j23klmn45678\",\n        \"time\": 1662665865167,\n        \"platform\": \"iOS\",\n        \"revenue\": 0.0,\n        \"productId\": \"rc_subscription_monthly\",\n        \"event_properties\": {\n            \"subscriber_attributes\": {\n                \"$attConsentStatus\": \"denied\", \n                \"$amplitudeDeviceId\": \"123a4b56-7890-12cd-345e-67f90gh1ij1k\"\n            },\n            \"period_type\": \"NORMAL\",\n            \"purchased_at\": \"2022-08-08T19:11:04Z\",\n            \"expiration_at\": \"2022-09-24T19:11:04Z\",\n            \"environment\": \"PRODUCTION\",\n            \"entitlement_id\": \"pro\",\n            \"entitlement_ids\": [\n                \"pro\"\n            ],\n            \"presented_offering_id\": null,\n            \"transaction_id\": \"123456789012345\",\n            \"original_transaction_id\": \"011223344556677\",\n            \"aliases\": [\n                \"$RCAnonymousID: 121abc123a4abc123123abc123abc1230\"\n            ],\n            \"original_app_user_id\": \"$RCAnonymousID: 1234567890ab1cd1234a55b6c78910a3\",\n            \"store\": \"APP_STORE\",\n            \"app_user_id\": \"$RCAnonymousID: 1234567890ab1cd1234a55b6c78910a3\",\n            \"product_id\": \"rc_subscription_monthly\",\n            \"currency\": \"EUR\",\n            \"revenue\": 0.0,\n            \"grace_period_expiration_at\": \"2022-09-24T19:11:04Z\",\n            \"app_id\": \"app1234567890\"\n        },\n        \"user_id\": \"$RCAnonymousID: 1234567890ab1cd1234a55b6c78910a3\"\n    }\n}",
      "language": "json",
      "name": "Billing Issues"
    },
    {
      "code": "{\n    \"api_key\": \"yourAmplitudeAPIKey\",\n    \"event\": {\n        \"event_type\": \"rc_product_change_event\",\n        \"partner_id\": \"revenuecat\",\n        \"insert_id\": \"a12bc3d4-e5fg-678h-91i0-j23klmn45678\",\n        \"time\": 1663786694542,\n        \"platform\": \"iOS\",\n        \"revenue\": 0.0,\n        \"productId\": \"rc_subscription_monthly\",\n        \"event_properties\": {\n            \"subscriber_attributes\": {\n                \"$attConsentStatus\": \"denied\", \n                \"$amplitudeDeviceId\": \"123a4b56-7890-12cd-345e-67f90gh1ij1k\"\n            },\n            \"period_type\": \"NORMAL\",\n            \"purchased_at\": \"2020-09-03T15:44:46Z\",\n            \"expiration_at\": \"2021-09-03T15:44:46Z\",\n            \"environment\": \"PRODUCTION\",\n            \"entitlement_id\": \"all-access\",\n            \"entitlement_ids\": [\n                \"all-access\"\n            ],\n            \"presented_offering_id\": \"Subscription\",\n            \"transaction_id\": \"123456789012345\",\n            \"original_transaction_id\": \"011223344556677\",\n            \"aliases\": [\n                \"$RCAnonymousID: 121abc123a4abc123123abc123abc1230\"\n            ],\n            \"original_app_user_id\": \"$RCAnonymousID: 1234567890ab1cd1234a55b6c78910a3\",\n            \"store\": \"APP_STORE\",\n            \"app_user_id\": \"$RCAnonymousID: 1234567890ab1cd1234a55b6c78910a3\",\n            \"product_id\": \"rc_subscription_monthly\",\n            \"currency\": \"USD\",\n            \"revenue\": 0.0,\n            \"new_product_id\": \"rc_subscription_yearly\",\n            \"app_id\": \"app1234567890\"\n        },\n    \"user_id\": \"$RCAnonymousID:1234567890ab1cd1234a55b6c78910a3\"\n    }\n}",
      "language": "json",
      "name": "Product Change"
    }
  ]
}
[/block]
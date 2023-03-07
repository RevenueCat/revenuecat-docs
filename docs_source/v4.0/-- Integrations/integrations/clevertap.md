---
title: "CleverTap"
slug: "clevertap"
excerpt: "Integrate in-app subscription events from RevenueCat with CleverTap"
hidden: false
metadata: 
  title: "CleverTap Integration – RevenueCat"
  description: "RevenueCat can automatically send subscription events into CleverTap. This is useful for seeing all events and revenue that occur for your app even if it's not active for a period of time."
  image: 
    0: "https://files.readme.io/8d4e0d7-RevenueCat_Docs_OG.png"
    1: "RevenueCat Docs OG.png"
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: "2020-10-23T02:20:59.696Z"
updatedAt: "2023-02-27T20:53:58.006Z"
---
[block:callout]
{
  "type": "success",
  "body": "The CleverTap integration is available on the [Pro](https://www.revenuecat.com/pricing) plan."
}
[/block]
CleverTap can be a useful integration tool for seeing all events and revenue that occur for your app even if it’s not active for a period of time. You can use CleverTap’s analytics and marketing tools to reach your goal of increasing user engagement and retention.

With our CleverTap integration, you can:
- Create a campaign that triggers when a user completes a certain event; ex. Send a notification with a discount code when they cancel their subscription. 
- Gather metrics on user purchases by tracking events over time.

With accurate and up-to-date subscription data in CleverTap, you'll be set to turbo-charge your user engagement ⚡️

# Events

The CleverTap integration tracks the following events:
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
    "8-0": "Expiration",
    "8-1": "rc_expiration_event",
    "9-0": "Billing Issues",
    "9-1": "rc_billing_issue_event",
    "10-0": "Product Change",
    "10-1": "rc_product_change_event",
    "h-7": "Promo",
    "h-6": "Web",
    "h-5": "Amazon",
    "h-4": "Play Store",
    "h-3": "App Store",
    "h-2": "Description",
    "0-2": "A new subscription has been purchased or a lapsed user has resubscribed.",
    "0-3": "✅",
    "0-4": "✅",
    "0-5": "✅",
    "0-6": "✅",
    "0-7": "❌",
    "1-2": "The start of an auto-renewing subscription product free trial.",
    "2-2": "When an auto-renewing subscription product converts from a free trial to normal paid period.",
    "1-3": "✅",
    "1-4": "✅",
    "2-3": "✅",
    "2-4": "✅",
    "2-5": "✅",
    "1-5": "✅",
    "1-6": "✅",
    "2-6": "✅",
    "2-7": "✅",
    "1-7": "✅",
    "3-7": "✅",
    "3-6": "✅",
    "3-5": "✅",
    "3-4": "✅",
    "3-3": "✅",
    "3-2": "When a user turns off renewals for an auto-renewing subscription product during a free trial period.",
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
    "6-3": "✅",
    "6-4": "✅",
    "6-5": "✅",
    "6-6": "❌",
    "6-7": "❌",
    "6-2": "A non-expired cancelled subscription has been re-enabled.",
    "7-2": "A customer has made a purchase that will not auto-renew.",
    "7-3": "✅",
    "7-4": "✅",
    "7-6": "✅",
    "7-5": "✅",
    "7-7": "✅",
    "8-2": "A subscription has expired and access should be removed.\n\nIf you have [Platform Server Notifications](https://www.revenuecat.com/docs/server-notifications) configured, this event will occur as soon as we are notified (within seconds to minutes) of the expiration.\n\nIf you do not have notifications configured, delays may be approximately 1 hour.",
    "8-3": "✅",
    "8-4": "✅",
    "8-5": "✅",
    "8-6": "✅",
    "8-7": "✅",
    "9-2": "There has been a problem trying to charge the subscriber. This does not mean the subscription has expired.\n\nCan be safely ignored if listening to CANCELLATION event + cancel_reason=BILLING_ERROR.",
    "10-2": "A subscriber has changed the product of their subscription.\n\nThis does not mean the new subscription is in effect immediately. See [Managing Subscriptions](https://www.revenuecat.com/docs/managing-subscriptions) for more details on updates, downgrades, and crossgrades.",
    "9-3": "✅",
    "9-4": "✅",
    "9-5": "✅",
    "9-6": "✅",
    "10-6": "✅",
    "10-4": "✅",
    "10-3": "✅",
    "10-5": "❌",
    "10-7": "❌",
    "9-7": "❌"
  },
  "cols": 8,
  "rows": 11
}
[/block]
For events that have revenue, such as trial conversions and renewals, RevenueCat will automatically record this amount along with the event in CleverTap.

# Setup

## 1. Send CleverTap Identity to RevenueCat

The CleverTap integration can send the CleverTap ID to CleverTap as the user identity. To do that, you will need to update the following [Subscriber Attribute](doc:subscriber-attributes) for the user.
[block:parameters]
{
  "data": {
    "h-0": "Key",
    "h-1": "Description",
    "h-2": "Required",
    "0-2": "✅",
    "0-0": "`$clevertapId`",
    "0-1": "The [CleverTap ID](https://developer.clevertap.com/docs/concepts-user-profiles#section-identifying-a-user) for the user."
  },
  "cols": 3,
  "rows": 1
}
[/block]
This property can be set manually, like any other [Subscriber Attribute](doc:subscriber-attributes). If you do not set this property, the [App User ID](doc:user-ids) will be sent as the user identity to CleverTap.

[block:code]
{
  "codes": [
    {
      "code": "// Configure Purchases SDK\nPurchases.configure(withAPIKey: \"public_sdk_key\", appUserID: \"my_app_user_id\")\n\n// Configure CleverTap SDK\nCleverTap.autoIntegrate()\n\n// ...\n\nif let cleverTapId = CleverTap.sharedInstance()?.profileGetCleverTapID() {\n  Purchases.shared.attribution.setCleverTapID(cleverTapId)\n}",
      "language": "swift"
    },
    {
      "code": "// Configure Purchases SDK\n[RCPurchases configureWithAPIKey:@\"public_sdk_key\" appUserID:@\"my_app_user_id\"];\n\n// Configure CleverTap SDK\n[CleverTap autoIntegrate];\n\n//...\n\nNSString *cleverTapId = [[CleverTap sharedInstance] profileGetCleverTapID];\nif (cleverTapId != nil) {\n  [[RCPurchases sharedPurchases] setCleverTapID: cleverTapId];\n}",
      "language": "objectivec",
      "name": "Objective-C"
    },
    {
      "code": "// Configure Purchases SDK\nPurchases.configure(this, \"public_sdk_key\", \"my_app_user_id\")\n\n// Configure CleverTap SDK\ncleverTapDefaultInstance = CleverTapAPI.getDefaultInstance(this)\n\nval cleverTapId = cleverTapDefaultInstance?.cleverTapID?.also {\n   Purchases.sharedInstance.setAttributes(mapOf(\"$cleverTapId\" to it))\n}",
      "language": "kotlin"
    },
    {
      "code": "// Configure Purchases SDK\nPurchases.configure(this, \"public_sdk_key\", \"my_app_user_id\");\n\n// Configure CleverTap SDK\nCleverTapAPI clevertapDefaultInstance = CleverTapAPI.getDefaultInstance(this);\n\nString cleverTapId = cleverTapDefaultInstance.getCleverTapId();\nif (cleverTapId != null) {\n  Map<String, String> attributes = new HashMap<String, String>();\n\tattributes.put(\"$cleverTapId\", cleverTapId);\n\n\tPurchases.getSharedInstance().setAttributes(attributes);\n}",
      "language": "java",
      "name": "Java"
    }
  ]
}
[/block]
## 2. Send RevenueCat Events to CleverTap

After you've set up the *Purchases SDK* and CleverTap SDK to have the same user identity, you can "turn on" the integration and configure the event names from the RevenueCat dashboard.

1. Navigate to your project in the RevenueCat dashboard and find the *Integrations* card in the left menu. Select **+ New** 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/51c285f-Screen_Shot_2021-12-01_at_12.23.10_PM.png",
        "Screen Shot 2021-12-01 at 12.23.10 PM.png",
        332,
        410,
        "#f5f6f5"
      ]
    }
  ]
}
[/block]
2. Choose **CleverTap** from the Integrations menu
3. Add your [CleverTap Account ID and Passcode](https://developer.clevertap.com/docs/api-quickstart-guide).
4. If you want to test in sandbox, also add your Sandbox Account ID and Passcode from your testing account.
5. Enter the event names that RevenueCat will send or choose the default event names
6. Select whether you want sales reported as gross revenue (before app store commission), or after store commission and/or estimated taxes.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/444dd1c-clevertap_screesnshot.png",
        "clevertap screesnshot.png",
        1710,
        3601,
        "#000000"
      ],
      "caption": "CleverTap configuration page"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "By default, RevenueCat sends data through CleverTap's EU data center. For CleverTap customers who have a regional data center configured, you can change your region in the dropdown selector under 'CleverTap Region'."
}
[/block]
# Sample Events
Below are sample JSONs that are delivered to CleverTap for most event types.
[block:code]
{
  "codes": [
    {
      "code": "{\n  \"d\": [\n    {\n      \"evtData\": {\n        \"amount\": 4.99,\n        \"app_id\": \"1234567890\",\n        \"currency\": \"USD\"\n      },\n      \"evtName\": \"rc_initial_purchase_event\",\n      \"identity\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n      \"ts\": 1662539769,\n      \"type\": \"event\"\n    }\n  ]\n}",
      "language": "json",
      "name": "Initial Purchase"
    },
    {
      "code": "{\n  \"d\": [\n    {\n      \"evtData\": {\n        \"$adjustId\": \"12abc345d67e890fgh12j3lm456n7890\",\n        \"$idfa\": \"00000000-0000-0000-0000-000000000000\",\n        \"$idfv\": \"12345A6B-C789-0D1E-FG23-456H6I7J890K\",\n         \"$ip\": \"123.45.67.89\",\n        \"amount\": 0,\n        \"app_id\": \"1234567890\",\n        \"currency\": \"EUR\"\n      },\n      \"evtName\": \"rc_trial_started_event\",\n      \"identity\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n      \"ts\": 1663045139,\n      \"type\": \"event\"\n    }\n  ]\n}",
      "language": "json",
      "name": "Trial Started"
    },
    {
      "code": "{\n  \"d\": [\n    {\n      \"evtData\": {\n        \"$adjustId\": \"12abc345d67e890fgh12j3lm456n7890\",\n        \"$idfa\": \"00000000-0000-0000-0000-000000000000\",\n        \"$idfv\": \"12345A6B-C789-0D1E-FG23-456H6I7J890K\",\n         \"$ip\": \"123.45.67.89\",\n        \"amount\": 14.99,\n        \"app_id\": \"1234567890\",\n        \"currency\": \"EUR\"\n      },\n      \"evtName\": \"rc_trial_converted_event\",\n      \"identity\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n      \"ts\": 1663062898,\n      \"type\": \"event\"\n    }\n  ]\n}",
      "language": "json",
      "name": "Trial Converted"
    },
    {
      "code": "{\n  \"d\": [\n    {\n      \"evtData\": {\n        \"$adjustId\": \"12abc345d67e890fgh12j3lm456n7890\",\n         \"$ip\": \"123.45.67.89\",\n        \"amount\": 0,\n        \"app_id\": \"1234567890\",\n        \"cancel_reason\": \"BILLING_ERROR\",\n        \"currency\": \"EUR\"\n      },\n      \"evtName\": \"rc_trial_cancelled_event\",\n      \"identity\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n      \"ts\": 1663060098,\n      \"type\": \"event\"\n    }\n  ]\n}",
      "language": "json",
      "name": "Trial Cancelled"
    },
    {
      "code": "{\n  \"d\": [\n    {\n      \"evtData\": {\n        \"$appsflyerId\": \"1234567890123-1234567890123456789\",\n        \"$clevertapId\": \"12345678-1234-1234-1234-123456789012\",\n        \"$email\": \"firstLast@gmail.com\",\n        \"$idfa\": \"00000000-0000-0000-0000-000000000000\",\n        \"$idfv\": \"12345A6B-C789-0D1E-FG23-456H6I7J890K\",\n         \"$ip\": \"123.45.67.89\",\n        \"amount\": 139.99,\n        \"app_id\": \"1234567890\",\n        \"currency\": \"INR\"\n      },\n      \"evtName\": \"rc_renewal_event\",\n      \"identity\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n      \"ts\": 1659935913,\n      \"type\": \"event\"\n    }\n  ]\n}",
      "language": "json",
      "name": "Renewal"
    },
    {
      "code": "{\n  \"d\": [\n    {\n      \"evtData\": {\n        \"$appsflyerId\": \"1234567890123-1234567890123456789\",\n        \"$clevertapId\": \"12345678-1234-1234-1234-123456789012\",\n        \"$email\": \"firstLast@gmail.com\",\n        \"$idfa\": \"00000000-0000-0000-0000-000000000000\",\n        \"$idfv\": \"12345A6B-C789-0D1E-FG23-456H6I7J890K\",\n         \"$ip\": \"123.45.67.89\",\n        \"amount\": 0,\n        \"app_id\": \"1234567890\",\n        \"cancel_reason\": \"UNSUBSCRIBE\",\n        \"currency\": \"INR\"\n      },\n      \"evtName\": \"rc_cancellation_event\",\n      \"identity\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n      \"ts\": 1659936775,\n      \"type\": \"event\"\n    }\n  ]\n}{\n  \"d\": [\n    {\n      \"evtData\": {\n        \"$appsflyerId\": \"1234567890123-1234567890123456789\",\n        \"$clevertapId\": \"12345678-1234-1234-1234-123456789012\",\n        \"$email\": \"firstLast@gmail.com\",\n        \"$idfa\": \"00000000-0000-0000-0000-000000000000\",\n        \"$idfv\": \"12345A6B-C789-0D1E-FG23-456H6I7J890K\",\n         \"$ip\": \"123.45.67.89\",\n        \"amount\": 0,\n        \"app_id\": \"1234567890\",\n        \"cancel_reason\": \"UNSUBSCRIBE\",\n        \"currency\": \"INR\"\n      },\n      \"evtName\": \"cancellation\",\n      \"identity\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n      \"ts\": 1659936775,\n      \"type\": \"event\"\n    }\n  ]\n}",
      "language": "json",
      "name": "Cancellation"
    }
  ]
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "{\n  \"d\": [\n    {\n      \"type\": \"event\",\n      \"evtName\": \"rc_uncancellation_event\",\n      \"evtData\": {\n         \"$ip\": \"123.45.67.89\",\n        \"$idfv\": \"12345A6B-C789-0D1E-FG23-456H6I7J890K\",\n        \"$email\": \"firstLast@gmail.com\",\n        \"$adjustId\": \"12abc345d67e890fgh12j3lm456n7890\",\n        \"$displayName\": \"first last\",\n        \"$mediaSource\": \"Organic\",\n        \"amount\": 0.0,\n        \"currency\": \"USD\"\n      },\n      \"ts\": 1632188342,\n      \"objectId\": \"abCdEFg01HiJklMN2OpQ3RStu4v5\"\n    }\n  ]\n}",
      "language": "json",
      "name": "Uncancellation"
    },
    {
      "code": "{\n  \"d\": [\n    {\n      \"evtData\": {\n        \"$appsflyerId\": \"1234567890123-1234567890123456789\",\n        \"$clevertapId\": \"12345678-1234-1234-1234-123456789012\",\n        \"$email\": \"firstLast@gmail.com\",\n        \"$idfa\": \"00000000-0000-0000-0000-000000000000\",\n        \"$idfv\": \"12345A6B-C789-0D1E-FG23-456H6I7J890K\",\n         \"$ip\": \"123.45.67.89\",\n        \"age\": \"24\",\n        \"amount\": 0,\n        \"currency\": \"USD\"\n      },\n      \"evtName\": \"rc_non_subscription_purchase_event\",\n      \"identity\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n      \"ts\": 1660903862,\n      \"type\": \"event\"\n    }\n  ]\n}",
      "language": "json",
      "name": "Non Subscription Purchase"
    },
    {
      "code": "{\n  \"d\": [\n    {\n      \"evtData\": {\n        \"$appsflyerId\": \"1234567890123-1234567890123456789\",\n        \"$clevertapId\": \"12345678-1234-1234-1234-123456789012\",\n        \"$email\": \"firstLast@gmail.com\",\n        \"$idfa\": \"00000000-0000-0000-0000-000000000000\",\n        \"$idfv\": \"12345A6B-C789-0D1E-FG23-456H6I7J890K\",\n         \"$ip\": \"123.45.67.89\",\n        \"amount\": 0,\n        \"app_id\": \"1234567890\",\n        \"currency\": \"INR\",\n        \"expiration_reason\": \"UNSUBSCRIBE\"\n      },\n      \"evtName\": \"rc_expiration_event\",\n      \"identity\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n      \"ts\": 1659936813,\n      \"type\": \"event\"\n    }\n  ]\n}",
      "language": "json",
      "name": "Expiration"
    },
    {
      "code": "{\n  \"d\": [\n    {\n      \"evtData\": {\n        \"$adjustId\": \"12abc345d67e890fgh12j3lm456n7890\",\n         \"$ip\": \"123.45.67.89\",\n        \"amount\": 0,\n        \"app_id\": \"1234567890\",\n        \"currency\": \"EUR\",\n        \"grace_period_expiration_at\": 1663146497433\n      },\n      \"evtName\": \"rc_billing_issue_event\",\n      \"identity\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n      \"ts\": 1663060098,\n      \"type\": \"event\"\n    }\n  ]\n}",
      "language": "json",
      "name": "Billing Issue"
    },
    {
      "code": "{\n  \"d\": [\n    {\n      \"type\": \"event\",\n      \"evtName\": \"rc_product_change_event\",\n      \"evtData\": {\n        \"amount\": 0.0,\n        \"currency\": \"USD\"\n      },\n      \"ts\": 1626283709,\n      \"identity\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n    }\n  ]\n}",
      "language": "json",
      "name": "Product Change"
    }
  ]
}
[/block]
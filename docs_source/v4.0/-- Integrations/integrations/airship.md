---
title: "Airship"
slug: "airship"
excerpt: "Integrate in-app purchase events from RevenueCat with Airship"
hidden: false
metadata: 
  title: "Airship Integration – RevenueCat"
  description: "RevenueCat can automatically sync subscription events with Airship. This is useful for pairing customer lifecycle events and revenue with Airship's features."
  image: 
    0: "https://files.readme.io/62b5dcd-RevenueCat_Docs_OG.png"
    1: "RevenueCat Docs OG.png"
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: "2021-09-30T01:49:47.596Z"
updatedAt: "2023-02-21T15:01:57.564Z"
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
    "5-2": "A subscription or non-renewing purchase has been cancelled. See [cancellation reasons](https://www.revenuecat.com/docs/webhooks#cancellation-and-expiration-reasons) for more details.",
    "7-2": "A customer has made a purchase that will not auto-renew.",
    "6-0": "Uncancellation",
    "6-2": "A non-expired cancelled subscription has been re-enabled.",
    "8-0": "Subscription Paused",
    "8-2": "A subscription has been paused.",
    "9-0": "Expiration",
    "9-2": "A subscription has expired and access should be removed.\n\nIf you have [Platform Server Notifications](https://www.revenuecat.com/docs/server-notifications) configured, this event will occur as soon as we are notified (within seconds to minutes) of the expiration.\n\nIf you do not have notifications configured, delays may be approximately 1 hour.",
    "10-0": "Billing Issue",
    "10-2": "There has been a problem trying to charge the subscriber. This does not mean the subscription has expired.\n\nCan be safely ignored if listening to CANCELLATION event + cancel_reason=BILLING_ERROR.",
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
    "11-2": "A subscriber has changed the product of their subscription.\n\nThis does not mean the new subscription is in effect immediately. See [Managing Subscriptions](doc:managing-subscriptions) for more details on updates, downgrades, and crossgrades.",
    "h-3": "App Store",
    "h-4": "Play Store",
    "h-5": "Amazon",
    "h-6": "Web",
    "h-7": "Promo",
    "0-3": "✅",
    "1-3": "✅",
    "2-3": "✅",
    "3-3": "✅",
    "4-3": "✅",
    "5-3": "✅",
    "6-3": "✅",
    "7-3": "✅",
    "9-3": "✅",
    "10-3": "✅",
    "11-3": "✅",
    "8-3": "❌",
    "0-4": "✅",
    "1-4": "✅",
    "2-4": "✅",
    "3-4": "✅",
    "4-4": "✅",
    "5-4": "✅",
    "6-4": "✅",
    "7-4": "✅",
    "8-4": "✅",
    "9-4": "✅",
    "10-4": "✅",
    "11-4": "✅",
    "10-5": "✅",
    "9-5": "✅",
    "7-5": "✅",
    "6-5": "✅",
    "5-5": "✅",
    "4-5": "✅",
    "3-5": "✅",
    "2-5": "✅",
    "1-5": "✅",
    "0-5": "✅",
    "8-5": "❌",
    "8-6": "❌",
    "8-7": "❌",
    "11-5": "❌",
    "6-6": "❌",
    "6-7": "❌",
    "10-7": "❌",
    "11-7": "❌",
    "0-7": "❌",
    "4-7": "❌",
    "0-6": "✅",
    "1-6": "✅",
    "1-7": "✅",
    "2-7": "✅",
    "3-7": "✅",
    "3-6": "✅",
    "2-6": "✅",
    "4-6": "✅",
    "5-6": "✅",
    "5-7": "✅",
    "7-6": "✅",
    "7-7": "✅",
    "9-6": "✅",
    "9-7": "✅",
    "10-6": "✅",
    "11-6": "✅"
  },
  "cols": 8,
  "rows": 12
}
[/block]

For events that have revenue, such as trial conversions and renewals, RevenueCat will automatically record this amount along with the event in Airship.

# Setup

## 1. Set Airship User Identity

If you're using the Airship SDK, you can either send the channel ID to RevenueCat or set an Airship Named User to match the RevenueCat app user ID. The preferred method is to send the channel ID to RevenueCat. Either method you use will allow events sent from the Airship SDK and events sent from RevenueCat to be synced to the same user.

### Set Airship User Identity Using Channel ID

Setting the Airship channel ID in RevenueCat is the preferred way for identifying users in Airship. Call `setAirshipChannelID` on the Purchases SDK to have RevenueCat use the channel ID to send events to Airship.
[block:code]
{
  "codes": [
    {
      "code": "func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {\n\n  // Configure Purchases\n  Purchases.configure(withAPIKey: \"public_sdk_key\", appUserID: \"my_app_user_id\")\n  \n  // Initialize Airship\n  Airship.takeOff(launchOptions: launchOptions)\n  \n  // Set the Airship channel ID in Purchases\n  let channelID = Airship.channel.identifier\n  Purchases.shared.attribution.setAirshipChannelID(channelID)\n  \n  // ...\n\n  return true\n}",
      "language": "swift"
    },
    {
      "code": "- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {\n\n  // Configure Purchases\n  [RCPurchases configureWithAPIKey:@\"public_sdk_key\" appUserID:@\"my_app_user_id\"];\n\n  // Initialize Airship\n  [UAirship takeOffWithLaunchOptions:launchOptions];\n  \n  // Set the Airship channel ID in Purchases\n  NSString *channelID = UAirship.channel.identifier;\n  [[RCPurchases sharedPurchases] setAirshipChannelID:channelID];\n  \n  // ...\n\n  return YES;\n}",
      "language": "objectivec"
    },
    {
      "code": "override fun onCreate(savedInstanceState: Bundle?) {\n\n  super.onCreate(savedInstanceState)\n\n  // Configure Purchases SDK\n  Purchases.configure(this, \"public_sdk_key\", \"my_app_user_id\")\n\n  // Airship should already be initialized using Autopilot\n  // https://docs.airship.com/platform/android/getting-started/#takeoff\n\n  // Set the Airship channel ID in Purchases\n  val channelId = UAirship.shared().channel.id\n  Purchases.sharedInstance.setAirshipChannelID(channelId)\n\n  // ...\n}",
      "language": "kotlin"
    },
    {
      "code": "@Override\npublic void onCreate(Bundle savedInstanceState) {\n  \n  super.onCreate(savedInstanceState);\n\n  // Configure Purchases SDK\n  Purchases.configure(this, \"public_sdk_key\", \"my_app_user_id\");\n\n  // Airship should already be initialized using Autopilot\n  // https://docs.airship.com/platform/android/getting-started/#takeoff\n\n  // Set the Airship channel ID in Purchases\n  String channelId = UAirship.shared().getChannel().getId();\n  Purchases.getSharedInstance().setAirshipChannelID(channelId);\n\n  // ...\n}",
      "language": "java"
    }
  ]
}
[/block]
### [Advanced Alternative] Set Airship User Identity Using Named Users

**Setting the Airship channel ID in RevenueCat is preferred over using Named Users, even if you have a user authentication system.** However, if you're already using Named Users in your Airship integration, you have the option to set the Named User in the Airship SDK as the same app user ID as RevenueCat. Ensure [Named Users is enabled in your Airship dashboard](https://docs.airship.com/guides/messaging/user-guide/project/enable-features/#named-users).
[block:code]
{
  "codes": [
    {
      "code": "func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {\n\n  // Configure Purchases\n  Purchases.configure(withAPIKey: \"public_sdk_key\", appUserID: \"my_app_user_id\")\n  \n  // Initialize Airship\n  Airship.takeOff(launchOptions: launchOptions)\n  \n  // Identify the user in Airship\n  Airship.contact.identify(\"my_app_user_id\")\n  \n  // ...\n\n  return true\n}",
      "language": "swift"
    },
    {
      "code": "- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {\n\n  // Configure Purchases\n  [RCPurchases configureWithAPIKey:@\"public_sdk_key\" appUserID:@\"my_app_user_id\"];\n\n  // Initialize Airship\n  [UAirship takeOffWithLaunchOptions:launchOptions];\n  \n  // Identify the user in Airship\n  [UAirship.contact identify:@\"my_app_user_id\"];\n  \n  // ...\n\n  return YES;\n}",
      "language": "objectivec"
    },
    {
      "code": "override fun onCreate(savedInstanceState: Bundle?) {\n\n  super.onCreate(savedInstanceState)\n\n  // Configure Purchases SDK\n  Purchases.configure(this, \"public_sdk_key\", \"my_app_user_id\")\n\n  // Airship should already be initialized using Autopilot\n  // https://docs.airship.com/platform/android/getting-started/#takeoff\n\n  // Set the Airship channel ID in Purchases\n  UAirship.shared().contact.identify(\"my_app_user_id\")\n\n  // ...\n}",
      "language": "kotlin"
    },
    {
      "code": "@Override\npublic void onCreate(Bundle savedInstanceState) {\n  \n  super.onCreate(savedInstanceState);\n\n  // Configure Purchases SDK\n  Purchases.configure(this, \"public_sdk_key\", \"my_app_user_id\");\n\n  // Airship should already be initialized using Autopilot\n  // https://docs.airship.com/platform/android/getting-started/#takeoff\n\n  // Identify the user in Airship\n  UAirship.shared().getContact().identify(\"my_app_user_id\");\n\n  // ...\n}",
      "language": "java"
    }
  ]
}
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
[block:code]
{
  "codes": [
    {
      "code": "[\n  {\n    \"occurred\": \"2022-08-17T22:24:09Z\",\n    \"user\": {\n      \"named_user_id\": \"ZYXWVUTSRQ\"\n    },\n    \"body\": {\n      \"name\": \"rc_initial_purchase_event\",\n      \"value\": 5.051,\n      \"properties\": {\n        \"id\": \"12345678-1234-1234-1234-123456789012\",\n        \"event_timestamp_ms\": 1660775073781,\n        \"app_user_id\": \"1234567890\",\n        \"aliases\": [\n          \"$RCAnonymousID:8069238d6049ce87cc529853916d624c\"\n        ],\n        \"original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"product_id\": \"subscription.v0.monthly\",\n        \"period_type\": \"NORMAL\",\n        \"purchased_at_ms\": 1660775049528,\n        \"expiration_at_ms\": 1660775464920,\n        \"environment\": \"SANDBOX\",\n        \"entitlement_ids\": [\n          \"Pro\"\n        ],\n        \"transaction_id\": \"GPA.1234-5678-9012-34567\", \n        \"original_transaction_id\": \"GPA.1234-5678-9012-34567\", \n        \"is_family_share\": false,\n        \"country_code\": \"BR\",\n        \"currency\": \"BRL\",\n        \"price_in_purchased_currency\": 25.99,\n        \"subscriber_attributes\": {\n          \"$ip\": {\n            \"value\": \"123.45.67.89\",\n            \"updated_at_ms\": 1660764263545\n          },\n          \"$gpsAdId\": {\n            \"value\": \"12345678-9012-3456-7890-123456789012\",\n            \"updated_at_ms\": 1660760899175\n          },\n          \"$fbAnonId\": {\n            \"value\": \"1234567890-1234-5678-9012-345678901234\",\n            \"updated_at_ms\": 1660760899262\n          },\n          \"$androidId\": {\n            \"value\": \"1234567890123456\",\n            \"updated_at_ms\": 1660760899175\n          },\n          \"$appsflyerId\": {\n            \"value\": \"1234567890123-1234567890123456789\",\n            \"updated_at_ms\": 1660760899175\n          }\n        },\n        \"store\": \"PLAY_STORE\",\n        \"takehome_percentage\": 0.85,\n        \"app_id\": \"1234567890\"\n      }\n    }\n  }\n]",
      "language": "json",
      "name": "Initial Purchase"
    },
    {
      "code": "[\n  {\n      \"body\": {\n        \"name\": \"rc_trial_started_event\",\n        \"properties\": {\n          \"aliases\": [\n            \"$RCAnonymousID:8069238d6049ce87cc529853916d624c\"\n          ],\n          \"app_id\": \"1234567890\",\n          \"app_user_id\": \"1234567890\",\n          \"currency\": \"USD\",\n          \"entitlement_ids\": [\n            \"Pro\"\n          ],\n          \"environment\": \"PRODUCTION\",\n          \"event_timestamp_ms\": 1662955146543,\n          \"expiration_at_ms\": 1663559941000,\n          \"id\": \"12345678-1234-1234-1234-123456789012\",\n          \"is_family_share\": false,\n          \"original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n          \"original_transaction_id\": \"123456789012345\",\n          \"period_type\": \"TRIAL\",\n          \"presented_offering_id\": \"default_offering\",\n          \"price_in_purchased_currency\": 0,\n          \"product_id\": \"1\",\n          \"purchased_at_ms\": 1662955141000,\n          \"store\": \"APP_STORE\",\n          \"subscriber_attributes\": {\n            \"$email\": {\n              \"updated_at_ms\": 1662955084635,\n              \"value\": \"firstlast@gmail.com\"\n          }\n        },\n        \"value\": 0\n      },\n      \"occurred\": \"2022-09-12T03:59:01Z\",\n      \"user\": {\n        \"named_user_id\": \"ZYXWVUTSRQ\"\n      }\n    }\n  }\n]",
      "language": "json",
      "name": "Trial Started"
    },
    {
      "code": "[\n  {\n    \"body\": {\n      \"name\": \"rc_trial_converted_event\",\n      \"properties\": {\n        \"aliases\": [\n          \"$RCAnonymousID:8069238d6049ce87cc529853916d624c\"\n        ],\n        \"app_id\": \"1234567890\",\n        \"app_user_id\": \"1234567890\",\n        \"country_code\": \"US\",\n        \"currency\": \"USD\",\n        \"entitlement_ids\": [\n          \"Pro\"\n        ],\n        \"environment\": \"PRODUCTION\",\n        \"event_timestamp_ms\": 1662985791349,\n        \"expiration_at_ms\": 1665579486000,\n        \"id\": \"12345678-1234-1234-1234-123456789012\",\n        \"is_family_share\": false,\n        \"is_trial_conversion\": true,\n        \"original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"original_transaction_id\": \"123456789012345\",\n        \"period_type\": \"NORMAL\",\n        \"presented_offering_id\": \"default_offering\",\n        \"price_in_purchased_currency\": 5.99,\n        \"product_id\": \"1\",\n        \"purchased_at_ms\": 1662987486000,\n        \"store\": \"APP_STORE\",\n        \"subscriber_attributes\": {\n          \"$email\": {\n            \"updated_at_ms\": 1662955084635,\n            \"value\": \"firstlast@gmail.com\"\n          }\n        },\n      },\n      \"value\": 5.091\n    },\n    \"occurred\": \"2022-09-12T12:58:06Z\",\n    \"user\": {\n      \"named_user_id\": \"ZYXWVUTSRQ\"\n    }\n  }\n]",
      "language": "json",
      "name": "Trial Converted"
    },
    {
      "code": "[\n  {\n    \"body\": {\n      \"name\": \"rc_trial_cancelled_event\",\n      \"properties\": {\n        \"aliases\": [\n          \"$RCAnonymousID:8069238d6049ce87cc529853916d624c\"\n        ],\n        \"app_id\": \"1234567890\",\n        \"app_user_id\": \"123456789012345\",\n        \"cancel_reason\": \"UNSUBSCRIBE\",\n        \"country_code\": \"US\",\n        \"currency\": \"USD\",\n        \"entitlement_ids\": [\n          \"Pro\"\n        ],\n        \"environment\": \"PRODUCTION\",\n        \"event_timestamp_ms\": 1662987212671,\n        \"expiration_at_ms\": 1663262049000,\n        \"id\": \"12345678-1234-1234-1234-123456789012\",\n        \"is_family_share\": false,\n        \"original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"original_transaction_id\": \"123456789012345\",\n        \"period_type\": \"TRIAL\",\n        \"presented_offering_id\": \"default_offering\",\n        \"price_in_purchased_currency\": 0,\n        \"product_id\": \"1\",\n        \"purchased_at_ms\": 1662657249000,\n        \"store\": \"APP_STORE\",\n        \"subscriber_attributes\": {\n          \"$email\": {\n            \"updated_at_ms\": 1662955084635,\n            \"value\": \"firstlast@gmail.com\"\n          }\n        },\n        \"takehome_percentage\": 0.85,\n        \"transaction_id\": \"123456789012345\"\n      },\n      \"value\": 0\n    },\n    \"occurred\": \"2022-09-12T12:53:32Z\",\n    \"user\": {\n      \"named_user_id\": \"ZYXWVUTSRQ\"\n    }\n  }\n]",
      "language": "json",
      "name": "Trial Cancelled"
    },
    {
      "code": "[\n  {\n    \"body\": {\n      \"name\": \"rc_renewal_event\",\n      \"properties\": {\n        \"aliases\": [\n          \"$RCAnonymousID:8069238d6049ce87cc529853916d624c\"\n        ],\n        \"app_id\": \"1234567890\",\n        \"app_user_id\": \"1234567890\",\n        \"country_code\": \"US\",\n        \"currency\": \"USD\",\n        \"entitlement_ids\": [\n          \"Pro\"\n        ],\n        \"environment\": \"PRODUCTION\",\n        \"event_timestamp_ms\": 1662951401457,\n        \"expiration_at_ms\": 1665540707000,\n        \"id\": \"12345678-1234-1234-1234-123456789012\",\n        \"is_family_share\": false,\n        \"is_trial_conversion\": false,\n        \"original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"original_transaction_id\": \"123456789012345\",\n        \"period_type\": \"NORMAL\",\n        \"presented_offering_id\": \"default_offering\",\n        \"price_in_purchased_currency\": 5.99,\n        \"product_id\": \"1\",\n        \"purchased_at_ms\": 1662948707000,\n        \"store\": \"APP_STORE\",\n        \"subscriber_attributes\": {\n          \"$appsflyerId\": {\n            \"updated_at_ms\": 1651022873900,\n            \"value\": \"1234567890123-1234567890123456789\"\n          },\n          \"$email\": {\n            \"updated_at_ms\": 1660274406606,\n            \"value\": \"firstlast@gmail.com\"\n          },\n          \"$ip\": {\n            \"updated_at_ms\": 1651022873887,\n            \"value\": \"123.45.67.89\"\n          }\n        },\n        \"takehome_percentage\": 0.85,\n        \"transaction_id\": \"123456789012345\"\n      },\n      \"value\": 5.091\n    },\n    \"occurred\": \"2022-09-12T02:11:47Z\",\n    \"user\": {\n      \"named_user_id\": \"ZYXWVUTSRQ\"\n    }\n  }\n]",
      "language": "json",
      "name": "Renewal"
    },
    {
      "code": "[\n  {\n    \"body\": {\n      \"name\": \"rc_cancellation_event\",\n      \"properties\": {\n        \"aliases\": [\n          \"$RCAnonymousID:8069238d6049ce87cc529853916d624c\"\n        ],\n        \"app_id\": \"1234567890\",\n        \"app_user_id\": \"1234567890\",\n        \"cancel_reason\": \"BILLING_ERROR\",\n        \"country_code\": \"US\",\n        \"currency\": \"USD\",\n        \"entitlement_ids\": [\n          \"Pro\"\n        ],\n        \"environment\": \"PRODUCTION\",\n        \"event_timestamp_ms\": 1663083538724,\n        \"expiration_at_ms\": 1664465906000,\n        \"id\": \"12345678-1234-1234-1234-123456789012\",\n        \"is_family_share\": false,\n        \"original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"original_transaction_id\": \"123456789012345\",\n        \"period_type\": \"NORMAL\",\n        \"price_in_purchased_currency\": 0,\n        \"product_id\": \"AutoRenewMonthlyBasic\",\n        \"purchased_at_ms\": 1660405106000,\n        \"store\": \"APP_STORE\",\n        \"subscriber_attributes\": {\n          \"$appsflyerId\": {\n            \"updated_at_ms\": 1647104232082,\n            \"value\": \"1234567890123-1234567890123456789\"\n          },\n          \"$email\": {\n            \"updated_at_ms\": 1649936423436,\n            \"value\": \"firstlast@gmail.com\"\n          },\n          \"$ip\": {\n            \"updated_at_ms\": 1649936467544,\n            \"value\": \"123.45.67.89\"\n          }\n        },\n        \"takehome_percentage\": 0.7,\n        \"transaction_id\": \"123456789012345\"\n      },\n      \"value\": 0\n    },\n    \"occurred\": \"2022-09-13T15:38:58Z\",\n    \"user\": {\n      \"named_user_id\": \"ZYXWVUTSRQ\"\n    }\n  }\n]",
      "language": "json",
      "name": "Cancellation"
    },
    {
      "code": "[\n  {\n    \"occurred\": \"2022-08-16T16:46:13Z\",\n    \"user\": {\n      \"named_user_id\": \"ZYXWVUTSRQ\"\n    },\n    \"body\": {\n      \"name\": \"rc_uncancellation_event\",\n      \"value\": 0.0,\n      \"properties\": {\n        \"id\": \"12345678-1234-1234-1234-123456789012\",\n        \"event_timestamp_ms\": 1660668373184,\n        \"app_user_id\": \"1234567890\",\n        \"aliases\": [\n          \"$RCAnonymousID:8069238d6049ce87cc529853916d624c\"\n        ],\n        \"original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"product_id\": \"AutoRenewMonthlyBasic\",\n        \"period_type\": \"NORMAL\",\n        \"purchased_at_ms\": 1660413184000,\n        \"expiration_at_ms\": 1663091584000,\n        \"environment\": \"PRODUCTION\",\n        \"entitlement_ids\": [\n          \"Pro\"\n        ],\n        \"transaction_id\": \"123456789012345\",\n        \"original_transaction_id\": \"123456789012345\",\n        \"is_family_share\": false,\n        \"country_code\": \"US\",\n        \"currency\": \"USD\",\n        \"price_in_purchased_currency\": 0.0,\n        \"subscriber_attributes\": {\n          \"$ip\": {\n            \"value\": \"123.45.67.89\",\n            \"updated_at_ms\": 1655130803273\n          },\n          \"$email\": {\n            \"value\": \"firstlast@gmail.com\",\n            \"updated_at_ms\": 1655162763950\n          },\n          \"$appsflyerId\": {\n            \"value\": \"1234567890123-1234567890123456789\",\n            \"updated_at_ms\": 1655130796226\n          }\n        },\n        \"store\": \"APP_STORE\",\n        \"takehome_percentage\": 0.7,\n        \"app_id\": \"1234567890\"\n      }\n    }\n  }\n]",
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
      "code": "[\n  {\n    \"body\": {\n      \"name\": \"rc_non_subscription_purchase_event\",\n      \"properties\": {\n        \"aliases\": [\n          \"$RCAnonymousID:8069238d6049ce87cc529853916d624c\"\n        ],\n        \"app_user_id\": \"1234567890\",\n        \"currency\": \"USD\",\n        \"entitlement_ids\": [\n          \"Pro\"\n        ],\n        \"environment\": \"PRODUCTION\",\n        \"event_timestamp_ms\": 1663031444913,\n        \"id\": \"12345678-1234-1234-1234-123456789012\",\n        \"original_app_user_id\": \"1234567890\",\n        \"original_transaction_id\": \"123456789012345\",\n        \"period_type\": \"PROMOTIONAL\",\n        \"price_in_purchased_currency\": 0,\n        \"product_id\": \"rc_promo_subscription_lifetime\",\n        \"purchased_at_ms\": 1663031444879,\n        \"store\": \"PROMOTIONAL\",\n        \"subscriber_attributes\": {\n          \"$email\": {\n            \"updated_at_ms\": 1663031444396,\n            \"value\": \"firstlast@gmail.com\"\n          }\n        },\n        \"takehome_percentage\": 1,\n        \"transaction_id\": \"123456789012345\"\n      },\n      \"value\": 9.99\n    },\n    \"occurred\": \"2022-09-13T01:10:44Z\",\n    \"user\": {\n      \"named_user_id\": \"ZYXWVUTSRQ\"\n    }\n  }\n]",
      "language": "json",
      "name": "Non Subscription Purchase"
    },
    {
      "code": "[\n  {\n    \"body\": {\n      \"name\": \"rc_expiration_event\",\n      \"properties\": {\n        \"aliases\": [\n          \"$RCAnonymousID:8069238d6049ce87cc529853916d624c\"\n        ],\n        \"app_id\": \"1234567890\",\n        \"app_user_id\": \"1234567890\",\n        \"country_code\": \"US\",\n        \"currency\": \"USD\",\n        \"entitlement_ids\": [\n          \"subscription\"\n        ],\n        \"environment\": \"PRODUCTION\",\n        \"event_timestamp_ms\": 1662950285264,\n        \"expiration_at_ms\": 1662948421000,\n        \"expiration_reason\": \"UNSUBSCRIBE\",\n        \"id\": \"12345678-1234-1234-1234-123456789012\",\n        \"is_family_share\": false,\n        \"original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"original_transaction_id\": \"123456789012345\",\n        \"period_type\": \"NORMAL\",\n        \"presented_offering_id\": \"default_offering\",\n        \"price_in_purchased_currency\": 0,\n        \"product_id\": \"1\",\n        \"purchased_at_ms\": 1660270021000,\n        \"store\": \"APP_STORE\",\n        \"subscriber_attributes\": {\n          \"$appsflyerId\": {\n            \"updated_at_ms\": 1659182049974,\n            \"value\": \"1234567890123-1234567890123456789\"\n          },\n          \"$email\": {\n            \"updated_at_ms\": 1662919930136,\n            \"value\": \"firstlast@gmail.com\"\n          },\n          \"$ip\": {\n            \"updated_at_ms\": 1659182049961,\n            \"value\": \"123.45.67.89\"\n          }\n        },\n        \"takehome_percentage\": 0.85,\n        \"transaction_id\": \"123456789012345\"\n      },\n      \"value\": 0\n    },\n    \"occurred\": \"2022-09-12T02:07:01Z\",\n    \"user\": {\n      \"named_user_id\": \"ZYXWVUTSRQ\"\n    }\n  }\n]",
      "language": "json",
      "name": "Expiration"
    },
    {
      "code": "[\n  {\n    \"body\": {\n      \"name\": \"rc_billing_issue_event\",\n      \"properties\": {\n        \"aliases\": [\n          \"$RCAnonymousID:8069238d6049ce87cc529853916d624c\"\n        ],\n        \"app_id\": \"1234567890\",\n        \"app_user_id\": \"1234567890\",\n        \"country_code\": \"US\",\n        \"currency\": \"USD\",\n        \"entitlement_ids\": [\n          \"Pro\"\n        ],\n        \"environment\": \"PRODUCTION\",\n        \"event_timestamp_ms\": 1663083538724,\n        \"expiration_at_ms\": 1664465906000,\n        \"grace_period_expiration_at_ms\": 1664465906000,\n        \"id\": \"12345678-1234-1234-1234-123456789012\",\n        \"is_family_share\": false,\n        \"original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"original_transaction_id\": \"123456789012345\",\n        \"period_type\": \"NORMAL\",\n        \"price_in_purchased_currency\": 0,\n        \"product_id\": \"AutoRenewMonthlyBasic\",\n        \"purchased_at_ms\": 1660405106000,\n        \"store\": \"APP_STORE\",\n        \"subscriber_attributes\": {\n          \"$appsflyerId\": {\n            \"updated_at_ms\": 1647104232082,\n            \"value\": \"1234567890123-1234567890123456789\"\n          },\n          \"$email\": {\n            \"updated_at_ms\": 1649936423436,\n            \"value\": \"firstlast@gmail.com\"\n          },\n          \"$ip\": {\n            \"updated_at_ms\": 1649936467544,\n            \"value\": \"123.45.67.89\"\n          }\n        },\n        \"takehome_percentage\": 0.7,\n        \"transaction_id\": \"123456789012345\"\n      },\n      \"value\": 0\n    },\n    \"occurred\": \"2022-09-13T15:38:58Z\",\n    \"user\": {\n      \"named_user_id\": \"ZYXWVUTSRQ\"\n    }\n  }\n]",
      "language": "json",
      "name": "Billing Issue"
    },
    {
      "code": "[\n  {\n    \"occurred\": \"2022-04-15T11:05:27Z\",\n    \"user\": {\n      \"named_user_id\": \"ZYXWVUTSRQ\"\n    },\n    \"body\": {\n      \"name\": \"rc_product_change_event\",\n      \"value\": 0.0,\n      \"properties\": {\n        \"id\": \"12345678-1234-1234-1234-123456789012\",\n        \"event_timestamp_ms\": 1652324747722,\n        \"app_user_id\": \"1234567890\",\n        \"aliases\": [\n          \"$RCAnonymousID:8069238d6049ce87cc529853916d624c\"\n        ],\n        \"original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"product_id\": \"1\",\n        \"period_type\": \"NORMAL\",\n        \"purchased_at_ms\": 1650020727000,\n        \"expiration_at_ms\": 1652612727000,\n        \"environment\": \"PRODUCTION\",\n        \"entitlement_ids\": [\n          \"subscription\"\n        ],\n        \"presented_offering_id\": \"default_offering\",\n        \"transaction_id\": \"123456789012345\",\n        \"original_transaction_id\": \"123456789012345\",\n        \"is_family_share\": false,\n        \"country_code\": \"US\",\n        \"new_product_id\": \"2\",\n        \"currency\": \"USD\",\n        \"price_in_purchased_currency\": 0.0,\n        \"subscriber_attributes\": {\n          \"$ip\": {\n            \"value\": \"123.45.67.89\",\n            \"updated_at_ms\": 1650694978412\n          },\n          \"$email\": {\n            \"value\": \"firstlast@gmail.com\",\n            \"updated_at_ms\": 1650017723043\n          },\n          \"$appsflyerId\": {\n            \"value\": \"1234567890123-1234567890123456789\",\n            \"updated_at_ms\": 1650694978424\n          }\n        },\n        \"store\": \"APP_STORE\",\n        \"takehome_percentage\": 0.85\n      }\n    }\n  }\n]",
      "language": "json",
      "name": "Product Change"
    }
  ]
}
[/block]
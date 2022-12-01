---
title: "Airship"
slug: "airship"
excerpt: "Integrate in-app purchase events from RevenueCat with Airship"
hidden: false
metadata: 
  title: "Airship Integration – RevenueCat"
  description: "RevenueCat can automatically sync subscription events with Airship. This is useful for pairing customer lifecycle events and revenue with Airship's features."
  image: 
    0: "https://files.readme.io/f048c55-60993e3c40039b67596bcc8c_slack-preview.png"
    1: "60993e3c40039b67596bcc8c_slack-preview.png"
    2: 1200
    3: 627
    4: "#f45476"
createdAt: "2021-09-30T01:49:47.596Z"
updatedAt: "2021-10-29T23:02:25.352Z"
---
[block:callout]
{
  "type": "success",
  "body": "The Airship integration is available on the [Pro](https://www.revenuecat.com/pricing) plan."
}
[/block]
RevenueCat can automatically send subscription events to Airship. This can be helpful in understanding what stage a customer is in to react accordingly. 

Use your RevenueCat events to send Custom Events to trigger messages with Airship. This means you can design personalized Airship [Journeys](https://docs.airship.com/guides/messaging/user-guide/journeys/about/) and [Automations](https://docs.airship.com/guides/messaging/user-guide/messages/automation/about/) based on purchase behavior. For example, you might want to:

- Send a message to a user whose subscription experienced a billing issue.
- Send reminders to your app's message center when a user's trial is about to expire.

With accurate and up-to-date subscription data in Airship, you'll be set to increase your users' engagement.

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
    "0-2": "The first purchase of an auto-renewing subscription product that does not contain a free trial.",
    "1-2": "The start of an auto-renewing subscription product free trial.",
    "2-2": "When an auto-renewing subscription product converts from a free trial to normal paid period.",
    "3-2": "When a user turns off renewals for an auto-renewing subscription product during a free trial period.",
    "4-2": "When an auto-renewing subscription product renews OR a user repurchases the auto-renewing subscription product after a lapse in their subscription.",
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
    "h-1": "Event Name",
    "0-1": "`RevenueCat_initial_purchase_event`",
    "1-1": "`RevenueCat_trial_started_event`",
    "2-1": "`RevenueCat_trial_converted_event`",
    "3-1": "`RevenueCat_trial_cancelled_event`",
    "4-1": "`RevenueCat_renewal_event`",
    "5-1": "`RevenueCat_cancellation_event`",
    "6-1": "`RevenueCat_uncancellation_event`",
    "7-1": "`RevenueCat_non_subscription_purchase_event`",
    "8-1": "`RevenueCat_subscription_paused_event`",
    "9-1": "`RevenueCat_expiration_event`",
    "10-1": "`RevenueCat_billing_issue_event`"
  },
  "cols": 3,
  "rows": 11
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
      "code": "func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {\n\n  // Configure Purchases\n  Purchases.configure(withAPIKey: \"public_sdk_key\", appUserID: \"my_app_user_id\")\n  \n  // Initialize Airship\n  Airship.takeOff(launchOptions: launchOptions)\n  \n  // Set the Airship channel ID in Purchases\n  let channelID = Airship.channel.identifier\n  Purchases.shared.setAirshipChannelID(channelID)\n  \n  // ...\n\n  return true\n}",
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
5. Select whether you want RevenueCat to report proceeds (after app store cut) or revenue (gross sales)
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/6a4164b-app.revenuecat.com_apps_633c0ff5_integrations_airship_2.png",
        "app.revenuecat.com_apps_633c0ff5_integrations_airship (2).png",
        1540,
        4567,
        "#f9fafa"
      ],
      "caption": "Airship configuration page"
    }
  ]
}
[/block]
# Sample Event
Below is sample JSON that is delivered to Airship for a renewal event.
[block:code]
{
  "codes": [
    {
      "code": "[\n    {\n        \"occurred\": \"2021-09-27T15:31:38Z\",\n        \"user\": {\n            \"channel\": \"2ceefb74-f116-49c8-601a-b36ad6ba42d4\"\n        },\n        \"body\": {\n            \"name\": \"renewal_event\",\n            \"value\": 4.503,\n            \"properties\": {\n                \"id\": \"2F4B1128-CF82-4192-AEB9-9B475393D1A2\",\n                \"event_timestamp_ms\": 1632756861708,\n                \"app_user_id\": \"$RCAnonymousID:281d3889d2aea5579f406bc1f285021f\",\n                \"aliases\": [\n                    \"$RCAnonymousID:281d3889d2aea5579f406bc1f285021f\"\n                ],\n                \"original_app_user_id\": \"$RCAnonymousID:281d3889d2aea5579f406bc1f285021f\",\n                \"product_id\": \"com.my.app.monthly_4.99.1_week_intro\",\n                \"period_type\": \"NORMAL\",\n                \"purchased_at_ms\": 1632756698000,\n                \"expiration_at_ms\": 1632756998000,\n                \"environment\": \"PRODUCTION\",\n                \"entitlement_ids\": [\n                    \"pro\"\n                ],\n                \"presented_offering_id\": \"default\",\n                \"transaction_id\": \"1000000881883259\",\n                \"original_transaction_id\": \"1000000884174114\",\n                \"is_family_share\": false,\n                \"country_code\": \"ES\",\n                \"currency\": \"EUR\",\n                \"is_trial_conversion\": false,\n                \"price_in_purchased_currency\": 5.49,\n                \"subscriber_attributes\": {\n                    \"$ip\": {\n                        \"value\": \"53.126.228.862\",\n                        \"updated_at_ms\": 1632755230679\n                    },\n                    \"$idfv\": {\n                        \"value\": \"D0860044-2AFE-7B5E-8175-284C3E46F0C1\",\n                        \"updated_at_ms\": 1632755230678\n                    },\n                    \"$airshipChannelId\": {\n                        \"value\": \"2ceefb74-f116-49c8-601a-b36ad6ba42d4\",\n                        \"updated_at_ms\": 1632756877789\n                    }\n                },\n                \"store\": \"APP_STORE\",\n                \"takehome_percentage\": 0.7\n            }\n        }\n    }\n]",
      "language": "json"
    }
  ]
}
[/block]
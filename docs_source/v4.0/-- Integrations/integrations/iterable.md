---
title: "Iterable"
slug: "iterable"
excerpt: "Integrate in-app purchase events from RevenueCat with Iterable"
hidden: false
metadata: 
  title: "Iterable Integration – RevenueCat"
  image: 
    0: "https://files.readme.io/61f2c22-RevenueCat_Docs_OG.png"
    1: "RevenueCat Docs OG.png"
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: "2022-01-31T17:07:33.480Z"
updatedAt: "2023-02-28T01:20:43.702Z"
---
[block:callout]
{
  "type": "success",
  "body": "The Iterable integration is available on the [Pro](https://www.revenuecat.com/pricing) plan."
}
[/block]
Iterable can be a helpful integration tool in understanding what stage a customer is in and reacting accordingly. Iterable is a cross-channel platform that powers unified customer experiences and empowers marketers to create, optimize and measure every interaction taking place throughout the customer journey. With Iterable, brands create individualized marketing touch points that earn engagement, solidify trust and galvanize loyal consumer-brand relationships.

With our Iterable integration, you can:
- Create an event to track unsubscribes that automatically triggers an email to users who cancel.
- Start a campaign to send users who have been with you for over a certain length of time a discount code for being a loyal customer.

With accurate and up-to date subscription data in Iterable, you’ll be set to turbocharge your users’ engagement  ⚡️

# Events
The Iterable integration tracks the following events:
[block:parameters]
{
  "data": {
    "h-0": "RevenueCat Event Type",
    "h-1": "Iterable Event Type",
    "h-2": "Default Event Name",
    "0-0": "Initial Purchase",
    "1-0": "Trial Started",
    "2-0": "Trial Converted",
    "3-0": "Trial Cancelled",
    "4-0": "Renewal",
    "5-0": "Cancellation",
    "6-0": "Uncancellation",
    "7-0": "Non Subscription Purchase",
    "8-0": "Subscription Paused",
    "9-0": "Expiration",
    "10-0": "Billing Issue",
    "0-1": "Purchase",
    "1-1": "Purchase",
    "2-1": "Purchase",
    "3-1": "Custom",
    "4-1": "Purchase",
    "5-1": "Custom",
    "6-1": "Custom",
    "7-1": "Purchase",
    "8-1": "Custom",
    "9-1": "Custom",
    "10-1": "Custom",
    "0-2": "rc_initial_purchase_event",
    "1-2": "rc_trial_started_event",
    "2-2": "rc_trial_converted_event",
    "4-2": "rc_renewal_event",
    "3-2": "rc_trial_cancelled_event",
    "5-2": "rc_cancellation_event",
    "6-2": "rc_uncancellation_event",
    "7-2": "rc_non_subscription_purchase_event",
    "8-2": "rc_subscription_paused_event",
    "9-2": "rc_expiration_event",
    "10-2": "rc_billing_issue_event",
    "11-0": "Product Change",
    "11-1": "Custom",
    "11-2": "rc_product_change_event",
    "h-3": "Description",
    "h-4": "App Store",
    "h-5": "Play Store",
    "h-6": "Amazon",
    "h-7": "Web",
    "h-8": "Promo",
    "11-4": "✅",
    "10-4": "✅",
    "9-4": "✅",
    "8-4": "❌",
    "7-4": "✅",
    "6-4": "✅",
    "5-4": "✅",
    "4-4": "✅",
    "3-4": "✅",
    "2-4": "✅",
    "1-4": "✅",
    "0-4": "✅",
    "11-5": "✅",
    "11-7": "✅",
    "11-6": "❌",
    "11-8": "❌",
    "10-8": "❌",
    "10-7": "✅",
    "10-6": "✅",
    "10-5": "✅",
    "9-5": "✅",
    "9-6": "✅",
    "9-7": "✅",
    "9-8": "✅",
    "8-5": "✅",
    "8-6": "❌",
    "8-7": "❌",
    "8-8": "❌",
    "6-7": "❌",
    "6-8": "❌",
    "4-8": "❌",
    "0-8": "❌",
    "7-5": "✅",
    "7-6": "✅",
    "7-7": "✅",
    "7-8": "✅",
    "6-6": "✅",
    "6-5": "✅",
    "5-5": "✅",
    "5-6": "✅",
    "5-7": "✅",
    "5-8": "✅",
    "4-7": "✅",
    "4-6": "✅",
    "4-5": "✅",
    "2-5": "✅",
    "3-5": "✅",
    "3-6": "✅",
    "3-7": "✅",
    "3-8": "✅",
    "2-8": "✅",
    "2-7": "✅",
    "2-6": "✅",
    "1-5": "✅",
    "1-6": "✅",
    "1-7": "✅",
    "1-8": "✅",
    "0-7": "✅",
    "0-6": "✅",
    "0-5": "✅",
    "0-3": "A new subscription has been purchased or a lapsed user has resubscribed.",
    "1-3": "The start of an auto-renewing subscription product free trial.",
    "2-3": "When an auto-renewing subscription product converts from a free trial to normal paid period.",
    "3-3": "When a user turns off renewals for an auto-renewing subscription product during a free trial period.",
    "4-3": "An existing subscription has been renewed.",
    "5-3": "A subscription or non-renewing purchase has been cancelled. See [cancellation reasons](https://www.revenuecat.com/docs/webhooks#cancellation-and-expiration-reasons) for more details.",
    "6-3": "A non-expired cancelled subscription has been re-enabled.",
    "7-3": "A customer has made a purchase that will not auto-renew.",
    "8-3": "A subscription has been paused.",
    "9-3": "A subscription has expired and access should be removed.\n\nIf you have [Platform Server Notifications](https://www.revenuecat.com/docs/server-notifications) configured, this event will occur as soon as we are notified (within seconds to minutes) of the expiration.\n\nIf you do not have notifications configured, delays may be approximately 1 hour.",
    "10-3": "There has been a problem trying to charge the subscriber. This does not mean the subscription has expired.\n\nCan be safely ignored if listening to CANCELLATION event + cancel_reason=BILLING_ERROR.",
    "11-3": "A subscriber has changed the product of their subscription.\n\nThis does not mean the new subscription is in effect immediately. See [Managing Subscriptions](https://www.revenuecat.com/docs/managing-subscriptions) for more details on updates, downgrades, and crossgrades."
  },
  "cols": 9,
  "rows": 12
}
[/block]
For events that have revenue, such as trial conversions and renewals, RevenueCat will automatically record this amount along with the event in Iterable. 


# Setup
## 1. Set Iterable User Identity
In order to associate RevenueCat data with the Iterable User Profile, either the RevenueCat `$email` or `$iterableUserId` [Subscriber Attributes](doc:subscriber-attributes) should be set in RevenueCat. The preferred method is to send the `$email` attribute. If neither of these fields exist, RevenueCat will fallback to the RevenueCat app user ID. You can read more about Iterable user profiles in Iterable's [Identifying the User](https://support.iterable.com/hc/en-us/articles/360035402531-Identifying-the-User-) documentation. 
[block:callout]
{
  "type": "info",
  "title": "$iterableUserId character limit",
  "body": "The `$iterableUserId` can be up to 52 characters long."
}
[/block]
## (optional) Set Iterable Campaign ID and/or Template ID
To attribute an event to an Iterable Campaign ID and/or Template ID, set the `$iterableCampaignId` and/or `$iterableTemplateId` subscriber attributes through the RevenueCat SDK or [REST API](https://docs.revenuecat.com/reference/update-subscriber-attributes).
[block:code]
{
  "codes": [
    {
      "code": "// Configure Purchases\nPurchases.configure(this, \"public_sdk_key\", \"my_app_user_id\");\n\n// Initialize Iterable\nIterableAPI.initialize(apiKey: \"<YOUR_API_KEY>\", launchOptions: launchOptions, config: config)\n\n// Setting Iterable email or userId\nIterableAPI.email = \"user@example.com\"\nIterableAPI.userId = \"user123\"\n\n\n// Set $email or $iterableUserId, (optional) $iterableCampaignId, $iterableTemplateId\nPurchases.shared.attribution.setAttributes([\"$email\" : IterableAPI.email],\n                               [\"$iterableUserId\" : IterableAPI.userId,\n                               [\"$iterableCampaignId\" : \"123\"],\n                               [\"$iterableTemplateId\" : \"123\"])\n\n",
      "language": "swift"
    },
    {
      "code": "// Configure Purchases\n[RCPurchases configureWithAPIKey:@\"public_sdk_key\"];\n\n// Initialize Iterable\n[IterableAPI initializeWithApiKey:@\"<YOUR_API_KEY>\" launchOptions:launchOptions config:config]\n\n// Setting Iterable email or userId\nIterableAPI.email = @\"user@example.com\";\nIterableAPI.userId = @\"user123\";\n\n// Set $email or $iterableUserId, (optional) $iterableCampaignId, $iterableTemplateId\n[[RCPurchases sharedPurchases] setAttributes:@{\n  @\"$email\": IterableAPI.email,\n  @\"iterableUserId\": IterableAPI.userId ,\n  @\"$iterableCampaignId\": @\"123\",\n  @\"$iterableTemplateId\": @\"123\"\n}];\n",
      "language": "objectivec"
    },
    {
      "code": "// Configure Purchases\nPurchases.configure(new PurchasesConfiguration.Builder(this, \"public_google_sdk_key\").build());\n\n// Initialize Iterable\nIterableApi.initialize(context, \"<YOUR_API_KEY>\", config);\n\n// Setting Iterable email or userId\nIterableApi.getInstance().setEmail(\"user@example.com\");\nIterableApi.getInstance().setUserId(\"user123\");\n\n// Set $email or $iterableUserId, (optional) $iterableCampaignId, $iterableTemplateId\nMap<String, String> attributes = new HashMap<String, String>();\nattributes.put(\"$email\", IterableApi.getInstance().getEmail());\nattributes.put(\"$iterableUserId\", IterableApi.getInstance().getUserId());\nattributes.put(\"$iterableCampaignId\", \"123\");\nattributes.put(\"$iterableTemplateId\", \"123\");\nPurchases.getSharedInstance().setAttributes(attributes);\n\n",
      "language": "java"
    },
    {
      "code": "// Configure Purchases\nif (Platform.OS === 'ios') {\n\tawait Purchases.setup(\"public_ios_sdk_key\");\n} else if (Platform.OS === 'android') {\n\tawait Purchases.setup(\"public_google_sdk_key\");\n\t// OR: if building for Amazon, be sure to follow the installation instructions then:\n\tawait Purchases.setup({ apiKey: \"public_amazon_sdk_key\", useAmazon: true });\n}\n\n// Initialize Iterable\nIterable.initialize('<YOUR_API_KEY>', config);\n\n// Setting Iterable email or userId\nIterable.setEmail(\"user@example.com\");\nIterable.setUserId(\"user123\");\n\n// Set $email or $iterableUserId, (optional) $iterableCampaignId, $iterableTemplateId\nIterable.getEmail().then(email => {\n\tconsole.log(\"Current email: \" + email);\n  \tPurchases.setAttributes({ \"$email\" : email });\n});\n\nIterable.getUserId().then(userId => {\n\tconsole.log(\"Current userId: \" + userId);\n  \tPurchases.setAttributes({ \"$iterableUserId\" : userId });\n});\n\nPurchases.setAttributes({ \"$iterableCampaignId\" : \"123\", \"$iterableTemplateId\" : \"123\" });\n",
      "language": "javascript",
      "name": "React Native"
    },
    {
      "code": "curl --request POST \\\n  --url https://api.revenuecat.com/v1/subscribers/app_user_id/attributes \\\n  --header 'Authorization: Bearer ' \\\n  --header 'Content-Type: application/json' \\\n  --data \\ \n  '{ \n\t\"attributes\" :  {\n\t\t\"$iterableCampaignId\": {\n\t\t\t\"value\": \"123\"\n\t\t},\n\t\t\"$iterableTemplateId\": {\n\t\t\t\"value\": \"123\"\n\t\t}\n\t}\n}'",
      "language": "curl"
    }
  ]
}
[/block]
## 2. Send RevenueCat Events to Iterable
After you've set up the Purchase SDK and Iterable SDK to have the same user identity, you can "turn on" the integration and configure the event names from the RevenueCat dashboard.

1. Navigate to your app in the RevenueCat and find the *Integrations* card in the left menu. Select **+ New**
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/1891d89-439289c-Screen_Shot_2021-12-01_at_12.23.10_PM.png",
        "439289c-Screen_Shot_2021-12-01_at_12.23.10_PM.png",
        332,
        410,
        "#f5f6f5"
      ]
    }
  ]
}
[/block]
2. Choose **Iterable** from the Integrations menu
3. Add your Iterable [Server-side API key](https://support.iterable.com/hc/en-us/articles/360043464871-API-Keys-#creating-api-keys) to the **API key** field in RevenueCat
4. Enter the event names that RevenueCat will send or choose the default event names
5. Select whether you want sales reported as gross revenue (before app store commission), or after store commission and/or estimated taxes.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/5191de2-Iterable.png",
        "Iterable.png",
        1791,
        3400,
        "#fbfcfc"
      ],
      "caption": "Iterable configuration page"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "title": "Iterable sandbox environment",
  "body": "Iterable recommends having a production and sandbox project to separate live and testing environments. You can input both keys in the RevenueCat Iterable settings page."
}
[/block]
# Testing the Iterable integration

## Make a sandbox purchase with a new user
Simulate a new user installing your app, and go through your app flow to complete the [sandbox purchase](doc:sandbox).

## Check that the Iterable event delivered successfully
While still on the Customer View, select the purchase event in the [Customer History](doc:customer-history) page and make sure that the Iterable integration event exists and was delivered successfully.
[block:image]
{
  "images": [
    {
      "image": []
    }
  ]
}
[/block]

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/470e07f-Screen_Shot_2022-02-11_at_4.36.22_PM.png",
        "Screen Shot 2022-02-11 at 4.36.22 PM.png",
        1126,
        177,
        "#f9f9f9"
      ]
    }
  ]
}
[/block]
## Check Iterable dashboard for the delivered event 
Navigate to your Iterable dashboard > Insights > Logs. To find Purchase events navigate to 'Purchases' and to find Custom events navigate to 'Events'. You will see events RevenueCat has dispatched to the Iterable under 'Purchase Log' and 'Events log'  respectively. 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/2b00ee8-Screen_Shot_2022-02-11_at_4.34.52_PM.png",
        "Screen Shot 2022-02-11 at 4.34.52 PM.png",
        2555,
        295,
        "#d8d8d8"
      ]
    }
  ]
}
[/block]

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/666b2e3-Screen_Shot_2022-02-11_at_4.35.04_PM.png",
        "Screen Shot 2022-02-11 at 4.35.04 PM.png",
        2556,
        335,
        "#dcdddd"
      ]
    }
  ]
}
[/block]
# Sample Events
Below are sample JSONs that are delivered to Iterable for events.
[block:code]
{
  "codes": [
    {
      "code": "{\n    \"id\": \"12345678-1234-1234-1234-123456789012\",\n    \"total\": 29.99,\n    \"user\": {\n        \"userId\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"preferUserId\": true,\n        \"dataFields\": {\n            \"subscriber_attributes\": {},\n            \"app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n            \"original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\"\n        }\n    },\n    \"items\": [\n        {\n            \"id\": \"premium_freetrial\",\n            \"name\": \"rc_initial_purchase_event\",\n            \"price\": 29.99,\n            \"quantity\": 1,\n            \"dataFields\": {\n                \"country_code\": \"US\",\n                \"currency\": \"USD\",\n                \"entitlement_ids\": [\n                    \"premium\"\n                ],\n                \"expiration_at_ms\": 1683233732021,\n                \"environment\": \"PRODUCTION\",\n                \"is_family_share\": false,\n                \"offer_code\": null,\n                \"period_type\": \"NORMAL\",\n                \"presented_offering_id\": null,\n                \"store\": \"PLAY_STORE\",\n                \"takehome_percentage\": 0.85,\n                \"original_transaction_id\": \"GPA.1234-5678-9012-34567\"\n            }\n        }\n    ],\n    \"createdAt\": 1651691577776\n}",
      "language": "json",
      "name": "Initial Purchase"
    },
    {
      "code": "{\n    \"id\": \"12345678-1234-1234-1234-123456789012\",\n    \"total\": 0,\n    \"user\": {\n        \"userId\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"preferUserId\": true,\n        \"dataFields\": {\n            \"subscriber_attributes\": {},\n            \"app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n            \"original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\"\n        }\n    },\n    \"items\": [\n        {\n            \"id\": \"annual_sub_1week_trial\",\n            \"name\": \"rc_trial_started_event\",\n            \"price\": 0,\n            \"quantity\": 1,\n            \"dataFields\": {\n                \"country_code\": \"US\",\n                \"currency\": \"USD\",\n                \"entitlement_ids\": null,\n                \"expiration_at_ms\": 1644623383000,\n                \"environment\": \"SANDBOX\",\n                \"is_family_share\": false,\n                \"offer_code\": null,\n                \"period_type\": \"TRIAL\",\n                \"presented_offering_id\": \"default\",\n                \"store\": \"APP_STORE\",\n                \"takehome_percentage\": 0.7,\n                \"original_transaction_id\": \"123456789012345\"\n            }\n        }\n    ],\n    \"createdAt\": 1644623203000\n}",
      "language": "json",
      "name": "Trial Started"
    },
    {
      "code": "{\n    \"id\": \"12345678-1234-1234-1234-123456789012\",\n    \"total\": 29.99,\n    \"user\": {\n        \"userId\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"preferUserId\": true,\n        \"dataFields\": {\n            \"subscriber_attributes\": {},\n            \"app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n            \"original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\"\n        }\n    },\n    \"items\": [\n        {\n            \"id\": \"annual_sub\",\n            \"name\": \"rc_trial_converted_event\",\n            \"price\": 29.99,\n            \"quantity\": 1,\n            \"dataFields\": {\n                \"country_code\": \"US\",\n                \"currency\": \"USD\",\n                \"entitlement_ids\": null,\n                \"expiration_at_ms\": 1644626983000,\n                \"environment\": \"SANDBOX\",\n                \"is_family_share\": false,\n                \"offer_code\": null,\n                \"period_type\": \"NORMAL\",\n                \"presented_offering_id\": \"default\",\n                \"store\": \"APP_STORE\",\n                \"takehome_percentage\": 0.7,\n                \"original_transaction_id\": \"123456789012345\"\n            }\n        }\n    ],\n    \"createdAt\": 1644623383000\n}",
      "language": "json",
      "name": "Trial Converted"
    },
    {
      "code": "{\n    \"createdAt\": 1663964010781,\n    \"dataFields\": {\n        \"app_id\": \"app1234567890\",\n        \"event_properties\": {\n            \"cancel_reason\": \"BILLING_ERROR\",\n            \"environment\": \"PRODUCTION\",\n            \"expiration_at_ms\": 1664050410466,\n            \"original_transaction_id\": \"GPA.1234-5678-9012-34567\",\n            \"period_type\": \"TRIAL\",\n            \"product_id\": \"annual_sub_1week_trial\",\n            \"store\": \"PLAY_STORE\",\n            \"transaction_id\": \"GPA.1234-5678-9012-34567\",\n        }\n    },\n    \"email\": null,\n    \"eventName\": \"rc_trial_cancelled_event\",\n    \"id\": \"12345678-1234-1234-1234-123456789012\",\n    \"userId\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n}",
      "language": "json",
      "name": "Trial Cancelled"
    },
    {
      "code": "{\n    \"id\": \"12345678-1234-1234-1234-123456789012\",\n    \"total\": 29.99,\n    \"user\": {\n        \"userId\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"preferUserId\": true,\n        \"dataFields\": {\n            \"subscriber_attributes\": {\n                \"$email\": {\n                    \"value\": \"first_last@gmail.com\",\n                    \"updated_at_ms\": 1644624942354\n                },\n                \"$iterableCampaignId\": {\n                    \"value\": \"01234\",\n                    \"updated_at_ms\": 1644634297590\n                },\n                \"$iterableTemplateId\": {\n                    \"value\": \"5678\",\n                    \"updated_at_ms\": 1644634301306\n                }\n            },\n            \"app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n            \"original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\"\n        },\n        \"email\": \"first_last@gmail.com\"\n    },\n    \"items\": [\n        {\n            \"id\": \"annual_sub\",\n            \"name\": \"rc_renewal_event\",\n            \"price\": 29.99,\n            \"quantity\": 1,\n            \"dataFields\": {\n                \"country_code\": \"US\",\n                \"currency\": \"USD\",\n                \"entitlement_ids\": null,\n                \"expiration_at_ms\": 1644648719000,\n                \"environment\": \"SANDBOX\",\n                \"is_family_share\": false,\n                \"offer_code\": null,\n                \"period_type\": \"NORMAL\",\n                \"presented_offering_id\": \"default\",\n                \"store\": \"APP_STORE\",\n                \"takehome_percentage\": 0.7,\n                \"original_transaction_id\": \"123456789012345\"\n            }\n        }\n    ],\n    \"createdAt\": 1644645119000,\n    \"campaignId\": \"01234\",\n    \"templateId\": \"5678\"\n}",
      "language": "json",
      "name": "Renewal"
    },
    {
      "code": "{\n    \"createdAt\": 1663963037855,\n    \"dataFields\": {\n        \"app_id\": \"app1234567890\",\n        \"event_properties\": {\n            \"cancel_reason\": \"UNSUBSCRIBE\",\n            \"environment\": \"PRODUCTION\",\n            \"expiration_at_ms\": 1666381224082,\n            \"original_transaction_id\": \"GPA.1234-5678-9012-34567\",\n            \"period_type\": \"NORMAL\",\n            \"product_id\": \"annual_sub\",\n            \"store\": \"PLAY_STORE\",\n            \"transaction_id\": \"GPA.1234-5678-9012-34567\",\n        }\n    },\n    \"email\": null,\n    \"eventName\": \"rc_cancellation_event\",\n    \"id\": \"12345678-1234-1234-1234-123456789012\",\n    \"userId\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n}",
      "language": "json",
      "name": "Cancellation"
    },
    {
      "code": "{\n    \"id\": \"12345678-1234-1234-1234-123456789012\",\n    \"eventName\": \"rc_uncancellation_event\",\n    \"userId\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n    \"dataFields\": {\n        \"event_properties\": {\n            \"environment\": \"SANDBOX\",\n            \"expiration_at_ms\": 1646073127000,\n            \"original_transaction_id\": \"123456789012345\",\n            \"period_type\": \"NORMAL\",\n            \"product_id\": \"annual_sub\",\n            \"store\": \"APP_STORE\",\n            \"transaction_id\": \"123456789012345\",\n            \"email\": \"first_last@gmail.com\"\n        }\n    },\n    \"createdAt\": 1646069715718,\n    \"campaignId\": \"0123\",\n    \"templateId\": \"4564\"\n}",
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
      "code": "{\n    \"id\": \"12345678-1234-1234-1234-123456789012\",\n    \"total\": 4.99,\n    \"user\": {\n        \"userId\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"preferUserId\": true,\n        \"dataFields\": {\n            \"subscriber_attributes\": {\n                \"$email\": {\n                    \"value\": \"first_last@gmail.com\",\n                    \"updated_at_ms\": 1659292070233\n                },\n                \"$iterableUserId\": {\n                    \"value\": \"12345A6B-C789-0D1E-FG23-456H6I7J890K\",\n                    \"updated_at_ms\": 1659292070233\n                },\n            },\n            \"app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n            \"original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\"\n        },\n        \"email\": \"first_last@gmail.com\"\n    },\n    \"items\": [\n        {\n            \"id\": \"100_tokens\",\n            \"name\": \"rc_non_subscription_purchase_event\",\n            \"price\": 4.99,\n            \"quantity\": 1,\n            \"dataFields\": {\n                \"country_code\": null,\n                \"currency\": \"USD\",\n                \"entitlement_ids\": [\n                    \"pro\"\n                ],\n                \"expiration_at_ms\": 1659897848466,\n                \"environment\": \"PRODUCTION\",\n                \"is_family_share\": null,\n                \"offer_code\": null,\n                \"period_type\": \"NORMAL\",\n                \"presented_offering_id\": null,\n                \"store\": \"APP_STORE\",\n                \"takehome_percentage\": 1.0,\n                \"original_transaction_id\": \"123456789012345\"\n            }\n        }\n    ],\n    \"createdAt\": 1659293048466\n}",
      "language": "json",
      "name": "Non Subscription Purchase"
    },
    {
      "code": "{\n    \"id\": \"12345678-1234-1234-1234-123456789012\",\n    \"email\": null,\n    \"eventName\": \"rc_subscription_paused_event\",\n    \"userId\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n    \"dataFields\": {\n        \"event_properties\": {\n            \"environment\": \"PRODUCTION\",\n            \"expiration_at_ms\": 1654366688509,\n            \"original_transaction_id\": \"GPA.1234-5678-9012-34567\",\n            \"period_type\": \"NORMAL\",\n            \"product_id\": \"monthly_sub_trial\",\n            \"store\": \"PLAY_STORE\",\n            \"transaction_id\": \"GPA.1234-5678-9012-34567\",\n            \"auto_resumes_at\": 1656951488509\n        }\n    },\n    \"createdAt\": 1651679019206\n}",
      "language": "json",
      "name": "Subscription Paused"
    },
    {
      "code": "{\n    \"createdAt\": 1663963579936,\n    \"dataFields\": {\n        \"app_id\": \"app1234567890\",\n        \"event_properties\": {\n            \"environment\": \"PRODUCTION\",\n            \"expiration_at_ms\": 1663963579936,\n            \"expiration_reason\": \"UNSUBSCRIBE\",\n            \"original_transaction_id\": \"GPA.1234-5678-9012-34567\",\n            \"period_type\": \"NORMAL\",\n            \"product_id\": \"weekly_sub\",\n            \"store\": \"PLAY_STORE\",\n            \"transaction_id\": \"GPA.1234-5678-9012-34567\",\n        }\n    },\n    \"email\": null,\n    \"eventName\": \"rc_expiration_event\",\n    \"id\": \"12345678-1234-1234-1234-123456789012\",\n    \"userId\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n}",
      "language": "json",
      "name": "Expiration"
    },
    {
      "code": "{\n    \"createdAt\": 1663964010781,\n    \"dataFields\": {\n        \"app_id\": \"app1234567890\",\n        \"event_properties\": {\n            \"environment\": \"PRODUCTION\",\n            \"expiration_at_ms\": 1664050410466,\n            \"grace_period_expires_at\": 1664580986800,\n            \"original_transaction_id\": \"GPA.1234-5678-9012-34567\",\n            \"period_type\": \"TRIAL\",\n            \"product_id\": \"annual_sub_one_week_trial\",\n            \"store\": \"PLAY_STORE\",\n            \"transaction_id\": \"GPA.1234-5678-9012-34567\",\n        }\n    },\n    \"email\": null,\n    \"eventName\": \"rc_billing_issue_event\",\n    \"id\": \"12345678-1234-1234-1234-123456789012\",\n    \"userId\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n}",
      "language": "json",
      "name": "Billing Issues"
    },
    {
      "code": "{\n    \"id\": \"12345678-1234-1234-1234-123456789012\",\n    \"email\": null,\n    \"eventName\": \"rc_product_change_event\",\n    \"userId\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n    \"dataFields\": {\n        \"event_properties\": {\n            \"environment\": \"PRODUCTION\",\n            \"expiration_at_ms\": 1652327468000,\n            \"original_transaction_id\": \"123456789012345\",\n            \"period_type\": \"TRIAL\",\n            \"product_id\": \"annual_sub_trial\",\n            \"store\": \"APP_STORE\",\n            \"transaction_id\": \"123456789012345\",\n            \"new_product_id\": \"annual_sub_trial\"\n        }\n    },\n    \"createdAt\": 1651722668000\n}",
      "language": "json",
      "name": "Product Change"
    }
  ]
}
[/block]
# Considerations
## Refunds
Revenue for Iterable campaign reporting will not be accurate due to refund events. You can build custom workflows around a "refund" event and independently calculate the total revenue refunded for your campaigns.
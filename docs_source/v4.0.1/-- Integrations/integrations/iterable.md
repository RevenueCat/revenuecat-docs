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
updatedAt: "2023-01-03T23:03:16.082Z"
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
    "h-0": "Event Type",
    "h-1": "Description",
    "h-2": "Iterable Event Type",
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
    "0-1": "A new subscription has been purchased or a lapsed user has resubscribed.",
    "1-1": "The start of an auto-renewing subscription product free trial.",
    "2-1": "When an auto-renewing subscription product converts from a free trial to normal paid period.",
    "3-1": "When a user turns off renewals for an auto-renewing subscription product during a free trial period.",
    "4-1": "When an existing subscription has been renewed.",
    "5-1": "When a user turns off renewals for an auto-renewing subscription product during the normal paid period.",
    "6-1": "When a user re-enables the auto-renew status for a subscription.",
    "7-1": "The purchase of any product that's not an auto-renewing subscription.",
    "8-1": "When a subscription is paused. Available for Google Play subscriptions only.",
    "9-1": "When a subscription expires.",
    "10-1": "When a billing issue is detected.",
    "0-2": "Purchase",
    "1-2": "Purchase",
    "2-2": "Purchase",
    "4-2": "Purchase",
    "3-2": "Custom",
    "5-2": "Custom",
    "6-2": "Custom",
    "7-2": "Purchase",
    "8-2": "Custom",
    "9-2": "Custom",
    "10-2": "Custom",
    "11-0": "Product Change",
    "11-1": "When user has changed the product of their subscription.\n\nThis does not mean the new subscription is in effect immediately. See [Managing Subscriptions](doc:managing-subscriptions) for more details on updates, downgrades, and crossgrades.",
    "11-2": "Custom"
  },
  "cols": 3,
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
# Sample Event
Below is a sample JSON that is delivered to Iterable for a trial started event. 
[block:code]
{
  "codes": [
    {
      "code": "{\n  \"createdAt\": 1644624970000,\n  \"id\": \"1000000967584331\",\n  \"items\": [\n    {\n      \"dataFields\": {\n        \"country_code\": \"US\",\n        \"currency\": \"USD\",\n        \"entitlement_ids\": [\n          \"pro\"\n        ],\n        \"environment\": \"SANDBOX\",\n        \"expiration_at_ms\": 1644625150000,\n        \"is_family_share\": false,\n        \"offer_code\": null,\n        \"original_transaction_id\": \"1000000967584331\",\n        \"period_type\": \"TRIAL\",\n        \"presented_offering_id\": \"default\",\n        \"store\": \"APP_STORE\",\n        \"takehome_percentage\": 0.7\n      },\n      \"id\": \"rc_3999_1y_1w0\",\n      \"name\": \"rc_trial_started_event\",\n      \"price\": 0,\n      \"quantity\": 1\n    }\n  ],\n  \"total\": 0,\n  \"user\": {\n    \"dataFields\": {\n      \"app_user_id\": \"$RCAnonymousID:354629ce52324242a03a42f5efe7d020\",\n      \"original_app_user_id\": \"$RCAnonymousID:354629ce52324242a03a42f5efe7d020\",\n      \"subscriber_attributes\": {\n        \"$email\": {\n          \"updated_at_ms\": 1644624942354,\n          \"value\": \"test@gmail.com\"\n        }\n      }\n    },\n    \"email\": \"test@gmail.com\",\n    \"preferUserId\": true,\n    \"userId\": \"$RCAnonymousID:354629ce52324242a03a42f5efe7d020\"\n  }\n}",
      "language": "json"
    }
  ]
}
[/block]
# Considerations
## Refunds
Revenue for Iterable campaign reporting will not be accurate due to refund events. You can build custom workflows around a "refund" event and independently calculate the total revenue refunded for your campaigns.
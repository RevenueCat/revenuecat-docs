---
title: "Statsig"
slug: "statsig"
excerpt: "Integrate in-app subscription events from RevenueCat with Statsig"
hidden: false
createdAt: "2021-10-06T16:01:28.989Z"
updatedAt: "2021-11-08T16:32:36.244Z"
---
[block:callout]
{
  "type": "success",
  "body": "The Statsig integration is available on the [Pro](https://www.revenuecat.com/pricing) plan."
}
[/block]
RevenueCat can automatically send billing, subscription, and revenue metrics to your Statsig project. This can be helpful in optimizing purchases and revenue, and understanding which features are causing product metrics to move. For example, you might want to:
* Compute how every new product improvement impacts your business metrics
* Simplify setting up Feature Gates and be able to automatically A/B test new features
* Run multiple independent experiments in parallel

# 0. Matching RevenueCat Users with Statsig Users 

In order to associate RevenueCat data with Statsig feature gate and/or experiment, the RevenueCat app user ID must match the Statsig User ID. You can read more about Statsig user IDs in their documentation [here](https://docs.statsig.com/server/python/index#statsig-user). You can set up a custom app user ID in RevenueCat by following the instructions in our [Identifying Users](doc:user-ids#provided-app-user-id) documentation. 

# 1. Enable RevenueCat integration with Statsig

On the Statsig [Integration page](https://console.statsig.com/integrations) enable the RevenueCat integration.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/af93af9-enableStatSig.png",
        "enableStatSig.png",
        676,
        578,
        "#000000"
      ],
      "caption": "Enable RevenueCat in Statsig integration page"
    }
  ]
}
[/block]
# 2. Send RevenueCat events into Statsig

After you enabled the RevenueCat integration in Statsig's dashboard, you can "turn on" the integration from the RevenueCat dashboard.
1. Navigate to your app in the RevenueCat dashboard and choose 'Statsig' from the integrations menu.
2. Add your ['statsig-server-secret'](https://docs.statsig.com/feature-gates/implement/server#step-1-get-the-statsig-server-secret-key)

Remember to select 'Save'
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/f8b5f66-Screen_Shot_2021-11-05_at_9.20.40_AM.png",
        "Screen Shot 2021-11-05 at 9.20.40 AM.png",
        1694,
        628,
        "#f9fafa"
      ],
      "caption": "Statsig configuration page"
    }
  ]
}
[/block]
# 3. Testing the Statsig integration

Ingesting sandbox events into Statsig can be enabled in the RevenueCat configuration in the Statsig [Integration page](https://console.statsig.com/integrations).
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/bbd8c17-enable_sandbox.png",
        "enable_sandbox.png",
        1542,
        376,
        "#000000"
      ],
      "caption": "Include Sandbox Events in Statsig integration page"
    }
  ]
}
[/block]
## Make a sandbox purchase with a new user
Simulate a new user installing your app, and go through your app flow to complete a sandbox purchase.

## Check that the Statsig event delivered successfully
While still on the Customer View, select test purchase event in the [Customer History](doc:customer-history) page and make sure that the Statsig integration event exists and was delivered successfully.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/7632c3b-statsig_customer_history.png",
        "statsig_customer_history.png",
        2240,
        114,
        "#000000"
      ]
    }
  ]
}
[/block]
## Check Statsig dashboard for the delivered event
Navigate to your Statsig app > Metrics. You will see events RevenueCat has dispatched to Statsig under 'Log Stream'.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/8afcbd5-statsig_events.png",
        "statsig_events.png",
        2762,
        622,
        "#000000"
      ]
    }
  ]
}
[/block]
# Sample Event
Below is sample JSON that is delivered to Statsig for a Trial Started event.


[block:code]
{
  "codes": [
    {
      "code": "{\n  \"api_version\": \"1.0\",\n  \"event\": {\n    \"aliases\": [\n      \"yourCustomerAliasedID\"\n    ],\n    \"app_id\": \"yourAppID\",\n    \"app_user_id\": \"yourCustomerAppUserID\",\n    \"country_code\": \"US\",\n    \"currency\": \"USD\",\n    \"entitlement_ids\": [\n      \"pro_cat\"\n    ],\n    \"environment\": \"SANDBOX\",\n    \"event_timestamp_ms\": 1636388733968,\n    \"expiration_at_ms\": 1636388909000,\n    \"id\": \"UniqueIdentifierOfEvent\",\n    \"is_family_share\": false,\n    \"offer_code\": null,\n    \"original_app_user_id\": \"OriginalAppUserID\",\n    \"original_transaction_id\": \"1000000906455653\",\n    \"period_type\": \"TRIAL\",\n    \"presented_offering_id\": \"OfferingID\",\n    \"price\": 0,\n    \"price_in_purchased_currency\": 0,\n    \"product_id\": \"com.revenuecat.monthly_4.99.1_week_intro\",\n    \"purchased_at_ms\": 1636388729000,\n    \"store\": \"APP_STORE\",\n    \"subscriber_attributes\": {},\n    \"takehome_percentage\": 0.7,\n    \"transaction_id\": \"1000000906455653\",\n    \"type\": \"INITIAL_PURCHASE\"\n  }\n}",
      "language": "json",
      "name": "JSON"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "success",
  "title": "You've done it!",
  "body": "You should start seeing subscription data from RevenueCat appear in Statsig"
}
[/block]
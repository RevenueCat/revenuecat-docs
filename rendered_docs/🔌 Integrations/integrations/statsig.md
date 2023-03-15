---
title: Statsig
slug: statsig
excerpt: Integrate in-app subscription events from RevenueCat with Statsig
hidden: false
metadata:
  title: Statsig Integration – RevenueCat
  image:
    0: https://files.readme.io/765fe34-RevenueCat_Docs_OG.png
    1: RevenueCat Docs OG.png
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: '2021-10-06T16:01:28.989Z'
updatedAt: '2022-06-02T21:40:31.740Z'
category: 640a7bf1c7bae2004235517b
---
[block:callout]
{
  "type": "success",
  "body": "The Statsig integration is available on the [Pro](https://www.revenuecat.com/pricing) plan."
}
[/block]
Statsig can be a helpful integration for optimizing purchases and revenue, and understanding which features are causing product metrics to move. RevenueCat can automatically send billing, subscription, and revenue metrics to your Statsig project. 

With our Statsig integration, you can:
- Compute how every new product improvement impacts your business metrics
- Simplify setting up Feature Gates and be able to automatically A/B test new features
- Run multiple independent experiments in parallel

With accurate and up-to-date subscription data in Statsig, you'll be set to turbocharge your product analytics ⚡️

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

1. Navigate to your project in the RevenueCat dashboard and find the *Integrations* card in the left menu. Select **+ New** 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/439289c-Screen_Shot_2021-12-01_at_12.23.10_PM.png",
        "Screen Shot 2021-12-01 at 12.23.10 PM.png",
        332,
        410,
        "#f5f6f5"
      ]
    }
  ]
}
[/block]
2. Choose **Statsig** from the Integrations menu.
2. Add your ['statsig-server-secret'](https://docs.statsig.com/feature-gates/implement/server#step-1-get-the-statsig-server-secret-key)

Remember to select **Add Integration**
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/14fc009-Screen_Shot_2021-12-01_at_12.57.55_PM.png",
        "Screen Shot 2021-12-01 at 12.57.55 PM.png",
        952,
        236,
        "#f7f9f9"
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
```json
{
  "api_version": "1.0",
  "event": {
    "aliases": [
      "yourCustomerAliasedID"
    ],
    "app_id": "yourAppID",
    "app_user_id": "yourCustomerAppUserID",
    "country_code": "US",
    "currency": "USD",
    "entitlement_ids": [
      "pro_cat"
    ],
    "environment": "SANDBOX",
    "event_timestamp_ms": 1636388733968,
    "expiration_at_ms": 1636388909000,
    "id": "UniqueIdentifierOfEvent",
    "is_family_share": false,
    "offer_code": null,
    "original_app_user_id": "OriginalAppUserID",
    "original_transaction_id": "1000000906455653",
    "period_type": "TRIAL",
    "presented_offering_id": "OfferingID",
    "price": 0,
    "price_in_purchased_currency": 0,
    "product_id": "com.revenuecat.monthly_4.99.1_week_intro",
    "purchased_at_ms": 1636388729000,
    "store": "APP_STORE",
    "subscriber_attributes": {},
    "takehome_percentage": 0.7,
    "transaction_id": "1000000906455653",
    "type": "INITIAL_PURCHASE"
  }
}
```

[block:callout]
{
  "type": "success",
  "title": "You've done it!",
  "body": "You should start seeing subscription data from RevenueCat appear in Statsig."
}
[/block]
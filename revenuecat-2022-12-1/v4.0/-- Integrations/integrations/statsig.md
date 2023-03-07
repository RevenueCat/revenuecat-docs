---
title: "Statsig"
slug: "statsig"
excerpt: "Integrate in-app subscription events from RevenueCat with Statsig"
hidden: false
metadata: 
  title: "Statsig Integration – RevenueCat"
  image: 
    0: "https://files.readme.io/765fe34-RevenueCat_Docs_OG.png"
    1: "RevenueCat Docs OG.png"
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: "2021-10-06T16:01:28.989Z"
updatedAt: "2023-02-21T15:01:14.708Z"
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
# Sample Events
Below are sample JSONs that are delivered to Statsig for each event type.
[block:code]
{
  "codes": [
    {
      "code": "{\n    \"event\": {\n        \"event_timestamp_ms\": 1637029477784,\n        \"product_id\": \"1_month\",\n        \"period_type\": \"NORMAL\",\n        \"purchased_at_ms\": 1637029467526,\n        \"expiration_at_ms\": 1639628655405,\n        \"environment\": \"PRODUCTION\",\n        \"entitlement_ids\": [\n            \"pro\"\n        ],\n        \"presented_offering_id\": null,\n        \"transaction_id\": \"GPA.1234-5678-9012-34567\",\n        \"original_transaction_id\": \"GPA.1234-5678-9012-34567\",\n        \"is_family_share\": false,\n        \"country_code\": \"US\",\n        \"app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"aliases\": [\n            \"12abc345d67e890fgh12j3lm456n7890\"\n        ],\n        \"original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"currency\": \"USD\",\n        \"price\": 14.99,\n        \"price_in_purchased_currency\": 14.99,\n        \"subscriber_attributes\": {\n            \"$email\": {\n                \"value\": \"firstlast@gmail.com\",\n                \"updated_at_ms\": 1637029304629\n            }\n        },\n        \"store\": \"PLAY_STORE\",\n        \"takehome_percentage\": 0.85,\n        \"offer_code\": null,\n        \"type\": \"initial_purchase\",\n        \"id\": \"12345678-1234-1234-1234-123456789012\",\n        \"app_id\": \"1234567890\",\n    },\n    \"api_version\": \"1.0\"\n}",
      "language": "json",
      "name": "Initial Purchase"
    },
    {
      "code": "{\n    \"event\": {\n        \"event_timestamp_ms\": 1637000963815,\n        \"product_id\": \"1_month\",\n        \"period_type\": \"NORMAL\",\n        \"purchased_at_ms\": 1637029695000,\n        \"expiration_at_ms\": 1639621695000,\n        \"environment\": \"PRODUCTION\",\n        \"entitlement_ids\": [\n            \"pro\"\n        ],\n        \"presented_offering_id\": null,\n        \"transaction_id\": \"123456789012345\",\n        \"original_transaction_id\": \"123456789012345\",\n        \"is_family_share\": false,\n        \"country_code\": \"US\",\n        \"app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"aliases\": [\n            \"12abc345d67e890fgh12j3lm456n7890\"\n        ],\n        \"original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"currency\": \"USD\",\n        \"is_trial_conversion\": false,\n        \"price\": 14.99,\n        \"price_in_purchased_currency\": 14.99,\n        \"subscriber_attributes\": {\n            \"$email\": {\n                \"value\": \"firstlast@gmail.com\",\n                \"updated_at_ms\": 1599867695969\n            }\n        },\n        \"store\": \"APP_STORE\",\n        \"takehome_percentage\": 0.85,\n        \"offer_code\": null,\n        \"type\": \"renewal\",\n        \"id\": \"12345678-1234-1234-1234-123456789012\",\n        \"app_id\": \"1234567890\",\n    },\n    \"api_version\": \"1.0\"\n}",
      "language": "json",
      "name": "Renewal"
    },
    {
      "code": "{\n    \"event\": {\n        \"event_timestamp_ms\": 1636393200702,\n        \"product_id\": \"1_month_trial\",\n        \"period_type\": \"NORMAL\",\n        \"purchased_at_ms\": 1636392545000,\n        \"expiration_at_ms\": 1636392845000,\n        \"environment\": \"SANDBOX\",\n        \"entitlement_ids\": [\n            \"pro\"\n        ],\n        \"presented_offering_id\": \"default\",\n        \"transaction_id\": \"123456789012345\",\n        \"original_transaction_id\": \"123456789012345\",\n        \"is_family_share\": false,\n        \"country_code\": \"US\",\n        \"app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"aliases\": [\n            \"12abc345d67e890fgh12j3lm456n7890\"\n        ],\n        \"original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"cancel_reason\": \"UNSUBSCRIBE\",\n        \"currency\": \"USD\",\n        \"price\": 0.0,\n        \"price_in_purchased_currency\": 0.0,\n        \"subscriber_attributes\": {},\n        \"store\": \"APP_STORE\",\n        \"takehome_percentage\": 0.7,\n        \"offer_code\": null,\n        \"type\": \"cancellation\",\n        \"id\": \"12345678-1234-1234-1234-123456789012\",\n        \"app_id\": \"1234567890\",\n    },\n    \"api_version\": \"1.0\"\n}",
      "language": "json",
      "name": "Cancellation"
    },
    {
      "code": "{\n    \"event\": {\n        \"event_timestamp_ms\": 1640819176602,\n        \"product_id\": \"annual\",\n        \"period_type\": \"NORMAL\",\n        \"purchased_at_ms\": 1609879926614,\n        \"expiration_at_ms\": 1641415926614,\n        \"environment\": \"PRODUCTION\",\n        \"entitlement_ids\": [\n            \"pro\"\n        ],\n        \"presented_offering_id\": null,\n        \"transaction_id\": \"GPA.1234-5678-9012-34567..0\",\n        \"original_transaction_id\": \"GPA.1234-5678-9012-34567\",\n        \"is_family_share\": false,\n        \"country_code\": \"CA\",\n        \"app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"aliases\": [\n            \"12abc345d67e890fgh12j3lm456n7890\"\n        ],\n        \"original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"currency\": \"CAD\",\n        \"price\": 0.0,\n        \"price_in_purchased_currency\": 0.0,\n        \"subscriber_attributes\": {\n            \"$email\": {\n                \"value\": \"firstlast@gmail.com\",\n                \"updated_at_ms\": 1621722480238\n            }\n        },\n        \"store\": \"PLAY_STORE\",\n        \"takehome_percentage\": 0.7,\n        \"offer_code\": null,\n        \"type\": \"uncancellation\",\n        \"id\": \"12345678-1234-1234-1234-123456789012\",\n        \"app_id\": \"1234567890\",\n    },\n    \"api_version\": \"1.0\"\n}",
      "language": "json",
      "name": "Uncancellation"
    },
    {
      "code": "{\n    \"event\": {\n        \"event_timestamp_ms\": 1637190959056,\n        \"product_id\": \"lifetime\",\n        \"period_type\": \"PROMOTIONAL\",\n        \"purchased_at_ms\": 1637190959012,\n        \"expiration_at_ms\": null,\n        \"environment\": \"PRODUCTION\",\n        \"entitlement_ids\": [\n            \"pro\"\n        ],\n        \"presented_offering_id\": null,\n        \"transaction_id\": \"123456789012345\",\n        \"original_transaction_id\": \"123456789012345\",\n        \"is_family_share\": null,\n        \"country_code\": \"EG\",\n        \"app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"aliases\": [\n            \"12abc345d67e890fgh12j3lm456n7890\"\n        ],\n        \"original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"currency\": \"USD\",\n        \"price\": 0,\n        \"price_in_purchased_currency\": 0,\n        \"subscriber_attributes\": {\n            \"$email\": {\n                \"value\": \"firstlast@gmail.com\",\n                \"updated_at_ms\": 1637170450860\n            }\n        },\n        \"store\": \"PROMOTIONAL\",\n        \"takehome_percentage\": 1.0,\n        \"offer_code\": null,\n        \"type\": \"non_subscription_purchase\",\n        \"id\": \"12345678-1234-1234-1234-123456789012\",\n    },\n    \"api_version\": \"1.0\"\n}",
      "language": "json",
      "name": "Non Subscription Purchase"
    },
    {
      "code": "{\n    \"event\": {\n        \"event_timestamp_ms\": 1653428219007,\n        \"product_id\": \"1_month_trial\",\n        \"period_type\": \"NORMAL\",\n        \"purchased_at_ms\": 1653055384116,\n        \"expiration_at_ms\": 1655740984116,\n        \"environment\": \"PRODUCTION\",\n        \"entitlement_ids\": [\n            \"Premium\"\n        ],\n        \"presented_offering_id\": \"default\",\n        \"transaction_id\": \"GPA.1234-5678-9012-34567\",\n        \"original_transaction_id\": \"GPA.1234-5678-9012-34567\",\n        \"is_family_share\": false,\n        \"country_code\": \"NL\",\n        \"app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"aliases\": [\n            \"12abc345d67e890fgh12j3lm456n7890\"\n        ],\n        \"original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"auto_resume_at_ms\": 1663682584116,\n        \"currency\": \"EUR\",\n        \"price\": 0.0,\n        \"price_in_purchased_currency\": 0.0,\n        \"subscriber_attributes\": {\n            \"$ip\": {\n                \"value\": \"123.45.67.89\",\n                \"updated_at_ms\": 1647518583621\n            },\n            \"$gpsAdId\": {\n                \"value\": \"12345678-9012-3456-7890-123456789012\",\n                \"updated_at_ms\": 1647518583621\n            },\n            \"$fbAnonId\": {\n                \"value\": \"1234567890-1234-5678-9012-345678901234\",\n                \"updated_at_ms\": 1647518583693\n            },\n            \"$androidId\": {\n                \"value\": \"1234567890123456\",\n                \"updated_at_ms\": 1647518583621\n            }\n        },\n        \"store\": \"PLAY_STORE\",\n        \"takehome_percentage\": 0.85,\n        \"offer_code\": null,\n        \"type\": \"subscription_paused\",\n        \"id\": \"12345678-1234-1234-1234-123456789012\",\n        \"app_id\": \"1234567890\",\n    },\n    \"api_version\": \"1.0\"\n}",
      "language": "json",
      "name": "Subscription Paused"
    }
  ]
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "{\n    \"event\": {\n        \"event_timestamp_ms\": 1637084145365,\n        \"product_id\": \"1_month\",\n        \"period_type\": \"NORMAL\",\n        \"purchased_at_ms\": 1634398134000,\n        \"expiration_at_ms\": 1637080134000,\n        \"environment\": \"PRODUCTION\",\n        \"entitlement_ids\": [\n            \"pro\"\n        ],\n        \"presented_offering_id\": null,\n        \"transaction_id\": \"123456789012345\",\n        \"original_transaction_id\": \"123456789012345\",\n        \"is_family_share\": false,\n        \"country_code\": \"US\",\n        \"app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"aliases\": [\n            \"12abc345d67e890fgh12j3lm456n7890\"\n        ],\n        \"original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"expiration_reason\": \"UNSUBSCRIBE\",\n        \"currency\": \"USD\",\n        \"price\": 0.0,\n        \"price_in_purchased_currency\": 0.0,\n        \"subscriber_attributes\": {\n            \"$email\": {\n                \"value\": \"firstlast@gmail.com\",\n                \"updated_at_ms\": 1612318142089\n            }\n        },\n        \"store\": \"APP_STORE\",\n        \"takehome_percentage\": 0.85,\n        \"offer_code\": null,\n        \"type\": \"expiration\",\n        \"id\": \"12345678-1234-1234-1234-123456789012\",\n        \"app_id\": \"1234567890\",\n    },\n    \"api_version\": \"1.0\"\n}",
      "language": "json",
      "name": "Expiration"
    },
    {
      "code": "{\n    \"event\": {\n        \"event_timestamp_ms\": 1637032896187,\n        \"product_id\": \"1_month\",\n        \"period_type\": \"NORMAL\",\n        \"purchased_at_ms\": 1634350887000,\n        \"expiration_at_ms\": 1638415287000,\n        \"environment\": \"PRODUCTION\",\n        \"entitlement_ids\": [\n            \"pro\"\n        ],\n        \"presented_offering_id\": null,\n        \"transaction_id\": \"123456789012345\",\n        \"original_transaction_id\": \"123456789012345\",\n        \"is_family_share\": false,\n        \"country_code\": \"US\",\n        \"app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"aliases\": [\n            \"12abc345d67e890fgh12j3lm456n7890\"\n        ],\n        \"original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"grace_period_expiration_at_ms\": 1638415287000,\n        \"currency\": \"USD\",\n        \"price\": 0.0,\n        \"price_in_purchased_currency\": 0.0,\n        \"subscriber_attributes\": {\n            \"$email\": {\n                \"value\": \"firstlast@gmail.com\",\n                \"updated_at_ms\": 1631065160180\n            }\n        },\n        \"store\": \"APP_STORE\",\n        \"takehome_percentage\": 0.85,\n        \"offer_code\": null,\n        \"type\": \"billing_issue\",\n        \"id\": \"12345678-1234-1234-1234-123456789012\",\n        \"app_id\": \"1234567890\",\n    },\n    \"api_version\": \"1.0\"\n}",
      "language": "json",
      "name": "Billing Issue"
    },
    {
      "code": "{\n    \"event\": {\n        \"event_timestamp_ms\": 1638167985431,\n        \"product_id\": \"1_month\",\n        \"period_type\": \"NORMAL\",\n        \"purchased_at_ms\": 1635176519000,\n        \"expiration_at_ms\": 1637858519000,\n        \"environment\": \"PRODUCTION\",\n        \"entitlement_ids\": [\n            \"pro\"\n        ],\n        \"presented_offering_id\": null,\n        \"transaction_id\": \"123456789012345\",\n        \"original_transaction_id\": \"123456789012345\",\n        \"is_family_share\": false,\n        \"country_code\": \"US\",\n        \"app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"aliases\": [\n            \"12abc345d67e890fgh12j3lm456n7890\"\n        ],\n        \"original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"new_product_id\": \"6_month\",\n        \"currency\": \"USD\",\n        \"price\": 0.0,\n        \"price_in_purchased_currency\": 0.0,\n        \"subscriber_attributes\": {\n            \"$email\": {\n                \"value\": \"firstlast@gmail.com\",\n                \"updated_at_ms\": 1634299061231\n            }\n        },\n        \"store\": \"APP_STORE\",\n        \"takehome_percentage\": 0.85,\n        \"offer_code\": null,\n        \"type\": \"product_change\",\n        \"id\": \"12345678-1234-1234-1234-123456789012\",\n        \"app_id\": \"1234567890\",\n    },\n    \"api_version\": \"1.0\"\n}",
      "language": "json",
      "name": "Product Change"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "success",
  "title": "You've done it!",
  "body": "You should start seeing subscription data from RevenueCat appear in Statsig."
}
[/block]
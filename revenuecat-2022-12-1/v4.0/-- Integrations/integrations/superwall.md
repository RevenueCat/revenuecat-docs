---
title: "Superwall"
slug: "superwall"
excerpt: "Integrate in-app purchase events from RevenueCat with Superwall"
hidden: false
metadata: 
  title: "Superwall Integration – RevenueCat"
  image: 
    0: "https://files.readme.io/12648e0-RevenueCat_Docs_OG.png"
    1: "RevenueCat Docs OG.png"
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: "2022-01-11T20:35:00.013Z"
updatedAt: "2023-02-21T15:01:19.119Z"
---
[block:callout]
{
  "type": "success",
  "body": "The Superwall integration is available on the [Pro](https://www.revenuecat.com/pricing) plan."
}
[/block]
Superwall can be a helpful integration for optimizing pricing and understanding which paywalls are producing customers with the highest LTV. RevenueCat can automatically send billing, subscription, and revenue metrics to Superwall, a paywall SDK that lets you remotely update every aspect of your paywall. 

With our Superwall integration, you can:
- Create paywalls on-the-fly without shipping app updates
- Determine which paywalls have high trial conversion rates
- Find which product & paywall combinations have the highest LTVs
- Offer discounts to users who churn

# Events
The Superwall integration tracks the following events:

[block:parameters]
{
  "data": {
    "h-0": "Event",
    "h-1": "Description",
    "0-0": "Initial Purchase",
    "0-1": "The first purchase of an auto-renewing subscription product, includes free trials.",
    "2-0": "Renewal",
    "2-1": "When an auto-renewing subscription product renews OR a user repurchases the auto-renewing subscription product after a lapse in their subscription.",
    "4-0": "Cancellation",
    "4-1": "A subscription or non-renewing purchase has been cancelled.",
    "5-0": "Uncancellation",
    "5-1": "When a user re-enables the auto-renew status for a subscription.",
    "7-0": "Subscription paused",
    "7-1": "A subscription has been paused.",
    "9-0": "Expiration",
    "9-1": "A subscription has expired and access should be removed.",
    "1-0": "Non Subscription Purchase",
    "1-1": "The purchase of any product that's not an auto-renewing subscription.",
    "3-0": "Product Change",
    "3-1": "A subscriber has changed the product of their subscription.",
    "6-0": "Billing Issues",
    "6-1": "There has been a problem trying to charge the subscriber.\n\nThis does not mean the subscription has expired (in the case of a grace period enabled).",
    "8-0": "Transfer",
    "8-1": "A transfer of transactions and entitlements was initiated between one App User ID(s) to another."
  },
  "cols": 2,
  "rows": 10
}
[/block]
# Setup
## 1. Set Superwall User Identity
In order to associate RevenueCat subscription data with Superwall paywall events, the RevenueCat app user ID must match the Superwall app user ID. You can read more about how Superwall handles user ID’s in their documentation [here](https://docs.superwall.me/docs/user-management). You can set up a custom app user ID in RevenueCat by following the instructions in our [Identifying Users](https://docs.revenuecat.com/docs/user-ids#provided-app-user-id) documentation.

## 2. Send RevenueCat events to Superwall
After you've set up the Purchases SDK and Superwall SDK to have the same user identity, you can "turn on" the integration from the RevenueCat dashboard. 
1. Navigate to your project in the RevenueCat dashboard and find the *Integrations* card in the left menu. Select **+ New**

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/2ff3026-439289c-Screen_Shot_2021-12-01_at_12.23.10_PM.png",
        "439289c-Screen_Shot_2021-12-01_at_12.23.10_PM.png",
        332,
        410,
        "#f5f6f5"
      ]
    }
  ]
}
[/block]
2. Choose **Superwall** from the Integrations menu
3. Add your Superwall Token (Superwall settings > Integrations)

Remember to select *Add Integration*
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/449d89f-Screen_Shot_2022-02-07_at_4.12.39_PM.png",
        "Screen Shot 2022-02-07 at 4.12.39 PM.png",
        1864,
        420,
        "#f8fafa"
      ]
    }
  ]
}
[/block]
# Testing the Superwall integration
## Make a sandbox purchase with a new user
Simulate a new user installing your app, and go through your app flow to complete the sandbox purchase.

## Check that the Superwall event delivered successfully
While still on the Customer View, select the purchase event in the [Customer History](doc:customer-history) page and make sure that the Superwall integration event exists and was delivered successfully.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/1643a7c-Screenshot_at_Feb_07_16-35-24.png",
        "Screenshot at Feb 07 16-35-24.png",
        2246,
        346,
        "#000000"
      ]
    }
  ]
}
[/block]
## Check Superwall dashboard for the delivered event 
Navigate to your Superwall dashboard > Users and search for the created app user ID. You will see events RevenueCat has dispatched to the Superwall under 'Recent Events'.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/71fe3aa-Screenshot_at_Feb_07_16-36-50.png",
        "Screenshot at Feb 07 16-36-50.png",
        2352,
        350,
        "#000000"
      ]
    }
  ]
}
[/block]
# Sample Events
Below are sample JSONs that are delivered to Superwall for each event type. 
[block:code]
{
  "codes": [
    {
      "code": "{\n    \"event\": {\n        \"event_timestamp_ms\": 1641980452341,\n        \"product_id\": \"annual\",\n        \"period_type\": \"NORMAL\",\n        \"purchased_at_ms\": 1641980447000,\n        \"expiration_at_ms\": 1642585247000,\n        \"environment\": \"PRODUCTION\",\n        \"entitlement_ids\": [\n            \"premium\"\n        ],\n        \"presented_offering_id\": null,\n        \"transaction_id\": \"123456789012345\",\n        \"original_transaction_id\": \"123456789012345\",\n        \"is_family_share\": false,\n        \"country_code\": \"US\",\n        \"app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"aliases\": [\n            \"12abc345d67e890fgh12j3lm456n7890\"\n        ],\n        \"original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"currency\": \"USD\",\n        \"price\": 89.99,\n        \"price_in_purchased_currency\": 89.99,\n        \"subscriber_attributes\": {\n            \"$ip\": {\n                \"value\": \"123.45.67.89\",\n                \"updated_at_ms\": 1641980373773\n            },\n            \"$idfa\": {\n                \"value\": \"00000000-0000-0000-0000-000000000000\",\n                \"updated_at_ms\": 1641980373773\n            },\n            \"$idfv\": {\n                \"value\": \"12345A6B-C789-0D1E-FG23-456H6I7J890K\",\n                \"updated_at_ms\": 1641980373773\n            },\n            \"$appsflyerId\": {\n                \"value\": \"1234567890123-1234567890123456789\",\n                \"updated_at_ms\": 1641980373775\n            }\n        },\n        \"store\": \"APP_STORE\",\n        \"takehome_percentage\": 0.7,\n        \"offer_code\": null,\n        \"type\": \"initial_purchase\",\n        \"id\": \"12345678-1234-1234-1234-123456789012\",\n        \"app_id\": \"1234567890\"\n    },\n    \"api_version\": \"1.0\"\n}",
      "language": "json",
      "name": "Initial Purchase"
    },
    {
      "code": "{\n    \"event\": {\n        \"event_timestamp_ms\": 1641990066553,\n        \"product_id\": \"weekly\",\n        \"period_type\": \"NORMAL\",\n        \"purchased_at_ms\": 1642018648000,\n        \"expiration_at_ms\": 1642623448000,\n        \"environment\": \"PRODUCTION\",\n        \"entitlement_ids\": [\n            \"premium\"\n        ],\n        \"presented_offering_id\": null,\n        \"transaction_id\": \"123456789012345\",\n        \"original_transaction_id\": \"123456789012345\",\n        \"is_family_share\": false,\n        \"country_code\": \"US\",\n        \"app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"aliases\": [\n            \"12abc345d67e890fgh12j3lm456n7890\"\n        ],\n        \"original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"currency\": \"USD\",\n        \"is_trial_conversion\": false,\n        \"price\": 4.99,\n        \"price_in_purchased_currency\": 4.99,\n        \"subscriber_attributes\": {\n            \"$ip\": {\n                \"value\": \"123.45.67.89\",\n                \"updated_at_ms\": 1635966996059\n            },\n            \"$idfa\": {\n                \"value\": \"00000000-0000-0000-0000-000000000000\",\n                \"updated_at_ms\": 1635966996058\n            },\n            \"$idfv\": {\n                \"value\": \"12345A6B-C789-0D1E-FG23-456H6I7J890K\",\n                \"updated_at_ms\": 1634600054627\n            },\n            \"$email\": {\n                \"value\": \"firstlast@gmail.com\",\n                \"updated_at_ms\": 1635967259599\n            },\n            \"$appsflyerId\": {\n                \"value\": \"1234567890123-1234567890123456789\",\n                \"updated_at_ms\": 1634600054630\n            },\n            \"$displayName\": {\n                \"value\": \"FirstLast\",   \n                \"updated_at_ms\": 1635967185821\n            }\n        },\n        \"store\": \"APP_STORE\",\n        \"takehome_percentage\": 0.7,\n        \"offer_code\": null,\n        \"type\": \"renewal\",\n        \"id\": \"12345678-1234-1234-1234-123456789012\",\n        \"app_id\": \"1234567890\"\n    },\n    \"api_version\": \"1.0\"\n}",
      "language": "json",
      "name": "Renewal"
    },
    {
      "code": "{\n    \"event\": {\n        \"event_timestamp_ms\": 1641979460185,\n        \"product_id\": \"annual\",\n        \"period_type\": \"NORMAL\",\n        \"purchased_at_ms\": 1641489607000,\n        \"expiration_at_ms\": 1673025607000,\n        \"environment\": \"PRODUCTION\",\n        \"entitlement_ids\": [\n            \"premium\"\n        ],\n        \"presented_offering_id\": null,\n        \"transaction_id\": \"123456789012345\",\n        \"original_transaction_id\": \"123456789012345\",\n        \"is_family_share\": false,\n        \"country_code\": \"US\",\n        \"app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"aliases\": [\n            \"12abc345d67e890fgh12j3lm456n7890\"\n        ],\n        \"original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"cancel_reason\": \"UNSUBSCRIBE\",\n        \"currency\": \"USD\",\n        \"price\": 0.0,\n        \"price_in_purchased_currency\": 0.0,\n        \"subscriber_attributes\": {\n            \"$ip\": {\n                \"value\": \"123.45.67.89\",\n                \"updated_at_ms\": 1640922085884\n            },\n            \"$idfa\": {\n                \"value\": \"00000000-0000-0000-0000-000000000000\",\n                \"updated_at_ms\": 1640922085883\n            },\n            \"$idfv\": {\n                \"value\": \"12345A6B-C789-0D1E-FG23-456H6I7J890K\",\n                \"updated_at_ms\": 1640884773572\n            },\n            \"$email\": {\n                \"value\": \"firstlast@gmail.com\",\n                \"updated_at_ms\": 1640884952087\n            },\n            \"$appsflyerId\": {\n                \"value\": \"1234567890123-1234567890123456789\",\n                \"updated_at_ms\": 1640884773577\n            },\n            \"$displayName\": {\n                \"value\": \"FirstLast\",   \n                \"updated_at_ms\": 1640884932761\n            }\n        },\n        \"store\": \"APP_STORE\",\n        \"takehome_percentage\": 0.7,\n        \"offer_code\": null,\n        \"type\": \"cancellation\",\n        \"id\": \"12345678-1234-1234-1234-123456789012\",\n        \"app_id\": \"1234567890\"\n    },\n    \"api_version\": \"1.0\"\n}",
      "language": "json",
      "name": "Cancellation"
    },
    {
      "code": "{\n    \"event\": {\n        \"event_timestamp_ms\": 1663976681591,\n        \"product_id\": \"annual\",\n        \"period_type\": \"NORMAL\",\n        \"purchased_at_ms\": 1642861650000,\n        \"expiration_at_ms\": 1674397650000,\n        \"environment\": \"PRODUCTION\",\n        \"entitlement_ids\": [\n            \"premium\"\n        ],\n        \"presented_offering_id\": \"standard\",\n        \"transaction_id\": \"123456789012345\",\n        \"original_transaction_id\": \"123456789012345\",\n        \"is_family_share\": false,\n        \"country_code\": \"US\",\n        \"app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"aliases\": [\n            \"12abc345d67e890fgh12j3lm456n7890\"\n        ],\n        \"original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"currency\": \"USD\",\n        \"price\": 0.0,\n        \"price_in_purchased_currency\": 0.0,\n        \"subscriber_attributes\": {\n            \"$ip\": {\n                \"value\": \"123.45.67.89\",\n                \"updated_at_ms\": 1642861599292\n            },\n            \"$idfa\": {\n                \"value\": \"00000000-0000-0000-0000-000000000000\",\n                \"updated_at_ms\": 1642861599292\n            },\n            \"$idfv\": {\n                \"value\": \"12345A6B-C789-0D1E-FG23-456H6I7J890K\",\n                \"updated_at_ms\": 1642861529624\n            },\n            \"$amplitudeDeviceId\": {\n                \"value\": \"12345A6B-C789-0D1E-FG23-456H6I7J890K\",\n                \"updated_at_ms\": 1662591626817\n            }\n        },\n        \"store\": \"APP_STORE\",\n        \"takehome_percentage\": 0.7,\n        \"offer_code\": null,\n        \"tax_percentage\": 0.0,\n        \"commission_percentage\": 0.3,\n        \"type\": \"uncancellation\",\n        \"id\": \"12345678-1234-1234-1234-123456789012\",\n        \"app_id\": \"1234567890\"\n    },\n    \"api_version\": \"1.0\"\n}",
      "language": "json",
      "name": "Uncancellation"
    },
    {
      "code": "{\n    \"event\": {\n        \"event_timestamp_ms\": 1642005085499,\n        \"product_id\": \"400_tokens\",\n        \"period_type\": \"NORMAL\",\n        \"purchased_at_ms\": 1642005085444,\n        \"expiration_at_ms\": 1644683485444,\n        \"environment\": \"PRODUCTION\",\n        \"entitlement_ids\": [\n            \"premium\"\n        ],\n        \"presented_offering_id\": null,\n        \"transaction_id\": \"123456789012345\",\n        \"original_transaction_id\": \"123456789012345\",\n        \"is_family_share\": null,\n        \"country_code\": \"US\",\n        \"app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"aliases\": [\n            \"12abc345d67e890fgh12j3lm456n7890\"\n        ],\n        \"original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"currency\": \"USD\",\n        \"price\": 3.99,\n        \"price_in_purchased_currency\": 3.99,\n        \"subscriber_attributes\": {\n            \"$ip\": {\n                \"value\": \"123.45.67.89\",\n                \"updated_at_ms\": 1605515259156\n            },\n            \"$idfa\": {\n                \"value\": \"00000000-0000-0000-0000-000000000000\",\n                \"updated_at_ms\": 1605515259155\n            },\n            \"$idfv\": {\n                \"value\": \"12345A6B-C789-0D1E-FG23-456H6I7J890K\",\n                \"updated_at_ms\": 1605515259156\n            },\n            \"$email\": {\n                \"value\": \"firstlast@gmail.com\",\n                \"updated_at_ms\": 1608329355624\n            },\n            \"$appsflyerId\": {\n                \"value\": \"1234567890123-1234567890123456789\",\n                \"updated_at_ms\": 1578134994616\n            },\n            \"$displayName\": {\n                \"value\": \"FirstLast\",   \n                \"updated_at_ms\": 1608329355625\n            }\n        },\n        \"store\": \"APP_STORE\",\n        \"takehome_percentage\": 1.0,\n        \"offer_code\": null,\n        \"type\": \"non_subscription_purchase\",\n        \"id\": \"12345678-1234-1234-1234-123456789012\",\n    },\n    \"api_version\": \"1.0\"\n}",
      "language": "json",
      "name": "Non Subscription Purchase"
    },
    {
      "code": "{\n    \"event\": {\n        \"event_timestamp_ms\": 1663972580977,\n        \"product_id\": \"monthly\",\n        \"period_type\": \"NORMAL\",\n        \"purchased_at_ms\": 1663950641060,\n        \"expiration_at_ms\": 1666549841060,\n        \"environment\": \"PRODUCTION\",\n        \"entitlement_ids\": null,\n        \"presented_offering_id\": null,\n        \"transaction_id\": \"GPA.1234-5678-9012-34567\",\n        \"original_transaction_id\": \"GPA.1234-5678-9012-34567\",\n        \"is_family_share\": false,\n        \"country_code\": null,\n        \"app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"aliases\": [\n            \"12abc345d67e890fgh12j3lm456n7890\"\n        ],\n        \"original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"auto_resume_at_ms\": 1674491441060,\n        \"currency\": \"USD\",\n        \"price\": 0.0,\n        \"price_in_purchased_currency\": 0.0,\n        \"subscriber_attributes\": {},\n        \"store\": \"PLAY_STORE\",\n        \"takehome_percentage\": 0.85,\n        \"offer_code\": null,\n        \"tax_percentage\": 0.0,\n        \"commission_percentage\": 0.15,\n        \"type\": \"subscription_paused\",\n        \"id\": \"12345678-1234-1234-1234-123456789012\",\n        \"app_id\": \"1234567890\"\n    },\n    \"api_version\": \"1.0\"\n}",
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
      "code": "{\n    \"event\": {\n        \"event_timestamp_ms\": 1641979680052,\n        \"product_id\": \"annual\",\n        \"period_type\": \"NORMAL\",\n        \"purchased_at_ms\": 1610443458000,\n        \"expiration_at_ms\": 1641979458000,\n        \"environment\": \"PRODUCTION\",\n        \"entitlement_ids\": [\n            \"premium\"\n        ],\n        \"presented_offering_id\": null,\n        \"transaction_id\": \"123456789012345\",\n        \"original_transaction_id\": \"123456789012345\",\n        \"is_family_share\": false,\n        \"country_code\": \"AU\",\n        \"app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"aliases\": [\n            \"12abc345d67e890fgh12j3lm456n7890\"\n        ],\n        \"original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"expiration_reason\": \"UNSUBSCRIBE\",\n        \"currency\": \"AUD\",\n        \"price\": 0.0,\n        \"price_in_purchased_currency\": 0.0,\n        \"subscriber_attributes\": {\n            \"$ip\": {\n                \"value\": \"123.45.67.89\",\n                \"updated_at_ms\": 1625546407475\n            },\n            \"$idfa\": {\n                \"value\": \"00000000-0000-0000-0000-000000000000\",\n                \"updated_at_ms\": 1625546407473\n            },\n            \"$idfv\": {\n                \"value\": \"12345A6B-C789-0D1E-FG23-456H6I7J890K\",\n                \"updated_at_ms\": 1625466331505\n            },\n            \"$email\": {\n                \"value\": \"firstlast@gmail.com\",\n                \"updated_at_ms\": 1625466352128\n            },\n            \"$appsflyerId\": {\n                \"value\": \"1234567890123-1234567890123456789\",\n                \"updated_at_ms\": 1625466331510\n            },\n            \"$displayName\": {\n                \"value\": \"FirstLast\",   \n                \"updated_at_ms\": 1625466352133\n            }\n        },\n        \"store\": \"APP_STORE\",\n        \"takehome_percentage\": 0.85,\n        \"offer_code\": null,\n        \"type\": \"expiration\",\n        \"id\": \"12345678-1234-1234-1234-123456789012\",\n        \"app_id\": \"1234567890\"\n    },\n    \"api_version\": \"1.0\"\n}",
      "language": "json",
      "name": "Expiration"
    },
    {
      "code": "{\n    \"event\": {\n        \"event_timestamp_ms\": 1641989467593,\n        \"product_id\": \"monthly\",\n        \"period_type\": \"NORMAL\",\n        \"purchased_at_ms\": 1641985292000,\n        \"expiration_at_ms\": 1673521292000,\n        \"environment\": \"PRODUCTION\",\n        \"entitlement_ids\": [\n            \"premium\"\n        ],\n        \"presented_offering_id\": null,\n        \"transaction_id\": \"123456789012345\",\n        \"original_transaction_id\": \"123456789012345\",\n        \"is_family_share\": false,\n        \"country_code\": \"ZA\",\n        \"app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"aliases\": [\n            \"12abc345d67e890fgh12j3lm456n7890\"\n        ],\n        \"original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"grace_period_expiration_at_ms\": null,\n        \"currency\": \"USD\",\n        \"price\": 0.0,\n        \"price_in_purchased_currency\": 0.0,\n        \"subscriber_attributes\": {\n            \"$ip\": {\n                \"value\": \"123.45.67.89\",\n                \"updated_at_ms\": 1641380990137\n            },\n            \"$idfa\": {\n                \"value\": \"00000000-0000-0000-0000-000000000000\",\n                \"updated_at_ms\": 1641380990136\n            },\n            \"$idfv\": {\n                \"value\": \"12345A6B-C789-0D1E-FG23-456H6I7J890K\",\n                \"updated_at_ms\": 1641380990136\n            },\n            \"$email\": {\n                \"value\": \"firstlast@gmail.com\",\n                \"updated_at_ms\": 1641380601324\n            },\n            \"$appsflyerId\": {\n                \"value\": \"1234567890123-1234567890123456789\",\n                \"updated_at_ms\": 1641380990138\n            },\n            \"$displayName\": {\n                \"value\": \"FirstLast\",   \n                \"updated_at_ms\": 1641449423479\n            }\n        },\n        \"store\": \"APP_STORE\",\n        \"takehome_percentage\": 1.0,\n        \"offer_code\": null,\n        \"type\": \"billing_issue\",\n        \"id\": \"12345678-1234-1234-1234-123456789012\",\n        \"app_id\": \"1234567890\"\n    },\n    \"api_version\": \"1.0\"\n}",
      "language": "json",
      "name": "Billing Issue"
    },
    {
      "code": "{\n    \"event\": {\n        \"event_timestamp_ms\": 1642108701236,\n        \"product_id\": \"monthly\",\n        \"period_type\": \"NORMAL\",\n        \"purchased_at_ms\": 1639087828000,\n        \"expiration_at_ms\": 1641766228000,\n        \"environment\": \"PRODUCTION\",\n        \"entitlement_ids\": [\n            \"premium\"\n        ],\n        \"presented_offering_id\": null,\n        \"transaction_id\": \"123456789012345\",\n        \"original_transaction_id\": \"123456789012345\",\n        \"is_family_share\": false,\n        \"country_code\": \"CA\",\n        \"app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"aliases\": [\n            \"12abc345d67e890fgh12j3lm456n7890\"\n        ],\n        \"original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"new_product_id\": \"annual\",\n        \"currency\": \"CAD\",\n        \"price\": 0.0,\n        \"price_in_purchased_currency\": 0.0,\n        \"subscriber_attributes\": {\n            \"$ip\": {\n                \"value\": \"123.45.67.89\",\n                \"updated_at_ms\": 1607426876996\n            },\n            \"$idfa\": {\n                \"value\": \"00000000-0000-0000-0000-000000000000\",\n                \"updated_at_ms\": 1607426876996\n            },\n            \"$idfv\": {\n                \"value\": \"12345A6B-C789-0D1E-FG23-456H6I7J890K\",\n                \"updated_at_ms\": 1607426876996\n            },\n            \"$email\": {\n                \"value\": \"firstlast@gmail.com\",\n                \"updated_at_ms\": 1608040666659\n            },\n            \"$appsflyerId\": {\n                \"value\": \"1234567890123-1234567890123456789\",\n                \"updated_at_ms\": 1582818527279\n            },\n            \"$displayName\": {\n                \"value\": \"FirstLast\",   \n                \"updated_at_ms\": 1608040666660\n            }\n        },\n        \"store\": \"APP_STORE\",\n        \"takehome_percentage\": 0.7,\n        \"offer_code\": null,\n        \"type\": \"product_change\",\n        \"id\": \"12345678-1234-1234-1234-123456789012\",\n        \"app_id\": \"1234567890\"\n    },\n    \"api_version\": \"1.0\"\n}",
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
  "body": "You should start seeing subscription data from RevenueCat appear in Superwall."
}
[/block]
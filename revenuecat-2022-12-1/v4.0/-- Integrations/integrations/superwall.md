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
updatedAt: "2022-06-02T21:42:07.276Z"
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
# Sample Event
Below is a sample JSON that is delivered to Superwall for a Trial Started event. 
[block:code]
{
  "codes": [
    {
      "code": "{\n  \"api_version\": \"1.0\",\n  \"event\": {\n    \"aliases\": [\n      \"$RCAnonymousID:646c8236950c4ffdb7eda9618c32fe66\"\n    ],\n    \"app_id\": \"app83e93e5855\",\n    \"app_user_id\": \"$RCAnonymousID:646c8236950c4ffdb7eda9618c32fe66\",\n    \"country_code\": \"US\",\n    \"currency\": \"USD\",\n    \"entitlement_ids\": null,\n    \"environment\": \"SANDBOX\",\n    \"event_timestamp_ms\": 1644280494982,\n    \"expiration_at_ms\": 1644280667000,\n    \"id\": \"D492AA52-07ED-4948-BF22-04A86636DA1E\",\n    \"is_family_share\": false,\n    \"offer_code\": null,\n    \"original_app_user_id\": \"$RCAnonymousID:646c8236950c4ffdb7eda9618c32fe66\",\n    \"original_transaction_id\": \"1000000964160097\",\n    \"period_type\": \"TRIAL\",\n    \"presented_offering_id\": \"default\",\n    \"price\": 0,\n    \"price_in_purchased_currency\": 0,\n    \"product_id\": \"rc_3999_1y_1w0\",\n    \"purchased_at_ms\": 1644280487000,\n    \"store\": \"APP_STORE\",\n    \"subscriber_attributes\": {},\n    \"takehome_percentage\": 0.7,\n    \"transaction_id\": \"1000000964160097\",\n    \"type\": \"INITIAL_PURCHASE\"\n  }\n}",
      "language": "json"
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
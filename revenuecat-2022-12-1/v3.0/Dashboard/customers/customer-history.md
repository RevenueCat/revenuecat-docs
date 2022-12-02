---
title: "Customer History"
slug: "customer-history"
hidden: false
metadata: 
  title: "In-app purchase history | RevenueCat"
  description: "The 'Customer History' card shows a timeline of transactions and activity for the selected customer. These can be useful for debugging and triaging support issues by understanding when critical events happened for the customer."
  image: 
    0: "https://files.readme.io/5542b5d-Reddit__E.jpg"
    1: "Reddit – E.jpg"
    2: 1200
    3: 630
    4: "#fbabaf"
createdAt: "2020-04-06T21:46:07.215Z"
updatedAt: "2021-07-22T20:17:49.074Z"
---
The 'Customer History' card shows a timeline of transactions and activity for the selected customer. These can be useful for debugging and triaging support issues by understanding when critical events happened for the customer.

The timeline events are generated from changes to the user's purchase receipt. This is the raw purchase data from Apple/Google presented in a more readable form and enhanced with RevenueCat price estimates. If there's no purchase history present, then the user either never sent RevenueCat a receipt or the receipt is empty.
[block:callout]
{
  "type": "info",
  "body": "If the Customer History is empty, it means we haven't received a purchase receipt for the user. If you think this may be a mistake, check out our [community article](https://community.revenuecat.com/dashboard-tools-52/when-a-purchase-isn-t-showing-up-in-revenuecat-105) on re-syncing a user's purchases."
}
[/block]

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/30a3f7f-Screen_Shot_2020-06-01_at_7.32.36_AM.png",
        "Screen Shot 2020-06-01 at 7.32.36 AM.png",
        1488,
        1088,
        "#f9f9f9"
      ]
    }
  ]
}
[/block]
## Event Types

Below is a table with all the event types you can expect in the customer history and a description of what they mean.
[block:parameters]
{
  "data": {
    "2-0": "Started a trial",
    "h-0": "Name",
    "h-1": "User Description",
    "h-2": "Webhook Event",
    "2-1": "Started a subscription with a $0 introductory price.",
    "2-2": "`INITIAL_PURCHASE`",
    "3-0": "Converted from a trial",
    "3-1": "Entered a paid subscription period after previously starting a trial.",
    "0-0": "Made a purchase",
    "0-1": "Purchased a non-renewing product",
    "1-0": "Started a subscription",
    "1-1": "Started a subscription without any free trial period.",
    "4-0": "Renewed",
    "4-1": "Entered a paid subscription period after previously being in a paid period.",
    "5-0": "Changed renewal preference",
    "5-1": "Changed the product identifier of an existing subscription.",
    "8-0": "Had a billing issue",
    "8-1": "Apple / Google received an error when attempting to charge the user's credit card.",
    "6-0": "Opted out of renewal",
    "6-1": "Disabled the auto-renew status for an active subscription.",
    "7-0": "Resubscribed",
    "7-1": "Re-enabled the auto-renew status for an active subscription after previously cancelling.",
    "0-2": "`NON_RENEWING_PURCHASE`",
    "1-2": "`INITIAL_PURCHASE`",
    "3-2": "`RENEWAL`",
    "4-2": "`RENEWAL`",
    "5-2": "`PRODUCT_CHANGE`",
    "6-2": "`CANCELLATION`",
    "7-2": "`UNCANCELLATION`",
    "8-2": "`BILLING_ISSUE`",
    "11-2": "`CANCELLATION`",
    "11-0": "Cancelled due to a billing error",
    "11-1": "Apple / Google was not able to charge the user's credit card and their subscription failed to renew.",
    "12-0": "Cancelled due to unknown reasons",
    "12-1": "Apple cancelled the user's subscription and did not provide a cancellation reason.",
    "9-0": "Was issued a refund",
    "9-1": "Apple customer support cancelled and refunded a user's subscription, or a Google subscription was refunded through RevenueCat.",
    "9-2": "`CANCELLATION`",
    "10-0": "Cancelled due to not agreeing to a price increase",
    "10-1": "Did not agree to a price increase.",
    "10-2": "`CANCELLATION`",
    "12-2": "`CANCELLATION`",
    "13-0": "Created a new alias",
    "13-2": "`SUBSCRIBER_ALIAS` (deprecated)",
    "13-1": "Was aliased with another App User Id."
  },
  "cols": 3,
  "rows": 14
}
[/block]

[block:callout]
{
  "type": "info",
  "title": "Missing or incorrect prices",
  "body": "It is possible for prices to be missing or incorrect, especially for apps that have migrated from a different system to RevenueCat. The stores provide very minimal pricing information for developers, so RevenueCat estimates the transaction price based off the data that is available - if you have old products that are no longer available for sale or changed the price of your products before using RevenueCat, you can expect some prices to be missing or incorrect. We do our best to backfill prices over time if more up-to-date information becomes available."
}
[/block]
## Event Details
You can click into events in the Customer History to view additional details about the event, including any integrations that may have been triggered as a result of the event. 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/703caac-Screen_Shot_2020-06-01_at_7.46.05_AM.png",
        "Screen Shot 2020-06-01 at 7.46.05 AM.png",
        1135,
        903,
        "#f8f9f9"
      ]
    }
  ]
}
[/block]
## Refunding Subscriptions
Active Android subscriptions can be refunded directly through the RevenueCat dashboard. Granting a refund will immediately expire the subscription and remove any entitlement access. By refunding directly through RevenueCat you can ensure that refunds are accounted for in all charts and integrations.

Apple doesn’t allow developers to grant refunds themselves, only through Apple customer support. However, Apple refunds are tracked with RevenueCat and accounted for in all charts and integrations.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/6fc40df-Screen_Shot_2020-06-01_at_7.46.14_AM.png",
        "Screen Shot 2020-06-01 at 7.46.14 AM.png",
        703,
        243,
        "#f9f8f8"
      ]
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "Next Steps"
}
[/block]
* [Active Subscriptions :fa-arrow-right:](doc:active-subscriptions)
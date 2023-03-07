---
title: "Update Customers"
slug: "update-customers"
excerpt: "View and manage customers"
hidden: false
createdAt: "2019-01-18T21:23:14.108Z"
---
The RevenueCat dashboard lets you view basic customer information, including a timeline of their purchases, and allows you to grant promotional subscriptions. This can be a great way to debug issues and help with customer support.
[block:api-header]
{
  "title": "Customer Information"
}
[/block]
To view a specific customer's information, you'll need to know their [App User Id](doc:user-ids), or find them on the [customers page](https://app.revenuecat.com/customers/).

## Basic Information
Basic customer information, including their total amount spent in your app, is presented at the top of the page.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/1ba4804-Screen_Shot_2019-01-18_at_12.39.40_PM.png",
        "Screen Shot 2019-01-18 at 12.39.40 PM.png",
        1134,
        239,
        "#f0f3f4"
      ]
    }
  ]
}
[/block]
## Customer History
The 'Customer History' card shows a timeline of transactions and activity for the selected customer. These can be useful for debugging and triaging support issues by understanding when critical events happened for the customer.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/20ebf40-Screen_Shot_2019-01-18_at_12.32.52_PM.png",
        "Screen Shot 2019-01-18 at 12.32.52 PM.png",
        756,
        316,
        "#f8f9f9"
      ]
    }
  ]
}
[/block]
Below are the events that will be shown in the customer timeline:
[block:parameters]
{
  "data": {
    "h-0": "Event",
    "h-1": "Description",
    "0-0": "First seen using the app",
    "1-0": "Purchase",
    "2-0": "Renewal",
    "3-0": "Last Seen using the app",
    "3-1": "The last time we saw this customer with an active instance of Purchases SDK.",
    "0-1": "The first time we saw this customer with an active instance of Purchases SDK.",
    "1-1": "A purchase made by the customer.",
    "2-1": "An automatic renewal of a subscription."
  },
  "cols": 2,
  "rows": 4
}
[/block]

[block:callout]
{
  "type": "info",
  "title": "Pro tip!",
  "body": "You can hover over dates in the Customer History card to get exact timestamps 🕵️‍♂️"
}
[/block]
## Promotional Subscriptions
Promotional subscriptions allow you to give a user access to premium content for a specific amount of time without requiring them to make a purchase or redeem a promo code. This can be useful for allowing beta users to preview content for free or resolving customer support issues. For more details on promotional subscriptions, jump to [Granting Promotional Subscriptions](customers#section-granting-promotional-subscriptions).
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/76fe2e0-Screen_Shot_2019-01-18_at_11.52.21_AM.png",
        "Screen Shot 2019-01-18 at 11.52.21 AM.png",
        366,
        243,
        "#f3f6f6"
      ],
      "caption": ""
    }
  ]
}
[/block]
## Attribution
If you're sending attribution information to RevenueCat through the Purchases SDK, we will display the latest information in the 'Attribution' card for the customer.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/b05c1c9-Screen_Shot_2019-01-18_at_1.21.11_PM.png",
        "Screen Shot 2019-01-18 at 1.21.11 PM.png",
        370,
        272,
        "#f7f7f8"
      ]
    }
  ]
}
[/block]
Below are the possible attribution fields displayed:
[block:parameters]
{
  "data": {
    "h-0": "Name",
    "h-1": "Description",
    "0-0": "Network",
    "4-0": "Creative",
    "1-0": "Campaign",
    "2-0": "Ad Group",
    "3-0": "Keywords",
    "0-1": "The ad network, such as Apple Search Ads or Facebook.",
    "1-1": "The campaign name from the network.",
    "2-1": "The ad group or ad set name from the network.",
    "3-1": "The keyword(s) from the network.",
    "4-1": "The individual ad/creative name or id from the network."
  },
  "cols": 2,
  "rows": 5
}
[/block]
See our [attribution integrations](doc:attribution) to start sending this information.


## Aliases
If this customer has any [aliases](doc:user-ids#section-aliases), they will appear in the 'Aliases' card.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/46e2aec-Screen_Shot_2019-01-18_at_12.54.28_PM.png",
        "Screen Shot 2019-01-18 at 12.54.28 PM.png",
        369,
        189,
        "#f7f8f8"
      ]
    }
  ]
}
[/block]

[block:callout]
{
  "type": "warning",
  "body": "If you see unexpected aliases, you may have incorrectly implemented `.createAlias`, `.identify`, or `.restore` methods. See our [guide on App User Ids](doc:user-ids) for more information."
}
[/block]

[block:api-header]
{
  "title": "Granting Promotional Subscriptions"
}
[/block]
To give a user promotional access to an entitlement choose the [entitlement name](doc:entitlements) and duration and click 'Grant'. You can grant multiple entitlements if you have different levels of access.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/d3e7835-Screen_Shot_2019-01-18_at_11.53.10_AM.png",
        "Screen Shot 2019-01-18 at 11.53.10 AM.png",
        366,
        241,
        "#ebf1f3"
      ]
    }
  ]
}
[/block]
Granting an entitlement from the customer page will go into effect immediately, but you may need to [refresh Purchaser Info](doc:getting-started-1#section-get-subscription-status) on the client to get the latest active entitlements. The promotional access will automatically be revoked after the selected duration.

## Removing Promotional Subscriptions
Granted entitlements will automatically be removed after expiration. To remove access to an entitlement early, click the :fa-times-circle: icon next to the Granted Entitlement name.
[block:callout]
{
  "type": "warning",
  "body": "To grant a user promotional access to a subscription, you'll need to be using RevenueCat entitlements to manage access to subscription content in your app.",
  "title": "Promotional subscriptions are for entitlements only"
}
[/block]

[block:api-header]
{
  "title": "Delete Users"
}
[/block]
You can delete a user under the 'Manage' card at the bottom of the page. Deleting a user will also remove all their purchase history for sandbox and production data which could change how charts and reports appear. Deleting users should only be used to remove accounts you may have set up for testing.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/37bba73-Screen_Shot_2019-01-18_at_11.30.25_AM.png",
        "Screen Shot 2019-01-18 at 11.30.25 AM.png",
        370,
        145,
        "#f9f0f0"
      ],
      "caption": "Careful, this can't be undone!"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "danger",
  "title": "Be careful!",
  "body": "Deleting a user with live purchases may have downstream effects on charts and reporting."
}
[/block]
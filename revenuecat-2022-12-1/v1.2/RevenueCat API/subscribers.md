---
title: "subscribers"
slug: "subscribers"
hidden: false
createdAt: "2018-05-08T17:13:32.048Z"
updatedAt: "2018-12-16T22:39:26.978Z"
---
[block:api-header]
{
  "title": "original_application_version"
}
[/block]
This will be null until an iOS receipt is sent for the user. After a receipt has been sent, it will indicate the first App Store version that user installed.
[block:api-header]
{
  "title": "other_purchases"
}
[/block]

[block:callout]
{
  "type": "warning",
  "title": "Deprecated",
  "body": "See non_subscriptions."
}
[/block]

[block:api-header]
{
  "title": "non_subscriptions"
}
[/block]
`non_subscriptions` contains information about any products that do not have an expiration date, such as consumable and non-consumable purchases, as well as non-renewing subscriptions.

`non_subscriptions` is a map of product_id to an array of transactions. Each transaction item contains two field:

- `purchase_date` -- The date the purchase happened.
- `id` -- A unique id. You can use this to ensure you track consumption of consumable products.

[block:api-header]
{
  "title": "subscriptions"
}
[/block]
A mapping of product_id to the latest transaction info. Fields include:

- `expires_date`: The latest known expiration date
- `period_type`: The type of period the subscription is in.

Possible values for `period_type`:
- `trial`: Free trial
- `intro`: Introductory pricing 
- `normal`: Standard subscription
[block:api-header]
{
  "title": "entitlements"
}
[/block]
Similar to the information available in `subscription` but organized by [entitlement](doc:entitlements).

Mapping of entitlement ID to information about the latest state of the subscription for that entitlement.

- `expires_date`: The latest expiration date
- `purchase_date`: The latest purchase date. Will update when it renews.
- `product_identifier`: The product identifier.
---
title: 'Google Play: Refund and Revoke Subscription'
slug: revoke-a-google-subscription
excerpt: Immediately revokes access to a Google Subscription and issues a refund for
  the last purchase. If you want to refund a one-time Google purchase, see [refund
  a Google purchase](ref:refund-a-google-subscription).
hidden: false
createdAt: '2020-03-04T21:44:22.200Z'
updatedAt: '2022-07-21T14:54:56.889Z'
category: 640a7bf5be4a66000b94ccc4
---
[block:callout]
{
  "type": "warning",
  "title": "Secret API Key Required",
  "body": "This endpoint requires a [secret API key](doc:authentication) to be used."
}
[/block]

[block:api-header]
{
  "title": "Response"
}
[/block]
If the response is successful, it will contain the updated [Subscriber object](ref:subscribers#the-subscriber-object).
[block:callout]
{
  "type": "info",
  "title": "Need to refund an iOS or Stripe purchase?",
  "body": "This API endpoint is for Google Play purchases only. To learn more about refunding purchases on other platforms, check out this [guide](doc:managing-subscriptions#refunding-purchases)."
}
[/block]
---
title: 'Google Play: Refund and Revoke Purchase'
slug: refund-a-google-subscription-old
excerpt: Issues a refund for the most recent purchase of a Google product and revokes
  access. Works for subscription and non-subscription purchases that occurred in the
  last 365 days.
hidden: true
metadata: 
createdAt: '2021-04-23T20:27:09.243Z'
updatedAt: '2023-06-02T23:23:03.977Z'
category: 6478b85e2169fb1556283358
order: 1
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
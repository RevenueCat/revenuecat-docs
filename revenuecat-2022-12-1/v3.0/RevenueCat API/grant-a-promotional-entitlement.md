---
title: "Grant a Promotional Entitlement"
slug: "grant-a-promotional-entitlement"
excerpt: "Grants a user a promotional entitlement."
hidden: false
createdAt: "2019-08-09T05:30:42.631Z"
updatedAt: "2020-03-02T21:37:06.534Z"
---
[block:callout]
{
  "type": "warning",
  "title": "Secret API Key Required",
  "body": "This endpoint requires a [secret API key](doc:authentication) to be used."
}
[/block]
### Duration Values
The `duration` parameter must be one of the following supported durations:

[block:parameters]
{
  "data": {
    "h-0": "Value",
    "h-1": "Description",
    "0-0": "`daily`",
    "0-1": "24 hour access",
    "1-0": "`weekly`",
    "1-1": "7 day access",
    "2-0": "`monthly`",
    "2-1": "1 month access",
    "3-0": "`two_month`",
    "4-0": "`three_month`",
    "5-0": "`six_month`",
    "6-0": "`yearly`",
    "3-1": "2 month access",
    "4-1": "3 month access",
    "5-1": "6 month access",
    "6-1": "1 year access",
    "7-0": "`lifetime`",
    "7-1": "200 year access"
  },
  "cols": 2,
  "rows": 8
}
[/block]

[block:api-header]
{
  "title": "Response"
}
[/block]
If the response is successful, it will contain the updated [Subscriber object](https://docs.revenuecat.com/reference#section-the-subscriber-object-).
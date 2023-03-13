---
title: "Delete Subscriber"
slug: "delete-subscriber"
excerpt: "Permanently deletes a subscriber."
hidden: false
createdAt: "2019-08-09T05:20:54.035Z"
updatedAt: "2021-11-24T03:05:25.661Z"
---
[block:callout]
{
  "type": "warning",
  "title": "Secret API Key Required",
  "body": "This endpoint requires a [secret API key](doc:authentication) to be used."
}
[/block]

[block:callout]
{
  "type": "danger",
  "title": "Deleted Subscribers Cannot Be Recovered",
  "body": "Be careful when using this endpoint - when a subscriber is deleted, it can't be brought back!"
}
[/block]

[block:api-header]
{
  "title": "Response"
}
[/block]
If successful, the response will contain the deleted app_user_id. 
[block:parameters]
{
  "data": {
    "h-0": "Attribute",
    "h-1": "Description",
    "0-0": "`app_user_id`",
    "0-1": "The app user ID, or alias of the deleted subscriber."
  },
  "cols": 2,
  "rows": 1
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "Subscribers are deleted asynchronously from the RevenueCat backend."
}
[/block]
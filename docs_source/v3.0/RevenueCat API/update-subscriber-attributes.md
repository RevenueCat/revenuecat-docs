---
title: "Update Subscriber Attributes"
slug: "update-subscriber-attributes"
excerpt: "Updates subscriber attributes for a user."
hidden: false
createdAt: "2020-03-10T01:14:10.675Z"
updatedAt: "2020-03-12T20:59:50.996Z"
---
[block:api-header]
{
  "title": "Response"
}
[/block]
If the request is successful, it will contain an empty response.

If the request is not successful because of invalid attributes, an `attributes_error` dictionary will be included in the response with additional details as to which attributes could not be saved and why (see the example 400 response for an example error body).
[block:callout]
{
  "type": "warning",
  "title": "Attribute Key Restrictions",
  "body": "For a full list of reserved attribute keys and restrictions refer to the [Subscriber Attributes guide here](doc:subscriber-attributes)."
}
[/block]
---
title: Update Subscriber Attributes
slug: update-subscriber-attributes-old
excerpt: Updates subscriber attributes for a user.
hidden: true
metadata: 
createdAt: '2020-03-10T01:14:10.675Z'
updatedAt: '2023-06-09T17:19:24.093Z'
category: 6483560b2e0a290051a971d7
order: 1
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
  "body": "For a full list of reserved attribute keys and restrictions refer to the [Subscriber Attributes guide here](doc:subscriber-attributes). To send reserved attribute keys, prefix the key with `$`."
}
[/block]
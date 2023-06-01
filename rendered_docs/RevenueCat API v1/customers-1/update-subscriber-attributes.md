---
title: Update Subscriber Attributes
slug: update-subscriber-attributes
excerpt: Updates subscriber attributes for a user.
hidden: false
metadata:
createdAt: '2023-04-12T01:31:25.955Z'
updatedAt: '2023-04-12T01:48:11.883Z'
category: 6478b85ba1ff55154dd9bbe5
---
## Response

If the request is successful, it will contain an empty response.

If the request is not successful because of invalid attributes, an `attributes_error` dictionary will be included in the response with additional details as to which attributes could not be saved and why (see the example 400 response for an example error body).

> 🚧 Attribute Key Restrictions
> 
> For a full list of reserved attribute keys and restrictions refer to the [Subscriber Attributes guide here](doc:subscriber-attributes). To send reserved attribute keys, prefix the key with `$`.
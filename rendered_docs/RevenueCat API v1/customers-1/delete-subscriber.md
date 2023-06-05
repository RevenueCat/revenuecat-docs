---
title: Delete Subscriber
slug: delete-subscriber
excerpt: Permanently deletes a subscriber.
hidden: false
metadata: 
createdAt: '2023-04-12T01:31:25.951Z'
updatedAt: '2023-04-12T01:45:58.438Z'
---
> 🚧 Secret API Key Required
> 
> This endpoint requires a [secret API key](doc:authentication) to be used.

> ❗️ Deleted Subscribers Cannot Be Recovered
> 
> Be careful when using this endpoint - when a subscriber is deleted, it can't be brought back!

## Response

If successful, the response will contain the deleted app_user_id. 

| Attribute     | Description                                          |
| :------------ | :--------------------------------------------------- |
| `app_user_id` | The app user ID, or alias of the deleted subscriber. |

> 📘 
> 
> Subscribers are deleted asynchronously from the RevenueCat backend.
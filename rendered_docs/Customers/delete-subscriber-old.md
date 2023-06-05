---
title: Delete Subscriber
slug: delete-subscriber-old
excerpt: Permanently deletes a subscriber.
hidden: true
metadata: 
createdAt: '2019-08-09T05:20:54.035Z'
updatedAt: '2023-06-05T21:38:24.807Z'
category: 
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
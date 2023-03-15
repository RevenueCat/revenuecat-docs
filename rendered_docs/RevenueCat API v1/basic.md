---
title: RevenueCat REST API
slug: basic
hidden: false
createdAt: '2018-10-01T11:03:55.483Z'
updatedAt: '2021-11-18T04:25:55.235Z'
category: 640a7bf3b3df0b003dc5ec62
---
[block:api-header]
{
  "type": "basic",
  "title": "Authentication"
}
[/block]
Authentication for the RevenueCat REST API is achieved by setting the `Authorization` header with a valid API key. You'll find two types of API keys in your RevenueCat dashboard: *public* and *secret*.

Certain endpoints require secret keys, which should be kept out of any publicly accessible areas such as GitHub, client-side code, and so forth. See our [Authentication guide](doc:authentication) for more information.
```text
Authorization: Bearer YOUR_REVENUECAT_API_KEY
```

[block:api-header]
{
  "title": "Payload"
}
[/block]
The body of the `POST` requests should be encoded in JSON and have the 'Content-Type' header set to 'application/json'.
```text
Content-Type: application/json
```

```json
{
  "app_user_id": "user-1456",
  "fetch_token": "MQABC...EFH1234="
}
```

[block:api-header]
{
  "title": "Params"
}
[/block]

[block:callout]
{
  "type": "warning",
  "title": "Encode Your URL Params",
  "body": "For URL params, such as the `app_user_id`, make sure you URL encode them before using them."
}
[/block]
---
title: "RevenueCat REST API"
slug: "basic"
hidden: false
createdAt: "2018-10-01T11:03:55.483Z"
updatedAt: "2020-04-23T20:53:46.343Z"
---
[block:api-header]
{
  "type": "basic",
  "title": "Authentication"
}
[/block]
Authentication for the RevenueCat REST API is achieved by setting the `Authorization` header with a valid API key. You'll find two types of API keys in your RevenueCat dashboard: *public* and *secret*.

Certain endpoints require secret keys, which should be kept out of any publicly accessible areas such as GitHub, client-side code, and so forth. See our [Authentication guide](doc:authentication) for more information.
[block:code]
{
  "codes": [
    {
      "code": "Authorization: Bearer YOUR_REVENUECAT_API_KEY",
      "language": "text",
      "name": "Authorization Header"
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "Payload"
}
[/block]
The body of the `POST` requests should be encoded in JSON and have the 'Content-Type' header set to 'application/json'.
[block:code]
{
  "codes": [
    {
      "code": "Content-Type: application/json",
      "language": "text",
      "name": "Content-Type Header"
    }
  ]
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "{\n  \"app_user_id\": \"user-1456\",\n  \"fetch_token\": \"MQABC...EFH1234=\"\n}",
      "language": "json",
      "name": "sample body"
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "Params"
}
[/block]

[block:callout]
{
  "type": "warning",
  "title": "Encode Your URL Params",
  "body": "For URL params, such as the app_user_id, make sure you URL encode them before using them."
}
[/block]
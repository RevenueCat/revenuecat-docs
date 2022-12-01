---
title: "RevenueCat REST API"
slug: "basic"
hidden: false
createdAt: "2018-10-01T11:03:55.483Z"
---
[block:api-header]
{
  "type": "basic",
  "title": "Authentication"
}
[/block]
Authentication for the RevenueCat REST API is achieved by setting the `Authorization` header.
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
      "code": "{\n  \"app_user_id\": \"user-1456\",\n  \"fetch_token\": \"MQABC...EFH1234=\"\n}",
      "language": "json",
      "name": "sample body"
    }
  ]
}
[/block]
---
title: Error Handling
slug: error-handling
hidden: false
createdAt: '2023-04-11T22:26:23.246Z'
updatedAt: '2023-06-02T23:22:59.340Z'
category: 6478b860a6b223151cd4a791
order: 3
---
RevenueCat uses [standard HTTP status codes](https://rcv2.readme.io/reference/error-codes) to indicate the success or failure of an API request. Codes in the `2XX` range indicate the request was successful. `4XX` codes indicate an error caused by the client. `5XX` codes indicate an error in RevenueCat servers.

Successful modifications return the modified entity. Errors return the following fields:

```json Sample error response
{
  "type": "parameter_error",
  "param": "customer_id",
  "message": "id is too long",
  "retryable": false,
  "doc_url": "https://errors.rev.cat/parameter-error"
}
```

For more information on the `type` field and how to resolve these errors, please visit our [Error Types](ref:error-types) documentation.
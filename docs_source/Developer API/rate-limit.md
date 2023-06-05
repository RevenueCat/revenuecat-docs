---
title: Rate Limit
slug: rate-limit
hidden: false
createdAt: '2023-04-11T22:43:01.120Z'
updatedAt: '2023-05-23T11:28:33.413Z'
---
We will return the following headers on all successful requests:

- `RevenueCat-Rate-Limit-Current-Usage`: the number of executed requests for the current rate limiting period, including the current request. The rate limiting period is one minute.
- `RevenueCat-Rate-Limit-Current-Limit`: the limit in requests per minute for this endpoint

If you reach the rate limit, as indicated by a `429` [error code](https://www.revenuecat.com/reference/error-codes), we will also include the following heaader:

- `Retry-After`: the number of milliseconds to wait until you can retry this request.

Below is an example of the response body that will be sent when the rate limit is reached. The content of the field `backoff_ms` is equal to the `Retry-After` header.

[block:file]
{"language":"json","name":"Sample error response","file":"code_blocks/Developer API/rate-limit_1.json"}
[/block]
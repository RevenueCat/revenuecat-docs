---
title: Rate Limit
slug: rate-limit
hidden: false
createdAt: '2023-04-11T22:43:01.120Z'
updatedAt: '2023-04-11T22:53:20.468Z'
category: 6465151799bbc20028ce105c
---
We will return the following headers on all successful requests:

- `revenuecat-rate-limit-current-usage`: the number of executed requests for the current rate limiting period, including the current request
- `revenuecat-rate-limit-current-limit`: the limit for this endpoint

If you reach the rate limit, as indicated by a `429` [error code](https://www.revenuecat.com/reference/error-codes), we will also include in the header:

`retry-after`: the number of seconds to wait until you can retry this request.

Below is an example of the response body that will be sent when the rate limit is reached:

```json Sample error response
{
  "type": "rate_limit_error",
  "message": "Rate limit exceeded",
  "retryable": true,
  "doc_url": "https://revenuecat.com/docs/errors/rate_limit_error",
  "backoff_ms": 1000
}
```
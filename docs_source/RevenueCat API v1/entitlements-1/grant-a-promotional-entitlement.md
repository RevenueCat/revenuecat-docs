---
title: Grant a Promotional Entitlement
slug: grant-a-promotional-entitlement
excerpt: Grants a user a promotional entitlement. Does not override or defer a store
  transaction, applied simultaneously.
hidden: false
metadata:
createdAt: '2023-04-12T01:31:25.953Z'
updatedAt: '2023-04-12T01:39:03.573Z'
---
> 🚧 Secret API Key Required
> 
> This endpoint requires a [secret API key](doc:authentication) to be used.

### Duration Values

The `duration` parameter must be one of the following supported durations:

| Value         | Description              |
| :------------ | :----------------------- |
| `daily`       | 24 hour access           |
| `three_day`   | 72 hour access           |
| `weekly`      | 7 day access             |
| `monthly`     | 1 month (31-day) access  |
| `two_month`   | 2 month (61-day) access  |
| `three_month` | 3 month (92-day) access  |
| `six_month`   | 6 month (183-day) access |
| `yearly`      | 1 year (365-day) access  |
| `lifetime`    | 200 year access          |

## Response

If the response is successful, it will contain the updated [Subscriber object](ref:subscribers#the-subscriber-object).
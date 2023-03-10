---
title: "Churn Chart"
slug: "churn-chart"
hidden: false
createdAt: "2022-10-19T15:30:31.866Z"
updatedAt: "2022-10-20T14:18:19.523Z"
---
## Churn
**Segments**: Yes
**Filters:** Yes
The Churn chart is the percentage of paid subscriptions that were lost during a given period and never resubscribed. The calculation is (number of subscriptions expired during period – re-subscriptions) / (number of paid subscriptions at the start of the period) * 100. Note that a subscription isn't counted as expired until the user no longer has access. This means users that turn off auto-renew aren't counted as "churned" until their subscription expires.

Churn can be negative if during a given period there were more re-subscriptions (i.e., previously churned subscribers who re-subscribed) than churned subscriptions.

Churn can be relatively high for mobile apps when compared to web SaaS products. Like trial conversion, churn is another metric you should continuously monitor and work to improve. By combining churn and trial conversion you can start to make longer-term forecasts of the lifetime value of your subscribers. 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/9333dc5-ae9fff5-Screen_Shot_2021-11-01_at_10.08.13_AM.png",
        "ae9fff5-Screen_Shot_2021-11-01_at_10.08.13_AM.png",
        1399,
        831,
        "#000000"
      ]
    }
  ]
}
[/block]
## Considerations

### ❓ Why doesn't the number of Actives in each period match the Active Subscriptions chart actives per period?

The Churn chart shows the number of actives at the _start_ of each chart period (with the number of subscriptions lost throughout the period), while [Active Subscriptions](doc:active-subscriptions-chart) shows the number of actives as of the _end_ of the chart period.
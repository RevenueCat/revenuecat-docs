---
title: Monthly Recurring Revenue (MRR) Chart
slug: monthly-recurring-revenue-mrr-chart
hidden: false
createdAt: '2022-10-19T15:33:28.776Z'
updatedAt: '2023-06-05T21:38:52.338Z'
category: 
---
## Definition

The Monthly Recurring Revenue (MRR) chart measures the normalized revenue of your active paid subscriptions down to a monthly value. It’s a way of normalizing the scale of your business to better understand your velocity or size outside of the fluctuations that may arise from varying subscription durations. It doesn't map directly to revenue, but it is a useful standardization.

MRR is computed by "normalizing" subscriptions to a 1-month period. Non-recurring subscriptions, consumable, or one-time purchases are not computed in MRR. For example:

- An active subscription that is $8/month will contribute $8 to MRR (price \* 1) each month it remains active
- While an active subscription that costs $120/year will contribute $10 dollars per month to MRR (price \* 1/12) for 12 months each year it remains active

This normalizing of all durations to a 1 month period makes it easier to compare the value of different subscriptions of different durations together.

### Available settings

- Filters: Yes
- Segments: Yes

## How to use Monthly Recurring Revenue (MRR) in your business

MRR is an important measure because it not only captures the size of your subscriber base, but translates that into a real velocity metric for your business by normalizing different durations to a common “denominator” (monthly recurring revenue). MRR and [ARR](doc:annual-recurring-revenue-arr-chart) are considered the standard velocity metrics for subscription software companies.

To understand how your subscriber cohorts are growing over time, try segmenting by first purchase month, changing the resolution to monthly, and creating a stacked area chart to see how monthly subscriber cohorts have translated into added MRR to your business over time. ([Explore here](https://app.revenuecat.com/charts/mrr?chart_type=Stacked%20area&conversion_timeframe=7%20days&customer_lifetime=30%20days&range=Last%20year&resolution=2&segment=first_purchase_month), and change the date range to meet your needs)

## Calculation

First, to convert a subscription payment to normalized monthly revenue, we apply the following conversion:

| Subscription Duration | Normalized Monthly Revenue |
| :-------------------- | :------------------------- |
| 1 Day                 | price \* 30                |
| 3 Days                | price \* 10                |
| 7 Days / 1 Week       | price \* 4                 |
| 2 Weeks               | price \* 2                 |
| 4 Weeks               | price \* 1                 |
| 1 Month               | price \* 1                 |
| 2 Months              | price \* (1/2)             |
| 3 Months              | price \* (1/3)             |
| 6 Months              | price \* (1/6)             |
| 1 Year                | price \* (1/12)            |

> 📘 
> 
> Weekly subscription durations will underestimate MRR over periods longer than 1 month (e.g. a 1 Week subscription would renew 17 times in a 4 month period, not 16), but given the high number of renewals before that extra revenue would be realized, we instead calculate what would be generated in a 1 month period.

For every [active paid subscription](doc:active-subscriptions-chart) in a given period, we sum their monthly recurring revenue value (e.g. `price * (1/12)` for a yearly subscription) to yield your total MRR for that period.

For each period, MRR is calculated as a snapshot based on the count of active subscriptions at the end of the period. Therefore, at a daily resolution, MRR is calculated from the number of Active Subscriptions at the end of that day; whereas at a monthly resolution it is calculated from the number of Active Subscriptions at the end of that month.

To understand how that snapshot is generated for each period, check out the [MRR Movement](doc:monthly-recurring-revenue-movement-chart) chart. 

## FAQs

[block:parameters]
{
  "data": {
    "h-0": "Question",
    "h-1": "Answer",
    "0-0": "What counts as an active paid subscription for the MRR measurement?",
    "0-1": "Any paid, unexpired subscription is considered active. [Learn more here](doc:active-subscriptions-chart).",
    "1-0": "Does MRR exclude subscriptions with auto-renewal disabled?",
    "1-1": "No, MRR includes normalized monthly revenue from all active paid subscriptions – even if their auto-renew status is currently disabled.",
    "2-0": "Are non-recurring subscriptions, consumable, or one-time purchases included in MRR?",
    "2-1": "No, since these purchases do not represent recurring revenue, they are not included in the MRR calculation.",
    "3-0": "Is MRR calculated before commission and taxes?",
    "3-1": "Yes, MRR is calculated using the gross price of your active subscriptions. Commission & taxes deducted by the stores would need to be additionally deducted from MRR to understand expected proceeds.",
    "4-0": "Why does my monthly revenue not equal my MRR?",
    "4-1": "MRR may differ from revenue due to renewals of various subscription lengths occurring within a given month. For example, you may have very few annual subscriptions renewing this month vs. last month, resulting in lower revenue captured this month simply due to those subscribers not being due to renew yet.  \n  \nBecause MRR is calculated in real-time based on currently active subscriptions, the number will fluctuate as new subscriptions are added and active subscribers churn out. If there are fewer new subscribers than churned subscriptions for a given period, MRR will go down and could be another reason actual revenue ends up being lower than recently calculated MRR."
  },
  "cols": 2,
  "rows": 5,
  "align": [
    "left",
    "left"
  ]
}
[/block]

> 📘 
> 
> If a Stripe subscription is canceled with immediate effect, this may cause temporary unusual behavior in your MRR, since RevenueCat will estimate the length of a subscription based on the purchase & expiration dates if the product duration is unknown.

![](https://files.readme.io/c963014-MRR.png "MRR.png")
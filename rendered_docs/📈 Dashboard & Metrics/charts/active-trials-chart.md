---
title: Active Trials Chart
slug: active-trials-chart
hidden: false
categorySlug: dashboard
order: 15
parentDoc: 649983b4c31b2e000a3c187e
---
## Definition
The Active Trials chart measures the number of unexpired free trials at the end of a given period. Similar to [Active Subscriptions](doc:active-subscriptions-chart), a trial is considered active until it expires, regardless of its auto-renew status.

The volume of Active Trials is an important leading indicator to growth of Active Subscriptions, and ultimately of your MRR. If the volume of active trials is increasing or decreasing it indicates that your business may be accelerating or decelerating respectively. The [Active Trials Movement](doc:active-trials-movement-chart) chart and [Initial Conversion](doc:initial-conversion-chart) chart can help you understand the nature of these movements.

### Available settings

* Filters: Yes
* Segments: Yes

## How to use Active Trials in your business
Active Trials act as a single measure of the size of your acquisition funnel. Your acquisition funnel may have many distinct inputs, such as advertising spend, install rates, initial conversion rate, etc. – but by starting with Active Trials you can answer the question of whether the net change in the size of your trialing audience is growing or shrinking over time.

## Calculation
For each period, the count of Active Trials represents the number of unexpired free trials at the end of the period. Therefore, at a daily resolution, the count represents the number of Active Trials at the end of that day; whereas at a monthly resolution it represents the number of Active Trials at the end of that month.

To understand how that snapshot is generated for each period, check out the [Active Trials Movement](doc:active-trials-movement-chart) chart. 

## FAQs
[block:parameters]
{
  "data": {
    "h-0": "Question",
    "h-1": "Answer",
    "0-0": "Are trials that have disabled their auto-renewal still considered active?",
    "0-1": "Yes, a trial is considered active as long as it has not expired, even if auto-renewal has been disabled, since that subscriber still retains access to your entitlement and has the opportunity to enable auto-renewal and ultimately convert.",
    "1-0": "At what point is a trial considered expired?",
    "1-1": "A trial for a subscription without a grace period is considered expired once its next renewal date has passed without a successful renewal.\n\nIf a grace period is offered, the end of that grace period is considered the trial’s expiration date."
  },
  "cols": 2,
  "rows": 2
}
[/block]

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/f34fb0a-ActiveTrials.png",
        "ActiveTrials.png",
        1424,
        824,
        "#000000"
      ]
    }
  ]
}
[/block]
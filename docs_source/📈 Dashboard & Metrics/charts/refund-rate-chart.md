---
title: Refund Rate Chart
slug: refund-rate-chart
hidden: false
---
## Definition
The Refund Rate chart shows the number of paid transactions (such as new paid subscriptions, renewals, and one-time purchases) in each time period and what proportion of these transactions were refunded. 

Your refund rate is an important indicator of whether your customers are getting the value they expected when they started their subscription.

### Available settings

* Filters: Yes
* Segments: Yes

## How to use Refund Rate in your business
The overall refund rate of your app(s) should be used as a health metric for your business that tells you whether your product is meeting the expectations of subscribers. 

If you see an increase in this rate that is out of the ordinary, consider segmenting by key acquisition demographics like Country or Store to see if you can isolate where the change is coming from, then check out charts like Trial Conversion to understand if your acquisition behavior in that segment has changed.

## Calculation
For each period we count: 

1. Transactions: The number of paid transactions that occurred in that period.
2. Refunded Transactions: The number of paid transactions from that period that have been refunded.

### Formula
[Refunded Transactions] / [Transactions] = Refund Rate

## FAQs
[block:parameters]
{
  "data": {
    "h-0": "Question",
    "h-1": "Answer",
    "0-0": "Are trial starts included in the count of Transactions?",
    "0-1": "No, since trials have no revenue associated with them and cannot be refunded, they are not included in the count of Transactions.",
    "1-0": "Are refunds included in the period they occurred in, or the period where the transaction occurred in?",
    "1-1": "Refunds are counted in the period where the transaction occurred in so that the quoted refund rate equals a portion of a cohort of paid transactions that have been refunded.\n\nThis results in more accurate comparison between periods when analyzing performance changes.",
    "2-0": "Can the Refund Rate for a given period change over time?",
    "2-1": "Yes. Because refunds are applied to the date of the original transaction, you should expect to see changes in prior periods when refunds occur."
  },
  "cols": 2,
  "rows": 3
}
[/block]

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/1377659-refundrate.png",
        "refundrate.png",
        1372,
        898,
        "#000000"
      ]
    }
  ]
}
[/block]
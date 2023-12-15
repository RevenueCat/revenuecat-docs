---
title: Performance Summaries
slug: performance-summaries
excerpt: Get a weekly recap of key subscription metrics in your inbox
hidden: false
---
With Performance Summaries, you can subscribe to a weekly recap of your key subscriptions metrics (including how they changed vs. the prior week) delivered right to your inbox every Monday morning.

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/2fc49ac-Screenshot_2023-12-14_at_4.02.35_PM.png",
        "",
        ""
      ],
      "align": "center",
      "sizing": "400px",
      "border": true
    }
  ]
}
[/block]


## How can I subscribe to a weekly Performance Summary?

1. Click on [**Account**](https://app.revenuecat.com/settings/account) from the RevenueCat Dashboard
2. Open the **Labs** option and click on **Performance Summaries**
3. Select the Project's you want to include in your weekly Performance Summary, and click **Update** to save your changes

> 📘 
> 
> You must first verify your email address with us in order to receive Performance Summaries.

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/6dbeb98-Screenshot_2023-12-15_at_12.08.29_PM.png",
        "",
        ""
      ],
      "align": "center"
    }
  ]
}
[/block]


## What will be included in my Performance Summary?

Your weekly performance summary will include the following metrics, aggregated for all Projects that you've subscribed to the email for.

[block:parameters]
{
  "data": {
    "h-0": "Metric",
    "h-1": "Definition",
    "0-0": "Revenue",
    "0-1": "Total revenue generated in the last week, minus any of those transactions that have been refunded. [Learn more about how Revenue is calculated](https://www.revenuecat.com/docs/revenue-chart)",
    "1-0": "MRR",
    "1-1": "Total MRR as of the end of the last week. [Learn more about how MRR is calculated ](https://www.revenuecat.com/docs/monthly-recurring-revenue-mrr-chart)",
    "2-0": "New Trials",
    "2-1": "The count of Trials started in the last week.",
    "3-0": "Active Subscriptions",
    "3-1": "The count of Active Subscriptions as of the end of the last week. [Learn more about how Active Subscriptions are calculated](https://www.revenuecat.com/docs/active-subscriptions-chart)",
    "4-0": "Initial CVR",
    "4-1": "The conversion rate of last week's new customers to any product (whether a subscription or other IAP) within their first seen day. This is equivalent to the Day 0 Conversion Timeframe in Charts. [Learn more about Conversion Timeframes](https://www.revenuecat.com/docs/charts-feature-incomplete-periods#conversion-timeframe-in-conversion-charts)",
    "5-0": "Trial CVR",
    "5-1": "The conversion rate of last week's ended trials to payers within their trial end day.  \n  \n(NOTE: This definition differs from our Trial Conversion chart to make sure we're providing complete, applicable data for the current week to compare against the prior week. Learn more about why below.)"
  },
  "cols": 2,
  "rows": 6,
  "align": [
    "left",
    "left"
  ]
}
[/block]


## FAQs

[block:parameters]
{
  "data": {
    "h-0": "Question",
    "h-1": "Answer",
    "0-0": "How is a \"week\" defined in these summaries?",
    "0-1": "Just like in Charts, we measure a week as beginning on Sunday and ending the following Saturday.",
    "1-0": "When will the summary be emailed to me?",
    "1-1": "Performance Summaries are delivered every Monday at 8AM ET.",
    "2-0": "Why are the conversion rate metrics limited to conversions occurring on a first seen day or trial end day?",
    "2-1": "Since we're delivering this weekly performance summary just one day after the week has ended, we need to ensure that all data points are complete to be accurately compared week over week, and a longer conversion timeframe could result in some days of the week being complete while others are incomplete, skewing the data.",
    "3-0": "Why does the Trial Conversion Rate definition differ from Charts?",
    "3-1": "In order to provide a comparable week over week measurement of Trial Conversion Rate, we're cohorting trials by their **end day** (the final day of the trial), since their end day is what creates the conversion opportunity that we can track and provide as a weekly performance metric with a tight conversion timeframe (described above).  \n  \nKeep in mind that since this definition is divorced from when the customer's journey began, or even when they started their trial (if you offer different trial lengths), if you see an unexpected change in performance we encourage you to visit the Trial Conversion & Active Trials Movement charts to analyze the data and see what may be driving the change.",
    "4-0": "Can I subscribe to individual Performance Summaries for each project?",
    "4-1": "Not at this time, but it's something we're considering for the future! If that's a feature you need, let us know about it.",
    "5-0": "Why are some metrics empty with just a `-`?",
    "5-1": "The hyphen indicates an empty data point, which may occur for reasons like:  \n- There are 0 trials completed (so trial conversion can not be calculated)  \n- There are 0 installs (so initial conversion can not be calculated)  \n- Last week's value is zero so the % change can not be calculated  \n  \nIf you believe this to be in error, feel free to reach out through [Support](https://app.revenuecat.com/settings/support)."
  },
  "cols": 2,
  "rows": 6,
  "align": [
    "left",
    "left"
  ]
}
[/block]

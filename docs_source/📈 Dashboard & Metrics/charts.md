---
title: Charts
slug: charts
excerpt: Analyzing your subscription business with visualizations
hidden: false
metadata:
  title: Charts – RevenueCat
  description: RevenueCat charts allow you to understand your user base with key subscription
    specific metrics, filters, and segments. All charts are generated from the current
    snapshot of purchase receipts saved in RevenueCat and work independently from
    any in-app usage.
  image:
    0: https://files.readme.io/99cce20-RevenueCat_Docs_OG.png
    1: RevenueCat Docs OG.png
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: '2022-10-19T20:51:43.737Z'
updatedAt: '2022-10-19T20:51:43.737Z'
category: 640a7bf126512c00308b2f8d
---
[block:callout]
{
  "type": "success",
  "body": "Charts are available on [paid](https://www.revenuecat.com/pricing) plans."
}
[/block]
RevenueCat charts allow you to understand your user base with key subscription specific metrics, filters, and segments. All charts are generated from the current snapshot of purchase receipts saved in RevenueCat and work independently from any in-app usage.

This means that your charts are always up-to-date, without having to rely on any client-side event logging. However, since receipt files are dynamic, this means even historical data may change from day-to-day if for example a user was refunded. This also means that data in RevenueCat may be different than other systems tracking similar metrics - see the section on [Differences In Data](doc:charts#differences-in-data) for more information.
[block:callout]
{
  "type": "info",
  "title": "Charts show production data only",
  "body": "Due to the limitations of the sandbox environments, charts are only displayed for production transaction data."
}
[/block]
# Data Discrepancies
Reconciling data between multiple sources is a fundamental challenge for all analytics systems. As a consequence, in-app purchase data from Apple, Google, or Stripe may not match what RevenueCat reports in Charts or in [Overview](doc:overview). Common reasons for these discrepancies are:
  * You migrated your app to RevenueCat (receipts must be sent through our SDK or API to be counted in Charts)
  * There is a disagreement between the store and RevenueCat over a definition (e.g., Apple uses fiscal months, whereas RevenueCat uses calendar months; Google considers trials to be active subscriptions, whereas RevenueCat does not)
  * RevenueCat makes an estimation in the absence of clear guidance from the store (e.g., currency conversions, taxes, price changes)

When reporting tax information, please use the data provided by the payment processor (i.e., Apple, Google, Stripe), instead of RevenueCat data.

Please see our [community post](https://community.revenuecat.com/featured-articles-55/about-data-discrepancies-116) for a more in-depth discussion of data discrepancies.

# Recreating Our Charts
Calculating in-app purchase metrics at scale is a complex process: Each of our metrics entail making decisions as to how users are grouped (i.e., cohorts), how users with different subscription histories are compared, etc.

We strive to provide clear and accurate insights into your data, but we cannot guarantee that our Charts definitions will match third-party definitions of similar metrics.

# Charts
For detailed information on a particular Chart, refer to the following guides:

  * [Active Subscriptions :fa-arrow-right:](doc:active-subscriptions-chart)
  * [Active Subscriptions Movement :fa-arrow-right:](doc:active-subscriptions-movement-chart) 
  * [Churn :fa-arrow-right:](doc:churn-chart)
  * [Refund Rate :fa-arrow-right:](doc:refund-rate-chart) 
  * [Annual Recurring Revenue (ARR) :fa-arrow-right:](doc:annual-recurring-revenue-arr-chart) 
  * [Realized LTV per Customer :fa-arrow-right:](doc:realized-ltv-per-customer-chart) 
  * [Realized LTV per Paying Customer :fa-arrow-right:](doc:realized-ltv-per-paying-customer-chart) 
  * [Monthly Recurring Revenue (MRR) :fa-arrow-right:](doc:monthly-recurring-revenue-mrr-chart) 
  * [Monthly Recurring Revenue Movement :fa-arrow-right:](doc:monthly-recurring-revenue-movement-chart) 
  * [Revenue :fa-arrow-right:](doc:revenue-chart) 
  * [Conversion to Paying :fa-arrow-right:](doc:conversion-to-paying-chart) 
  * [Initial Conversion :fa-arrow-right:](doc:initial-conversion-chart) 
  * [Trial Conversion :fa-arrow-right:](doc:trial-conversion-chart) 
  * [Subscription Retention :fa-arrow-right:](doc:subscription-retention-chart) 
  * [Active Trials :fa-arrow-right:](doc:active-trials-chart) 
  * [Active Trials Movement :fa-arrow-right:](doc:active-trials-movement-chart) 

# Filters and Segments

All charts can be filtered, while subscription, revenue, and active trial charts can be filtered and/or segmented.

Filters allow you to limit the charts to only include data that matches one or more attributes. This is useful when you want to check the performance of a specific property, such as a certain country or product identifier. 

Segments allow you to break down the chart totals into underlying data segments. This is useful for comparing the performance of specific properties, such as monthly vs. annual subscriptions.
[block:parameters]
{
  "data": {
    "h-0": "Attribute",
    "h-1": "Description",
    "0-0": "Project",
    "0-1": "The different projects you have access to in RevenueCat. These projects contain your apps across various platforms.",
    "1-0": "Apple Search Ads Ad Group",
    "1-1": "If you're collecting [Apple Search Ads Attribution](doc:apple-search-ads), the specific ad group that drove the install (iOS only).",
    "2-0": "Apple Search Ads Campaign",
    "2-1": "If you're collecting [Apple Search Ads Attribution](doc:apple-search-ads), the specific campaign that drove the install (iOS only).",
    "3-0": "Country",
    "3-1": "The device locale that was recorded with the purchase or the last known locale of the customer. May be unknown.",
    "4-0": "First Purchase Month",
    "4-1": "The month that the first purchase (incl. free trials) was recorded for the user (segment option only).",
    "5-0": "Install Month",
    "5-1": "The month that the user was first seen by RevenueCat (segment option only).",
    "6-0": "Offering",
    "6-1": "The offering identifier set in RevenueCat.",
    "7-0": "Product Duration",
    "7-1": "The duration of the normal subscription period (not trial or intro period).",
    "8-0": "Product",
    "8-1": "The product identifier set in the store.",
    "9-0": "Store",
    "9-1": "The store that processed the purchase. Either App Store, Play Store, Amazon Appstore, or Stripe."
  },
  "cols": 2,
  "rows": 10
}
[/block]

[block:callout]
{
  "type": "info",
  "title": "Filters do not affect 'New Customers' number",
  "body": "Filters and segments do not apply to the 'New Customers' number. It is possible for customers to jump between web, iOS, and Android devices, so these filters only apply to transactions, which always happen through a particular Store."
}
[/block]
# Exporting Data

The underlying chart data can be exported in .csv format by clicking the *Export CSV* button.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/1cdf29d-Screenshot_at_Sep_10_12-47-41.png",
        "Screenshot at Sep 10 12-47-41.png",
        1238,
        134,
        "#fcfcfc"
      ]
    }
  ]
}
[/block]
# Saving Charts
Your most frequently used chart configurations can be saved by clicking on the *Save* button. This will save all settings such as segments, filters, time / period settings, and bar / line view. 

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/cf66c88-f598340-Screen_Shot_2022-04-29_at_11.24.05_AM.png",
        "f598340-Screen_Shot_2022-04-29_at_11.24.05_AM.png",
        1408,
        627,
        "#f1f2fc"
      ]
    }
  ]
}
[/block]
Time settings are saved relatively. Meaning if you select "last 7 days", the chart will always show the last 7 days prior to the current day (not the 7 days prior to the date the chart was saved). This does not apply to custom timeframes.

Give it a name and select *Save*, your chart will be saved on the left-hand side.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/93ad014-3fa504c-Screen_Shot_2022-04-29_at_11.24.20_AM.png",
        "3fa504c-Screen_Shot_2022-04-29_at_11.24.20_AM.png",
        618,
        357,
        "#f0f0f1"
      ]
    }
  ]
}
[/block]

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/58997e5-a1e12fd-Screen_Shot_2022-04-29_at_11.22.54_AM.png",
        "a1e12fd-Screen_Shot_2022-04-29_at_11.22.54_AM.png",
        464,
        350,
        "#f7f7f7"
      ]
    }
  ]
}
[/block]
# Other Options
## Date Range
Choose the the date range for the x-axis of the charts.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/bc3a956-Screen_Shot_2021-09-10_at_12.48.20_PM.png",
        "Screen Shot 2021-09-10 at 12.48.20 PM.png",
        335,
        418,
        "#fafafb"
      ]
    }
  ]
}
[/block]
## Resolution
Choose the time scale for the x-axis of the charts. Use a *day* timescale to see the most granular level of data and lower resolutions like *month* to spot longer term trends.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/6858457-Screen_Shot_2021-09-10_at_12.48.56_PM.png",
        "Screen Shot 2021-09-10 at 12.48.56 PM.png",
        378,
        249,
        "#f8f8f9"
      ]
    }
  ]
}
[/block]
# Timezones

All charts are displayed in UTC time.

# Sandbox Data

Due to the limitations of the sandbox environments, charts can only display production transaction data.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/0d0ccea-Screen_Shot_2020-04-06_at_4.29.08_PM.png",
        "Screen Shot 2020-04-06 at 4.29.08 PM.png",
        243,
        52,
        "#f8f2ef"
      ]
    }
  ]
}
[/block]
# Refunds
Whenever a subscription is refunded, that subscription is counted as active between its start date and the refund date. Any refunded revenue is removed from all revenue-based charts. You can use the [Refund Rate](#refund-rate) chart to gain additional insights into how many of your subscriptions get refunded, and how that refund rate develops over time.


# Next Steps

* Learn how to view the purchase history of a specific user and grant them promotional access via the [Customer View :fa-arrow-right:](doc:customers)
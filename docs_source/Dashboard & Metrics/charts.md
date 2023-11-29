---
title: Charts
slug: charts
excerpt: Analyzing your subscription business with visualizations
hidden: false
---
[block:callout]
{
  "type": "success",
  "body": "Charts are available to all users signed up after September '23, the legacy Starter and Pro plans, and Enterprise plans. If you're on a legacy Free plan and want to access this integration, migrate to our new pricing via your [billing settings](https://app.revenuecat.com/settings/billing)"
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
# Conversion Charts

## Cohorting
To ensure our conversion rate charts provide an accurate measurement of the conversion "funnel" that an individual customer experiences, they are cohorted by the earliest date that a customer:

1. Was "first seen" (first opened your app), or
2. Made their first purchase (for purchases made outside of your app, like promoted purchases in the App Store)

**Example**: If a customer first opened your app on April 15th, 2022, but didn't make a purchase until May 21st, 2022, they would be included in the April 15th cohort.
[block:callout]
{
  "type": "info",
  "body": "Measuring conversion rates through a cohort of customers *from* a given period, as opposed to a count of events *within* a given period, is critical for accurate performance comparison."
}
[/block]
## Understanding conversion rates
We offer three conversion rate charts to measure different aspects of your conversion funnel:

1. Initial Conversion: The proportion of new customers from a given period who subscribe to or purchase any product, including free trials.
2. Conversion to Paying: The proportion of new customers from a given period who subscribe to or purchase any paid product.
3. Trial Conversion: The proportion of new customers from a given period starting free trials, through their conversion into paying subscriptions.

It's important to understand the relationships between these three charts, since depending on the nature of your product offerings, you may use these charts for different purposes.

**If all of your products offer a free trial, then Initial Conversion = Trial Start Rate.**
![](https://files.readme.io/1386416-image-20230224-130028.png "image-20230224-130028.png")
**If all of your products begin with a paid subscription, then Initial Conversion = Conversion to Paying, and Trial Conversion is not applicable to your business.**
![](https://files.readme.io/611728c-image-20230224-155039.png "image-20230224-155039.png")
**If your products contain a mix of subscriptions with and without trials, then these charts will measure distinct conversion rates. Initial Conversion will equal ([Trial Starts] + [Paying Customers]) / [New Customers], while Conversion to Paying will equal ([Trial Conversions] + [Paying Customers]) / [New Customers].**
![](https://files.readme.io/179324e-image-20230224-155057.png "image-20230224-155057.png")
## Conversion Timeframes

On our Initial Conversion and Conversion to Paying charts we offer a "Conversion Timeframe" selector that lets you choose how long to give each cohort to convert within to be included in the chart.

Since these charts are cohorted by a customer's first seen date, earlier cohorts have had more opportunity to convert, which is one reason why the most recent periods in your chart might have lower reported conversion rates.

By setting a Conversion Timeframe of 7 days, for example, you ensure that even periods which are much older than 7 days only include conversions that occurred within 7 complete days of customer's first seen date in the chart. If you compare that to a recent cohort that's also had 7 complete days to convert, that you're seeing an accurate comparison of performance within that defined time period.

Here's a specific example using a 7 day Conversion Timeframe:
* A cohort that is 14 days old would only include conversions that occurred within the first 7 complete days, but none that occurred after
* A cohort that is 10 days old would include all conversions that occurred within the first 7 complete days, but none that occurred after, allowing for accurate comparison with the older cohort even though that cohort has had more opportunities to convert -- that additional time is excluded from this view.
* While a cohort that is 5 days old would include all conversions that occurred thus far, since all have occurred within the first 7 complete days, and it would additionally be marked as incomplete, since that cohort still has remaining time before it reaches full maturity.

[block:callout]
{
  "type": "info",
  "body": "Select the \"Unbounded\" conversion timeframe to see all the conversions for a given cohort, regardless of when they occurred."
}
[/block]
Additionally, cohorts that have not yet had the time fully mature (as defined by the Conversion Timeframe selected) will be marked as incomplete periods and styled accordingly. This ensures that you can interpret their performance accurately against other periods. Learn more about incomplete periods [here](doc:charts-feature-incomplete-periods).
[block:callout]
{
  "type": "warning",
  "body": "Conversion Timeframes are not yet supported on the Trial Conversion chart, but will be coming soon."
}
[/block]
# Exporting Data

The underlying chart data can be exported in .csv format by clicking the *Export CSV* button.
![](https://files.readme.io/90cf474-demo.revenuecat.com_.png "demo.revenuecat.com_.png")
# Saving Charts
Your most frequently used chart configurations can be saved by clicking on the *Save* button. This will save all settings such as segments, filters, time / period settings, and bar / line view. 

![](https://files.readme.io/bbfca79-Screenshot_2023-03-27_at_2.35.10_PM.png "Screenshot 2023-03-27 at 2.35.10 PM.png")
Time settings are saved relatively. Meaning if you select "last 7 days", the chart will always show the last 7 days prior to the current day (not the 7 days prior to the date the chart was saved). This does not apply to custom timeframes.

Give it a name and select *Save*, your chart will be saved on the left-hand side.
![](https://files.readme.io/e1ba744-Screenshot_2023-03-27_at_2.36.33_PM.png "Screenshot 2023-03-27 at 2.36.33 PM.png")

![](https://files.readme.io/878cc0f-demo.revenuecat.com__1.png "demo.revenuecat.com_ (1).png")
# Other Options
## Date Range
Choose the the date range for the x-axis of the charts.
![](https://files.readme.io/60cba96-Screenshot_2023-03-27_at_2.44.10_PM.png "Screenshot 2023-03-27 at 2.44.10 PM.png")
## Resolution
Choose the time scale for the x-axis of the charts. Use a *day* timescale to see the most granular level of data and lower resolutions like *month* to spot longer term trends.
![](https://files.readme.io/15462d2-Screenshot_2023-03-27_at_2.46.13_PM.png "Screenshot 2023-03-27 at 2.46.13 PM.png")
# Timezones

All charts are displayed in UTC time.

# Refunds
Whenever a subscription is refunded, that subscription is counted as active between its start date and the refund date. Any refunded revenue is removed from all revenue-based charts. You can use the [Refund Rate](#refund-rate) chart to gain additional insights into how many of your subscriptions get refunded, and how that refund rate develops over time.


# Next Steps

* Learn how to view the purchase history of a specific user and grant them promotional access via the [Customer View :fa-arrow-right:](doc:customers)

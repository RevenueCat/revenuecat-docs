---
title: "Charts"
slug: "charts"
excerpt: "Analyzing your subscription business with visualizations"
hidden: false
metadata: 
  title: "Charts – RevenueCat"
  description: "RevenueCat charts allow you to understand your user base with key subscription specific metrics, filters, and segments. All charts are generated from the current snapshot of purchase receipts saved in RevenueCat and work independently from any in-app usage."
  image: 
    0: "https://files.readme.io/fa05d8d-60993e3c40039b67596bcc8c_slack-preview.png"
    1: "60993e3c40039b67596bcc8c_slack-preview.png"
    2: 1200
    3: 627
    4: "#f45476"
createdAt: {}
updatedAt: "2021-12-30T00:10:43.669Z"
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
# Differences In Data

All of the charts in RevenueCat are generated from a snapshot of the current state of all receipts from your app. This is different than other analytics systems that may use event based metrics and counters to track values. This also means that data for any historical point in time may change if a receipt file is added or updated.

When comparing data in RevenueCat to other systems, keep in mind any reporting differences between the systems such as timezones, calculations, and whether the underlying source data is the same.

RevenueCat does not connect to App Store Connect or Play Store directly, so you should expect differences in data when comparing these systems to RevenueCat. Also, remember that RevenueCat only has information from customers that have purchased or restored through the *Purchases SDK* or REST API.

You can read more about data discrepancies more in-depth in our community article [here](https://community.revenuecat.com/featured-articles-55/about-data-discrepancies-116).

# Charts
## Active Subscriptions
**Segments:** Yes
**Filters:** Yes
The Active Subscriptions chart shows the number of unexpired, paid subscriptions at the end of each period charted. For the current period, the number indicated is the current active subscriptions. Subscriptions that have auto-renew disabled are still counted in Active Subscriptions.  

Note that it is possible for a single user to start multiple subscriptions in the same period, if for example they start a trial for a monthly subscription then switch to an annual subscription.

This chart is useful for understanding the number of individual, recurring relationships you are currently serving and is a proxy for the size of the business and is powerful when combined with [filters and segments](doc:charts#section-filters-and-segments) to understand what is driving subscriptions.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/daa8074-Screen_Shot_2021-11-01_at_10.08.59_AM.png",
        "Screen Shot 2021-11-01 at 10.08.59 AM.png",
        1395,
        751,
        "#fdfefe"
      ]
    }
  ]
}
[/block]
## Active Subscriptions Movement
**Segments:** No
**Filters:** Yes
The Active Subscriptions Movement chart shows the increases and decreases to Active Subscriptions caused by new and churned subscriptions.

New Actives are new subscriptions started in that period. Churned Actives counts subscriptions that exceeded their expiration date without renewing or that were refunded, minus any previously churned subscribers that re-subscribed. Churned Actives can be negative if there were more re-subscriptions than churned subscriptions during the period. Movement is the difference between the two and represents the net change of Active Subscriptions.

Dissecting the movement of your Active Subscriptions is a good way to understand what is causing your subscription base to grow or shrink. 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/dbce72e-Screen_Shot_2021-09-10_at_12.44.13_PM.png",
        "Screen Shot 2021-09-10 at 12.44.13 PM.png",
        1269,
        715,
        "#cee3f1"
      ]
    }
  ]
}
[/block]
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
        "https://files.readme.io/ae9fff5-Screen_Shot_2021-11-01_at_10.08.13_AM.png",
        "Screen Shot 2021-11-01 at 10.08.13 AM.png",
        1399,
        831,
        "#fdfefe"
      ]
    }
  ]
}
[/block]
## Refund Rate
**Segments:** Yes
**Filters:** Yes
The Refund Rate chart shows the number of transactions (new subscriptions and renewals) in each time period and what proportion of these transactions was refunded. Trial start transactions are excluded from the Refund Rate chart, given that they have no revenue and can’t be refunded.

The Refund Rate is an important indicator whether your customers are getting the value they expected when they started their subscription. 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/1a30b24-Screenshot_2021-10-04_at_16.32.25.png",
        "Screenshot 2021-10-04 at 16.32.25.png",
        1956,
        1316,
        "#fcfcfd"
      ]
    }
  ]
}
[/block]
## Annual Recurring Revenue (ARR)
**Segments:** Yes
**Filters:** Yes
The Annual Recurring Revenue, or ARR, chart is an annualized estimation of your recurring revenue. It is computed by multiplying [MRR](#monthly-recurring-revenue-mrr) by 12. Non-recurring subscriptions, consumable, or one-time purchases are not computed in ARR. Also, a subscription contributes to ARR until it expires, the auto-renew status has no effect. Note that ARR calculations excludes store cuts.

ARR is an important metric to track as it is a common benchmark for subscription companies and is a good way to assess scale of your existing business. 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/dab6135-Screen_Shot_2021-11-01_at_10.09.37_AM.png",
        "Screen Shot 2021-11-01 at 10.09.37 AM.png",
        1396,
        754,
        "#fdfefe"
      ]
    }
  ]
}
[/block]
## Monthly Recurring Revenue (MRR)
**Segments:** Yes
**Filters:** Yes
The Monthly Recurring Revenue, or MRR, chart is a way of normalizing the scale of your business to better understand your velocity or size. It doesn't map directly to revenue, but it is a useful standardization.

MRR is computed by "normalizing" subscriptions to a 1-month period. Non-recurring subscriptions, consumable, or one-time purchases are not computed in MRR. For example, a subscription that is $8 per month, will contribute $8 to MRR while it is active. An annual subscription that costs $120 per year will contribute $10 dollars per month to MRR for 12 months. This normalizing of all durations to a 1 month period makes it easier to compare different subscriptions of different durations together. Note that MRR calculations excludes store cuts.

MRR is an important measure because it not only captures the size of your subscriber base, but translates that into a real velocity metric for your business. MRR and ARR are considered the standard velocity metrics for subscription software companies. 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/e130def-Screen_Shot_2021-11-01_at_10.09.56_AM.png",
        "Screen Shot 2021-11-01 at 10.09.56 AM.png",
        1395,
        750,
        "#fdfefe"
      ]
    }
  ]
}
[/block]
## Monthly Recurring Revenue Movement 
**Segments:** No
**Filters:** Yes
The Monthly Recurring Revenue Movement chart shows how New Subscriptions and Churned Subscriptions affect MRR. This chart displays all revenue from non-consumable and consumable purchases, as well as non-renewing subscriptions.

New MRR is MRR that was added during the period by New Subscriptions. Churned MRR is MRR that was lost in the period by Churned Subscriptions.

Looking at MRR Movement is important to understand the factors that cause your MRR to increase or decrease over a period and give insight into what grows or contracts your business. 

Revenue displays the revenue generated during a period. This number will usually be a little higher that MRR as it is un-normalized and all the revenue from an annual subscription is charted the period it starts or is renewed. 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/f8c2e2a-Screen_Shot_2021-09-10_at_12.44.55_PM.png",
        "Screen Shot 2021-09-10 at 12.44.55 PM.png",
        1265,
        713,
        "#cde3f1"
      ]
    }
  ]
}
[/block]
## Revenue
**Segments:** Yes
**Filters:** Yes
The Revenue chart displays the revenue generated during a period. This number will usually be a little higher that MRR as it is un-normalized and all the revenue from an annual subscription is charted the period it starts or is renewed. This chart also displays all revenue from non-consumable and consumable purchases, as well as non-renewing subscriptions. 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/a0824d5-Screen_Shot_2021-09-10_at_12.45.07_PM.png",
        "Screen Shot 2021-09-10 at 12.45.07 PM.png",
        1266,
        787,
        "#e0e7f9"
      ]
    }
  ]
}
[/block]
## Conversion to Paying
**Segments:** Yes
**Filters:** Yes
The Conversion to Paying chart shows what proportion of new customers end up paying.

The conversion rate to paying is a good indicator of how effective your app is at acquiring the right kind of customers and demonstrating the value of your premium products.

For apps that offer no products with trials, the conversion rate to paying is equal to the initial conversion rate (because there are no subscribers that don't pay). For trial products, conversion to paying is equal to the product of trial start rate and trial conversion rate, in other words, the conversion rate from the start to the end of the trial funnel. It is therefore a measure of both the effectiveness of converting users to a trial and convincing trialists of the value of the subscription and converting them to paying subscribers. 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/0773322-Screen_Shot_2021-11-01_at_10.13.10_AM.png",
        "Screen Shot 2021-11-01 at 10.13.10 AM.png",
        1398,
        834,
        "#fdfdfd"
      ]
    }
  ]
}
[/block]
## Initial Conversion
**Segments:** Yes
**Filters:** Yes
The Initial Conversion chart shows what proportion of new customers start any subscription (including trial) or make any purchase.

The initial conversion rate is a good indicator of how effective your app is at acquiring the right kind of customers and messaging the value proposition of your premium products, including the effectiveness of your paywall.

For apps that exclusively rely on products with trials, the initial conversion rate is equal to the trial start rate. For apps that offer no trials at all, the initial conversion rate is equal to the conversion rate to paying (because there are no subscribers that don't pay). 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/3c34147-Screen_Shot_2021-11-01_at_10.13.33_AM.png",
        "Screen Shot 2021-11-01 at 10.13.33 AM.png",
        1397,
        833,
        "#fdfdfd"
      ]
    }
  ]
}
[/block]
## Trial Conversion
**Segments:** No
**Filters:** Yes
The Trial Conversion chart gives you a picture of how customers start free trials and convert into paying subscriptions. This chart is plotted on a "cohort" basis, meaning the time periods represent the date a customer was first seen, i.e. the date they first opened your app.

When a customer first launches your app, they are added to the "New Customers" number for a cohort. If they start a free trial, they contribute to the Trials column. Immediately after a trial is started, it is considered Pending as it has yet to convert, but is set to convert. Once the customer disables auto-renew, the trial is no longer Pending and is now considered Abandoned. If a user re-enables auto-renew, they will return to the Pending column. Once a trial has expired, it will be permanently counted in the Converted or Abandoned column depending on whether it converted to paid subscription or not.

Trials Conversion funnels are extremely important for understanding how well your app is monetizing. Two rates are important: the rate at which users start a trial, aka the Start Rate, and the rate that those trials convert to trials, i.e. the Conversion Rate. The Start Rate is a good way of measuring how well users are finding your trial, but Conversion Rate is the real measure of how valuable and convincing the offering is. The product of these two numbers, (Start Rate) x (Conversion Rate) is your Overall Conversion Rate which is also indicative of the overall fit of your product and pricing. 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/df9e284-Screen_Shot_2021-09-10_at_12.46.03_PM.png",
        "Screen Shot 2021-09-10 at 12.46.03 PM.png",
        1269,
        790,
        "#edf2f8"
      ]
    }
  ]
}
[/block]
## Subscription Retention
**Segments:** No
**Filters:** Yes
The Subscription Retention chart shows you how paying subscriptions renew and retain over time by cohort.

Cohorts are defined by the start of a paid, auto-renewing subscription (excluding trial periods and periods with introductory pricing). Subsequent periods along the horizontal table indicate how many subscriptions continued renewing through those periods. The final, incomplete period is indicated with a hashed background and shows how many subscriptions are set to renew by the end of the period, taking into account the auto-renewal preference of the subscriptions. 

We count retention on a per-product basis. If a customer re-subscribes to the same product they would be counted as retained and will not be included in two different cohorts. Due to that same per-product retention, if a subscriber changes products, they would be counted as "churned" on the old product and start a new "retention journey" on the new one. Their new cohort would be based on the date the transaction for the new product was completed.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/52388e9-Screen_Shot_2021-09-10_at_12.45.49_PM.png",
        "Screen Shot 2021-09-10 at 12.45.49 PM.png",
        1270,
        823,
        "#fafafb"
      ]
    }
  ]
}
[/block]
## Active Trials
**Segments:** Yes
**Filters:** Yes
The Active Trials chart shows the number of active trials at the end of the period. Included in this number is all trials, regardless of whether they are set to auto-convert on completion or not.

The volume of Active Trials is a good leading indicator to growth of Active Subscriptions and therefore MRR. If the volume of active trials is increasing or decreasing it indicates that your business may be accelerating or decelerating respectively. The [Active Trials Movement chart](doc:charts#active-trials-movement) can help you understand these movements. 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/f7978c5-Screen_Shot_2021-11-01_at_10.10.43_AM.png",
        "Screen Shot 2021-11-01 at 10.10.43 AM.png",
        1395,
        753,
        "#fefefd"
      ]
    }
  ]
}
[/block]
## Active Trials Movement
**Segments:** No
**Filters:** Yes
The Active Trials Movement chart breaks down the inputs to the Active Trials chart and gives you a picture of how your active trial base is evolving.

New Trials are trials started during the period. Expired Trials are the trials that completed during the period. The difference between these two numbers is the Movement and it tells you if your trial base is growing or shrinking.

Understanding the dynamics of your trial base is important for understanding leading indicators of the growth of your business. 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/f509343-Screen_Shot_2021-09-10_at_12.46.28_PM.png",
        "Screen Shot 2021-09-10 at 12.46.28 PM.png",
        1266,
        711,
        "#e5dadc"
      ]
    }
  ]
}
[/block]



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

[block:callout]
{
  "type": "info",
  "title": "Save views as bookmarks",
  "body": "Filters and segments are set as URL parameters so views can be saved as bookmarks for quick access later."
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
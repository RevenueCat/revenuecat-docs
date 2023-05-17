---
title: "[DRAFT] Overview"
slug: draft-overview
excerpt: In-app purchase dashboard
hidden: true
createdAt: '2022-03-29T18:31:13.011Z'
updatedAt: '2022-03-29T19:37:56.970Z'
category: 64651518bd7ecf19272c3b8c
---
The RevenueCat Overview is your in-app purchase hub for quick metrics on the health of your business. 

# Metrics
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/7f2deb3-new_active_trials_card_sm.png",
        "new_active_trials_card_sm.png",
        368,
        164,
        "#fbfbfb"
      ],
      "sizing": "original"
    }
  ]
}
[/block]
The **Active Trials** card displays the number of free trials that are currently tracked in RevenueCat.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/bcb1f4d-new_active_subs_card_sm.png",
        "new_active_subs_card_sm.png",
        367,
        163,
        "#fafafa"
      ]
    }
  ]
}
[/block]
The **Active Subscriptions** card displays the number of active subscriptions that are currently tracked in RevenueCat.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/19265f0-new_mrr_card_sm.png",
        "new_mrr_card_sm.png",
        365,
        160,
        "#f8f9f9"
      ]
    }
  ]
}
[/block]
The **MRR** card displays the current monthly recurring revenue tracked in RevenueCat. You can read more about how MRR is calculated in our [charts guide here](doc:charts#monthly-recurring-revenue-mrr).
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/81c5f2b-new_revenue_card_sm.png",
        "new_revenue_card_sm.png",
        364,
        159,
        "#f9fafa"
      ]
    }
  ]
}
[/block]
The **Revenue** card displays the gross revenue tracked in RevenueCat. This is before any store fees, taxes, etc.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/2d46486-new_customers_card_sm.png",
        "new_customers_card_sm.png",
        363,
        156,
        "#fafafa"
      ]
    }
  ]
}
[/block]
The **New Customers** card displays the number of App User IDs created in the past 28 days. Multiple App User IDs aliased together will be counted as 1 user.
[block:callout]
{
  "type": "info",
  "body": "You should expect the New Customers count in RevenueCat to be different than the download numbers provided by the respective store. However, if things seem drastically off, make sure you're [identifying users](doc:user-ids) correctly in RevenueCat."
}
[/block]

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/dec6885-new_active_users_card_sm.png",
        "new_active_users_card_sm.png",
        365,
        157,
        "#fafafa"
      ]
    }
  ]
}
[/block]
The **Active Users** card displays the number of App User IDs that have communicated with RevenueCat in the past 28 days. Active Users should be higher than **New Customers** if your app is retaining users and they keep coming back after 28 days. Multiple App User IDs aliased together will be counted as 1 active user.

## Sandbox Data
The sandbox data toggle will change the Overview metrics to report from sandbox purchases or production purchases. There's no concept of a sandbox or production *user* in RevenueCat, since the same App User Id can have both production and sandbox receipts. Because of this, **the 'View sandbox data' toggle will not affect 'New Customers' or 'Active Users' cards**. 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/ef2a134-Screen_Shot_2020-04-06_at_4.29.08_PM.png",
        "Screen Shot 2020-04-06 at 4.29.08 PM.png",
        243,
        52,
        "#f8f2ef"
      ]
    }
  ]
}
[/block]

## Refresh Rate
All Overview metrics are captured from our charts and will refresh every 15 minutes. To see when an individual metric was last refreshed, you can hover over the clock icon in the bottom right corner of the card:


[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/e14b7aa-refresh_tooltip.png",
        "refresh_tooltip.png",
        511,
        162,
        "#e7e8e8"
      ]
    }
  ]
}
[/block]
# Recent Transactions
Below the metrics is a table of the most recent transactions shown in real-time. Transactions include trial starts, trial conversions, purchases, and renewals. The details of this table are covered in our guide on the [Activity Table](doc:activity).

# Dates and times representation
All dates and times in the dashboard are represented in UTC, unless explicitly specified.

# Next Steps
* Dig into the details of your subscriber base by [looking at the charts :fa-arrow-right:](doc:charts)
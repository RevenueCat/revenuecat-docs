---
title: "Overview"
slug: "overview"
excerpt: "In-app purchase dashboard"
hidden: false
metadata: 
  title: "In-app purchase dashboard | RevenueCat"
  description: "The RevenueCat Overview is your in-app purchase hub for quick metrics on the health of your business."
  image: 
    0: "https://files.readme.io/1aa6e4d-Reddit__E.jpg"
    1: "Reddit – E.jpg"
    2: 1200
    3: 630
    4: "#fbabaf"
createdAt: "2020-04-02T23:21:02.437Z"
updatedAt: "2020-04-17T20:13:26.511Z"
---
The RevenueCat Overview is your in-app purchase hub for quick metrics on the health of your business. 
[block:api-header]
{
  "title": "Metrics"
}
[/block]

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/91a41ad-Screen_Shot_2020-04-02_at_4.37.36_PM.png",
        "Screen Shot 2020-04-02 at 4.37.36 PM.png",
        357,
        153,
        "#f5f9f9"
      ]
    }
  ]
}
[/block]
The 'Active Trials' card displays the number of free trials that are currently tracked in RevenueCat.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/202a31a-Screen_Shot_2020-04-02_at_4.37.47_PM.png",
        "Screen Shot 2020-04-02 at 4.37.47 PM.png",
        357,
        152,
        "#f3f8f7"
      ]
    }
  ]
}
[/block]
The 'Paying Subscribers' card displays the number of paid subscriptions that are currently tracked in RevenueCat.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/3b8f514-Screen_Shot_2020-04-02_at_4.38.01_PM.png",
        "Screen Shot 2020-04-02 at 4.38.01 PM.png",
        355,
        152,
        "#f4f8f7"
      ]
    }
  ]
}
[/block]
The 'MRR' card displays the current monthly recurring revenue tracked in RevenueCat. You can read more about how MRR is calculated in our [charts guide here](doc:charts#section-monthly-recurring-revenue).
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/53d02b5-Screen_Shot_2020-04-02_at_4.38.09_PM.png",
        "Screen Shot 2020-04-02 at 4.38.09 PM.png",
        358,
        153,
        "#f4f8f8"
      ]
    }
  ]
}
[/block]
The 'Revenue' card displays the gross revenue tracked in RevenueCat. This is before any store fees, taxes, etc.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/458bfad-Screen_Shot_2020-04-02_at_4.38.15_PM.png",
        "Screen Shot 2020-04-02 at 4.38.15 PM.png",
        357,
        152,
        "#f5f9f9"
      ]
    }
  ]
}
[/block]
The 'Installs' card displays the number of App User IDs created in the past 28 days.
[block:callout]
{
  "type": "info",
  "body": "You should expect the Install count in RevenueCat to be different than the download numbers provided by Apple/Google. However, if things seem drastically off, make sure you're [identifying users](doc:user-ids) correctly in RevenueCat."
}
[/block]

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/77db7b8-Screen_Shot_2020-04-02_at_4.38.23_PM.png",
        "Screen Shot 2020-04-02 at 4.38.23 PM.png",
        356,
        154,
        "#f5f9f9"
      ]
    }
  ]
}
[/block]
The 'Active Users' card displays the number of App User IDs that have communicated with RevenueCat in the past 28 days. Active users should be higher than 'Installs' if your app is retaining users and they keep coming back after 28 days.
[block:api-header]
{
  "title": "Sandbox Data"
}
[/block]
The sandbox data toggle will change the Overview metrics to report from sandbox purchases or production purchases. There's no concept of a sandbox or production *user* in RevenueCat, since the same App User Id can have both production and sandbox receipts. Because of this, **the 'View sandbox data' toggle will not affect 'Installs' or 'Active User' cards**. 
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

[block:api-header]
{
  "title": "Recent Transactions"
}
[/block]
Below the metrics card is a table of the most recent transactions shown in real-time. Transactions include trial starts, trial conversions, purchases, and renewals. The details of this table are covered in our guide on the [Activity Table](doc:activity).
[block:api-header]
{
  "title": "Next Steps"
}
[/block]
* Dig into the details of your subscriber base by [looking at the charts :fa-arrow-right:](doc:charts)
---
title: New Charts Transition
slug: new-charts-transition
excerpt: Migrating workflows from Original Charts to the New Charts beta
hidden: true
createdAt: '2021-06-10T16:41:59.584Z'
updatedAt: '2023-06-16T16:17:44.503Z'
category: 648c78a49909bc0c3debff17
order: 0
parentDoc: 648c7ee8b4629e1fd0fb39b5
---
# Known Issues

### All Charts

- Usability on mobile devices is not ideal.
  ** Workaround:** View in landscape for a better experience.

# Changelog

**June 23, 2021**
The engineering team discovered an issue with the MRR calculation, and pushed a fix to resolve the issue.

# Finding data

Since the New Charts are more opinionated about how and when to display relevant subscription data for certain charts, some of the places you're used to looking in the Original Charts may have been moved in the New Charts.
[block:parameters]
{
  "data": {
    "0-0": "Monthly&nbsp;Recurring&nbsp;Revenue",
    "h-0": "📈 Original Charts",
    "h-1": "📈 New Charts",
    "h-2": "Notes",
    "0-1": "MRR",
    "1-0": "Revenue",
    "1-1": "Revenue",
    "1-2": "Revenue is now segmented by 'New' and 'Renewal' revenue. The sum for each day is displayed by hovering over the day in the chart.",
    "2-0": "New Purchases & Trials",
    "2-1": "'Movement' Charts",
    "2-2": "The movement charts display 'new' data, as well as churned/expired data.",
    "3-0": "Active Subscriptions & Trials",
    "3-1": "'Active' Charts",
    "4-0": "Trial Start Rate",
    "4-1": "Trial Conversion",
    "4-2": "Change 'absolute' values to 'relative' values.",
    "5-0": "Trial Conversion",
    "5-1": "Trial Conversion",
    "6-0": "Auto Renew Status",
    "6-1": "Subscription&nbsp;Retention",
    "7-0": "Cohorts",
    "7-1": "Subscription&nbsp;Retention",
    "6-2": "The last striped column represents users that will auto-renew."
  },
  "cols": 3,
  "rows": 8
}
[/block]
## Use-cases

---

> I used to reference the **New Purchases & Trials** chart to filter and segment by **Is Trial Period** to see how many new trials were started, as well as how many new non-trial purchases occurred.

Use the Active Subscriptions/Trials Movement charts to view more detailed information about new and expired/churned purchases and trials.

---

> I used to reference the **Trial Start Rate** chart as a relative measure to see the performance of trial starts vs installations.

Use 'relative' data in the new Trial Conversion chart.

---

> I used to reference the **Auto-Renew Status** chart as a way to see how many users were set to renew at the current moment.

Use the last striped column in the new Subscriber Retention chart to see how many users are set to renew.

---
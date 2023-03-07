---
title: "15% Reduced Service Fee"
slug: "15-reduced-service-fee"
excerpt: "How to have the reduced commission rate reflected in RevenueCat"
hidden: false
createdAt: "2021-06-17T01:24:15.988Z"
updatedAt: "2021-06-25T16:32:06.500Z"
---
Google recently announced a reduction in their service fee for the first $1,000,000 USD in revenue per developer per year (note that for 2021, this amount is prorated to $500,000 USD as the program started on July 1st, 2021). 

You can read more about Google's Play's service fees [here](https://support.google.com/googleplay/android-developer/answer/112622?hl=en).
[block:api-header]
{
  "title": "Opting In to Reduced Service Fees"
}
[/block]
To opt-in to Google Play's reduced service fee, you'll need to create an account group and link your account. Google has instructions on how to do this [here](https://support.google.com/googleplay/android-developer/answer/10632485).

Once this is done, you'll automatically be opted in to the reduced fee for your first $1,000,000 USD in revenue per year.
[block:api-header]
{
  "title": "How RevenueCat Calculates Google Play Service Fees"
}
[/block]
RevenueCat will automatically assume developers have opted in to the reduced service fees. Additionally, we'll track your apps revenue and automatically switch over to the 30% fee when an application crosses over $1,000,000 USD in year-to-date revenue.

There are a few edge cases in which the date we calculate to switch from a 15% to a 30% service fee might be incorrect:
* If you have multiple apps in the same account, our estimate might be incorrect.
* If you transfer apps to another owner, our estimate might be incorrect.

If you find that the service fee displayed on RevenueCat is incorrect, [contact us](https://support.revenuecat.com/hc/en-us) and we can make adjustments.
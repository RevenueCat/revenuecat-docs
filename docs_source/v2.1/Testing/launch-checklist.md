---
title: "Launch Checklist"
slug: "launch-checklist"
excerpt: "Purchases SDK pre-launch checklist"
hidden: false
createdAt: "2019-03-21T16:50:31.806Z"
updatedAt: "2019-03-26T21:57:31.390Z"
---
This document contains a checklist of things to consider before launching your app to production.
[block:api-header]
{
  "title": "1. Know your plan limits"
}
[/block]

[block:parameters]
{
  "data": {
    "h-0": "Plan Limits",
    "h-1": "iOS",
    "0-0": "There are usage limits on the free Build plan. Hitting these limits may mean that purchases stop working. Consider upgrading to the Analyze plan to remove these limits. See the [pricing page](https://www.revenuecat.com/pricing) for more details.",
    "0-1": "✅",
    "0-2": "✅",
    "h-2": "Android"
  },
  "cols": 3,
  "rows": 1
}
[/block]

[block:api-header]
{
  "title": "2. Testing user identity in RevenueCat"
}
[/block]

[block:parameters]
{
  "data": {
    "h-1": "iOS",
    "h-2": "Android",
    "0-1": "✅",
    "0-2": "✅",
    "h-0": "Verify all users are tracked in customer view",
    "0-0": "Verify that all the users you create are tracked in the [customer view](https://app.revenuecat.com/customers). If you expect to see a specific App User Id, but it's missing, something could be wrong."
  },
  "cols": 3,
  "rows": 1
}
[/block]

[block:parameters]
{
  "data": {
    "h-0": "Verify users don't have unexpected aliases",
    "h-1": "iOS",
    "h-2": "Android",
    "0-1": "✅",
    "0-2": "✅",
    "0-0": "Aliases can only be created by restoring purchases or manually calling `.createAlias`. It would be normal to [see aliases](doc:customers#section-aliases) for a user if either of these scenarios apply."
  },
  "cols": 3,
  "rows": 1
}
[/block]

[block:parameters]
{
  "data": {
    "h-0": "No unexpected aliases on user",
    "h-1": "iOS",
    "h-2": "Android",
    "0-1": "✅",
    "0-2": "✅",
    "0-0": "For each user, check that there are no unexpected aliases on their customer page. See [our guide](doc:user-ids) for more information on how aliases are created."
  },
  "cols": 3,
  "rows": 1
}
[/block]

[block:api-header]
{
  "title": "3. Testing purchases"
}
[/block]

[block:parameters]
{
  "data": {
    "h-0": "All products are available",
    "h-1": "iOS",
    "h-2": "Android",
    "0-1": "✅",
    "0-2": "✅",
    "0-0": "Verify that all of your products are being fetched correctly by RevenueCat. \nIf any product is unavailable, there may be a [configuration issue](https://www.revenuecat.com/2018/10/11/configuring-in-app-products-is-hard)."
  },
  "cols": 3,
  "rows": 1
}
[/block]

[block:parameters]
{
  "data": {
    "h-0": "Test purchases unlock content",
    "h-1": "iOS",
    "h-2": "Android",
    "0-1": "✅",
    "0-2": "✅",
    "0-0": "Make a purchase, the transaction should succeed and unlock \"pro\" content. It should appear right away in the transactions table and in the customer view for that user. (Note: Sandbox subscriptions will auto-renew at an accelerated rate.)"
  },
  "cols": 3,
  "rows": 1
}
[/block]

[block:parameters]
{
  "data": {
    "h-0": "Subscriptions status is up-to-date",
    "h-1": "iOS",
    "h-2": "Android",
    "0-1": "✅",
    "0-2": "✅",
    "0-0": "Return to the app while a test subscription is still active. You should still be able to access \"pro\" content. \nWait for the subscription to expire then return to the app, your \"pro\" access should be revoked."
  },
  "cols": 3,
  "rows": 1
}
[/block]

[block:parameters]
{
  "data": {
    "h-0": "Restoring purchases",
    "h-1": "iOS",
    "h-2": "Android",
    "0-1": "✅",
    "0-2": "✅",
    "0-0": "Uninstall and re-install the app. If you're setting your own App User Id, any active subscriptions should be automatically restored when you log-in.\nIf you're using RevenueCat generated App User Ids on iOS, you won't be able to restore purchases after an uninstall in sandbox until you make another purchase."
  },
  "cols": 3,
  "rows": 1
}
[/block]

[block:api-header]
{
  "title": "4. Verify webhooks and integrations"
}
[/block]

[block:parameters]
{
  "data": {
    "h-1": "iOS",
    "h-2": "Android",
    "0-1": "✅",
    "0-2": "✅",
    "h-0": "No webhook failures",
    "0-0": "If you have a webhook configured, ensure that you don't have any errors and are handling all event types properly."
  },
  "cols": 3,
  "rows": 1
}
[/block]

[block:parameters]
{
  "data": {
    "h-1": "iOS",
    "h-2": "Android",
    "0-1": "✅",
    "0-2": "✅",
    "h-0": "Integrations delivered to correct user",
    "0-0": "If you have any integrations configured, ensure that you're receiving test events attached to the expected user"
  },
  "cols": 3,
  "rows": 1
}
[/block]

[block:api-header]
{
  "title": "6. Prepare release"
}
[/block]

[block:parameters]
{
  "data": {
    "0-2": "❌",
    "h-0": "Store description",
    "h-1": "iOS",
    "0-0": "Include [disclosure of auto-renewing subscription details](https://medium.com/revenuecat-blog/apple-will-reject-your-subscription-app-if-you-dont-include-this-disclosure-bba95244405d) in your app description.",
    "0-1": "✅",
    "h-2": "Android"
  },
  "cols": 3,
  "rows": 1
}
[/block]

[block:parameters]
{
  "data": {
    "h-0": "Phased rollout",
    "h-1": "iOS",
    "0-0": "Choose a staged release option so you can monitor, and halt, a rollout on a fraction of users if there's any problems.",
    "0-1": "✅",
    "0-2": "✅",
    "h-2": "Android"
  },
  "cols": 3,
  "rows": 1
}
[/block]

[block:parameters]
{
  "data": {
    "h-0": "Choose to manually release app",
    "0-0": "On iOS, if your app contains new products, choose to manually release the version and wait ~24 hours after your app is \"Cleared for Sale\" to release publicly. \nThis is because it sometimes takes new products ~24 hours to propagate throughout the App Store.",
    "0-1": "✅",
    "h-1": "iOS",
    "h-2": "Android",
    "0-2": "❌"
  },
  "cols": 3,
  "rows": 1
}
[/block]

[block:parameters]
{
  "data": {
    "h-0": "IDFA guidelines",
    "0-0": "If you're using an attribution integration, ensure your app complies with IDFA usage guidelines by disclosing the use of IDFA.",
    "h-1": "iOS",
    "0-1": "✅",
    "0-2": "❌",
    "h-2": "Android"
  },
  "cols": 3,
  "rows": 1
}
[/block]

[block:api-header]
{
  "title": "Next Steps"
}
[/block]
* Profit! However, if your app gets rejected, don't panic - check out our post on [getting through App Store review :fa-arrow-right:](https://medium.com/revenuecat-blog/getting-through-app-review-39ac50438c62)
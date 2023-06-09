---
title: Billing Issues & Grace Periods
slug: how-grace-periods-work
excerpt: What happens when a user encounters a billing issue
hidden: false
createdAt: '2022-09-15T18:31:21.266Z'
updatedAt: '2023-06-09T17:19:31.227Z'
category: 6483560b2e0a290051a971e0
order: 1
---
If a customer is unable to complete their purchase due to an invalid or expired payment method, supported stores offer an optional grace period. Grace periods allow the customer to retain access to their subscription purchase for a short period of time while the store attempts to renew the subscription. This prevents disruption for paid features, and can improve the user experience for your app.

Grace Periods are optional and customizable on certain platforms.

[block:parameters]
{
  "data": {
    "h-0": "Store",
    "h-1": "Required?",
    "h-2": "Duration",
    "0-0": "App Store",
    "0-1": "Optional",
    "0-2": "6 days (weekly products)\n16 days (monthly and up)",
    "1-0": "Google Play",
    "1-1": "Optional",
    "1-2": "Customizable",
    "2-0": "Stripe",
    "2-1": "Optional",
    "2-2": "Customizable",
    "3-0": "Amazon",
    "3-1": "❌ Not supported",
    "3-2": "N/A"
  },
  "cols": 3,
  "rows": 4
}
[/block]
# Encountering Billing Issues

As mentioned, billing issues occur when a user is unable to complete a subscription purchase due to an invalid or expired payment method. When this occurs, RevenueCat sends a `BILLING_ISSUE` event to webhooks, integrations, and the customer history page.

RevenueCat will only send **one** billing issue event -- additional payment failures won't trigger additional billing issue events, unless a renewal is successful between payment failures or the subscription ends and is restarted. 

# Entering a Grace Period

When a subscription enters a grace period, RevenueCat detects the change automatically. Users will retain access to their subscriptions, but we'll immediately send events indicating the subscription has been **cancelled**. These subscriptions are considered cancelled because they are now past due, but will not be considered expired until the end of their grace period. During this time, a subscription may convert to paid through additional billing attempts from the store or by the customer updating their billing information.

## API, Events, and Webhooks

To detect grace periods in [webhook](doc:webhooks) events, watch for the value of `grace_period_expiration_at_ms`. This property is only valid for `BILLING_ISSUE` events.

To detect grace periods in the `GET /subscriber` [endpoint](https://www.revenuecat.com/reference/subscribers), watch for the value of `grace_period_expires_date` on a subscription object and compare it to the current date. This property will be `null` if the subscription is not in a grace period.

Once a user corrects their payment method, RevenueCat will send a renewal event. This will reset the `grace_period_expires_date` property to `null` in the `GET /subscriber` endpoint.

## Dashboard

Customers who enter into a grace period will have events added to their [Customer History](doc:customers).
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/4265860-Screen_Shot_2022-09-15_at_2.46.12_PM.png",
        "Screen Shot 2022-09-15 at 2.46.12 PM.png",
        1244,
        294,
        "#000000"
      ],
      "sizing": "80",
      "border": true
    }
  ]
}
[/block]
Additionally, subscriptions that are currently in a grace period will still be considered "active," since the customer retains access to their entitlement throughout their grace period. Distinct customers who are currently in a grace period can be counted through Customer Lists using the "Billing Issue Trial" and "Billing Issue" statuses.
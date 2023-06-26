---
title: Handling Refunds
slug: refunds
excerpt: Handling and reacting to refunded purchases
hidden: false
categorySlug: offers-lifecycle-guidance
order: 4
---
Refunds are handled differently on each platform. It's recommended to set up [Platform Server Notifications](doc:server-notifications) for the best performance. 

## Platforms
[block:parameters]
{
  "data": {
    "h-0": "Platform",
    "h-1": "Subscriptions",
    "h-2": "Non-subscriptions",
    "0-0": "Apple",
    "0-1": "✅ RevenueCat will automatically detect when a refund has been issued by Apple, but Apple does not allow developers to issue refunds on behalf of customers\n\nIf a customer requests a refund, you can direct them to the Apple support page: https://support.apple.com/en-us/HT204084",
    "0-2": "🚧  RevenueCat requires [Platform Server Notifications](doc:server-notifications) to be enabled in order to detect when a non-subscription refund has been issued by Apple. Apple does not allow developers to issue refunds on behalf of customers.\n\nIf a customer requests a refund, you can direct them to the Apple support page: https://support.apple.com/en-us/HT204084\n\nConsumable refunds are not currently detected in RevenueCat.",
    "1-0": "Google Play",
    "1-1": "🚧 Active Google Play subscriptions may be refunded directly through the RevenueCat dashboard. Click on the respective transaction event on the customer page and hit \"Refund\" in the upper right. [Documentation](https://docs.revenuecat.com/docs/customer-history#refunding-purchases) for reference.\n\nRefunds can also be granted programmatically through the RevenueCat [REST API](https://docs.revenuecat.com/reference#revoke-a-google-subscription). This will immediately revoke access to the Google subscription and issue a refund for the last purchase.\n\nIf a refund is granted by Google or initiated through the Google Play console, it **will not** be detected as a refund in RevenueCat and the subscription will remain active until the end of the current billing period.",
    "1-2": "🚧  Google Play non-subscriptions can be refunded directly through the RevenueCat dashboard or REST API (see refunding Google Play Subscriptions for more info on how to do this).\n\nIf a non-subscription refund is granted by Google or initiated through the Google Play console, it **will not** be detected as a refund in RevenueCat, and the purchase will remain active.",
    "2-0": "Stripe",
    "2-1": "✅ RevenueCat will automatically detect when a refund has been issued through Stripe. Note that you have the option in Stripe to refund, or refund and revoke access. See Stripe's docs for more info.",
    "2-2": "✅ RevenueCat will automatically detect when a refund has been issued through Stripe. Note that you have the option in Stripe to refund, or refund and revoke access. See Stripe's docs for more info.",
    "3-0": "Amazon",
    "3-1": "❌ Amazon does not allow developers to issue refunds on behalf of users. \n\nIf a user has a valid reason for a pro-rated refund, they should contact Amazon customer service through the Contact Us link at [amazon.com](https://amazon.com).\n\nRefunds granted through Amazon customer service **will not** be detected as a refund in RevenueCat and the subscription will remain active until the end of the current billing period.",
    "3-2": "❌ Amazon does not allow developers to issue refunds on behalf of users. \n\nIf a user has a valid reason for a pro-rated refund, they should contact Amazon customer service through the Contact Us link at [amazon.com](https://amazon.com).\n\nRefunds granted through Amazon customer service **will not** be detected as a refund in RevenueCat, and the purchase will remain active."
  },
  "cols": 3,
  "rows": 4
}
[/block]
## RevenueCat Dashboard

**Android** purchases can be refunded directly through the RevenueCat dashboard. Granting a refund will immediately expire the subscription and remove any entitlement access. By refunding directly through RevenueCat you can ensure that refunds are accounted for in all charts and integrations.

Apple doesn’t allow developers to grant refunds themselves, only through Apple customer support. However, Apple refunds are tracked with RevenueCat and accounted for in all charts and integrations.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/9def41e-app.revenuecat.com_activity_270f6f8f_event_909c784d-ba27-4e33-8e7c-020e4db714ef_2.png",
        "app.revenuecat.com_activity_270f6f8f_event_909c784d-ba27-4e33-8e7c-020e4db714ef (2).png",
        1232,
        223,
        "#000000"
      ]
    }
  ]
}
[/block]
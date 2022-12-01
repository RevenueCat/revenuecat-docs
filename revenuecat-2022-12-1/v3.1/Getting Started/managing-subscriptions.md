---
title: "Managing Subscriptions"
slug: "managing-subscriptions"
excerpt: "Making changes to a customer's subscription"
hidden: false
metadata: 
  title: "Managing Subscriptions - RevenueCat"
  description: "Some parts of a customer's subscription can be managed directly through RevenueCat, other parts can only be managed by the customer directly in Apple / Google."
  image: 
    0: "https://files.readme.io/bed1058-OG_image.png"
    1: "OG image.png"
    2: 1200
    3: 627
    4: "#e9acb0"
createdAt: "2021-01-15T19:53:13.255Z"
updatedAt: "2021-06-18T00:00:04.881Z"
---
Some parts of a customer's subscription can be managed directly through RevenueCat, other parts can only be managed by the customer directly in Apple / Google. Learn how to upgrade/downgrade, cancel, and refund subscriptions here! 

For information about Stripe, you can read more about working with web payments [here](doc:stripe#working-with-web-payments).

# Upgrade or Downgrade a Subscription
[block:callout]
{
  "type": "info",
  "body": "The app stores do not allow developers (you) to upgrade or downgrade a subscription on behalf of a customer. Only a customer can change their subscription.",
  "title": "Developers cannot change a customer's subscription directly"
}
[/block]
## iOS
There are no code changes required to support upgrades, downgrades, and crossgrades for iOS subscriptions in your app. A customer can choose to upgrade, downgrade, or crossgrade between subscriptions as often as they like. 

According to [Apple](https://developer.apple.com/app-store/subscriptions#ranking), when a customer changes their subscription level, access to the new product can vary depending on the change:
>**Upgrade**. A user purchases a subscription that offers a higher level of service than their current subscription. They are immediately upgraded and receive a refund of the prorated amount of their original subscription. If you’d like users to immediately access more content or features, rank the subscription higher to make it an upgrade.

>**Downgrade**. A user selects a subscription that offers a lower level of service than their current subscription. The subscription continues until the next renewal date, then is renewed at the lower level and price.

>**Crossgrade**. A user switches to a new subscription of the equivalent level. If the subscriptions are the same duration, the new subscription begins immediately. If the durations are different, the new subscription goes into effect at the next renewal date.

You can refer to this [blog post](https://www.revenuecat.com/blog/ios-subscription-groups-explained) for more information on how to set up subscription groups in App Store Connect.

## Android
In order to perform upgrades and downgrades for Android subscriptions, you need to pass the [`UpgradeInfo`](https://sdk.revenuecat.com/android/purchases/com.revenuecat.purchases/-upgrade-info/index.html) object to either [`purchaseProduct`](https://sdk.revenuecat.com/android/purchases/com.revenuecat.purchases/-purchases/purchase-product.html) or [`purchasePackage`](https://sdk.revenuecat.com/android/purchases/com.revenuecat.purchases/-purchases/purchase-package.html). The `UpgradeInfo` is a small object containing the `oldSKU` (the SKU the user is changing from) and the `prorationMode`. Proration modes are documented [here](https://developer.android.com/reference/com/android/billingclient/api/BillingFlowParams.ProrationMode).
[block:callout]
{
  "type": "info",
  "title": "Supported proration modes",
  "body": "RevenueCat currently only supports `IMMEDIATE_WITH_TIME_PRORATION`. This mode changes the subscription immediately and the remaining time will be prorated."
}
[/block]
## Considerations
### [PRODUCT_CHANGE](doc:customer-history#event-types) events and webhooks
Note that `expiration_at_ms` will always be for the product the customer is changing from (old product). You will also see a `RENEWAL` event trigger when the new iOS subscription is in effect, an `INITIAL_PURCHASE` would trigger for Android instead. When this triggers may vary for App Store subscriptions depending on if the product change is an upgrade, downgrade, or crossgrade.

### Prorations
#### iOS
Due to some limitations, prorated revenue will not be calculated in the customer page. However, prorated revenue will be calculated for your chart and overview data.

#### Android
RevenueCat assumes the default proration mode, `IMMEDIATE_WITH_TIME_PRORATION`, for all pricing calculations. This mode will take effect immediately, and the new expiration time will be prorated and credited or charged to the user.

If you choose a different proration mode, the subscription status will be reflected correctly but the RevenueCat price calculation will be off.

# Cancel a Subscription

## iOS
Apple does not allow developers to manage subscriptions on behalf of users. Your customers have to manually opt-out of renewal. The [Apple subscription terms](https://support.apple.com/en-us/HT202039) require users to cancel subscriptions at least 24 hours before the next renewal.

## Android
To revoke an Android subscription, you can use our REST API [endpoint](https://docs.revenuecat.com/reference#revoke-a-google-subscription) to do so. This will refund the last purchase, immediately expire the subscription, and remove entitlement access. This can also be done from the dashboard (see 'Refund a Subscription' below for more details).
[block:callout]
{
  "type": "warning",
  "title": "Deleting a User",
  "body": "Deleting a user from RevenueCat **WILL NOT** cancel their subscription. The user can still trigger the [Restore Purchases](doc:making-purchases#restoring-purchases) method to re-sync their transactions with RevenueCat servers."
}
[/block]
# Refund a Subscription

Refunds are issued differently depending if a subscriber purchased through the App Store or the Play Store.

## App Store
Apple does not allow developers to issue refunds on behalf of users. Customers will need to contact Apple customer support directly for a refund. RevenueCat will automatically detect when a refund has been issued by Apple.

If a user requests a refund, you can direct them to the Apple support page: https://support.apple.com/en-us/HT204084

## Play Store
There are multiple ways to refund a customer that purchased through the Play Store:

- **(recommended)** Active Android subscriptions may be refunded directly through the RevenueCat dashboard. Click on the respective transaction event on the customer page and hit "Refund" in the upper right. [Documentation](https://docs.revenuecat.com/docs/customer-history#refunding-purchases) for reference.
- Refunds can also be granted programmatically through the RevenueCat [REST API](https://docs.revenuecat.com/reference#revoke-a-google-subscription). This will immediately revoke access to the Google subscription and issue a refund for the last purchase.
- It's also possible to refund users directly through the Google Play console. This is **not recommended** since RevenueCat cannot track refunds initiated through the Google Play console. 

We recommend granting a refund directly through RevenueCat to keep chart data consistent. Note that refunding a subscription through RevenueCat would also revoke access.
---
title: Upgrades, Downgrades, & Management
slug: managing-subscriptions
excerpt: Making changes to a customer's subscription
hidden: false
metadata:
  title: Managing Subscriptions - RevenueCat
  description: Some parts of a customer's subscription can be managed directly through
    RevenueCat, other parts can only be managed by the customer directly in Apple
    / Google.
  image:
    0: https://files.readme.io/a28a3d4-RevenueCat_Docs_OG.png
    1: RevenueCat Docs OG.png
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: '2021-01-15T19:53:13.255Z'
updatedAt: '2022-11-16T22:45:46.178Z'
category: 640a7bf19a17e2000b581d4c
---
Some parts of a customer's subscription can be managed directly through RevenueCat, other parts can only be managed by the customer directly in the respective stores (Apple, Google, Stripe, and Amazon). Learn how to upgrade/downgrade, cancel, and refund subscriptions here! 

For information about Stripe, you can read more about working with web payments [here](doc:stripe#working-with-web-payments).

# Upgrade or Downgrade a Subscription
[block:callout]
{
  "type": "info",
  "body": "The app stores do not allow developers (you) to upgrade or downgrade a subscription on behalf of a customer. Only a customer can change their subscription.",
  "title": "Developers cannot change a customer's subscription directly"
}
[/block]
## App Store
There are no code changes required to support upgrades, downgrades, and crossgrades for iOS subscriptions in your app. A customer can choose to upgrade, downgrade, or crossgrade between subscriptions as often as they like. 

According to [Apple](https://developer.apple.com/app-store/subscriptions#ranking), when a customer changes their subscription level, access to the new product can vary depending on the change:
>**Upgrade**. A user purchases a subscription that offers a higher level of service than their current subscription. They are immediately upgraded and receive a refund of the prorated amount of their original subscription. If you’d like users to immediately access more content or features, rank the subscription higher to make it an upgrade.

>**Downgrade**. A user selects a subscription that offers a lower level of service than their current subscription. The subscription continues until the next renewal date, then is renewed at the lower level and price.

>**Crossgrade**. A user switches to a new subscription of the equivalent level. If the subscriptions are the same duration, the new subscription begins immediately. If the durations are different, the new subscription goes into effect at the next renewal date.

You can refer to this [blog post](https://www.revenuecat.com/blog/ios-subscription-groups-explained) for more information on how to set up subscription groups in App Store Connect.
[block:callout]
{
  "type": "info",
  "title": "Upgrades during introductory periods",
  "body": "When a customer upgrades products during an introductory period (including a free trial), Apple does not cancel the introductory offer but instead keeps the introductory offer active in addition to the upgraded product. So in these cases you can expect two products in the same Subscription Group to be active simultaneously."
}
[/block]
## Google Play
In order to perform upgrades and downgrades for Google Play subscriptions, you need to pass the [`UpgradeInfo`](https://sdk.revenuecat.com/android/5.6.4/purchases/com.revenuecat.purchases/-upgrade-info/index.html) object to either [`purchaseProduct`](https://sdk.revenuecat.com/android/5.6.4/purchases/com.revenuecat.purchases/purchase-product-with.html) or [`purchasePackage`](https://sdk.revenuecat.com/android/5.6.4/purchases/com.revenuecat.purchases/purchase-package-with.html). The `UpgradeInfo` is a small object containing the `oldSKU` (the SKU the user is changing from) and the `prorationMode`. Proration modes are documented [here](https://developer.android.com/reference/com/android/billingclient/api/BillingFlowParams.ProrationMode).
[block:callout]
{
  "type": "info",
  "title": "Supported proration modes",
  "body": "RevenueCat currently only supports `IMMEDIATE_WITH_TIME_PRORATION`. This mode changes the subscription immediately and the remaining time will be prorated. Using alternate proration modes will work accurately for the customer subscription, but the pricing will not be correctly reflected in RevenueCat."
}
[/block]
## Amazon Appstore
Amazon does not support changing products. Customers will need to cancel their existing subscription and re-subscribe to a different product.

## Considerations
### [PRODUCT_CHANGE](doc:customer-history#event-types) events and webhooks
- The `expiration_at_ms` will always be for the product the customer is changing from (old product). 
- The `PRODUCT_CHANGE` webhook should be considered informative, and does not mean that the product change has gone into effect. When the product change goes into effect you will receive a `RENEWAL` event on Apple or a `INITIAL_PURCHASE` event on Google Play. 

# Prorations and Revenue Metrics
## App Store
For Apple transactions,  prorated revenue **will not** be shown in the [Customer History](doc:customer-history) page. However, prorated revenue **will** be calculated for your chart and overview data.

## Google Play
RevenueCat assumes the default proration mode, `IMMEDIATE_WITH_TIME_PRORATION`, for all pricing calculations. This mode will take effect immediately, and the new expiration time will be prorated and credited or charged to the user.

If you choose a different proration mode, the subscription status will be reflected correctly but the RevenueCat price calculation will be off.

# Cancelling Subscriptions

Cancelling (or unsubscribing) from subscriptions is handled differently on each platform. Cancellations are automatically detected by RevenueCat within a few hours of occurring. This detection time can be increased to near real-time by enabling [Platform Server Notifications](doc:server-notifications).
[block:parameters]
{
  "data": {
    "h-0": "Store",
    "h-1": "Behavior",
    "0-0": "Apple",
    "0-1": "Apple does not allow developers to manage subscriptions on behalf of users. Your customers have to manually opt-out of renewal. The [Apple subscription terms](https://support.apple.com/en-us/HT202039) require users to cancel subscriptions at least 24 hours before the next renewal.",
    "1-0": "Google Play",
    "1-1": "Google allows developers to cancel subscriptions on behalf of customers via Google Play Console or Google's API. \n\nIf you're looking to refund and revoke a subscription via RevenueCat's dashboard, see [Refunds](doc:refunds).",
    "3-0": "Amazon",
    "3-1": "Amazon does not allow developers to cancel subscriptions on behalf of users. Once a subscription is purchased for a period, it is valid through that period and cannot be cancelled.",
    "2-0": "Stripe",
    "2-1": "Subscriptions can be cancelled on behalf of customers via the Stripe dashboard or REST API. Refer to Stripe documentation for more info."
  },
  "cols": 2,
  "rows": 4
}
[/block]
## Using the `managementURL` to Help Customers Cancel a Subscription

As of August 27, Google requires developers to allow customers to cancel a subscription within apps. You can do this by displaying a link in your app that takes the user directly to Google Play's subscription management screen where they can immediately cancel their subscription. RevenueCat helps you do this by providing a `managementURL` property on the CustomerInfo object in the SDK and in our [REST API](https://docs.revenuecat.com/reference/subscribers#the-subscriber-object).
[block:callout]
{
  "type": "info",
  "title": "Include the `managementURL` on iOS",
  "body": "The `managementURL` is a great way to allow customers to check the status of and manage their subscriptions on both iOS and Android. RevenueCat will automatically provide your app with the correct `managementURL` based on the platform of the customer's device and original store they purchased their subscription from."
}
[/block]

[block:callout]
{
  "type": "danger",
  "title": "`managementURL` is not supported on Amazon"
}
[/block]

```swift
Purchases.shared.getCustomerInfo { (customerInfo, error) in
    let managementURL = customerInfo.managementURL
    // display the managementURL in your app
}
```
```kotlin
Purchases.sharedInstance.getCustomerInfo({ error -> /* Optional error handling */ }) { customerInfo ->
    val managementURL = customerInfo.managementURL
    // display the managementURL in your app
}
```

[block:callout]
{
  "type": "warning",
  "title": "Deleting a User",
  "body": "Deleting a user from RevenueCat **WILL NOT** cancel their subscription. The user can still trigger the [Restore Purchases](doc:making-purchases#restoring-purchases) method to re-sync their transactions with RevenueCat servers."
}
[/block]
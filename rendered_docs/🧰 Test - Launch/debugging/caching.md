---
title: Caching
slug: caching
excerpt: How caching works with RevenueCat
hidden: false
createdAt: '2023-05-15T18:35:31.067Z'
updatedAt: '2023-06-16T16:20:44.891Z'
category: 648c78a4ec91de0019fd4f76
order: 0
parentDoc: 648c7ee83ccbe61ab66dce23
---
RevenueCat caches data in several places to improve performance. This includes the Dashboard’s Overview, Customer Lists, and the SDK’s CustomerInfo object.

# Dashboard

In the Overview, the data is usually not cached and these subscription metrics will be updated in real-time. New Customer and Active Users may be cached for 1-2 hours. For some larger customers, subscription metrics may be cached for 1-2 hours as well.

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/94582cb-small-Untitled.png",
        null,
        ""
      ],
      "align": "center"
    }
  ]
}
[/block]

In each metric, you can hover over the circle icon in the bottom right corner of the card to see how recently the data within that card has been updated.

In Customer Lists, the data will always cache and refresh every two hours.

# SDK

The SDK will cache in several places.  

## App User Id

A user’s app user id is cached on the device, so this value will persist between app launches.

## CustomerInfo

The latest `CustomerInfo` is automatically fetched and cached when the _Purchases SDK_ is configured and throughout the lifecycle of your app, so in most cases the `getCustomerInfo()` method will return synchronously. It is safe to call `getCustomerInfo()`  as often as needed and is a good idea to call it any time a user accesses premium content.

The SDK will update the cache if it's older than 5 minutes, but only if you call `getCustomerInfo()`, make a purchase, or restore purchases. The cache will also be updated in the background when the app restarts even if the cache is not older than 5 minutes, as well as on the app foreground after 5 minutes has passed. These background updates can be listened to with the `CustomerInfo` listener. See here for information on the [CustomerInfo's fetchPolicy](https://revenuecat.github.io/purchases-ios-docs/4.19.0/documentation/revenuecat/purchases/customerinfo(fetchpolicy:)/).

The SDK caches this subscription information to reduce your app's reliance on the network, and as such users who unlock entitlements will be able to access them even without an internet connection.  The cache's default behavior is `cachedOrFetched`, which is that the SDK returns the cached data if available (even if stale), or fetches up-to-date data. See here for information on the [SDK's fetchPolicy](https://revenuecat.github.io/purchases-ios-docs/4.19.0/documentation/revenuecat/cachefetchpolicy/).

Note that calling `logOut` clears the cache.

## Debug Logs

The RevenueCat SDK’s debug logs will tell you if cached data is being fetched.

> [Purchases] - DEBUG: Vending customerInfo from cache

## Products

Products are automatically fetched and cached when the _Purchases SDK_ is configured, so in most cases the `getOfferings()` method will return synchronously. For this reason, it's safe to call `getOfferings()` as often as needed, knowing it will read from the cache without a network call.

These will be cached if nothing has changed in them since the last call to `getOfferings()`, or after 5 minutes. 

# FAQ

### Does data cache between app launches?

The `app_user_id` and `CustomerInfo` are cached between app launches. 

### How does the cache work if the user is offline?

The `app_user_id` and `CustomerInfo` are cached. `CustomerInfo` will be returned while offline forever if the user never goes online, unless something happens that invalidates the cache. Currently`offerings` do not persist between app launches, so you will need to cache this data and display them yourself when the app is offline. 

### When to use invalidateCustomerInfoCache()?

You should use this method to invalidate the current cache if you want to force the SDK to fetch the data again.

### What happens if the user leaves the app open in the background?

If the app is in production, the app in background will refresh after 24-25 hours.
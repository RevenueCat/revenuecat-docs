---
title: "[DRAFT] Caching"
slug: draft-caching
excerpt: Working with the cache
hidden: true
createdAt: '2020-04-14T01:50:29.653Z'
updatedAt: '2023-01-10T19:11:23.625Z'
---
The Purchases SDK caches the user's subscription information, products, packages, offerings, and entitlements to make sure your app works in the event of a network outage.

* cache is refreshed if it's older than 5 minutes when you access the purchaserInfo
* you can call getPurchaserInfo as many times as needed
* if you need to invalidate the cache you can use invalidatePurchaserInfoCache
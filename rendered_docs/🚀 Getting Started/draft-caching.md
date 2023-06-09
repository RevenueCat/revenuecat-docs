---
title: "[DRAFT] Caching"
slug: draft-caching
excerpt: Working with the cache
hidden: true
createdAt: '2020-04-14T01:50:29.653Z'
updatedAt: '2023-06-09T17:19:44.213Z'
category: 6483560b2e0a290051a971d8
order: 15
---
The Purchases SDK caches the user's subscription information, products, packages, offerings, and entitlements to make sure your app works in the event of a network outage.

* cache is refreshed if it's older than 5 minutes when you access the purchaserInfo
* you can call getPurchaserInfo as many times as needed
* if you need to invalidate the cache you can use invalidatePurchaserInfoCache
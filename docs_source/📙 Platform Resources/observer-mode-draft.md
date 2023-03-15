---
title: "[DRAFT] Observer Mode"
slug: observer-mode-draft
excerpt: Using RevenueCat without changing existing purchase code
hidden: true
createdAt: '2022-05-18T16:50:15.163Z'
updatedAt: '2022-05-31T21:57:04.294Z'
category: 640a7bf336aa500154bfceee
---
Observer Mode enables you to migrate your existing subscribers to RevenueCat while retaining your existing code for fetching products, making purchases, and checking subscription status. This allows you to access to the advanced charting, webhooks, and integrations that RevenueCat provides as quickly as possible and with minimal engineering effort.

Observer Mode may be set up as part of your migration strategy to RevenueCat, or as a permanent solution. Use the table below to compare what features become available with Observer Mode vs. a full RevenueCat SDK integration.
[block:parameters]
{
  "data": {
    "h-0": "Feature",
    "h-1": "Observer Mode",
    "h-2": "Full Integration",
    "5-0": "Fetching Products",
    "0-0": "Charts",
    "1-0": "Webhooks & Integrations",
    "2-0": "Data Exports",
    "3-0": "Customer Lists",
    "0-1": "✅ *",
    "3-1": "✅ *",
    "1-1": "✅",
    "2-1": "✅",
    "6-0": "Making Purchases",
    "7-0": "Checking Subscription Status",
    "0-2": "✅",
    "1-2": "✅",
    "2-2": "✅",
    "3-2": "✅",
    "5-2": "✅",
    "6-2": "✅",
    "7-2": "✅",
    "5-1": "❌",
    "6-1": "❌",
    "7-1": "❌",
    "4-0": "Experiments",
    "4-1": "❌",
    "4-2": "✅"
  },
  "cols": 3,
  "rows": 8
}
[/block]
**information based around the "last seen time" and "country" may not be complete in Observer Mode*

#Implementation

Observer Mode can be implemented server-side via REST APIs or client-side through the RevenueCat SDK. You should only implement Observer Mode one way or the other. 

#Option 1: Server-side
[block:parameters]
{
  "data": {
    "h-0": "Pros",
    "h-1": "Cons",
    "0-0": "✅ No client-side code changes",
    "1-0": "✅ Captures purchases from any app version",
    "0-1": "❌ The \"last seen\" attribute will be missing from customers since they are never \"seen\" by the client",
    "1-1": ""
  },
  "cols": 2,
  "rows": 2
}
[/block]
If you're already sending receipts to your server, you can enable Observer Mode by forwarding the receipts along to RevenueCat then processing them as you normally do.

With this option, you should already have a process in place for validating receipts on your server. When you receive a receipt, you can forward it to RevenueCat via the [POST /receipts endpoint](https://docs.revenuecat.com/reference/receipts) then have your server continue doing whatever it is already. 

Don't worry about validating the receipt before forwarding to RevenueCat - we always validate receipts with the stores before saving them.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/8bfe65a-Screen_Shot_2022-05-31_at_2.29.22_PM.png",
        "Screen Shot 2022-05-31 at 2.29.22 PM.png",
        1035,
        696,
        "#cedddf"
      ]
    }
  ]
}
[/block]
## Requirements
The requirements for server-side Observer Mode are the same as those for the  [POST /receipts endpoint](https://docs.revenuecat.com/reference/receipts). This includes:
- `app_user_id`
- `fetch_token`
- `price`
- `currency`
- `product_id`

While **price**, **currency**, and **product_id** are not required parameters for the API, they're highly recommended for Observer Mode to get value out of the integration - without providing this info RevenueCat will not have any price information.

If you're not already sending **price** and **currency** to your server there are two options:
1. Update your client-side code to start sending price and currency to your server. However, at this point a client-side Observer Mode setup may be simpler.
2. Hardcode a mapping of product IDs to their corresponding USD currency on your server. While this system isn't perfect as it won't account for country specific pricing and currency conversion rates, it may be a suitable approximation.
[block:callout]
{
  "type": "warning",
  "title": "Complete Apple base64 receipt file required",
  "body": "Observer Mode requires the raw base64 encoded Apple receipt as the `fetch_token`. Partial receipts or the receipt information from the Apple server-to-server notifications is insufficient."
}
[/block]
#Option 2: Client-side
[block:parameters]
{
  "data": {
    "h-0": "Pros",
    "h-1": "Cons",
    "0-1": "❌ Only captures purchases from latest app version",
    "0-0": "✅ No server-side code changes"
  },
  "cols": 2,
  "rows": 1
}
[/block]
If you're not saving receipts already on your server, or have limited backend resources available, a client-side Observer Mode implementation is often the best path. Implementation is no more than a couple lines

## Requirements

**Android**
Google Play Billing Library: 2.0+ (Android only)

**iOS**
No special requirements

**Amazon**
❌ Not supported with client-side Observer Mode

## 1. Configure the SDK
[block:file]
swift->code_blocks/📙 Platform Resources/observer-mode-draft_1.swift
objectivec->code_blocks/📙 Platform Resources/observer-mode-draft_1.m
kotlin->code_blocks/📙 Platform Resources/observer-mode-draft_1.kt
java->code_blocks/📙 Platform Resources/observer-mode-draft_1.java
javascript->code_blocks/📙 Platform Resources/observer-mode-draft_1.js
text->code_blocks/📙 Platform Resources/observer-mode-draft_1.txt
[/block]
### Enable Observer Mode in Unity configuration (Unity Only)
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/399c9ad-Screen_Shot_2019-05-31_at_12.07.34_PM.png",
        "Screen Shot 2019-05-31 at 12.07.34 PM.png",
        482,
        388,
        "#b9b9b9"
      ],
      "sizing": "smart"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "warning",
  "title": "Important note regarding InAppBillingService (Android Unity only)",
  "body": "If using RevenueCat alongside Unity IAP or other plugin that includes the Android InAppBillingService class, follow [these instructions :fa-arrow-right:](doc:unity#installation-with-unity-iap-side-by-side)"
}
[/block]
##2. Sync purchases with RevenueCat (Android only)

On Android (including cross-platform SDKs running on Android), any time a purchase or restore occurs in your app you should call the `syncPurchases` method to record it in RevenueCat. **Failure to do so will result in no purchases being recorded**.
[block:file]
kotlin->code_blocks/📙 Platform Resources/observer-mode-draft_2.kt
java->code_blocks/📙 Platform Resources/observer-mode-draft_2.java
javascript->code_blocks/📙 Platform Resources/observer-mode-draft_2.js
[/block]

[block:callout]
{
  "type": "danger",
  "body": "On Android, RevenueCat **will not** consume or acknowledge any purchase in Observer Mode so be sure your app is handling that. **Failure to do so will result in your purchases being refunded after 3 days.**",
  "title": "Important (Android only)"
}
[/block]
# Configuring Integrations
Certain integrations, such as most of the [Attribution Integrations](https://docs.revenuecat.com/docs/attribution), require some device data to work properly. **Observer Mode does not automatically collect any device data**.

If you plan on using an integration that requires device data with Observer Mode, you'll need to integrate the RevenueCat SDK to collect the data or set the appropriate attributes via the [REST API](https://docs.revenuecat.com/reference/update-subscriber-attributes). Note that attributes can be passed as an object in the [POST /receipts endpoint](https://docs.revenuecat.com/reference/receipts) as well if you're doing a server-side Observer Mode implementation.

#Next Steps

* With Observer Mode up-and-running capturing new purchases, you may want to [migrate existing purchases to RevenueCat as well :fa-arrow-right:](doc:migrating-existing-subscriptions)
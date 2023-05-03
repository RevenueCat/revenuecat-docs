---
title: Making Purchases
slug: making-purchases
excerpt: Process a transaction with Apple or Google
hidden: false
metadata:
  title: Making in-app purchases using the SDK – RevenueCat
  description: When it comes time to make a purchase, Purchases SDK has a simple method,
    `purchasePackage`, that takes a package from the fetched Offering and purchases
    the underlying product with Apple or Google.
  image:
    0: https://files.readme.io/222c22e-RevenueCat_Docs_OG.png
    1: RevenueCat Docs OG.png
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: '2023-03-28T08:06:18.490Z'
updatedAt: '2023-03-28T08:06:18.490Z'
category: 64515c38a0f5ef001898dfd8
---
The SDK has a simple method, `purchase(package:)`, that takes a package from the fetched Offering and purchases the underlying product with Apple, Google, or Amazon. 
[block:file]
swift->code_blocks/🚀 Getting Started/making-purchases_1.swift
objectivec->code_blocks/🚀 Getting Started/making-purchases_1.m
kotlin->code_blocks/🚀 Getting Started/making-purchases_1.kt
java->code_blocks/🚀 Getting Started/making-purchases_1.java
javascript->code_blocks/🚀 Getting Started/making-purchases_1.js
csharp->code_blocks/🚀 Getting Started/making-purchases_1.cs
[/block]
The `purchase(package:)` completion block will contain an updated [CustomerInfo](doc:purchaserinfo) object if successful, along with some details about the transaction.

If the `error `object is present, then the purchase failed. See our guide on [Error Handling](doc:errors) for the specific error types.

The `userCancelled` boolean is a helper for handling user cancellation errors. There will still be an error object if the user cancels, but you can optionally check the boolean instead of unwrapping the error completely. 
[block:callout]
{
  "type": "warning",
  "title": "Warning: Automatic Transaction Finishing/Acknowledgement/Consumption",
  "body": "Transactions (new and previous transactions that are synced) will be automatically finished (acknowledged and consumed in Android), and will be made available through the RevenueCat SDK / Dashboard / ETL Exports. \n\nYou can use [observer mode](https://docs.revenuecat.com/docs/observer-mode) if you don't wish to have transactions finished (or consumed, in Android) automatically, but you will have to make sure that you finish/consume them yourself."
}
[/block]

[block:api-header]
{
  "title": "Next Steps"
}
[/block]
* Don't forget to provide some way for customers to [restore their purchases :fa-arrow-right:](doc:restoring-purchases)
* With purchases coming through, make sure they're [linked to the correct user Id :fa-arrow-right:](doc:user-ids)
* If you're ready to test, start with our guides on [sandbox testing :fa-arrow-right:](doc:sandbox)
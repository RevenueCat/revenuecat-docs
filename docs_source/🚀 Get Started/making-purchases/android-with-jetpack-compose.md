---
title: Android with Jetpack Compose
slug: android-with-jetpack-compose
excerpt: Process a transaction with an Android app built with Jetpack Compose
hidden: false
createdAt: '2022-12-05T12:43:33.896Z'
updatedAt: '2022-12-05T19:42:28.432Z'
category: 640a7bef79274d00428d102b
---
Jetpack Compose is a new modern toolkit for building native UI for Android. One major difference in Jetpack Compose is the absence of `Activity`.  The `purchasePackage()` and `purchasePackageWith()` functions accept an `Activity` as the first parameter but an `Activity` is not easily accessible in a `@Composable` function.

To get around this, you can create an extension function to recursively find the nearest `Activity` from your Jetpack Compose context.
[block:code]
{
  "codes": [
    {
      "code": "fun Context.findActivity(): Activity? = when (this) {\n    is Activity -> this\n    is ContextWrapper -> baseContext.findActivity()\n    else -> null\n}",
      "language": "kotlin"
    }
  ]
}
[/block]
So example below shows how to check the nullable `Activity?` returned by `LocalContext.current.findActivity()` and pass it into `purchase(package:)`.
[block:code]
{
  "codes": [
    {
      "code": "LocalContext.current.findActivity()?.let { activity ->\n\tPurchases.sharedInstance.purchasePackage( \n\t\tactivity,\n\t\taPackage,\n\t\tonError = { error, userCancelled -> /* No purchase */ },\n\t\tonSuccess = { product, customerInfo ->\n\t\t\tif (customerInfo.entitlements[\"my_entitlement_identifier\"]?.isActive == true) {\n\t\t\t\t// Unlock that great \"pro\" content\n\t\t\t}\n\t})\n}",
      "language": "kotlin"
    }
  ]
}
[/block]
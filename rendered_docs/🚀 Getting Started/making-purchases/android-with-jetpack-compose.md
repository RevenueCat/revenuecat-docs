---
title: Android with Jetpack Compose
slug: android-with-jetpack-compose
excerpt: Process a transaction with an Android app built with Jetpack Compose
hidden: false
createdAt: '2022-12-05T12:43:33.896Z'
updatedAt: '2023-06-09T17:19:46.367Z'
category: 6483560b2e0a290051a971d8
order: 0
parentDoc: 6483560b2e0a290051a972dd
---
Jetpack Compose is a new modern toolkit for building native UI for Android. One major difference in Jetpack Compose is the absence of `Activity`.  The `purchasePackage()` and `purchasePackageWith()` functions accept an `Activity` as the first parameter but an `Activity` is not easily accessible in a `@Composable` function.

To get around this, you can create an extension function to recursively find the nearest `Activity` from your Jetpack Compose context.
```kotlin 
fun Context.findActivity(): Activity? = when (this) {
    is Activity -> this
    is ContextWrapper -> baseContext.findActivity()
    else -> null
}
```

So example below shows how to check the nullable `Activity?` returned by `LocalContext.current.findActivity()` and pass it into `purchase(package:)`.
```kotlin 
LocalContext.current.findActivity()?.let { activity ->
	Purchases.sharedInstance.purchaseWith(
		PurchaseParams.Builder(this, aPackage).build(),
    onError = { error, userCancelled -> /* No purchase */ },
    onSuccess = { product, customerInfo ->
			if (customerInfo.entitlements["my_entitlement_identifier"]?.isActive == true) {
				// Unlock that great "pro" content
			}
    }
	)
}
```

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
[block:file]
kotlin->code_blocks/🚀 Get Started/making-purchases/android-with-jetpack-compose_1.kt
[/block]
So example below shows how to check the nullable `Activity?` returned by `LocalContext.current.findActivity()` and pass it into `purchase(package:)`.
[block:file]
kotlin->code_blocks/🚀 Get Started/making-purchases/android-with-jetpack-compose_2.kt
[/block]
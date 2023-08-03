---
title: Restoring Purchases
slug: restoring-purchases
excerpt: Re-sync purchased transactions from Apple, Google, or Amazon
hidden: false
---
Restoring purchases is a mechanism by which your user can restore their in-app purchases, reactivating any content that had previously been purchased **from the same store account** (Apple, Google, or Amazon).

It is recommended that all apps have some way for users to trigger the `restorePurchases` method, even if you require all customers to create accounts. 

[block:file]
[
  {
    "language": "swift",
    "name": "",
    "file": "code_blocks/🚀 Getting Started/restoring-purchases_1.swift"
  },
  {
    "language": "objectivec",
    "name": "",
    "file": "code_blocks/🚀 Getting Started/restoring-purchases_2.m"
  },
  {
    "language": "kotlin",
    "name": "",
    "file": "code_blocks/🚀 Getting Started/restoring-purchases_3.kt"
  },
  {
    "language": "java",
    "name": "",
    "file": "code_blocks/🚀 Getting Started/restoring-purchases_4.java"
  },
  {
    "language": "javascript",
    "name": "Flutter",
    "file": "code_blocks/🚀 Getting Started/restoring-purchases_5.js"
  },
  {
    "language": "javascript",
    "name": "React Native",
    "file": "code_blocks/🚀 Getting Started/restoring-purchases_6.js"
  },
  {
    "language": "javascript",
    "name": "Cordova",
    "file": "code_blocks/🚀 Getting Started/restoring-purchases_7.js"
  },
  {
    "language": "csharp",
    "name": "Unity",
    "file": "code_blocks/🚀 Getting Started/restoring-purchases_8.cs"
  }
]
[/block]



The `restorePurchases` method **should not** be triggered programmatically, since it may cause OS level sign-in prompts to appear, and should only be called from some user interaction (e.g. tapping a "Restore" button.)

> 🚧 Programmatically trigger a restore, by calling syncPurchases instead
> 
> If you are trying to restore a purchase programmatically, use `syncPurchases` instead. This will not cause OS level sign-in prompts to appear.

# Transferring purchases seen on multiple App User IDs

If an [App User ID](doc:user-ids) tries to restore transactions that are already associated with a different identified App User ID in RevenueCat, you can configure how RevenueCat should respond by changing the dropdown in **Project Settings > General** in the dashboard:

![](https://files.readme.io/0fd6ec3-image.png)

Note that the behavior set here will affect all apps under the project. Also note that **Share between App User IDs (legacy)** will only be available for legacy projects with this behavior already enabled, not new projects.

> 📘 Transfer behavior also applies to making purchases
> 
> The configured behavior will also apply if an identified App User ID [makes a new purchase](doc:making-purchases) and the device receipt is already associated with a different identified App User ID in RevenueCat.

> 📘 Transfer behavior only applies to purchases associated with an identified App User ID
> 
> The behavior selected in the dropdown only applies to purchases currently associated with an _identified_ App User IDs. If the purchase is currently associated with an anonymous App User ID, that App User ID will be aliased with the new App User ID instead (ie. the purchase is shared between the App User IDs).

## Transfer to new App User ID

**Default ✅**

The default behavior is to transfer purchases between identified App User IDs if needed. This ensures that the customer restoring gets access to any purchased content, but only one customer at a time can have access. For example, if UserA buys a subscription, then UserB logs into your app on the same device and restores transactions, UserB would now have access to the subscription and it would be revoked from UserA. 

If an identified App User ID restores and the owner of the receipt is anonymous, the anonymous identifiers will be merged (aliased) into the same customer profile in RevenueCat and treated as the same customer going forward. If an anonymous ID restores and the owner of the receipt is an identified App User ID, we will resort to the specified restore behavior and transfer the receipt to the anonymous user. And finally, if an anonymous ID restores and the owner of the receipt is also anonymous, the anonymous identifiers will be merged (aliased).

### Google Play on Android

Due to platform limitations, purchases will be transferred as soon as you call `configure` if a user's purchases are already associated with another app user ID.

This may cause unexpected transfers of purchases between app user IDs, especially for apps with optional logins or users with multiple devices. To prevent this behavior, you should wait to call `configure` until you have the appropriate app user ID for your customer.

## Transfer if there are no active subscriptions

This behavior will transfer the purchases to the new App User ID unless they contain an active subscription. This behavior is especially beneficial if you have strict business logic that associate subscriptions with a given App User ID, but you still want churned subscribers who might later return to your app with a new App User ID to start a new subscription. This is especially relevant on iOS, where a receipt contains all purchases associated with a given Apple ID, so in the case of using the behavior "Keep with original App User ID", the customer would be able to start a new subscription on the store, but they would not be able to gain access because RevenueCat would associate that new subscription with the original App User ID (since it is on the same Apple receipt).

Note that the presence of one-time (non-subscription) purchases does not prevent transfers from happening. 

## Keep with original App User ID

**Use with caution 🚧**

Returns an [error](doc:errors#-receipt_already_in_use) if the App User ID attempting to restore purchase or make a new purchase is different from the original App User ID that made the purchase. This requires customers to sign in with their original App User ID, and is only allowed for apps that require every customer to create an account before purchasing. 

## Share between App User IDs (legacy)

**Legacy ✅**

The legacy behavior is to merge (alias) any App User IDs that restore the same underlying subscription and treat them as the same subscriber moving forward. This applies to both anonymous and identified App user IDs. You can continue to use this legacy behavior as long as you'd like, **but you cannot re-enable the alias behavior if you switch to Transfer Purchases or Block Restores**.

## Example usage

| My app...                                                                                                                                                                  | Restore Behavior                                                                                                                                                                                                    |
| :------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Does not have any login mechanism and only relies on RevenueCat anonymous App User IDs.                                                                                    | **Transfer to new App User ID**. Required to allow customers to restore transactions after uninstalling / reinstalling your app.                                                                                    |
| Has an optional login mechanism and / or allows customers to purchase before creating an account in my app.                                                                | **Transfer to new App User ID**. Required to make sure customers that purchase without an account can restore transactions.                                                                                         |
| Requires all customers to create an account before purchasing.                                                                                                             | **Transfer to new App User ID**. Recommended to help customers restore transactions even if they forget previous account information.                                                                               |
| Requires all customers to create an account before purchasing, and has strict business logic that requires purchases to only ever be associated with a single App User ID. | **Keep with original App User ID**. Will make sure that transactions never get transferred between accounts. Your support team should be prepared to guide customers through an account recovery process if needed. |

# Syncing purchases without user interaction

`syncPurchases` is a method we provide in our SDK which allows you to programmatically trigger a restore. This method, much like restorePurchases, reactivates any content that had previously been purchased from the same store account (Apple, Google, or Amazon). 

## syncPurchases considerations

- `syncPurchases` is usually used for [migrating subscriptions](doc:migrating-existing-subscriptions)
- Since this method simulates restoring a purchase, there is a risk of transferring or aliasing an anonymous user

# Restoring Purchases for Consumables and Non-renewing Subscriptions

Consumables and non-renewing subscriptions cannot be restored without using an acounts system and logging in users. This is because these types of purchases do not show up on the receipt after its transaction is finished, so if you uninstall or try on a different device, the receipt will be considered a brand new one for a brand new user, with nothing on it (unless there are subscriptions or non-consumables on it).

If you want to use consumable and non-renewing subscription products with restore functionality, you would need to use an accounts system and only allowing purchases for logged in users. If not, then we recommend using non-consumable or subscription products instead. 

# Next Steps

- Make sure all purchases are being [linked to the correct user Id ](doc:user-ids)
- If you're ready to test, start with our guides on [sandbox testing ](doc:debugging)

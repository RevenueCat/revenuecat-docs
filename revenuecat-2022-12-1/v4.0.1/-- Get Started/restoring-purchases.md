---
title: "Restoring Purchases"
slug: "restoring-purchases"
excerpt: "Re-sync purchased transactions from Apple, Google, or Amazon"
hidden: false
metadata: 
  title: "Restoring In-App Purchases – RevenueCat"
  image: 
    0: "https://files.readme.io/e69acd8-RevenueCat_Docs_OG.png"
    1: "RevenueCat Docs OG.png"
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: "2021-04-28T16:33:56.375Z"
updatedAt: "2022-12-08T00:12:29.946Z"
---
Restoring purchases is a mechanism by which your user can restore their in-app purchases, reactivating any content that had previously been purchased **from the same store account** (Apple, Google, or Amazon).

It is recommended that all apps have some way for users to trigger the `restorePurchases` method, even if you require all customers to create accounts. 
[block:code]
{
  "codes": [
    {
      "code": "Purchases.shared.restorePurchases { customerInfo, error in\n    //... check customerInfo to see if entitlement is now active\n}",
      "language": "swift"
    },
    {
      "code": "[[RCPurchases sharedPurchases] restorePurchasesWithCompletion:^(RCCustomerInfo *customerInfo, NSError *error) {\n    //... check customerInfo to see if entitlement is now active\n}];",
      "language": "objectivec"
    },
    {
      "code": "Purchases.sharedInstance.restorePurchases(::showError) { customerInfo ->\n    //... check customerInfo to see if entitlement is now active\n}",
      "language": "kotlin"
    },
    {
      "code": "Purchases.getSharedInstance().restorePurchases(new ReceiveCustomerInfoCallback() {\n\t@Override\n\tpublic void onReceived(@android.support.annotation.Nullable CustomerInfo customerInfo, @android.support.annotation.Nullable PurchasesError error) {\n    //... check customerInfo to see if entitlement is now active \t\n  }\n});",
      "language": "java"
    },
    {
      "code": "try {\n  PurchaserInfo restoredInfo = await Purchases.restoreTransactions();\n  // ... check restored purchaserInfo to see if entitlement is now active\n} on PlatformException catch (e) {\n  // Error restoring purchases\n}",
      "language": "javascript",
      "name": "Flutter"
    },
    {
      "code": "try {\n  const restore = await Purchases.restorePurchases();\n  // ... check restored purchaserInfo to see if entitlement is now active\n} catch (e) {\n\n}",
      "language": "javascript",
      "name": "React Native"
    },
    {
      "code": "Purchases.restoreTransactions(\n  info => {\n    //... check customerInfo to see if entitlement is now active\n  },\n  error => {\n    // Error restoring purchases\n  }\n);",
      "language": "javascript",
      "name": "Cordova"
    },
    {
      "code": "var purchases = GetComponent<Purchases>();\npurchases.RestorePurchases((info, error) =>\n{\n    //... check purchaserInfo to see if entitlement is now active\n});",
      "language": "csharp",
      "name": "Unity"
    }
  ]
}
[/block]
The `restorePurchases` method **should not** be triggered programmatically, since it may cause OS level sign-in prompts to appear, and should only be called from some user interaction (e.g. tapping a "Restore" button.)

# Restore Behavior

If an identified [App User ID](doc:user-ids) tries to restore transactions that are already associated with a different identified App User ID in RevenueCat, you can configure how RevenueCat should respond by changing the Restore Behavior dropdown in **Project Settings > General** in the dashboard.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/c1c933f-Screen_Shot_2021-07-15_at_8.49.55_AM.png",
        "Screen Shot 2021-07-15 at 8.49.55 AM.png",
        509,
        177,
        "#f6f6f7"
      ]
    }
  ]
}
[/block]
Note that the restore behavior set here will affect all apps under the project. Also note that **Alias (legacy)** will only be available for legacy projects with Alias behavior already enabled, not new projects.
[block:callout]
{
  "type": "info",
  "title": "Restore behavior also applies to making purchases",
  "body": "The configured restore behavior will also apply if an identified App User ID [makes a new purchase](doc:making-purchases) and the device receipt is already associated with a different identified App User ID in RevenueCat."
}
[/block]
## Transfer Purchases
**Default ✅**

The default behavior is to transfer purchases between identified App User IDs if needed. This ensures that the customer restoring gets access to any purchased content, but only one customer at a time can have access. For example, if UserA buys a subscription, then UserB logs into your app on the same device and restores transactions, UserB would now have access to the subscription and it would be revoked from UserA. 


If an identified App User ID restores and the owner of the receipt is anonymous, the anonymous identifiers will be merged (aliased) into the same customer profile in RevenueCat and treated as the same customer going forward. If an anonymous ID restores and the owner of the receipt is an identified App User ID, we will resort to the specified restore behavior and transfer the receipt to the anonymous user. And finally, if an anonymous ID restores and the owner of the receipt is also anonymous, the anonymous identifiers will be merged (aliased).


### Google Play on Android

Due to platform limitations, purchases will be transferred as soon as you call `configure` if a user's purchases are already associated with another app user ID.

This may cause unexpected transfers of purchases between app user IDs, especially for apps with optional logins or users with multiple devices. To prevent this behavior, you should wait to call `configure` until you have the appropriate app user ID for your customer.


## Block Restores

**Use with caution 🚧**

Returns an [error](doc:errors#-receipt_already_in_use) if the App User ID attempting to restore purchases is different from the original App User ID that made the purchase. This requires customers to sign in with their original App User ID, and is only allowed for apps that require every customer to create an account before purchasing. 


## Alias
**Legacy ✅**

The legacy behavior is to merge (alias) any App User IDs that restore the same underlying subscription and treat them as the same subscriber moving forward. This applies to both anonymous and identified App user IDs. You can continue to use this legacy behavior as long as you'd like, **but you cannot re-enable the alias behavior if you switch to Transfer Purchases or Block Restores**.

## Example usage
[block:parameters]
{
  "data": {
    "h-0": "My app...",
    "h-1": "Restore Behavior",
    "h-2": "Description",
    "0-0": "Does not have any login mechanism and only relies on RevenueCat anonymous App User IDs.",
    "1-0": "Has an optional login mechanism and / or allows customers to purchase before creating an account in my app.",
    "0-1": "**Transfer purchases**. Required to allow customers to restore transactions after uninstalling / reinstalling your app.",
    "1-1": "**Transfer purchases**. Required to make sure customers that purchase without an account can restore transactions.",
    "0-2": "Transfer purchases between identified App User IDs, if needed. This is the default and recommended behavior which ensures that the customer restoring gets access to any purchased content but only one customer at a time can have access.",
    "1-2": "Returns an error if the App User ID attempting to restore purchases is different from the original App User ID that made the purchase. This requires customers to sign in with their original App User ID, and is only allowed for apps that require every customer to create an account before purchasing.",
    "2-0": "Requires all customers to create an account before purchasing.",
    "2-1": "**Transfer purchases**. Recommended to help customers restore transactions even if they forget previous account information.",
    "3-0": "Requires all customers to create an account before purchasing, and has strict business logic that requires purchases to only ever be associated with a single App User ID.",
    "3-1": "**Block restores**. Will make sure that transactions never get transferred between accounts. Your support team should be prepared to guide customers through an account recovery process if needed."
  },
  "cols": 2,
  "rows": 4
}
[/block]

# Next Steps
* Make sure all purchases are being [linked to the correct user Id :fa-arrow-right:](doc:user-ids)
* If you're ready to test, start with our guides on [sandbox testing :fa-arrow-right:](doc:debugging)
---
title: "App User IDs"
slug: "user-ids"
excerpt: "How RevenueCat handles user identity"
hidden: false
createdAt: "2018-06-11T23:32:40.260Z"
updatedAt: "2019-04-30T19:49:59.511Z"
---
[block:callout]
{
  "type": "success",
  "body": "This section assumes you've followed our [Quickstart](doc:getting-started-1) section of our Getting Started guide to install and configure our SDK."
}
[/block]
RevenueCat provides a source of truth for a subscriber's status across different platforms. To do this, each subscriber has an App User ID that uniquely identifies them within your application. 
[block:api-header]
{
  "title": "Anonymous App User ID"
}
[/block]
If you don't provide an App User ID when instantiating the Purchases SDK, RevenueCat will create a new random App User ID for you and cache it on the device. 

In the event that the user deletes and reinstalls the app, this random App User ID will be unrecoverable and a new random App User ID will be generated. Restoring in-app purchases will recover any subscriptions and [alias](doc:user-ids#section-restoring-purchases) the new and old random App User IDs together. 
[block:api-header]
{
  "title": "Provided App User ID"
}
[/block]
Setting your own App User ID will allow you to reference users in the RevenueCat dashboard, via the API, as well as in the [webhooks](doc:webhooks) and other integrations.

Using an externally managed App User ID also provides a mechanism by which to restore purchases in a few scenarios: 
* When a user deletes and reinstalls your app - using the same App User ID will ensure they still haves access to subscriptions previously started. 
* When the user logs in on multiple devices - you can honor a subscription that was purchased on one device across any other platform.

## Set App User ID on instantiation
If you have your own App User IDs, you can pass those on instantiation to *Purchases*.
[block:code]
{
  "codes": [
    {
      "code": "Purchases.configure(withAPIKey: \"my_api_key\", appUserID: \"my_app_user_id\")",
      "language": "swift"
    },
    {
      "code": "[RCPurchases configureWithAPIKey:@\"my_api_key\" appUserID:@\"my_app_user_id\"];",
      "language": "objectivec"
    },
    {
      "code": "Purchases.configure(this, \"my_api_key\", \"my_app_user_id\")",
      "language": "kotlin"
    },
    {
      "code": "Purchases.configure(this, \"my_api_key\", \"my_app_user_id\");",
      "language": "java"
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "Convert Anonymous User to Identifiable User"
}
[/block]
If you don't have an App User ID on instantiation, you can set it later. The most common cases are after registration, when a user switches from being an anonymous user (with a random App User ID) to an authenticated user with some ID, and before a returning user (with a random App User ID) is logged in.

There are two ways to convert an anonymous user to an identifiable user:

- `.identify()` - set the App User ID to a new user
- `createAlias()` - merge a new App User ID with the current subscriber

## Identify *Purchases* new a new user
Using `.identify()` will clear any caches and re-fetch info for the provided App User ID.

**The `.identify()` method should be used to log in existing users.** 
[block:code]
{
  "codes": [
    {
      "code": "Purchases.shared.identify(\"my_app_user_id\") { (purchaserInfo, error) in\n    \n    // purchaserInfo updated for my_app_user_id\n}",
      "language": "swift"
    },
    {
      "code": "[[RCPurchases sharedPurchases] identify:@\"my_app_user_id\" completionBlock:^(RCPurchaserInfo *purchaserInfo, NSError *error) {\n    \n    // New user set with purchaserInfo from my_app_user_id\n}];",
      "language": "objectivec"
    },
    {
      "code": "Purchases.sharedInstance.identifyWith(\"my_app_user_id\", ::showError) { purchaserInfo ->\n  // New user set with purchaserInfo from my_app_user_id\n}",
      "language": "kotlin"
    },
    {
      "code": "Purchases.getSharedInstance().identify(\"my_app_user_id\", new ReceivePurchaserInfoListener() {\n\t@Override\n\tpublic void onReceived(@android.support.annotation.Nullable PurchaserInfo purchaserInfo, @android.support.annotation.Nullable PurchasesError error) {\n\t\t// New user set with purchaserInfo from my_app_user_id\n\t}\n});",
      "language": "java"
    }
  ]
}
[/block]
## Creating Aliases
Aliases are a way for RevenueCat to attach multiple App User IDs to a single subscriber. This allows you to start identifying a user by a provided App User ID without changing the original random App User Id that was assigned by RevenueCat.

There are two ways that aliases are created:

* Calling `createAlias` manually
* Restoring purchases

### Manually Creating Aliases
Using `.createAlias()` will attach the current App User ID and the provided App User ID to the same subscriber record. This is most often used when an app is configured without a known App User ID and you need to set the App User ID later.

**The `.createAlias()` method should be used when a new user account is created after configuring *Purchases* with a random anonymous App User ID.** 
[block:code]
{
  "codes": [
    {
      "code": "Purchases.shared.createAlias(\"my_app_user_id\") { (purchaserInfo, error) in\n            \n    // my_app_user_id added as an alias for current user\n}",
      "language": "swift"
    },
    {
      "code": "[[RCPurchases sharedPurchases] createAlias:@\"my_app_user_id\" completionBlock:^(RCPurchaserInfo *purchaserInfo, NSError *error) {\n    \n    // my_app_user_id added as an alias for current user\n}];",
      "language": "objectivec"
    },
    {
      "code": "Purchases.sharedInstance.createAlias(\"my_app_user_id\", ::showError) { purchaserInfo ->\n  // my_app_user_id added as an alias for current user\n})",
      "language": "kotlin",
      "name": null
    },
    {
      "code": "Purchases.getSharedInstance().createAlias(\"my_app_user_id\", new ReceivePurchaserInfoListener() {\n  @Override\n  public void onReceived(@Nullable PurchaserInfo purchaserInfo, @Nullable PurchasesError error) {\n    // my_app_user_id added as an alias for current user\n  }\n});",
      "language": "java"
    }
  ]
}
[/block]
In practice, using the `.createAlias()` method usually looks something like the following:

1. User opens the app, `Purchases` is instantiated without an App User ID therefore generates a random App User ID
2. User creates an account later
3. Developer calls `createAlias(newAppUserID)` to link any previous purchases to newAppUserID in RevenueCat

Now the subscriber can be referenced in the Purchases SDK or the REST API by using the developer specified App User ID.


### Restoring Purchases
Restoring purchases is a mechanism by which your user can *restore* their in-app purchases, reactivating any content that had previously been purchased **from the same store account** (Apple or Google).

If two different App User IDs try to restore transactions from the same underlying store account (Apple or Google) RevenueCat will create an alias between the two App User IDs and count them as the same user going forward. 

This is a common if your app does not have accounts and is relying on RevenueCat's random App User IDs. 
[block:code]
{
  "codes": [
    {
      "code": "Purchases.shared.restoreTransactions { (purchaserInfo, error) in\n    //... check purchaserInfo to see if entitlement is now active\n}",
      "language": "swift"
    },
    {
      "code": "[[RCPurchases sharedPurchases] restoreTransactionsWithCompletionBlock:^(RCPurchaserInfo *purchaserInfo, NSError *error) {\n    //... check purchaserInfo to see if entitlement is now active\n}];",
      "language": "objectivec"
    },
    {
      "code": "Purchases.sharedInstance.restorePurchasesWith(::showError) { purchaserInfo ->\n    //... check purchaserInfo to see if entitlement is now active\n}",
      "language": "kotlin"
    },
    {
      "code": "Purchases.getSharedInstance().restorePurchases(new ReceivePurchaserInfoListener() {\n\t@Override\n\tpublic void onReceived(@android.support.annotation.Nullable PurchaserInfo purchaserInfo, @android.support.annotation.Nullable PurchasesError error) {\n    //... check purchaserInfo to see if entitlement is now active \t\n  }\n});",
      "language": "java"
    }
  ]
}
[/block]
#### Sharing Subscriptions Across Store Accounts

By default, RevenueCat will not let you reuse a subscription from an App or Play Store account that already has that subscription active. If you set `allowSharingAppStoreAccount = True` the SDK will be permissive in accepting shared accounts, creating aliases as needed. 

By default `allowSharingAppStoreAccount` is `True` for RevenueCat random App User IDs but must be enabled manually if you want to allow permissive sharing if you set your own App User IDs.

Calling `restoreTransactions` will always create aliases, even if `allowSharingAppStoreAccount` is `False`. If you have your own login system and always set the App User Id, your user authentication system should be used to restore purchases.
[block:api-header]
{
  "title": "Logging Out"
}
[/block]
When a user logs out you should call the `reset()` method on Purchases to reset the App User ID to a new generated App User ID. This sets you up with a new anonymous user for the logged out state.

[block:callout]
{
  "type": "info",
  "title": "Logging out will reset the account sharing preference",
  "body": "Calling `reset()` will set `allowSharingStoreAccount` to `True`, be sure to set this back if needed."
}
[/block]

[block:api-header]
{
  "title": "Tips for setting App User IDs"
}
[/block]
## App User IDs Should Not Be Guessable

RevenueCat provides subscription status via the public API, having App User IDs that are easily guessed is not good. It is recommended to use a non-guessable psuedo-random ID that isn't made public inside your app.

For App User IDs generated by RevenueCat, we use a UUID.

## Don't set emails as App User IDs

For the above reason, and GDPR compliance, we don't recommend using email addresses as App User IDs
[block:api-header]
{
  "title": "Next Steps"
}
[/block]
* If you're using Firebase, see our sample resource on [syncing Firebase User Ids with RevenueCat :fa-arrow-right:](doc:firebase)
* If you're moving to RevenueCat from another system, see our guide on [migrating your existing subscriptions :fa-arrow-right:](doc:migrating-existing-subscriptions)
* Once you're ready to test your integration, you can follow our guides on [testing and debugging :fa-arrow-right:](doc:debugging)
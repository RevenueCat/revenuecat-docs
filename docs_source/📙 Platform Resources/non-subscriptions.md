---
title: Non-Subscription Purchases
slug: non-subscriptions
excerpt: Using RevenueCat beyond subscriptions
hidden: false
metadata:
  title: Non-Subscription In-App Purchases – RevenueCat
  description: Although RevenueCat is commonly used to handle complex subscription
    logic, all types of purchases, including consumables, are tracked by the Purchases
    SDK. This makes it easy to use RevenueCat’s powerful revenue reporting features
    to track all of the purchases your app supports.
  image:
    0: https://files.readme.io/57d70c1-RevenueCat_Docs_OG.png
    1: RevenueCat Docs OG.png
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: '2020-06-04T17:15:44.078Z'
updatedAt: '2023-04-28T15:13:18.507Z'
category: 6465151a9d12de0fd4b5e835
---
Although RevenueCat is primarily used to handle subscription purchases, our SDK will track all purchases, including consumable and non-consumable in-app purchases (**IAPs**). This makes it easy to track your app's total revenue with RevenueCat's powerful reporting features.

# Types of Non-Subscription Purchases

**Consumable IAP**: a purchase that unlocks content that can be "consumed," for example coins or gems in a game.

**Non-consumable IAP**: a purchase that permanently unlocks content, for example unlocking a specific coloring book in a coloring app.

**Non-renewing subscription**: a purchase that unlocks content for a specific period of time. For example, unlocking access to a magazine for 1 month, after which the subscription will not be renewed.

# Platform Support

| Platform |                        Supported Purchase Types                       |
| :------: | :-------------------------------------------------------------------: |
|    iOS   |        Consumables, non-consumables, non-renewing subscriptions       |
|  Android |                Consumables, non-renewing subscriptions                |
|  Stripe  | One-time purchases supported when using [Stripe Checkout](doc:stripe) |

> 🚧 Google Play Store IAPs
> 
> Google Play Store does not provide an option to mark IAPs as consumable or non-consumable. RevenueCat's SDK will consume all Android IAPs upon purchase.
> 
> To replicate the behavior of a non-consumable IAP for Android users, you must ensure your user will not be offered the IAP after the initial purchase. Failure to do so will enable the user to re-purchase the IAP.

# Entitlements

Entitlements are used to unlock access to content after a user purchases a product. This means: if you add a consumable product to an entitlement, RevenueCat will report that entitlement as unlocked (forever), even after one purchase. This is because there is no expiration date for consumables, like there is for a subscription. This may work for some use-cases, but generally, you wouldn't add a consumable product to an entitlement meant to be unlocked by a subscription.

> 📘 
> 
> It's important to note that even if consumables aren't attached to an entitlement, they can still be purchased the same way as other offerings and packages. This will allow you to take advantage of RevenueCat's powerful revenue reporting features.

If you wanted to add a **Lifetime Unlock** purchase option to your app, it is recommended to create a new **non-consumable** IAP (iOS), add the product to your offering, and add the product to your entitlement. This works well in many contexts, such as alongside other subscription packages, or just as a standalone package in your offering. (See the above section to replicate a non-consumable IAP for Android users.)

For more information, read our guide on [Entitlements](https://docs.revenuecat.com/docs/entitlements).

# Offerings

Offerings are typically associated with different subscription options, but they can be used to display any kind of in-app purchase.

## Example

Let's say we are building a game where we can offer multiple coin packages. First, we need to create a new offering called "coins." Go to your project settings in the RevenueCat dashboard, select the **Offerings** tab under **Product Setup**, and select the **+ New** button to add a new offering.

![](https://files.readme.io/e7cd1c4-app.revenuecat.com_projects_85ff18c7_apps_app71b4cc0fea_1.png)

Great! Select **Add**, and we're on to setting up packages.

Each package should contain a different quantity of coins. For our example, let's assume we'll offer the following options: 100 coins, 250 coins, 600 coins, and 1400 coins. Go ahead and add those packages, and your offering page should now look like the following:

![](https://files.readme.io/0f1a9b6-app.revenuecat.com_projects_85ff18c7_apps_app71b4cc0fea_2.png)

> 📘 
> 
> If you haven't already, you'll need to set up products in the respective app stores on which you intend to ship your app. For more information on setting up products and adding them to RevenueCat, check out the [Configuring Products](https://docs.revenuecat.com/docs/entitlements#configuration) guide.

Attach your products to each package, and you're ready to use to Purchases SDK to display your offering. On iOS, you could fetch the offering like this:

```swift
Purchases.shared.getOfferings { (offerings, error) in
	if let coinOffering = offerings?["coins"] {
		let packages = coinOffering.availablePackages
		// `packages` should contain each coin package with an identifier like 'coins-100'
	}
}
```



For more information displaying products, check out the [Displaying Products](doc:displaying-products) guide.

When you're ready to purchase one of the coin packages, pass the package object to the Purchases SDK, like the following:

```swift
Purchases.shared.purchase(package: package) { (transaction, customerInfo, error, userCancelled)
	if let customerInfo = customerInfo, error == nil {
		// validate the purchase with your server, and display content
	}
}
```



> 🚧 
> 
> It's important to note that at the moment, logic for keeping track of consumable redemptions must be handled outside of RevenueCat. We recommend your server is set up to receive [Webhook](https://docs.revenuecat.com/docs/webhooks) events for `NON_RENEWING_PURCHASE` to appropriately provide consumable content for your users.
> 
> For example: RevenueCat can track a consumable coin purchase and include it in the `CustomerInfo`, but cannot track if you've granted a user the appropriate number of coins for that purchase.

For more information on making purchases, check out the [Making Purchases](doc:making-purchases) guide.

### Sales, alternative packages, and more

With this structure for Offerings, creating a sale offering is easy and can be accomplished in the same way as the above steps:

1. Create a new offering called **coins-sale**
2. Create new packages for the offering with appropriate coin identifiers
3. Create the sale IAPs in respective app stores
4. Fetch the new **coins-sale** offering from the SDK

## Conclusion

It's important to note that the above example is just that- an example. Your specific app may require a different implementation. This guide is meant as a way to understand the different ways you can use RevenueCat's powerful features for in-app purchases.
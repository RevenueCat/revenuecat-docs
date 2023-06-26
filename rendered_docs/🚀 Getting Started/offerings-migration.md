---
title: Offerings Migration Guide
slug: offerings-migration
excerpt: Migrating to Offerings from a legacy setup
hidden: true
categorySlug: documentation
order: 13
---
[block:embed]
{
  "html": "<iframe class=\"embedly-embed\" src=\"//cdn.embedly.com/widgets/media.html?src=https%3A%2F%2Fwww.youtube.com%2Fembed%2FDC2_ZcOfMwA%3Ffeature%3Doembed&url=http%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DDC2_ZcOfMwA&image=https%3A%2F%2Fi.ytimg.com%2Fvi%2FDC2_ZcOfMwA%2Fhqdefault.jpg&key=f2aa6fc3595946d0afc3d76cbbd25dc3&type=text%2Fhtml&schema=youtube\" width=\"854\" height=\"480\" scrolling=\"no\" frameborder=\"0\" allow=\"autoplay; fullscreen\" allowfullscreen=\"true\"></iframe>",
  "url": "https://www.youtube.com/watch?v=DC2_ZcOfMwA",
  "title": "New Offerings Migration",
  "favicon": "https://s.ytimg.com/yts/img/favicon-vfl8qSV2F.ico",
  "image": "https://i.ytimg.com/vi/DC2_ZcOfMwA/hqdefault.jpg"
}
[/block]
In order to make it easier to control and present products to end users remotely from the RevenueCat dashboard, we've released a new product setup called Offerings. Offerings replaces our [legacy setup](doc:legacy-entitlements) and allows more flexibility in presenting products to customers.

[Legacy offerings](doc:legacy-entitlements) will still be available for existing apps, and both systems can be used simultaneously during migration. However, there will be a forced migration at some point in the future.
[block:api-header]
{
  "title": "What's new?"
}
[/block]
There are a few major improvements over the legacy system.

## 1. No hardcoded strings
With new Offerings, you can now fully reference products without any hard coded strings. This will make your paywall code more robust and allow maximum configurability from the backend.
```swift 
func fetchOffering() {
    Purchases.shared.offerings { (offerings, error) in
        
        guard let offering = offerings?.current else {
            print("No current offering configured")
            return
        }
        
        for package in offering.availablePackages {
            print("Product: \(package.product.localizedDescription)")
            print("Type: \(package.packageType)")
            print("Price: \(package.localizedPriceString)")
        }
    }
}
```
The above code sample fetches the offerings from the server, unpacks the current Offering, and prints out the available packages. There's no need to hardcode any strings, making remote configuration a breeze.

##2. More configuration options
In the legacy system, an entitlement had many offerings, and each offering had one product per platform. Now, one offering can contain multiple different ways of purchasing. These new "ways of purchasing" are called *packages*. Packages are simply a group of equivalent products across iOS, Android, and Stripe.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/1628274-Entitlements_2.0.png",
        "Entitlements 2.0.png",
        1154,
        1254,
        "#f6f6f5"
      ],
      "sizing": "smart",
      "caption": "Offerings can now have multiple ways to purchase (we call them Packages)."
    }
  ]
}
[/block]
What this means is that packages can easily be added and removed from Offerings which will update in your app immediately. 

For example, want to try out a new 3-month subscription? No problem. Want to change your free trial duration from 3-days to 7-days? No problem. How about changing the order my products are displayed in? Easy.

##3. Simplified entitlement access
Entitlements are now configured completely separately from Offerings since there is no reason that what a product unlocks should be related to how it is displayed. 

For most apps that only have one entitlement, all products can be added to that entitlement. For apps that do have multiple entitlements, a single products can now unlock any number of entitlements.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/de42988-Entitlements_2.0_Copy.png",
        "Entitlements 2.0 Copy.png",
        679,
        1254,
        "#fafaf9"
      ],
      "caption": "Entitlements are now directly related to products."
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "Migration Guide"
}
[/block]
## 1. Check your entitlements

All of the entitlements from the legacy view should be brought over to the new Offerings system, ensuring that the correct products are added to the correct entitlement.

## 2. Create new Offerings and Packages

Add a standard offering and configure it with packages. See the [Configuring Products](doc:entitlements) guide for how to set them up.

## 3. Update to SDK version 3.x. 

**Change `Purchases.entitlements` to `Purchases.offerings`**
To access the new offerings, you will need to migrate from the `Purchases.entitlements` method to the `Purchases.offerings` method. See the [Displaying Products](doc:displaying-products) guide for how to use the new method.

**Change `makePurchase` to `purchasePackage`**
In order to correctly track the offering that was purchased, `makePurchase` has been replaced with `purchasePackage` that takes a new Package object instead of an SKProduct. See [Making Purchases](doc:making-purchases) guide for more info.


[block:api-header]
{
  "title": "FAQ"
}
[/block]
## Will this affect my existing entitlements and offerings?

For entitlements, no. Existing entitlements work with both systems, and we use a super-set of the two configurations when computing entitlement eligibility.

The existing offerings are still available in version 2.x of the SDK and can continue to be used and updated without affecting the existing system.
[block:api-header]
{
  "title": "Glossary"
}
[/block]

[block:parameters]
{
  "data": {
    "h-0": "Concept",
    "h-1": "Legacy",
    "h-2": "New Offerings",
    "1-0": "Offering",
    "1-1": "A single product per platform.",
    "1-2": "The selection of products that are offered to a user in the form of *packages*.",
    "2-0": "Package",
    "2-1": "n/a",
    "2-2": "A group of products, one per platform, usually with the same characteristics such as duration and trial period.",
    "0-0": "Entitlement",
    "0-1": "Level of access user is \"entitled\" to, unlocked by *offerings*.",
    "0-2": "Level of access user is \"entitled\" to, unlocked by *products*."
  },
  "cols": 3,
  "rows": 3
}
[/block]
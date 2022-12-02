---
title: "[DRAFT] Offerings and Packages Migration Guide"
slug: "offerings-migration"
excerpt: "Moving from Legacy Entitlements to Offerings and Packages"
hidden: true
createdAt: "2019-09-21T00:32:27.183Z"
updatedAt: "2019-09-24T18:07:14.013Z"
---
In order to make it easier to control and present products to end users, we've released Offerings and Packages. Offerings and Packages replaces our [Legacy Entitlements](doc:legacy-entitlements) and allows more flexibility in presenting products to customers.

[Legacy Entitlements](doc:legacy-entitlements) will still be available for existing apps, and both systems can be used simultaneously during migration. However, the current Offerings system will be deprecated at some point in the future.
[block:api-header]
{
  "title": "No More Magic Strings"
}
[/block]
With new Offerings, you can now fully reference your users products without any hard coded strings. This will make your paywall code more robust and allow maximum configurability from the backend.
[block:code]
{
  "codes": [
    {
      "code": "Purchases.shared.offerings { (offerings, error) in\n  if let offerings = offerings,\n     let currentOffering = offerings.current,\n     let monthlyPackage = currentOffering.monthly {\n       self.showPaywall(monthly: monthlyPackage)\n  }\n}",
      "language": "swift"
    }
  ]
}
[/block]
The above code sample fetches the offerings from the server, unpacks the current "offering", grabs the special "Monthly" package, and passes it to the paywall.
[block:api-header]
{
  "title": "New Offerings vs Legacy Offerings"
}
[/block]
In the legacy system, an entitlement had many offerings, and each offering had one product. This presented limitations because often you wanted to present groups of offerings to users, and that required combining legacy offerings, often using conventions or string hacks to associated different offerings together. Now, one offering can contain multiple different ways of purchasing. These new "ways of purchasing" are called packages. 
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
      "caption": "Offerings can now have many packages (that hold one product per platform)."
    }
  ]
}
[/block]

[block:parameters]
{
  "data": {
    "h-0": "Concept",
    "h-1": "Legacy Entitlements",
    "h-2": "New Offerings",
    "0-0": "Offering",
    "0-1": "Was associated with 1 product per platform",
    "0-2": "Can have many products in the form of packages",
    "1-0": "Package",
    "1-1": "A \"Legacy Offering\" is the equivalent of a package in the new system.",
    "1-2": "A group of products, one per platform, usually with the same characteristics such as duration and trial period",
    "2-0": "Which Product to Show",
    "2-1": "Active Product within an entitlement, one per platform",
    "2-2": "One offering can be set as the current and accessed via `Offerings.current` in the SDK."
  },
  "cols": 3,
  "rows": 3
}
[/block]

[block:api-header]
{
  "title": "Entitlements"
}
[/block]
Entitlements are no longer related to offerings directly. There is no reason that what a product unlocks should be related to how it is displayed. 

In New Offerings, Entitlements are configured completely separately from products. 
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
This allows products to unlock multiple entitlements and for products to be a part of multiple packages or multiple offerings.
[block:api-header]
{
  "title": "Migration Guide"
}
[/block]
## 1. Check your entitlements

The new entitlements view will automatically account for any entitlements you have configured in Legacy entitlements but you will need to add any new products manually.

## 2. Create new Offerings and Packages

Add a standard offering and configure it with packages. See the [Configuring Products](doc:configuring-products) guide for how to set them up.

## 3. Update to SDK version 3+. 

To access the new offerings, you will need to migrate from the `Purchases.entitlements` method to the `Purchases.offerings` method. See the [Quickstart](doc:getting-started-1) for how to use the new method.
[block:api-header]
{
  "title": "FAQ"
}
[/block]
## Will this affect my existing entitlements and offerings?

For entitlements, no. Existing entitlements work with both systems, and we use a super-set of the two configurations when computing entitlement eligibility.

The existing offerings are still available in version 2 of the SDK and can continue to be used and updated without affecting the existing system.
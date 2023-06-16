---
title: Offering metadata (beta)
slug: offering-metadata
hidden: false
createdAt: '2023-05-12T16:04:40.191Z'
updatedAt: '2023-06-16T16:18:04.167Z'
category: 648c78a1dbb1aa005e52ed52
order: 0
parentDoc: 648c7ee8f6668b004fda3cdc
---
Metadata allows attaching arbitrary information as key/value pairs to your Offering to control how to display your products inside your app. The metadata you configure in an Offering is available from the RevenueCat SDK. For example, you could use it to remotely configure strings on your paywall, or even URLs of images shown on the paywall.

> 📘 
> 
> Offering metadata is supported in iOS SDK version 4.20.0 and up, and Android SDK version 6.3.0 and up.
> 
> Flutter, React Native, and Cordova support coming soon.

## Benefits of using Offering metadata

Using Offering metadata has several advantages: 

- You can remotely configure aspects of your paywall and upsell messaging and make changes without deploying any code, creating a new app build, or going through app review.
- You can use offering metadata together with [Offering Override](doc:offering-override) to display messaging for special offers and discounts. For example, you could create a key `discount_message` that, if present, shows a special message about the applied discount on the paywall, and set that on a discounted Offering that you apply as an override to customers who are eligible for the specific discount.
- You can use [Experiments](doc:experiments-v1) in conjunction with Offering metadata to not only A/B test different products and prices, but also to test changes to the paywall. To do that, you would create a second Offering with the same products as your current offering, but have different values for the metadata keys in the second Offering.

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/febdc0b-Screen_Shot_2023-05-19_at_4.35.53_PM.png",
        null,
        "Example response where metadata is used to control additional paywall variables"
      ],
      "align": "center",
      "sizing": "450px",
      "caption": "Example response where metadata is used to control additional paywall variables"
    }
  ]
}
[/block]

## How to add metadata to your Offering

First, navigate to the Offering you'd like to add metadata to and click **Edit**.

![](https://files.readme.io/b427522-Screen_Shot_2023-05-30_at_3.47.15_PM.png)

Then click **Add new property** to define the metadata for your Offering.

![](https://files.readme.io/3245cef-Screen_Shot_2023-05-30_at_3.47.28_PM.png)

Once you've entered all desired properties as key/value pairs, click **Save** to save your changes.

![](https://files.readme.io/2e32fcf-Screen_Shot_2023-05-30_at_3.48.25_PM.png)

After saving your changes, you'll be navigated back to the summary page for your Offering, where the new metadata properties you've created will be listed.

![](https://files.readme.io/756de89-Screen_Shot_2023-05-30_at_3.48.42_PM.png)

> 📘 
> 
> When creating a new Offering, you'll be able to add metadata properties directly from the creation form.

## Accessing metadata from your app

You can access metadata directly from the Offering object in the RevenueCat SDKs.

```swift 
Purchases.shared.getOfferings { (offerings, error) in
    if let offering = offerings?.current {
        let paywallTitle = offering.getMetadataValue(for: "title", default: "Get Pro")
        let paywallSubtitle = offering.getMetadataValue(for: "subtitle", default: "Unlock all the features")
        let paywallButton = offering.getMetadataValue(for: "button", default: "Redeem Trial")
    }
}
```
```kotlin 
Purchases.sharedInstance.getOfferingsWith({ error ->
    // An error occurred
}) { offerings ->
    offerings.current?.let {
        val paywallTitle = it.getMetadataString("title", default="Get Pro")
        val paywallSubtitle = it.getMetadataString("title", default="Unlock all the features")
        val paywallButton = it.getMetadataString("title", default="Redeem Trial")
    }
}
```

## Offering metadata limits

- Offering metadata is limited to a total of 500 characters of JSON encoded key/value pairs. If you attempt to set more metadata on an offering, you will not be able to save the offering.
- Additionally, individual keys are limited to 40 characters.
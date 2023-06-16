---
title: Apple Family Sharing
slug: apple-family-sharing
excerpt: Let users share their subscriptions with Family Sharing
hidden: false
metadata:
  title: Apple Family Sharing – RevenueCat
  description: This guide covers how to opt-in your subscriptions to family sharing
    and how RevenueCat handles family-shared purchases.
  image:
    0: https://files.readme.io/89781f2-RevenueCat_Docs_OG.png
    1: RevenueCat Docs OG.png
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: '2021-02-09T20:34:15.268Z'
updatedAt: '2023-06-16T16:20:32.422Z'
category: 648c78a7ec91de0019fd4f79
order: 3
parentDoc: 648c7f0801ab9d0074c85913
---
Apple allows any in-app purchases to be shared within a family using [Family Sharing](https://developer.apple.com/documentation/storekit/in-app_purchase/supporting_family_sharing_in_your_app). This is great for apps that tend to be used by groups of people, like video streaming services and kids' apps, without needing users to share their Apple ID. This guide covers how to opt-in your subscriptions to family sharing and how RevenueCat handles family-shared purchases.

# Prerequisites

While family sharing will work on all versions of the SDK, some patches were released in version 3.9.1 in the iOS SDK that improve the SDK's handling of revoked family purchases. Below are the recommended SDK versions:

| SDK          | Version |
| :----------- | :------ |
| iOS          | 3.9.1+  |
| Flutter      | 2.0.0+  |
| React Native | 4.0.0+  |
| Cordova      | 2.0.0+  |
| Unity        | 3.0.0+  |

# Opt in to Family Sharing

By default, family sharing is disabled for all new and existing in-app purchases. Therefore, you need to enable family sharing for each individual in-app purchase.

> 👍 Pro tip: Not all in-app purchases need to be family shareable
> 
> Since you enable family sharing per product, you can choose some products to be family shareable. This opens the door to providing family plans that cost more than an individual subscription, but are more cost-effective than purchasing multiple subscriptions for a family.

If you don't have any in-app purchases in App Store Connect, go ahead and create one by following our guide on [iOS Product Setup](doc:ios-products). Next, navigate to your in-app purchase and click **Turn On** under Family Sharing.

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/908bb53-2021-02-09_14.54.25_appstoreconnect.apple.com_ab0d5a03d489.png",
        "2021-02-09 14.54.25 appstoreconnect.apple.com ab0d5a03d489.png",
        1223
      ],
      "align": "center",
      "caption": "Click **Turn On** to enable Family Sharing."
    }
  ]
}
[/block]

> 🚧 Family Sharing cannot be disabled once turned on
> 
> Double check that you're turning on family sharing for the correct in-app purchase!

Click **Confirm**, and you're done! The Family Sharing section should now display "This subscription can be shared by everyone in a family group."

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/58339d7-2021-02-09_14.59.04_appstoreconnect.apple.com_d5fd0205d87d.png",
        "2021-02-09 14.59.04 appstoreconnect.apple.com d5fd0205d87d.png",
        1218
      ],
      "align": "center",
      "caption": "This in-app purchase has family sharing enabled."
    }
  ]
}
[/block]

# RevenueCat and Family Sharing

RevenueCat seamlessly tracks family shared purchases, so there's no additional setup needed in RevenueCat. In the customer history, you can find out if a purchase was made by the user by checking the `is_family_share` key. True means the user's family made the purchase and this user has access via their family; false means the user made the purchase themselves.

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/bd05f51-app.revenuecat.com_activity_16e7167a_event_c2f2ca41-28f9-457d-b5a0-b55e61a52b9f.png",
        null,
        null
      ],
      "caption": "`is_family_share` is true, so this user has access to Pro via their family."
    }
  ]
}
[/block]

The `is_family_share` key is included in webhook events. In the REST API, the `ownership_type` is included.

> 📘 The user must manually share a subscription with their family
> 
> Even after setting up your in-app purchase to be shareable, the user must choose to share the subscription with their family in settings.

# FAQ

## 1. Is it possible to know which family a user is part of? In other words, is it possible to track a family-shared purchase back to the original owner?

Apple doesn't provide any info that will allow you to link purchases that come from the same family together. If this is something you want to do, you'll have to record which purchases come from which family yourself using user authentication.

## 2. What happens if a user leaves a family? Will their entitlements be revoked?

Yes, RevenueCat will automatically revoke any entitlements that were granted by the user's former family. Version 3.9.1 of the iOS SDK addresses some issues for this edge case, so if this is a concern for you, make sure you use a recent SDK version.

## 3. How long does it take for family members to gain access to a new shared subscription?

It takes up to 1 hour after a user purchases a subscription and shares it for it to be available to their family members. This is an intentional feature from Apple to give the user time to undo the action if desired. Renewals don't have a delay.

## 4. Are family-shared purchases counted in RevenueCat metrics?

Family-shared transactions are **not included** in charts data. Transactions are ignored in some [overview metrics](doc:overview#metrics) (all except 'Installs' and 'Active Users').
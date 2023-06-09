---
title: Sandbox Testing
slug: sandbox
excerpt: Making in-app purchases from a test account
hidden: false
metadata:
  title: In-App Purchase Sandbox Testing – RevenueCat
  description: You don't need to make real purchases in order to test your subscriptions.
    You can make sure your subscriptions have been implemented correctly by using
    the sandbox environments provided by Google and Apple. These environments will
    behave as the real stores, without incurring any costs.
  image:
    0: https://files.readme.io/c8f6708-RevenueCat_Docs_OG.png
    1: RevenueCat Docs OG.png
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: '2022-10-31T14:08:19.865Z'
updatedAt: '2023-06-09T17:30:01.475Z'
category: 6483560b2e0a290051a971dd
order: 2
---
You don't need to make real purchases in order to test your subscriptions. You can make sure your subscriptions have been implemented correctly by using the sandbox environments. These environments will generally behave as the real stores, without incurring any costs.

RevenueCat will automatically detect the environment (production vs. sandbox) in which a purchase occurs, so no additional configuration is required in RevenueCat to test in sandbox.

- **[Apple App Store Sandbox Testing :fa-arrow-right:](doc:apple-app-store)**
- **[Google Play Store Sandbox Testing :fa-arrow-right:](doc:google-play-store)**
- **[Amazon Appstore Sandbox Testing :fa-arrow-right:](doc:amazon-store-sandbox-testing)**

## Sandbox Limitations

In general, the sandbox environments behave nearly identical to the production environments. That being said, we recommend to test only **the flow of a purchase** in sandbox mode, and _not_ metadata-related tests on products. This is because:

1. Store APIs often do not return accurate prices across regions, including in TestFlight on iOS
2. Store APIs often do not return accurate names and descriptions for products

While the production environment is generally mode stable than the sandbox environment, we're not able to provide support on why store APIs are not up to date at any given moment. For this reason, we recommend only testing the flow of a purchase in sandbox mode instead. For example:

1. Initiate a purchase
2. Complete a purchase
3. Verify content has been unlocked

This will ensure you are properly unlocking content for a purchase, and in production you'll see more accurate metadata.
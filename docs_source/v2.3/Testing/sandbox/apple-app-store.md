---
title: "Apple App Store"
slug: "apple-app-store"
excerpt: "Testing purchases in App Store Sandbox"
hidden: false
createdAt: "2019-01-25T21:02:23.756Z"
updatedAt: "2019-07-31T21:54:49.193Z"
---
[block:callout]
{
  "type": "success",
  "body": "This section assumes you've followed our [Quickstart](doc:getting-started-1) section of our Getting Started guide to install and configure our SDK."
}
[/block]

[block:api-header]
{
  "title": "Create a sandbox test account"
}
[/block]
In order to test your purchases, you'll need a sandbox test account. You can create test accounts from your [App Store Connect dashboard](https://appstoreconnect.apple.com/) > Users and Access > Sandbox Testers. 

If you need help, you can refer to Apple's guide on creating sandbox testers [here](https://help.apple.com/app-store-connect/#/dev8b997bee1).

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/d2a7a0e-users_and_roles_sandbox_testers.png",
        "users_and_roles_sandbox_testers.png",
        4048,
        1966,
        "#fafafb"
      ]
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "title": "Valid email required for sandbox accounts",
  "body": "Keep in mind you'll need to create sandbox accounts with valid emails that you can verify you own."
}
[/block]

[block:api-header]
{
  "title": "Add the sandbox test account to your device"
}
[/block]
Even for sandbox purchases, **you'll need to test on a real device**. Starting in iOS 12, you're able to add a sandbox account to your device without having to sign out of your iTunes account. 

Navigate to `Settings > Your Account > iTunes & App Store > Sandbox Account`. Add the sandbox account credentials that you previously created
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/5ec1d52-IMG_24A67F299178-1.jpeg",
        "IMG_24A67F299178-1.jpeg",
        828,
        1792,
        "#eae9ec"
      ],
      "caption": "Add your sandbox account under iOS settings to streamline testing"
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "Make a purchase"
}
[/block]
Build and run your app on your device. When you attempt to make a purchase, you may be still be prompted to sign in with the sandbox account you just created. 
[block:callout]
{
  "type": "info",
  "body": "Apple may prompt you to sign into an iTunes account whenever you make or restore a purchase. When using *Purchases*, this could only happen when you call `.makePurchase` or `.restoreTransactions`. Developers don't have control over the type of prompt that is shown (Touch Id, password, etc.)"
}
[/block]

[block:api-header]
{
  "title": "Verify transaction appears in dashboard"
}
[/block]
After a purchase is successful, you should be able to view the transaction immediately in the RevenueCat dashboard. If the purchase does not appear in the dashboard, it's **not** being tracked by RevenueCat.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/e9b4aa7-20ebf40-Screen_Shot_2019-01-18_at_12.32.52_PM.png",
        "20ebf40-Screen_Shot_2019-01-18_at_12.32.52_PM.png",
        756,
        316,
        "#f8f9f9"
      ]
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "title": "Make sure Sandbox Data is enabled",
  "body": "Make sure the the *View Sandbox Data* toggle is enabled in the navigation bar."
}
[/block]

[block:api-header]
{
  "title": "Working with subscriptions"
}
[/block]
In the the sandbox environment, subscription renewals happen at an accelerated rate, and auto-renewable subscriptions renew a maximum of six times per day. This enables you to test how your app handles a subscription renewal, a subscription lapse, and a subscription history that includes gaps.

Because of the accelerated expiration and renewal rates, sometimes not all renewals are reflected in the RevenueCat customer dashboard.
[block:api-header]
{
  "title": "Deleting test users"
}
[/block]
When testing, it may be helpful to delete a customer and all their receipts from RevenueCat to simulate a new installation. You can delete a specific user from the customer dashboard in RevenueCat. See our [docs on deleting users](doc:customers#section-delete-users) for more information.
[block:api-header]
{
  "title": "Next Steps"
}
[/block]
For more information, take a look at the official Apple documentation:
[Apple App Store: Testing in-app purchases](https://developer.apple.com/library/archive/documentation/NetworkingInternet/Conceptual/StoreKitGuide/Chapters/ShowUI.html)
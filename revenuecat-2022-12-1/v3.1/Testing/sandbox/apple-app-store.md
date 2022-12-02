---
title: "Apple App Store"
slug: "apple-app-store"
excerpt: "Testing purchases in App Store Sandbox"
hidden: false
metadata: 
  title: "App Store Sandbox Purchase Testing – RevenueCat"
  description: "In order to test your purchases, you'll need a sandbox test account. You can create test accounts from your App Store Connect dashboard > Users and Access > Sandbox Testers."
  image: 
    0: "https://files.readme.io/cffd819-OG_image.png"
    1: "OG image.png"
    2: 1200
    3: 627
    4: "#e9acb0"
createdAt: {}
updatedAt: "2021-06-10T23:35:35.306Z"
---
[block:callout]
{
  "type": "success",
  "body": "This section assumes you've followed our [Quickstart](doc:getting-started-1) section of our Getting Started guide to install and configure our SDK."
}
[/block]
# Create a sandbox test account

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
# Testing on Device

This section is for testing on a physical device. If you want to test on the simulator, skip to the next section for instructions on how to get started with [StoreKit testing](doc:apple-app-store#ios-14-only-testing-on-the-simulator).

## Add the sandbox test account to your device

On iOS 13 and earlier, even for sandbox purchases, **you'll need to test on a real device**. Starting in iOS 12, you're able to add a sandbox account to your device without having to sign out of your iTunes account. 

On iOS 12 or greater, navigate to `Settings > [Your Account] > iTunes & App Store > Sandbox Account`. 

On iOS 13 or greater, navigate to `Settings > iTunes & App Store > Sandbox Account`.

Add the sandbox account credentials that you previously created. (The sandbox account credentials won't appear until you've made a purchase using a sandbox account in a development build.)
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/527a407-IMG_3EC533BFA443-1.jpeg",
        "IMG_3EC533BFA443-1.jpeg",
        1170,
        1028,
        "#e7e9f1"
      ],
      "caption": "Add your sandbox account under iOS settings to streamline testing",
      "border": true,
      "sizing": "80"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "title": "",
  "body": "If you do not see the option to add a sandbox account under iOS settings, make a sandbox purchase in your app. Apple will show a popup to enter login details, then you will see your account in iOS settings."
}
[/block]
# iOS 14 Only: Testing on the Simulator

Starting from iOS 14, you can test sandbox purchases in the simulator. If you're using a physical device, you can skip this section.

Testing on the simulator requires one of these SDK versions:
[block:parameters]
{
  "data": {
    "h-0": "SDK",
    "h-1": "Version",
    "1-1": "2.0.0+",
    "1-0": "Flutter",
    "0-1": "3.9.0+",
    "0-0": "iOS",
    "2-0": "React Native",
    "2-1": "4.0.0+",
    "3-0": "Cordova",
    "3-1": "2.0.0+",
    "4-0": "Unity",
    "4-1": "3.0.0+"
  },
  "cols": 2,
  "rows": 5
}
[/block]

[block:callout]
{
  "type": "info",
  "title": "StoreKit testing works on iOS 14 and later",
  "body": "Make sure to test on a real device if testing on iOS 13 or earlier."
}
[/block]
## Step 1: Add a StoreKit Configuration file

Go to **File > New > File...** in the menu bar and select **StoreKit Configuration File**. Save the file in the top-level folder of your project and add it to your targets.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/37ff24b-Screen_Shot_2020-12-01_at_11.56.19_AM.png",
        "Screen Shot 2020-12-01 at 11.56.19 AM.png",
        2538,
        1646,
        "#333334"
      ],
      "caption": "Search for \"storekit\" to find the configuration file template quicker."
    }
  ]
}
[/block]

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/abdf69a-Screen_Shot_2020-12-01_at_11.58.59_AM.png",
        "Screen Shot 2020-12-01 at 11.58.59 AM.png",
        2538,
        1646,
        "#333333"
      ],
      "caption": "Add the configuration file to your targets and save."
    }
  ]
}
[/block]
## Step 2: Create a new scheme for StoreKit testing

Click the scheme in the scheme menu and click **Manage Schemes...**
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/f984dad-Screen_Shot_2020-12-01_at_12.00.09_PM.png",
        "Screen Shot 2020-12-01 at 12.00.09 PM.png",
        2538,
        1646,
        "#2d2c2c"
      ]
    }
  ]
}
[/block]
Select your current scheme and click **Duplicate**.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/2adb3ea-Screen_Shot_2020-12-01_at_12.00.27_PM.png",
        "Screen Shot 2020-12-01 at 12.00.27 PM.png",
        2538,
        1646,
        "#353333"
      ]
    }
  ]
}
[/block]
In the scheme editor, add the StoreKit Configuration file you created in [Step 1](doc:apple-app-store#step-1-add-a-storekit-configuration-file) and click **Close**.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/f4582cb-Screen_Shot_2020-12-01_at_7.46.50_PM.png",
        "Screen Shot 2020-12-01 at 7.46.50 PM.png",
        2538,
        1646,
        "#313030"
      ]
    }
  ]
}
[/block]
## Step 3: Setting up the StoreKit Configuration file.

In the editor, click the "+" button at the bottom and create a new product. In this tutorial, an auto-renewable subscription will be created.

Enter a name for a new subscription group and click **Done**. The subscription group name should match one that is set up for your app in App Store Connect, but it's not a requirement. That means you can test your subscription groups and products in the simulator and then create the products in App Store Connect later.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/a04c726-Screen_Shot_2020-12-01_at_7.54.48_PM.png",
        "Screen Shot 2020-12-01 at 7.54.48 PM.png",
        2538,
        1638,
        "#2e2e2d"
      ]
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "title": "Products in the configuration file must be set up in RevenueCat",
  "body": "Even though products don't have to be set up in App Store Connect, they have to be set up in RevenueCat so that RevenueCat can validate the sandbox receipt. Refer to the [Configuring Products](doc:entitlements) guide for more information."
}
[/block]
Configure the subscription as needed by filling in the **Reference Name**, **Product ID**, **Price**, **Subscription Duration**, and optionally an **Introductory Offer**. Again, this product doesn't have to exist in App Store Connect for you to test purchasing in the simulator. Here is a sample configuration: 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/a00f530-Screen_Shot_2020-12-01_at_7.56.32_PM.png",
        "Screen Shot 2020-12-01 at 7.56.32 PM.png",
        2538,
        1638,
        "#313030"
      ]
    }
  ]
}
[/block]
Repeat this for as many products as you want.

## Step 4: Uploading the public certificate to RevenueCat.

Go to **Editor** > **Save Public Certificate** and save the public certificate to your project.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/b36d09c-Screen_Shot_2020-12-01_at_8.01.01_PM.png",
        "Screen Shot 2020-12-01 at 8.01.01 PM.png",
        2538,
        1638,
        "#333232"
      ]
    }
  ]
}
[/block]
Go to your app's **StoreKit Testing** settings and upload the certificate to your app. If successful, you should see **Certificate added**.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/9f1be79-2020-12-02_10.03.02_app.revenuecat.com_bcce5052273a.png",
        "2020-12-02 10.03.02 app.revenuecat.com bcce5052273a.png",
        2310,
        1210,
        "#f7f6f6"
      ]
    }
  ]
}
[/block]

[block:callout]
{
  "type": "success",
  "title": "You did it!",
  "body": "You're ready to make purchases locally in the simulator!"
}
[/block]
# Make a purchase

Build and run your app on your device. When you attempt to make a purchase, you may be still be prompted to sign in with the sandbox account you just created. 
[block:callout]
{
  "type": "info",
  "body": "Apple may prompt you to sign into an iTunes account whenever you make or restore a purchase. When using *Purchases*, this could only happen when you call `.purchasePackage` or `.restoreTransactions`. Developers don't have control over the type of prompt that is shown (Face ID, Touch ID, password, etc.)"
}
[/block]
# Verify transaction appears in dashboard

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

[block:callout]
{
  "type": "info",
  "title": "Sandbox receipts are transferred between users",
  "body": "If a user uploads an expired sandbox receipt (when making a purchase or restoring purchases) that had previously belonged to a different user, the receipt is transferred to the new user. This behavior is in place so you don't need to create a new sandbox user in App Store Connect for every App User Id you wish to test with."
}
[/block]
# Sandbox specific logic

If latest subscription has expired in sandbox and a new App User Id attempts to purchase or restore, RevenueCat will move the purchases around between users. This logic exists to simplify sandbox testing so you don’t need to create new sandbox users all the time to avoid hitting `RECEIPT_ALREADY_IN_USE ` errors frequently.

# Working with subscriptions

In the the sandbox environment, subscription renewals happen at an accelerated rate, and auto-renewable subscriptions renew a maximum of six times per day. This enables you to test how your app handles a subscription renewal, a subscription lapse, and a subscription history that includes gaps.

Because of the accelerated expiration and renewal rates, sometimes not all renewals are reflected in the RevenueCat customer dashboard.

# Deleting test users

When testing, it may be helpful to delete a customer and all their receipts from RevenueCat to simulate a new installation. You can delete a specific user from the customer dashboard in RevenueCat. See our [docs on deleting users](doc:customers#section-delete-users) for more information.
[block:callout]
{
  "type": "info",
  "title": "Make sure to log out of the sandbox user on your testing device",
  "body": "Deleting the user from RevenueCat doesn't delete the user's purchase history with Apple. It only deletes the user's receipt and metadata from our servers. That means making or restoring purchases will restore those purchases with RevenueCat. To simulate purchasing as a completely new user, make sure to log out of the sandbox account on your device and [create a new one](https://docs.revenuecat.com/docs/apple-app-store#create-a-sandbox-test-account)."
}
[/block]
# Next Steps

For more information, take a look at the official Apple documentation:
[Apple App Store: Testing in-app purchases](https://developer.apple.com/library/archive/documentation/NetworkingInternet/Conceptual/StoreKitGuide/Chapters/ShowUI.html)
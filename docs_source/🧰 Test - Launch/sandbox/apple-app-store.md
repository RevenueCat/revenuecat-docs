---
title: Apple App Store & TestFlight
slug: apple-app-store
excerpt: Testing purchases in App Store Sandbox
hidden: false
metadata:
  title: App Store Sandbox Purchase Testing – RevenueCat
  description: In order to test your purchases, you'll need a sandbox test account.
    You can create test accounts from your App Store Connect dashboard > Users and
    Access > Sandbox Testers.
  image:
    0: https://files.readme.io/fa8e623-RevenueCat_Docs_OG.png
    1: RevenueCat Docs OG.png
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: '2023-05-30T14:34:37.349Z'
---
> 👍 
> 
> This section assumes you've followed our [Quickstart](doc:getting-started-1) section of our Getting Started guide to install and configure our SDK.

# Sandbox Considerations

## Products, prices, and metadata

In sandbox, StoreKit Test, and TestFlight environments, prices will often not reflect the actual prices set in App Store Connect. This is due to these environments being relatively unstable, does not necessarily indicate an issue with your implementation, and is not commonly seen in the production environment.

In these testing environments, you should ensure the purchase flow works as expected, rather than the prices and metadata being accurate. Unfortunately Apple's API can sometimes just be inaccurate, especially with different regions set for devices/accounts.

# Create a Sandbox Test Account

In order to test your purchases, you'll need a sandbox test account. You can create test accounts from your **[App Store Connect dashboard](https://appstoreconnect.apple.com/) > Users and Access > Sandbox Testers**. 

If you need help, you can refer to Apple's guide on creating sandbox testers [here](https://help.apple.com/app-store-connect/#/dev8b997bee1).

![sandbox tester account](https://files.readme.io/bcc016b-download.png)

> 📘 Valid email required for sandbox accounts
> 
> Keep in mind you'll need to create sandbox accounts with valid emails that you can verify you own.

## Localization

To test purchases in different regions, you should set your sandbox user's **App Store Country or Region** property to the territory you'd like to test. 

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/7a32b3e-984a1f91-3d0c-4f36-b020-b48275dfbcf4.png",
        "984a1f91-3d0c-4f36-b020-b48275dfbcf4.png",
        1252
      ],
      "align": "center",
      "sizing": "80",
      "border": true
    }
  ]
}
[/block]

# Testing on Device

This section is for testing on a physical device. If you want to test on the simulator, skip to the next section for instructions on how to get started with [StoreKit testing](doc:apple-app-store#ios-14-only-testing-on-the-simulator).

## Add the Sandbox Test Account to Your Device

On iOS 13 and earlier, even for sandbox purchases, **you'll need to test on a real device**. Starting from iOS 12, you're able to add a sandbox account to your device without having to sign out of your Apple Developer account. 

On iOS 12 or greater, navigate to `Settings > [Your Account] > App Store > Sandbox Account`. 

On iOS 13 or greater, navigate to `Settings > App Store > Sandbox Account`.

On macOS 11.5.2 or greater, navigate to `App Store > Preferences > Sandbox Account`. 

Add the sandbox account credentials that you previously created. (The sandbox account credentials won't appear until you've made a purchase using a sandbox account in a development build.)

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/527a407-IMG_3EC533BFA443-1.jpeg",
        "IMG_3EC533BFA443-1.jpeg",
        1170
      ],
      "align": "center",
      "sizing": "80",
      "border": true,
      "caption": "Add your sandbox account under iOS settings to streamline testing"
    }
  ]
}
[/block]

> 📘 
> 
> If you do not see the option to add a sandbox account under iOS settings, make a sandbox purchase in your app. Apple will show a popup to enter login details, then you will see your account in iOS settings.

# iOS 14+ Only: Testing on the Simulator

Starting from iOS 14, you can test sandbox purchases in the simulator. If you're using a physical device, you can skip this section.

Testing on the simulator requires one of these SDK versions:

| SDK          | Version |
| :----------- | :------ |
| iOS          | 3.9.0+  |
| Flutter      | 2.0.0+  |
| React Native | 4.0.0+  |
| Cordova      | 2.0.0+  |
| Unity        | 3.0.0+  |

> 📘 StoreKit testing works on iOS 14 and later
> 
> Make sure to test on a real device if testing on iOS 13 or earlier.

> 📘 StoreKit testing requires running app from Xcode
> 
> StoreKit testing only works if you are running your app directly through Xcode. Any command line tools that use the `xcodebuild` command to start running an app (like `flutter run` or Flutter's VSCode plugin) won't use the StoreKit Configuration File specified in your scheme. This is a known issue and we have filed a feedback to Apple.

> 🚧 StoreKit testing is currently incompatible with macOS
> 
> While you can upload a StoreKit configuration file with a macOS app, this setup is currently incompatible with the SDK. When making test purchases on the simulator, the transactions will appear to go through but you'll receive an error from our backend. It's recommended to test without configuration files until this is addressed.

## Step 1: Add a StoreKit Configuration File

Go to **File > New > File...** in the menu bar and select **StoreKit Configuration File**. Save the file in the top-level folder of your project and add it to your targets.

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/37ff24b-Screen_Shot_2020-12-01_at_11.56.19_AM.png",
        "Screen Shot 2020-12-01 at 11.56.19 AM.png",
        2538
      ],
      "align": "center",
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
        2538
      ],
      "align": "center",
      "caption": "Add the configuration file to your targets and save."
    }
  ]
}
[/block]

## Step 2: Create a New Scheme for StoreKit Testing

Click the scheme in the scheme menu and click **Manage Schemes...**

![](https://files.readme.io/f984dad-Screen_Shot_2020-12-01_at_12.00.09_PM.png "Screen Shot 2020-12-01 at 12.00.09 PM.png")

Select your current scheme and click **Duplicate**.

![](https://files.readme.io/2adb3ea-Screen_Shot_2020-12-01_at_12.00.27_PM.png "Screen Shot 2020-12-01 at 12.00.27 PM.png")

In the scheme editor, add the StoreKit Configuration file you created in [Step 1](doc:apple-app-store#step-1-add-a-storekit-configuration-file) and click **Close**.

![](https://files.readme.io/f4582cb-Screen_Shot_2020-12-01_at_7.46.50_PM.png "Screen Shot 2020-12-01 at 7.46.50 PM.png")

## Step 3: Setting up the StoreKit Configuration File

In the editor, click the "+" button at the bottom and create a new product. In this tutorial, an auto-renewable subscription will be created.

Enter a name for a new subscription group and click **Done**. The subscription group name should match one that is set up for your app in App Store Connect, but it's not a requirement. That means you can test your subscription groups and products in the simulator and then create the products in App Store Connect later.

![](https://files.readme.io/a04c726-Screen_Shot_2020-12-01_at_7.54.48_PM.png "Screen Shot 2020-12-01 at 7.54.48 PM.png")

> 📘 Products in the configuration file must be set up in RevenueCat
> 
> Even though products don't have to be set up in App Store Connect, they have to be set up in RevenueCat so that RevenueCat can validate the sandbox receipt. Refer to the [Configuring Products](doc:entitlements) guide for more information.

Configure the subscription as needed by filling in the **Reference Name**, **Product ID**, **Price**, **Subscription Duration**, and optionally an **Introductory Offer**. Again, this product doesn't have to exist in App Store Connect for you to test purchasing in the simulator. Here is a sample configuration: 

![](https://files.readme.io/a00f530-Screen_Shot_2020-12-01_at_7.56.32_PM.png "Screen Shot 2020-12-01 at 7.56.32 PM.png")

Repeat this for as many products as you want.

## Step 4: Uploading the Public Certificate to RevenueCat

Go to **Editor** > **Save Public Certificate** and save the public certificate to your project.

![](https://files.readme.io/b36d09c-Screen_Shot_2020-12-01_at_8.01.01_PM.png "Screen Shot 2020-12-01 at 8.01.01 PM.png")

Go to your app's configuration page in your RevenueCat project settings (**Project Settings > Apps > [Your App]**). Expand the dropdown **StoreKit testing framework** and upload the certificate to your app. If successful, you should see **Certificate added**.

![](https://files.readme.io/eccabe0-app.revenuecat.com_projects_572548b2_apps_app75924793e7.png)

> 👍 You did it!
> 
> You're ready to make purchases locally in the simulator!

# Make a Purchase

Build and run your app on your device. When you attempt to make a purchase, you may be still be prompted to sign in with the sandbox account you just created. 

> 📘 
> 
> Apple may prompt you to sign in with an Apple ID whenever you make or restore a purchase. When using the SDK, this could only happen when you call `.purchase(package:)` or `.restorePurchases`. Developers don't have control over the type of prompt that is shown (Face ID, Touch ID, password, etc.)

# Verify the Transaction Appears in the Dashboard

After a purchase is successful, you should be able to view the transaction immediately in the RevenueCat dashboard. If the purchase does not appear in the dashboard, it's **not** being tracked by RevenueCat.

![](https://files.readme.io/9f944ee-Screen_Shot_2021-12-05_at_7.41.15_PM.png "Screen Shot 2021-12-05 at 7.41.15 PM.png")

> 📘 Make sure Sandbox Data is enabled
> 
> Make sure the the _View Sandbox Data_ toggle is enabled in the navigation bar.

# Working with Subscriptions

In the the sandbox environment, subscription renewals happen at an accelerated rate, and auto-renewable subscriptions renew a maximum of six times per day. This enables you to test how your app handles a subscription renewal, a subscription lapse, and a subscription history that includes gaps.

Because of the accelerated expiration and renewal rates, sometimes not all renewals are reflected in the RevenueCat customer dashboard.

# Deleting Test Users

When testing, it may be helpful to delete a customer and all their receipts from RevenueCat to simulate a new installation. You can delete a specific user from the customer dashboard in RevenueCat. See our [docs on deleting users](https://www.revenuecat.com/docs/manage-users) for more information.

> ❗️ Maximum number of App Store subscription receipts
> 
> For performance reasons, RevenueCat limits the number of App Store subscription receipts per customer to 100. Having more than 100 subscription receipts on a single customer is not going to happen in production, but can easily happen during sandbox testing. Simply deleting the customer will solve this problem.

# TestFlight

TestFlight is a hybrid environment that uses production Apple IDs but purchases occur in sandbox, which can cause unexpected issues that are very likely undocumented by Apple.

## Common Errors

If you're getting the error "Account Not In This Store" when attempting to make a purchase on macOS, try to:

- Switch your region to the recommended region
- Sign out of the App Store
- Relaunch the TestFlight app
- Attempt to make the purchase again, and sign in when prompted

> 📘 Make sure to log out of the sandbox user on your testing device
> 
> Deleting the user from RevenueCat doesn't delete the user's purchase history with Apple. It only deletes the user's receipt and metadata from our servers. That means making or restoring purchases will restore those purchases with RevenueCat. To simulate purchasing as a completely new user, make sure to log out of the sandbox account on your device and [create a new one](https://docs.revenuecat.com/docs/apple-app-store#create-a-sandbox-test-account).

# Next Steps

For more information, take a look at the official Apple documentation:  
[Apple App Store: Testing in-app purchases](https://developer.apple.com/library/archive/documentation/NetworkingInternet/Conceptual/StoreKitGuide/Chapters/ShowUI.html)
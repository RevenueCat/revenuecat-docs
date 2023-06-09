---
title: Stripe Dashboard App
slug: stripe-app
excerpt: Install and use the RevenueCat App in Stripe App Marketplace
hidden: false
metadata:
  title: View in-app purchase history in Stripe – RevenueCat
  image:
    0: https://files.readme.io/c31e77f-RevenueCat_Docs_OG.png
    1: RevenueCat Docs OG.png
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: '2022-04-13T22:30:41.204Z'
updatedAt: '2023-06-09T17:19:40.463Z'
category: 6483560b2e0a290051a971e2
order: 8
---
The RevenueCat App in Stripe's App Marketplace combines Stripe’s customer and billing data with enriched data from RevenueCat’s native cross-platform SDKs and subscription backend. Rather than context switching between RevenueCat’s customer details and Stripe’s customer profile in multiple windows, the RevenueCat App combines RevenueCat data into a single page view within Stripe. 

You will be able to do the following:
- Quickly navigate to RevenueCat customer and setting pages with convenient buttons 
- View RevenueCat customer metadata such as app user ID, last seen RevenueCat SDK version, last seen locale, and timestamps (first and last seen) when your customer interacted with your app
- View transaction events for Stripe, as well as cross-platform purchases across Apple App Store, Google Play Store, and Amazon Appstore 
[block:callout]
{
  "type": "info",
  "body": "RevenueCat data visible within Stripe is read-only and does not allow for additional filtering in Stripe based on RevenueCat data"
}
[/block]
# Setup
## Prerequisites 
The customer's Stripe fetch token must exist in RevenueCat in order for RevenueCat to find the Stripe customer. To read more about this, visit the [Send Stripe tokens to RevenueCat](doc:stripe#5-send-stripe-tokens-to-revenuecat) section of our Stripe documentation! 

## Installing the app
To install the RevenueCat App in Stripe, navigate to the [RevenueCat App](https://marketplace.stripe.com/apps/revenuecat) on Stripe's App Marketplace. Select the 'Install app' button.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/4a68982-Screen_Shot_2022-04-26_at_5.34.05_PM.png",
        "Screen Shot 2022-04-26 at 5.34.05 PM.png",
        2850,
        532,
        "#f8f6f9"
      ],
      "caption": ""
    }
  ]
}
[/block]
Select 'Install'
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/93f135c-Screen_Shot_2022-04-26_at_5.36.14_PM.png",
        "Screen Shot 2022-04-26 at 5.36.14 PM.png",
        950,
        1418,
        "#fbf9fa"
      ]
    }
  ]
}
[/block]
Select 'Sign in with RevenueCat' and log in with your RevenueCat account credentials.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/8a5b7a8-Screen_Shot_2022-07-07_at_2.17.30_PM.png",
        "Screen Shot 2022-07-07 at 2.17.30 PM.png",
        280,
        256,
        "#f8f7f7"
      ]
    }
  ]
}
[/block]
The RevenueCat App is now installed to your Stripe account! 
[block:callout]
{
  "type": "info",
  "title": "Project owner must connect with Stripe",
  "body": "Only the owner of the RevenueCat project can connect a Stripe account for their apps - no [collaborators](doc:collaborators) will be able to add or remove a Stripe connection."
}
[/block]
# Using the RevenueCat App 
To view data from the RevenueCat App, you must first select a customer in Stripe. 

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/cf7a34b-0.1.5.png",
        "0.1.5.png",
        1731,
        1282,
        "#fbfbfb"
      ],
      "caption": "RevenueCat App at a glance"
    }
  ]
}
[/block]
The RevenueCat App is broken into 5 main sections:

## Customer Details
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/979583c-0.1.5.png",
        "0.1.5.png",
        279,
        234,
        "#f3f4f6"
      ],
      "caption": "Customer Details"
    }
  ]
}
[/block]
The Customer details section displays metadata about your customer such as:
- RevenueCat app user ID
- First Seen 
- Last Seen SDK Version
- Last Opened
- Last Seen Platform Version
- Last Seen Locale

These fields will not populate in the app if they are null in the RevenueCat Customer Page.

An external link is provided in this section to bring you to the RevenueCat [Customer History](doc:customer-history) page.

## Attributes
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/7456cc9-0.1.5.png",
        "0.1.5.png",
        276,
        317,
        "#f4f5f8"
      ],
      "caption": "Attributes"
    }
  ]
}
[/block]
The Attributes section allows you to view [subscriber attributes](doc:subscriber-attributes) you have assigned to this customer. 

## Entitlements
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/3d47025-0.1.5.png",
        "0.1.5.png",
        274,
        127,
        "#f5f6f8"
      ],
      "caption": "Entitlements"
    }
  ]
}
[/block]
The Entitlements section gives you a quick glance at the current Entitlement status for the customer. You can see which Entitlement has been unlocked along when they'll renew or cancel. 

An external link is provided in this section to bring you to the RevenueCat [Entitlement](doc:entitlements#entitlements) settings page.

## Current Offering
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/2b11324-0.1.5.png",
        "0.1.5.png",
        275,
        130,
        "#f6f7f8"
      ],
      "caption": "Current Offering"
    }
  ]
}
[/block]
The Current offering section shows the current offering for the customer. This allows you to see what products are displayed in their paywall. 

An external link is provided in this section to bring you to the RevenueCat [Offerings](doc:entitlements#offerings) settings page.

## Customer History 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/ec7cf2b-Screen_Shot_2022-07-07_at_9.37.59_AM.png",
        "Screen Shot 2022-07-07 at 9.37.59 AM.png",
        299,
        575,
        "#f5f7fa"
      ],
      "caption": "Customer History"
    }
  ]
}
[/block]
The Customer history section lays out a timeline of transactions for the selected customer, ordered by recent transactions towards the top. 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/6a9c463-Screen_Shot_2022-07-07_at_9.45.24_AM.png",
        "Screen Shot 2022-07-07 at 9.45.24 AM.png",
        288,
        419,
        "#eff2f4"
      ],
      "caption": "Customer History Expanded"
    }
  ]
}
[/block]
"Show details" buttons are provided to expand each transaction event to conveniently view metadata such as product ID, purchase and expiration timestamps in a readable format, and price in purchased currency.


[block:callout]
{
  "type": "success",
  "title": "That's it!",
  "body": "You can now view RevenueCat's data from our subscription backend directly within Stripe."
}
[/block]
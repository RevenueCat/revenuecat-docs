---
title: "Active Entitlements"
slug: "active-entitlements"
hidden: false
metadata: 
  title: "Active Entitlements – RevenueCat"
  description: "The Entitlements card gives you a quick glance at the current subscription status for a customer. You can see which product(s) or Entitlement(s) have been purchased, when they'll renew or cancel, and transfer them to other customers."
  image: 
    0: "https://files.readme.io/445009d-RevenueCat_Docs_OG.png"
    1: "RevenueCat Docs OG.png"
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: "2020-04-06T21:46:06.712Z"
updatedAt: "2023-03-01T02:12:34.867Z"
---
The 'Entitlements' card gives you a quick glance at the current entitlement status for a user. You can see which product(s) or [Entitlement(s)](doc:entitlements) have been purchased, and when they'll renew or cancel.  

Like the 'Customer History' view, this card is generated from current purchase receipt saved for the user. 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/765a617-2023-02-28_20.40.48_app.revenuecat.com_1030bde9f564.png",
        "2023-02-28 20.40.48 app.revenuecat.com 1030bde9f564.png",
        502,
        232,
        "#000000"
      ],
      "sizing": "smart",
      "border": true
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "title": "Grace periods will extend expiration dates",
  "body": "If the expiration date seems further out then you expect, e.g. 16 days past when your monthly subscription should renew, that indicates the user is in a grace period due to a failed payment. The store will attempt to re-charge the user there's no action to take on your part."
}
[/block]
# Transferring entitlements

You can manually [transfer entitlements](doc:restoring-purchases#transfer-purchases) from one customer to another via the dashboard. 

1. In the Entitlements section of the customer profile, click **Transfer**.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/6f6e842-2023-02-28_20.48.12_app.revenuecat.com_1a547ce96b7e.png",
        "2023-02-28 20.48.12 app.revenuecat.com 1a547ce96b7e.png",
        1517,
        749,
        "#000000"
      ],
      "caption": ""
    }
  ]
}
[/block]
2. Enter the user to whom you want to transfer the entitlements.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/6f6d71e-2023-02-28_20.52.04_app.revenuecat.com_3e979e697aa5.png",
        "2023-02-28 20.52.04 app.revenuecat.com 3e979e697aa5.png",
        1524,
        746,
        "#000000"
      ]
    }
  ]
}
[/block]
3. Click **Find**. After a few moments the user should appear in the **Destination Customer details** section.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/01a530e-2023-02-28_20.53.56_app.revenuecat.com_3eb512a438a0.png",
        "2023-02-28 20.53.56 app.revenuecat.com 3eb512a438a0.png",
        708,
        421,
        "#000000"
      ]
    }
  ]
}
[/block]
4. Review the transfer details and click **Transfer Entitlements** to perform the transfer. If you want to cancel the transfer use the back button in your browser.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/8806692-2023-02-28_20.57.19_docs-origin.revenuecat.com_f88e0b13997d.png",
        "2023-02-28 20.57.19 docs-origin.revenuecat.com f88e0b13997d.png",
        1472,
        980,
        "#000000"
      ]
    }
  ]
}
[/block]
5. Click **Transfer Entitlements** in the confirmation dialog.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/4c88578-2023-02-28_20.59.13_app.revenuecat.com_3183fb3aa62f.png",
        "2023-02-28 20.59.13 app.revenuecat.com 3183fb3aa62f.png",
        777,
        369,
        "#000000"
      ]
    }
  ]
}
[/block]
6. If the transfer is successful, you will be redirected to the destination customer's profile.
[block:callout]
{
  "type": "info",
  "body": "Transferring an entitlement will:\n\n1. Generate a transfer event in both customer profiles.\n2. Send a transfer event to any integrations and webhooks you have configured."
}
[/block]

[block:api-header]
{
  "title": "Next Steps"
}
[/block]
* [Promotionals :fa-arrow-right:](doc:promotionals)
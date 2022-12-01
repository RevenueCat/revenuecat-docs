---
title: "Promotionals"
slug: "promotionals"
hidden: false
metadata: 
  title: "Grant promotional access – RevenueCat"
  description: "Promotional subscriptions allow you to give a user access to premium content for a specific amount of time without requiring them to make a purchase or redeem a promo code."
  image: 
    0: "https://files.readme.io/15bebe9-RevenueCat_Docs_OG.png"
    1: "RevenueCat Docs OG.png"
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: "2020-04-06T21:46:08.587Z"
updatedAt: "2022-11-09T13:55:00.602Z"
---
[block:callout]
{
  "type": "info",
  "title": "Promotional subscriptions won't affect billing",
  "body": "Promotional subscriptions are a RevenueCat specific feature and work independently of App Store or Play Store billing and will never: cancel a user's subscription, charge a user, issue a refund, or convert to a paid subscription.\n\nPromotionals don't stack on top of store subscriptions, and are applied alongside them instead."
}
[/block]
Promotional subscriptions allow you to give a user access to premium content for a specific amount of time without requiring them to make a purchase or redeem a promo code. This can be useful for allowing beta users to preview content for free or resolving customer support issues. 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/76fe2e0-Screen_Shot_2019-01-18_at_11.52.21_AM.png",
        "Screen Shot 2019-01-18 at 11.52.21 AM.png",
        366,
        243,
        "#f3f6f6"
      ],
      "caption": ""
    }
  ]
}
[/block]
# Granting Promotionals
[block:callout]
{
  "type": "info",
  "title": "Looking for the REST API endpoint?",
  "body": "Grant and revoke promotional entitlements via our REST API as described [here](https://docs.revenuecat.com/reference/grant-a-promotional-entitlement)."
}
[/block]
To give a user promotional access to an entitlement choose the [entitlement name](doc:entitlements) and duration and click 'Grant'. You can grant multiple entitlements if you have different levels of access. You must be using RevenueCat [Entitlements](doc:entitlements) to grant promotionals.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/d3e7835-Screen_Shot_2019-01-18_at_11.53.10_AM.png",
        "Screen Shot 2019-01-18 at 11.53.10 AM.png",
        366,
        241,
        "#ebf1f3"
      ]
    }
  ]
}
[/block]
Granting an entitlement from the customer page will go into effect immediately, but you may need to [refresh CustomerInfo](doc:getting-started-1#section-get-subscription-status) on the client to get the latest active entitlements. The promotional access will automatically be revoked after the selected duration. Note that promotional entitlements in the customer timeline will not show as "sandbox" transactions.
[block:callout]
{
  "type": "info",
  "body": "Promotional entitlements will be prefixed with \"rc_promo\" in the customer dashboard."
}
[/block]
# Removing Promotional Subscriptions
Granted entitlements will automatically be removed after expiration. To remove access to an entitlement early, click the :fa-times-circle: icon next to the **Granted Entitlement** name.

# Next Steps

* [Attributes :fa-arrow-right:](doc:attributes)
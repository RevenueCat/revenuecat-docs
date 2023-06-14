---
title: Deleting Users
slug: manage-users
hidden: false
metadata:
  title: Deleting Users – RevenueCat
  description: You can delete a user under the 'Manage' card at the bottom of the
    page. Deleting a user will also remove all their purchase history for sandbox
    and production data which could change how charts and reports appear.
  image:
    0: https://files.readme.io/480dc45-RevenueCat_Docs_OG.png
    1: RevenueCat Docs OG.png
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: '2020-04-06T21:46:08.709Z'
updatedAt: '2023-06-14T14:26:33.780Z'
category: 6483560b2e0a290051a971e1
order: 8
parentDoc: 6483560b2e0a290051a97257
---
You can delete a user under the 'Manage' card at the bottom of the page. Deleting a user will also remove all their purchase history for sandbox and production data which could change how charts and reports appear. Deleting users should only be used to remove accounts you may have set up for testing or if the user requests their data to be deleted.

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/b42278c-app.revenuecat.com_customers_aec1bada_15343510_2.png",
        "app.revenuecat.com_customers_aec1bada_15343510 (2).png",
        390
      ],
      "align": "center",
      "sizing": "80",
      "border": true,
      "caption": "Careful, this can't be undone!"
    }
  ]
}
[/block]

Deleting users through the RevenueCat dashboard or API clears out all of their data and is sufficient for GDPR erasure requests.

> ❗️ Be careful!
> 
> Deleting a user with live purchases may have downstream effects on charts and reporting.

> 📘 Deleting a user from RevenueCat won't cancel their subscriptions.
> 
> You can cancel a user's Google Play subscription before deleting them via our [API](https://docs.revenuecat.com/reference#revoke-a-google-subscription). It's not possible for you to cancel a user's Apple subscription; this is a limitation of the App Store.
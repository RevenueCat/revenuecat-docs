---
title: Deleting Users
slug: manage-users
hidden: false
createdAt: '2020-04-06T21:46:08.709Z'
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
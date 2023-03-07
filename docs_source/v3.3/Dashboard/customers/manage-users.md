---
title: "Deleting Users"
slug: "manage-users"
hidden: false
metadata: 
  title: "Deleting Users – RevenueCat"
  description: "You can delete a user under the 'Manage' card at the bottom of the page. Deleting a user will also remove all their purchase history for sandbox and production data which could change how charts and reports appear."
  image: 
    0: "https://files.readme.io/c0abc80-60993e3c40039b67596bcc8c_slack-preview.png"
    1: "60993e3c40039b67596bcc8c_slack-preview.png"
    2: 1200
    3: 627
    4: "#f45476"
createdAt: "2020-04-06T21:46:08.709Z"
updatedAt: "2020-12-18T20:03:08.304Z"
---
You can delete a user under the 'Manage' card at the bottom of the page. Deleting a user will also remove all their purchase history for sandbox and production data which could change how charts and reports appear. Deleting users should only be used to remove accounts you may have set up for testing.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/0269a10-Screen_Shot_2020-12-18_at_2.58.30_PM.png",
        "Screen Shot 2020-12-18 at 2.58.30 PM.png",
        728,
        268,
        "#f9fafa"
      ],
      "caption": "Careful, this can't be undone!",
      "border": true,
      "sizing": "80"
    }
  ]
}
[/block]
Deleting users through the RevenueCat dashboard or API clears out all of their data and is sufficient for GDPR erasure requests.
[block:callout]
{
  "type": "danger",
  "title": "Be careful!",
  "body": "Deleting a user with live purchases may have downstream effects on charts and reporting."
}
[/block]

[block:callout]
{
  "type": "info",
  "title": "Deleting a user from RevenueCat won't cancel their subscriptions.",
  "body": "You can cancel a user's Google Play subscription before deleting them via our [API](https://docs.revenuecat.com/reference#revoke-a-google-subscription). It's not possible for you to cancel a user's Apple subscription; this is a limitation of the App Store."
}
[/block]
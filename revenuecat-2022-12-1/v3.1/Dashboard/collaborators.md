---
title: "Add Collaborators"
slug: "collaborators"
excerpt: "Share RevenueCat apps with your team"
hidden: false
metadata: 
  title: "Add Collaborators – RevenueCat"
  description: "Collaborators allow you to share apps in RevenueCat with other people without having to share any login credentials. You can limit the access of specific collaborators to \"Admin\" or \"Read Only\"."
  image: 
    0: "https://files.readme.io/ea3281b-OG_image.png"
    1: "OG image.png"
    2: 1200
    3: 627
    4: "#e9acb0"
createdAt: {}
updatedAt: "2020-10-07T00:57:25.545Z"
---
[block:callout]
{
  "type": "success",
  "body": "Collaborators are only available on [paid](https://www.revenuecat.com/pricing) plans."
}
[/block]
Collaborators allow you to share apps in RevenueCat with other people without having to share any login credentials. You can limit the access of specific collaborators to "Admin", "Read Only", or "Customer Support".
[block:api-header]
{
  "title": "Invite a Collaborator"
}
[/block]
To invite a collaborator, send them an invite from the [Collaborators page under app settings.](https://app.revenuecat.com/app/collaborators) 

All collaborators can view customers and analytics. Only admins are able to make changes to your app's configuration.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/14bcc2d-screencapture-app-revenuecat-apps-a4b20cba-collaborators-2019-01-03-12_50_58.png",
        "screencapture-app-revenuecat-apps-a4b20cba-collaborators-2019-01-03-12_50_58.png",
        2400,
        1220,
        "#f8f6f7"
      ]
    }
  ]
}
[/block]
Add the collaborator's email, select their permission level, and send the invite. 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/af811cb-Screen_Shot_2020-04-08_at_3.38.59_PM.png",
        "Screen Shot 2020-04-08 at 3.38.59 PM.png",
        812,
        433,
        "#f3f4f4"
      ]
    }
  ]
}
[/block]
Invited collaborators will receive an email where they can accept your invitation and optionally create a RevenueCat account if needed.
[block:callout]
{
  "type": "info",
  "title": "Collaborators are Per App",
  "body": "If you have multiple apps that you wish to share, you will need to repeat the invite process for each application that you want to collaborate with them on."
}
[/block]

[block:api-header]
{
  "title": "Permissions"
}
[/block]
When inviting a collaborators there are two permission levels that grant them different levels of access:
- **Admin** - Can view and make changes to settings, including inviting other collaborators. This is usually app owners or engineers that are integrating RevenueCat.
- **Customer Support** - Can see [user activity](doc:customers), [grant promotionals](doc:promotionals), [issue refunds](doc:customer-history#section-refunding-subscriptions), and [delete customers](doc:manage-users). Cannot see any charts, overview metrics, or app settings.
- **Read Only** - Cannot view or change settings. Perfect for people that need access to revenue metrics, customer transactions, etc. but don't need access to things like API keys.
[block:callout]
{
  "type": "info",
  "title": "Collaborators cannot delete apps or manage billing",
  "body": "No collaborator, regardless of permission level, is allowed to delete an app, change billing or connect a Stripe account."
}
[/block]
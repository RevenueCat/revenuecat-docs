---
title: "Add Collaborators"
slug: "collaborators"
excerpt: "Share RevenueCat apps with your team"
hidden: false
metadata: 
  title: "Add Collaborators – RevenueCat"
  description: "Collaborators allow you to share apps in RevenueCat with other people without having to share any login credentials. You can limit the access of specific collaborators to \"Admin\" or \"Read Only\"."
  image: 
    0: "https://files.readme.io/1b702da-RevenueCat_Docs_OG.png"
    1: "RevenueCat Docs OG.png"
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: {}
updatedAt: "2022-07-05T23:19:16.919Z"
---
[block:callout]
{
  "type": "success",
  "body": "Collaborators are only available on [paid](https://www.revenuecat.com/pricing) plans."
}
[/block]
Collaborators allow you to share projects in RevenueCat with other people without having to share any login credentials. You can limit the access of specific collaborators to "Admin", "Read Only", or "Customer Support".
[block:api-header]
{
  "title": "Invite a Collaborator"
}
[/block]
To invite a collaborator, send them an invite from the **Collaborators page under project settings**. 

All collaborators can view customers and analytics. Only admins are able to make changes to your project's configuration.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/4940e98-Screen_Shot_2021-12-01_at_11.51.18_AM.png",
        "Screen Shot 2021-12-01 at 11.51.18 AM.png",
        1834,
        686,
        "#f8f8f8"
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
        "https://files.readme.io/f62d1d0-Screen_Shot_2021-12-01_at_11.53.16_AM.png",
        "Screen Shot 2021-12-01 at 11.53.16 AM.png",
        1314,
        694,
        "#f0f1f0"
      ]
    }
  ]
}
[/block]
Invited collaborators will receive an email where they can accept your invitation and optionally create a RevenueCat account if needed.
[block:callout]
{
  "type": "info",
  "title": "Collaborators are Per Project",
  "body": "If you have multiple projects that you wish to share, you will need to repeat the invite process for each project that you want to collaborate with them on."
}
[/block]

[block:api-header]
{
  "title": "Permissions"
}
[/block]
When inviting a collaborators there are three permission levels that grant them different levels of access:
- **Admin** - Can view and make changes to project settings, including inviting other collaborators. This is usually app owners or engineers that are integrating RevenueCat.
- **Customer Support** - Can see [user activity](doc:customers), [grant promotionals](doc:promotionals), [issue refunds](doc:customer-history#section-refunding-subscriptions), and [delete customers](doc:manage-users). Cannot see any charts, overview metrics, aggregate customer lists, or most project settings (other than **Entitlements**, **Offerings**, and **Products**).
- **Read Only** - Cannot change project settings. Perfect for people that need access to revenue metrics, customer transactions, etc. but don't need access to things like API keys.
[block:callout]
{
  "type": "info",
  "title": "Collaborators cannot delete projects or apps within projects, or manage billing",
  "body": "No collaborator, regardless of permission level, is allowed to delete a project or apps within a project, change billing, or connect a Stripe account."
}
[/block]
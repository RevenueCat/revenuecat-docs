---
title: "App User Ids"
slug: "aliases-card"
hidden: false
metadata: 
  title: "Customer aliases | RevenueCat"
  description: "If this customer has any aliases they will appear in the 'Aliases' card. Aliasing is when two App User Ids are merged together and treated as the same user in RevenueCat - effectively connecting two sets of user data as one."
  image: 
    0: "https://files.readme.io/2cdaafb-Reddit__E.png"
    1: "Reddit – E.png"
    2: 2400
    3: 1260
    4: "#fbabb0"
createdAt: "2020-04-06T21:46:10.612Z"
updatedAt: "2020-08-17T23:30:00.167Z"
---
The App User Ids will hold both the Original App User Id and the list of Aliases a particular customer has.

If this customer has any [aliases](doc:user-ids#aliasing), they will appear in the 'Aliases' sub-section.

Aliasing is when two App User Ids are merged together and treated as the same user in RevenueCat - effectively connecting two sets of user data as one. The user can then be referenced by any of their aliases and the same result will be returned.

The most common reasons for aliases are when a RevenueCat anonymous user is identified with a provided App User Id in your system, and when users restore purchases usually after uninstalling/reinstalling your app.

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/084be11-Screen_Shot_2020-05-11_at_8.33.09_PM.png",
        "Screen Shot 2020-05-11 at 8.33.09 PM.png",
        816,
        492,
        "#f8f8f8"
      ]
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "If you see unexpected aliases, you may be incorrectly identifying users. See our [guide on App User Ids](doc:user-ids) for more information."
}
[/block]

[block:api-header]
{
  "title": "Next Step"
}
[/block]
* [Manage Users :fa-arrow-right:](doc:manage-users)
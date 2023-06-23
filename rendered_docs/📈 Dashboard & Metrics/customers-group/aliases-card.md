---
title: App User IDs
slug: aliases-card
hidden: false
categorySlug: dashboard-metrics
order: 7
parentDoc: 648c7ee63d0e7f00669ced48
---
The App User IDs will hold both the Original App User ID and the list of Aliases a particular customer has.

If this customer has any [aliases](doc:user-ids#aliasing), they will appear in the 'Aliases' sub-section.

Aliasing is when two App User IDs are merged together and treated as the same user in RevenueCat - effectively connecting two sets of user data as one. The user can then be referenced by any of their aliases and the same result will be returned.

The most common reasons for aliases are when a RevenueCat anonymous user is identified with a provided App User Id in your system, and when users restore purchases usually after uninstalling/reinstalling your app.

![](https://files.readme.io/c1b5927-app.revenuecat.com_customers_a4b20cba_ThlFQJQgLAbQHt1rYiJPnAqMafB3.png "app.revenuecat.com_customers_a4b20cba_ThlFQJQgLAbQHt1rYiJPnAqMafB3.png")

The app_user_id that is sent in events is not necessarily the most recently seen alias, It is whatever is found first according to the following ordering:

1. Last seen identified alias. This is a non-anonymous id.
2. Last seen alias. This id can be anonymous.
3. Any app user ID. In the case that no last seen data is available, RevenueCat will send any app user id associated with the user. Can be the original app user id or an alias.

The aliases listed in this App User Ids card are not necessarily the order that these aliases were last seen.

> 📘 
> 
> If you see unexpected aliases, you may be incorrectly identifying users. See our [guide on App User Ids](doc:user-ids) for more information.

## Next Step

- [Manage Users ](doc:manage-users)
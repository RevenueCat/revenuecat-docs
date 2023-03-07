---
title: "API Keys & Authentication"
slug: "authentication"
excerpt: "Manage your API keys to authenticate with RevenueCat"
hidden: false
metadata: 
  title: "Authentication – RevenueCat"
  description: "RevenueCat authenticates requests from the REST API and Purchases SDK using your app's API keys. All requests must include a valid key. There are also two types of API keys: public and secret."
  image: 
    0: "https://files.readme.io/10e3130-RevenueCat_Docs_OG.png"
    1: "RevenueCat Docs OG.png"
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: {}
updatedAt: "2022-06-21T21:21:52.969Z"
---
RevenueCat authenticates requests from the [REST API](https://docs.revenuecat.com/reference) and the *Purchases SDK* using your app's API keys. All requests must include a valid API key. There are also two types of API keys: public and secret.

- **Public** API keys (also known as **App specific keys** in the dashboard) are meant to make non-potent changes to subscribers, and must be used to [configure the SDK](doc:configuring-sdk). Each app under a project is automatically provided with a public API key.
- **Secret** API keys, prefixed `sk_`, should be kept confidential and only stored on your own servers. Your secret API keys can perform restricted API requests such as deleting subscribers and granting promotional access. Secret API keys are project-wide and can be created and revoked by project [Admins](doc:collaborators). Please note: [creating purchases via the REST API](https://docs.revenuecat.com/reference#receipts) requires using a **public** API key, not a secret API key.

# Legacy API Keys
[block:callout]
{
  "type": "warning",
  "title": "Legacy public API keys will continue to be supported",
  "body": "Public API keys generated prior to the launch of RevenueCat's project system will continue to work as before, but we recommend using the new **App specific keys** generated for your existing project."
}
[/block]
# Obtaining API Keys

You can find the API keys for your app under the **API Keys** tab of your project settings in the dashboard. 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/199bb76-Screen_Shot_2021-11-30_at_7.16.47_PM.png",
        "Screen Shot 2021-11-30 at 7.16.47 PM.png",
        1866,
        932,
        "#fafafb"
      ],
      "border": true,
      "sizing": "80",
      "caption": ""
    }
  ]
}
[/block]
Public API keys will be listed under the section **App specific keys**. Secret API keys can be created by selecting the **+ New** button in the top right, and will be listed under the section **Private API keys**. 

You can also find the public API key in your app settings by selecting your app from **Project Settings > Apps**.

If you cannot see your API keys anywhere in the dashboard, it may mean you do not have access to them. Contact the project's owner and make sure you are added as an **Admin**.
[block:callout]
{
  "type": "warning",
  "title": "Only configure the Purchases SDK with your public API key",
  "body": "Never embed secret API keys in your app or website."
}
[/block]
# Keeping Secret API Keys Safe

Secret API keys can be used to make any API request on behalf of your RevenueCat account, such as granting entitlement access and deleting subscribers for your app. You should only create secret API keys if you need to use them and should ensure they are kept out of any publicly accessible areas such as GitHub, client-side code, and so forth.

## Adding and Revoking Secret API Keys

You can create as many secret API keys as you need, and they can be revoked at any time. When a secret API key is revoked, it's invalidated immediately and can no longer make any requests.

# Next Steps

* Get your products ready to purchase by [configuring them in RevenueCat :fa-arrow-right: ](doc:entitlements)
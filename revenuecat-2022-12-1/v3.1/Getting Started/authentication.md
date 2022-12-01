---
title: "Authentication"
slug: "authentication"
excerpt: "Manage your API keys to authenticate with RevenueCat"
hidden: false
metadata: 
  title: "Authentication – RevenueCat"
  description: "RevenueCat authenticates requests from the REST API and Purchases SDK using your app's API keys. All requests must include a valid key. There are also two types of API keys: public and secret."
  image: 
    0: "https://files.readme.io/d44c347-OG_image.png"
    1: "OG image.png"
    2: 1200
    3: 627
    4: "#e9acb0"
createdAt: {}
updatedAt: "2021-06-10T23:12:57.779Z"
---
RevenueCat authenticates requests from the [REST API](https://docs.revenuecat.com/reference) and *Purchases SDK* using your app's API keys. All requests must include a valid key. There are also two types of API keys: public and secret.

- **Public** API keys are meant to make non-potent changes to subscribers, and must be used to configure the *Purchases SDK*.
- **Secret** API keys, prefixed `sk_`, should be kept confidential and only stored on your own servers. Your secret API keys can perform any API request without restriction including deleting subscribers and granting promotional access.

Each app is provided with a public key. Secret keys can be created and deleted by the app [Admins](doc:collaborators).

# Obtaining API Keys

You can find your API Keys in your app's configuration dashboard. 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/6fdd675-Screen_Shot_2021-04-15_at_10.45.03_AM.png",
        "Screen Shot 2021-04-15 at 10.45.03 AM.png",
        1698,
        1006,
        "#f7f7f8"
      ],
      "border": true,
      "sizing": "80"
    }
  ]
}
[/block]
If you cannot see your API keys, it may mean you do not have access to them. Contact the app's owner and make sure you are added as an **Admin**.
[block:callout]
{
  "type": "warning",
  "title": "Only configure Purchases SDK with your Public key",
  "body": "Never embed secret keys in your app or website"
}
[/block]
# Keeping Secret Keys Safe

Your secret API key can be used to make any API call on behalf of your account, such as granting entitlement access and deleting users. You should only create secret keys if you need to use them and ensure they are kept out of any publicly accessible areas such as GitHub, client-side code, and so forth.

## Adding and removing keys
You can create as many secret keys as you need, and secret keys can be deleted at any time. When a secret key is deleted, it's invalidated immediately and can no longer make any requests.

# Next Steps

* Get your products ready to purchase by [configuring them in RevenueCat :fa-arrow-right: ](doc:entitlements)
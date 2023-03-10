---
title: "Stripe (beta)"
slug: "stripe"
excerpt: "Allow your users to subscribe to your app via Stripe"
hidden: false
createdAt: "2018-12-06T22:12:24.305Z"
updatedAt: "2019-02-05T00:58:02.990Z"
---
[block:callout]
{
  "type": "warning",
  "body": "Our Stripe integration is in beta and may change. [Contact us](https://www.revenuecat.com/contact) if you if you're interested in early access.",
  "title": ""
}
[/block]

[block:api-header]
{
  "title": "1. Connect with Stripe"
}
[/block]
Go to [RevenueCat's dashboard](https://app.revenuecat.com) and click the _Connect with Stripe_ button in your app's settings.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/3fa9bfe-Screen_Shot_2018-12-06_at_14.13.48.png",
        "Screen Shot 2018-12-06 at 14.13.48.png",
        641,
        148,
        "#f2f5f9"
      ]
    }
  ]
}
[/block]
Follow the instructions to either create a new account with Stripe, or sign in with your existing one.
[block:callout]
{
  "type": "info",
  "title": "Important note",
  "body": "RevenueCat only requests **read permissions** from Stripe. We will not be able to issue charges on your behalf. You will still maintain full control through the Stripe dashboard."
}
[/block]

[block:api-header]
{
  "title": "2. Create products and plans on Stripe"
}
[/block]
Create your Stripe product using [their billing dashboard](https://dashboard.stripe.com/subscriptions/products). In Stripe, a *product* can have multiple *pricing plans*. These are useful if you want to offer different price points for the same product and work similar to *offerings* and *products* in RevenueCat.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/8154aeb-Screen_Shot_2018-12-06_at_14.26.56.png",
        "Screen Shot 2018-12-06 at 14.26.56.png",
        1104,
        1102,
        "#f6f7fa"
      ]
    }
  ]
}
[/block]
You can read more about **products and plans** in [their official documentation](https://stripe.com/docs/billing/quickstart).
[block:callout]
{
  "type": "info",
  "title": "Important",
  "body": "RevenueCat only supports **per unit** and **recurring quantity** plans. Metered usage and tiers are currently not supported."
}
[/block]

[block:api-header]
{
  "title": "3. Create subscriptions on Stripe"
}
[/block]
The typical setup consists of a website that uses [Stripe checkout](https://stripe.com/payments/checkout) to tokenize the customer payment information, and send this information to your server. After that, your server will be able to subscribe your customer to a product.

On the server-side, you can use [Stripe's REST API](https://stripe.com/docs/api/subscriptions) or their library for your favorite programming language. An example can be found [here](https://stripe.com/docs/billing/quickstart#create-subscription).

Alternatively, you can also use the Stripe dashboard for manually creating the subscriptions for testing. 
[block:callout]
{
  "type": "info",
  "title": "Purchases inside your app",
  "body": "Remember that it is against Apple's App Store terms to provide a different system than in-app purchases for digital goods. Make sure you don't promote your Stripe subscriptions from inside your app. Your app may get rejected, or banned."
}
[/block]

[block:api-header]
{
  "title": "4. Send Stripe tokens to RevenueCat"
}
[/block]
You can send your Stripe subscriptions to RevenueCat through the [POST receipt endpoint](https://docs.revenuecat.com/reference#receipts). 

The only required fields are:
- `fetch_token`: Your Stripe subscription ID.
- `app_user_id`: The same id you use inside your app

**Headers**
- `X-Platform`: Should be set to `stripe`.
- `Authorization`: It should be *Bearer YOUR_REVENUECAT_API_KEY*
[block:api-header]
{
  "title": "5. Add your Stripe products to your app's entitlements"
}
[/block]
RevenueCat will send Stripe subscriptions to your app the same way we do for the other App Stores. Don't forget to add your Stripe products to your app's [entitlements](doc:entitlements) to easily group your products.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/f98cd18-Screen_Shot_2018-12-06_at_15.39.25.png",
        "Screen Shot 2018-12-06 at 15.39.25.png",
        810,
        380,
        "#e6e9ee"
      ]
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "6. Test your Stripe subscriptions"
}
[/block]
You can test your implementation for Stripe and RevenueCat by using [Stripe's test mode](https://stripe.com/docs/testing).

The subscriptions you create using this environment will be considered _sandbox transactions_ in RevenueCat.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/bd33089-Screen_Shot_2018-12-06_at_15.43.52.png",
        "Screen Shot 2018-12-06 at 15.43.52.png",
        228,
        163,
        "#dfe2e8"
      ]
    }
  ]
}
[/block]
---
title: "Web Payments"
slug: "stripe"
excerpt: "Allow your users to subscribe to your app via Stripe"
hidden: false
createdAt: "2018-12-06T22:12:24.305Z"
updatedAt: "2019-10-25T19:04:15.253Z"
---
RevenueCat currently supports web payments through Stripe. This allows you to let users subscribe on your own website, and automatically unlock access to the same subscription content through the *Purchases SDK*.

Remember that it is against Apple's App Store terms to provide a different system than in-app purchases for digital goods. Make sure you don't promote your web subscriptions from inside your app. Your app may get rejected, or banned.

Before launching your Stripe integration, be sure to read the limitations that apply to [working with web payments](doc:stripe#section-working-with-web-payments).
[block:api-header]
{
  "title": "1. Connect with Stripe"
}
[/block]
Go to [RevenueCat's dashboard](https://app.revenuecat.com) and click the _Connect with Stripe_ button in your app's settings. Follow the instructions to either create a new account with Stripe, or sign in with your existing one.
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

[block:callout]
{
  "type": "info",
  "title": "",
  "body": "RevenueCat only requests **read permissions** from Stripe. We will not be able to issue charges on your behalf. You will still maintain full control through the Stripe dashboard."
}
[/block]

[block:api-header]
{
  "title": "2. Create products and plans on Stripe"
}
[/block]
Create your Stripe product(s) using [their billing dashboard](https://dashboard.stripe.com/subscriptions/products). In Stripe, a *product* can have multiple *pricing plans*. These are useful if you want to offer different price points for the same product and work similar to *offerings* and *products* in RevenueCat.
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
  "type": "warning",
  "title": "Important",
  "body": "RevenueCat only supports **per unit** and **recurring quantity** subscription plans. Metered usage and tiers are currently not supported."
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
  "title": "Subscriptions only",
  "body": "Currently, the Stripe integration only supports subscription products."
}
[/block]

[block:api-header]
{
  "title": "4. Add your Stripe products to your app's entitlements"
}
[/block]
Add your Stripe products to your app's [entitlements](doc:entitlements) to easily group your products. RevenueCat will send Stripe subscriptions to your app the same way we do for the other App Stores. 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/ba20f28-Screen_Shot_2019-05-24_at_11.23.51_AM.png",
        "Screen Shot 2019-05-24 at 11.23.51 AM.png",
        812,
        384,
        "#e3eaef"
      ]
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "title": "Product Identifier should be a Stripe product Id",
  "body": "In order for Stripe subscriptions to unlock [entitlements](doc:entitlements), you must set a Product Identifier in the desired Offering to match a Stripe  **product id** exactly."
}
[/block]

[block:api-header]
{
  "title": "5. Send Stripe tokens to RevenueCat"
}
[/block]
You can send your Stripe subscriptions to RevenueCat through the [POST receipt endpoint](https://docs.revenuecat.com/reference#receipts). 

The only required fields are:
- `fetch_token`: Your Stripe subscription ID
- `app_user_id`: The App User ID that the subscription should be applied to

**Headers**
- `X-Platform`: Should be set to `stripe`.
- `Authorization`: It should be `Bearer YOUR_REVENUECAT_API_KEY`

Stripe subscriptions are automatically refreshed by RevenueCat the same way as subscriptions from the app stores. This means that **it may take up to two hours for a Stripe cancellation to be reflected in the RevenueCat backend**. Alternatively, you can re-post the same subscription to RevenueCat after a user has cancelled, and it will be updated right away.
[block:code]
{
  "codes": [
    {
      "code": "curl -X POST \\\n  https://api.revenuecat.com/v1/receipts \\\n  -H 'X-Platform: stripe' \\\n  -H 'Authorization: Bearer YOUR_REVENUECAT_API_KEY' \\\n  -d '{ \"app_user_id\": \"my_app_user_id\",\n  \"fetch_token\": \"sub_xxxxxxxxxx\"\n  }'",
      "language": "curl"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "title": "App User ID is required",
  "body": "In order for a Stripe subscription to be honored within an app, the *Purchases SDK* needs to be configured with the same App User ID associated with the Stripe subscription."
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

[block:api-header]
{
  "title": "Working with web payments"
}
[/block]
Subscription payments through the web are processed with the same logic as subscriptions through the app stores. This means there are currently some limitations that must be considered for web payments to work properly.

## Supported plans
Only **per unit** and **recurring quantity** subscription plans are supported. This is currently how the app stores behave. 

## Upgrading and downgrading
Prorated amounts are not factored into *MRR* or *Revenue* calculations. If someone changes plans, the default behavior in Stripe is to give the user credit for any unused portion and bill them for the remainder of the new plan cost. You need to disable this behavior manually, or by passing the `prorate=false` flag through the Stripe API for accurate revenue calculations in RevenueCat.

## Cancellations
When a subscription is cancelled in Stripe, you have two options:
1. Immediate cancellation: The subscription is cancelled immediately, with the option to pro-rate or not.
2. Cancellation at the end of the period: The subscription is cancelled at the end of the current billing period (this is how the app stores behave).

Both options are supported by RevenueCat, but the *MRR* and *Revenue* calculations will only be accurate in the first case (immediate cancellation) if you choose **not** to prorate. **Also, refunds in Stripe are not accounted for in RevenueCat.**

Cancellations in Stripe are automatically detected by RevenueCat the same way as subscriptions from the app stores. This means there may be up to a two-hour delay between when the subscription is cancelled in Stripe and when the cancellation is reflected in the RevenueCat backend.
[block:callout]
{
  "type": "success",
  "title": "That's it!",
  "body": "You can now allow user's to subscribe from the web or within your app, and let them access their subscription anywhere."
}
[/block]
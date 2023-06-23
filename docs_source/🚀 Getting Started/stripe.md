---
title: Stripe Web Payments
slug: stripe
excerpt: Allow your users to subscribe to your app via Stripe
hidden: false
---
RevenueCat currently supports web payments through Stripe. This allows you to let users subscribe on your own website using Stripe, and automatically unlock access based on the Stripe subscription through the _Purchases SDK_.

Remember that it is against Apple's App Store terms to provide a different system than in-app purchases for digital goods. Make sure you don't promote your web subscriptions from inside your app. Your app may get rejected, or banned.

Before launching your Stripe integration, be sure to read the limitations that apply to [working with web payments](doc:stripe#section-working-with-web-payments).

# 1. Connect with Stripe

Log into [RevenueCat](https://app.revenuecat.com/settings/account) and click the _Connect with Stripe_ button in your account settings. Install the RevenueCat Stripe App either by creating a new account with Stripe or sign in with your existing one. Finalize setting up the connection between Stripe and RevenueCat in the RevenueCat Stripe App. RevenueCat only requests the permissions from Stripe found [here](https://marketplace.stripe.com/apps/revenuecat). We will not be able to issue charges on your behalf. You will still maintain full control through the Stripe dashboard.

![](https://files.readme.io/9decad9-Screen_Shot_2021-12-01_at_11.25.42_AM.png "Screen Shot 2021-12-01 at 11.25.42 AM.png")

![](https://files.readme.io/f439ec3-Screen_Shot_2022-07-07_at_9.25.36_AM.png "Screen Shot 2022-07-07 at 9.25.36 AM.png")

![](https://files.readme.io/fac6fcb-Screen_Shot_2022-07-07_at_2.17.30_PM.png "Screen Shot 2022-07-07 at 2.17.30 PM.png")

> 📘 Project owner must connect with Stripe
> 
> Only the owner of the RevenueCat project can connect a Stripe account for their apps - no [collaborators](doc:collaborators) will be able to add or remove a Stripe connection.

# 2. Create products and plans on Stripe

Create your Stripe product(s) using [their billing dashboard](https://dashboard.stripe.com/subscriptions/products). In Stripe, a _product_ can have multiple _pricing plans_. These are useful if you want to offer different price points for the same product and work similar to _offerings_ and _products_ in RevenueCat.

![](https://files.readme.io/8154aeb-Screen_Shot_2018-12-06_at_14.26.56.png "Screen Shot 2018-12-06 at 14.26.56.png")

You can read more about **products and plans** in [their official documentation](https://stripe.com/docs/billing/quickstart).

> 🚧 Important
> 
> RevenueCat only supports **per unit** and **recurring quantity** subscription plans. Metered usage and tiers are currently not supported.

# 3. Create subscriptions on Stripe

The typical setup consists of a website that uses [Stripe checkout](https://stripe.com/payments/checkout) to tokenize the customer payment information, and send this information to your server. After that, your server will be able to subscribe your customer to a product.

On the server-side, you can use [Stripe's REST API](https://stripe.com/docs/api/subscriptions) or their library for your favorite programming language. An example can be found [here](https://stripe.com/docs/billing/quickstart#create-subscription).

Alternatively, you can also use the Stripe dashboard for manually creating the subscriptions for testing. 

> 📘 Using Checkout Sessions?
> 
> [Ensure your session creates a Stripe Customer](https://stripe.com/docs/api/checkout/sessions/create#create_checkout_session-customer_creation) by setting `customer_creation` to `always`.

# 4. Add your Stripe products to your project's entitlements

Add your Stripe products to your project's [entitlements](doc:entitlements) to easily group the products for your app. RevenueCat will send Stripe subscriptions to your app the same way we do for the other app stores. 

![](https://files.readme.io/fd4e1ab-Screen_Shot_2021-12-01_at_11.23.21_AM.png "Screen Shot 2021-12-01 at 11.23.21 AM.png")

> 📘 Product Identifier should be a Stripe product ID
> 
> In order for Stripe subscriptions to unlock [entitlements](doc:entitlements), you must set a Product Identifier in the desired Offering to match a Stripe  **product ID** exactly.

# 5. Send Stripe tokens to RevenueCat

You can send your Stripe subscriptions to RevenueCat through the [POST receipt endpoint](https://docs.revenuecat.com/reference#receipts). If you are using Stripe Checkout, you should send the subscription after the checkout.session.completed event.

The only required fields are:

- `fetch_token`: Your Stripe subscription ID (`sub_...`) OR your Stripe Checkout Session ID
- `app_user_id`: The App User ID that the subscription should be applied to

**Headers**

- `X-Platform`: Should be set to `stripe`.
- `Authorization`: It should be `Bearer YOUR_REVENUECAT_STRIPE_APP_PUBLIC_API_KEY`

Stripe subscriptions are automatically refreshed by RevenueCat the same way as subscriptions from the app stores. This means that **it may take up to two hours for a Stripe cancellation to be reflected in the RevenueCat backend**. Alternatively, you can re-post the same subscription to RevenueCat after a user has cancelled, and it will be updated right away.

> 👍 One-time Stripe purchases supported
> 
> RevenueCat supports one-time purchases as well as subscription purchases through Stripe. 
> 
> One-time purchases require using Stripe Checkout, and you'll need to send us the Checkout Session ID as the fetch_token. Additionally, you'll need to use Stripe's [Prices](https://stripe.com/docs/api/prices) objects as [SKU's](https://stripe.com/docs/api/skus) are not supported. RevenueCat supports both one-time purchases and subscriptions made through Stripe Checkout.

[block:file]
{"language":"curl","name":"","file":"code_blocks/🚀 Getting Started/stripe_1.curl"}
[/block]

> 📘 App User ID is required
> 
> In order for a Stripe subscription to be honored within an app, the _Purchases SDK_ needs to be configured with the same App User ID associated with the Stripe subscription.

# 6. Test your Stripe subscriptions

You can test your implementation for Stripe and RevenueCat by using [Stripe's test mode](https://stripe.com/docs/testing).

The subscriptions you create using this environment will be considered _sandbox transactions_ in RevenueCat.

![](https://files.readme.io/bd33089-Screen_Shot_2018-12-06_at_15.43.52.png "Screen Shot 2018-12-06 at 15.43.52.png")

> ❗️ Stripe Test Clocks not fully supported
> 
> Stripe allows using [test clocks](https://stripe.com/docs/billing/testing/test-clocks) to manipulate how subscriptions move through time. Since using test clocks lead to time divergences between Stripe and RevenueCat, data may not be accurately reflected in RevenueCat when using Stripe test clocks.

# Working with web payments

Subscription payments through the web are processed with the same logic as subscriptions through the app stores. This means there are currently some limitations that must be considered for web payments to work properly.

> 👍 Coupons are supported
> 
> Pricing in RevenueCat [Charts](doc:charts) and [customer events](doc:customer-history)  will reflect any coupons applied to a Stripe purchase.

## Supported subscription plans

Only **Package Pricing** and **Standard Pricing** subscription plans with **per unit** pricing are supported. Metered usage and tiers are currently not supported. This is currently how the app stores behave. 

## Upgrading and downgrading

Prorated amounts are not factored into _MRR_ or _Revenue_ calculations. If someone changes plans, the default behavior in Stripe is to give the user credit for any unused portion and bill them for the remainder of the new plan cost. You need to disable this behavior manually, or by passing the `prorate=false` flag through the Stripe API for accurate revenue calculations in RevenueCat.

## Cancellations

When a subscription is cancelled in Stripe, you have two options:

1. Immediate cancellation: The subscription is cancelled immediately, with the option to pro-rate or not.
2. Cancellation at the end of the period: The subscription is cancelled at the end of the current billing period (this is how the app stores behave).

Both options are supported by RevenueCat, but the _MRR_ and _Revenue_ calculations will only be accurate in the first case if you choose **not** to prorate.

Cancellations in Stripe are automatically detected by RevenueCat the same way as subscriptions from the app stores. This means there may be up to a two-hour delay between when the subscription is cancelled in Stripe and when the cancellation is reflected in the RevenueCat backend.

## Billing Issues

When a customer encounters an issue with their payment, RevenueCat will generate a billing issue event in the RevenueCat [Customer History](https://docs.revenuecat.com/docs/customer-history). If all retries for a payment fails, you have three options:

1. cancel the subscription: RevenueCat will **revoke access**.
2. mark the subscription as unpaid: RevenueCat will **revoke access**.
3. leave the subscription as-is: RevenueCat **will not revoke access**.

You can find these options, along with your Retry schedule, in your Stripe dashboard under **Settings > Billing > Subscriptions and email > Manage failed payments**.

If you are expecting a billing issue event, it may take a few hours for the RevenueCat dashboard to display the event. Note that we will only generate the billing issue event once and we do not generate new ones when subsequent retries fail.

> 👍 That's it!
> 
> You can now allow users to subscribe from the web or within your app, and let them access their subscription anywhere.
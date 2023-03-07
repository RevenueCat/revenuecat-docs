---
title: "🔢 Support First Steps"
slug: "support-first-steps"
excerpt: "We can help, but we need your help first."
hidden: false
createdAt: "2022-10-13T20:24:32.602Z"
updatedAt: "2023-01-04T15:42:45.629Z"
---
# Contacting Support

When contacting support, it's extremely important that you provide enough information for the team to help out. This includes:

1. **User IDs.** If you don't provide example [user IDs](doc:identifying-users), but you're asking about a specific user, we aren't going to be able to be of much help. Please provide this to reduce the need for us to ask (and we will ask! 😄)
2. **Debug logs.** If you have an SDK-related issue, it's critical we have the [logs](https://www.revenuecat.com/docs/debugging) that our SDK prints **from the start of your app, through the end of the issue you're experiencing**.
3. **Be descriptive.** We need you to be as descriptive as possible about the issue you're facing. We receive a lot of questions, and if we don't have enough information we're going to be requesting more. This causes unnecessary back and forth, and delays the answer you're looking for.

# Before reaching out..

Our documentation (you're already here!) answers a lot of questions about Charts, the dashboard, Customer Lists, and SDK setup. Try looking through here first.

You can also use this list of common questions before reaching out to support:

## ➡️ Products or Offerings can't be fetched, or Offerings are empty

If you can't fetch products, or your offerings are empty, this is nearly always a configuration issue. We have a guide detailing next steps [in our community here](https://community.revenuecat.com/sdks-51/why-are-offerings-or-products-empty-124 ).

Here's how it works under the hood:
1. Products are configured in each store
2. Product identifiers are added to your offering configuration in the RevenueCat dashboard
3. The RevenueCat SDK fetches the configuration from the RevenueCat API
4. The SDK requests the products in the configuration from the stores directly
5. The stores return the valid products from that request

If the stores are unable to return valid products, it means that somewhere in that cycle there is a configuration issue. If there is a typo in your product identifier, the request will fail. If the bundle ID doesn't match the configuration in App Store Connect (or package name for Google Play, etc.), the request will fail. The guide linked above details the potential configuration issues.

## ➡️ A user lost access to their purchases

If a user lost access to their purchases, then it is likely that:
1. The user's identifier changed (via re-installation, created a new account, etc.). This is very common, and should be an expected part of your app's flow. This can happen automatically at times, like after a re-install of your app. (See [Identifying Users](doc:identifying-users).)
2. Another user with the same underlying store account claimed the purchases (see question below).
3. The user's subscription purchases expired (in this case, they should re-purchase).

If a user has active purchases that are no longer synced to their user ID or they have lost access, they need to **[restore purchases](doc:restoring-purchases)**. **You should always have a restore purchases button in your app** - typically located in your paywall or in-app settings page to make it easy for your users to find the option.

Restoring purchases will re-sync the user's purchase with the currently identified user ID and re-unlock any entitlements that have been lost due to a changed user ID.

## ➡️ A user's purchases were mistakenly transferred

If a user's purchases were transferred, it means that a different user ID *claimed* the transactions or purchases that another user in RevenueCat already owned. When we detect this, we perform a *transfer* so that the user can continue accessing purchases on the device they are currently logged into.

While this may seem unexpected at times, this is **extremely common**, and is a valid case for apps with subscriptions. Since the transactions are actually associated to the **underlying store account**, when a user claims a receipt that is already owned by another user ID it means that:
1. The user is logged into the underlying store account, indicating ownership of those purchases.
2. The user is attempting to restore those purchases from a different app user ID than the one that already owns the purchases. 

For more information on transfers, and how to prevent it from occurring in certain cases, see: [Restoring Purchases](doc:restoring-purchases).

## ➡️ Revenue data in RevenueCat doesn't match the real revenue data for individual transactions

Revenue and pricing data in RevenueCat uses a **best-effort** approach. Stores like the App Store and Google Play don't allow developers to see individual prices for transactions, so RevenueCat infers transaction prices based on the price of the product when it was originally purchased.

If you **change prices** of your products in App Store Connect or Google Play, revenue data in RevenueCat will be off by a larger margin. For this reason, we almost always recommend creating a new product instead.

In truth, the only **real** metric of earnings is the actual payout amounts that each payment processor (the stores) deposits into your account. You should use revenue metrics in RevenueCat's dashboard to track trends, but for accounting purposes we recommend using the actual store payout reports.

## ➡️ Metrics that I'm seeing in RevenueCat don't match App Store Connect, Google Play, etc.

RevenueCat metrics (active subscriptions, active trials, etc.) are generated based on *the synced receipts we have for your users*. If those receipts/transactions aren't synced to RevenueCat, they **won't** be included in Charts or other RevenueCat metrics. This is expected behavior.

If your app sold in-app purchases before implementing the RevenueCat SDK, it's very likely these metrics won't align until every single one of your previous users updates their app to a version with the RevenueCat SDK, and has their transactions synced.

## ➡️ I see an event in RevenueCat, but it wasn't sent to webhooks or my own integration!

Missing events are often a configuration issue. Most third-party integrations that we support require additional configuration before events will be sent; if that configuration hasn't been completed, events won't be dispatched to the third-party provider.

For example, many integrations require a [Subscriber Attribute](doc:subscriber-attributes) to be set on each user before events can be dispatched. Ensure that this value (typically from the third-party SDK) is set on a user before contacting support.

## ➡️ My app was rejected because of RevenueCat!

Rest assured, thousands of apps are powered by RevenueCat and the SDK does not cause rejections on its own. Typically, rejections are due to:
1. Missing products when submitting for review (a common, easy to miss issue when submitting a new build).
2. Apple's sandbox environment being flaky (API downtime, missing products, missing transactions, etc.)

Since the App Store reviewers use this flaky sandbox environment, and aren't typically aware of downtime as keenly as RevenueCat is (we track it on [our status page](https://status.revenuecat.com)), they often reject apps as if it is the fault of the developer.
[block:callout]
{
  "type": "info",
  "body": "RevenueCat Support can explain error messages or help you troubleshoot reproducible issues but we don't have other ways of expediting the review process."
}
[/block]
Sometimes, the reviewer will provide you with "Next Steps" to resolve the rejection. These are usually not the most helpful in pinpointing any issues with purchases. One of the more common reasons is shown below:

> When validating receipts on your server, your server needs to be able to handle a production-signed app getting its receipts from Apple’s test environment. The recommended approach is for your production server to always validate receipts against the production App Store first. If validation fails with the error code "Sandbox receipt used in production," you should validate against the test environment instead.

If you're using RevenueCat, sandbox and production purchases are automatically handled so even if the reviewer provides you with this reason, **it's simply incorrect.** You'll need to likely resubmit your app for review (some developers have had to do this up to a dozen times before being approved).

For more information, see [App Store Rejections](doc:app-store-rejections).
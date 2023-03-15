---
title: App Store Rejections
slug: app-store-rejections
excerpt: Your app was rejected. Now what?
hidden: false
metadata:
  title: App Store rejection reasons & fixes – RevenueCat
  description: Your app is finally complete! But, after a few days in review, you
    get the dreaded 'Rejected' message. Now what? Let's work through some common rejection
    reasons and the best way to get your app back on track.
  image:
    0: https://files.readme.io/6fb2e64-RevenueCat_Docs_OG.png
    1: RevenueCat Docs OG.png
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: '2020-06-10T15:10:23.774Z'
updatedAt: '2022-07-11T14:45:58.663Z'
category: 640a7bf096064f005a3e667a
---
[block:callout]
{
  "type": "info",
  "body": "RevenueCat support can explain error messages or help you troubleshoot reproducible issues but don't have other ways of expediting the review process."
}
[/block]
Your app is finally complete! 🎉 You're tracking subscriptions in Sandbox, your Testflight users love it, you've followed our [Launch Checklist](https://docs.revenuecat.com/docs/launch-checklist), and you're finally ready to launch your app to the world.

After a few days in review, you get the dreaded 'Rejected' message. Now what? Let's work through some common rejection reasons and the best way to get your app back on track.

# Understanding the rejection reason

According to Apple's [App Review Center](https://developer.apple.com/app-store/review/), over 40% of app rejections are for [Guideline 2.1 – Performance: App Completeness](https://developer.apple.com/app-store/review/guidelines/#app-completeness) - this means that something didn't work in your app during review. We can't help with those rejections, obviously.

If you're here, we'll assume that your app was rejected for some problem with purchases. There are three places in the purchase flow that cause the majority of App Store rejections we hear about:

1. Issues fetching products
2. Error during purchase
3. Content not unlocked after purchase

Usually the reviewer will include a screenshot with the problem they encountered. This can be helpful for you to track down where to look for the problem in your app. Always try to reproduce the issue first in a local build or Testflight. RevenueCat will behave the same way in your environment and the reviewers, so if there's any problem with your integration it should be able to be reproduced.

# Issues fetching products

Often times, purchases will work fine in Sandbox and Testflight, but App Store Review will not be able to fetch products. It's important to ensure that you are submitting your in-app purchases with your app for review. If an app has not previously had in-app purchases approved on the App Store, an option to submit them will appear on the main app version page.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/bec1d0d-Screen_Shot_2020-06-10_at_1.17.23_PM.png",
        "Screen Shot 2020-06-10 at 1.17.23 PM.png",
        2518,
        1634,
        "#fbfcfd"
      ],
      "border": true,
      "caption": "Don't forget to submit the products with the first version of your app containing in-app purchases"
    }
  ]
}
[/block]
To see this option, you must first fill in all required metadata so that the status of any in-app purchases you intend to use is 'Ready to Submit'.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/e823df0-Screen_Shot_2020-06-10_at_1.33.58_PM.png",
        "Screen Shot 2020-06-10 at 1.33.58 PM.png",
        2522,
        846,
        "#f9fafc"
      ],
      "caption": "Make sure any in-app purchases you intend to use are \"Ready to Submit\"."
    }
  ]
}
[/block]
If you've already released a version of your app containing in-app purchases, you can create new products in App Store Connect without having to release an update to your app. You'll have to submit new products for review independently of a new app version, and they must be in the 'Approved' state before they'll be available for purchase.

If you're having trouble fetching products in Testflight or a local build, see our community article on [the most common reasons this occurs](https://community.revenuecat.com/featured-articles-55/app-rejections-86). 
[block:callout]
{
  "type": "info",
  "title": "Re-submit for review",
  "body": "If you're able to test purchases on your device successfully but App Review runs into issues fetching products, it's likely an issue with their environment. There isn't much you can do in these cases- some users have had to re-submit the same build up to a dozen times before being approved."
}
[/block]
# Error during purchase

If an error occurs during the purchase process, it will be one of the errors outlined in our [Error Handling guide here](https://docs.revenuecat.com/docs/errors). Understanding what error triggered the rejection is the only way to make sure the issue gets resolved. 

If the reviewer provides a screenshot of an error popup - use that to help track down the issue. RevenueCat itself will never display a user-facing popup or error message, so look through your app to find the code that triggered the alert and work backwards to determine the error message.

## "Cannot connect to iTunes Store"

This is actually the generic error message Apple uses for all [SKErrors](https://developer.apple.com/documentation/storekit/skerror) and not an error message from RevenueCat. See our [guide on Error Handling](https://docs.revenuecat.com/docs/errors) for more info.

## STORE_PROBLEM - "There was a problem with the App Store"

This is the most common error from RevenueCat that can lead to unexplained App Store rejections. Unfortunately, this error occurs when Apple's sandbox environment is down and unable to verify purchases. The best course of action here is usually to re-submit your binary or try to explain the situation to the reviewer.

There are momentary outages in sandbox from time-to-time, but occasionally outages [can last for days at a time](https://status.revenuecat.com/incidents/6y3tfs3fyxb7). We'll do our best to flag major outages on our status page at [status.revenuecat.com](https://status.revenuecat.com).

# Content not unlocked after purchase

Your app could also get rejected even if there are no issues during the purchase process, but the content does not get unlocked after purchasing. You should be able to reproduce this issue in a test environment.

Double check that you're [checking the subscription status correctly](https://docs.revenuecat.com/docs/purchaserinfo) and all of the [products are added to Entitlements](https://docs.revenuecat.com/docs/entitlements) as needed.

# Other Tips

## Reviewer provided "Next Steps"

Sometimes, the reviewer will provide you with "Next Steps" to resolve the rejection. These are usually not the most helpful in pinpointing any issues with purchases. One of the more common reasons is shown below:

> When validating receipts on your server, your server needs to be able to handle a production-signed app getting its receipts from Apple’s test environment. The recommended approach is for your production server to always validate receipts against the production App Store first. If validation fails with the error code "Sandbox receipt used in production," you should validate against the test environment instead.

If you're using RevenueCat, sandbox and production purchases are automatically handled so even if the reviewer provides you with this reason, it's simply incorrect.

## My app is live - but purchases are broken!

When an app is launched for the first time **or when new products are created for an existing app** it can take 24 hours for purchases to work on the App Store and the app/update might show up hours before the products can be purchased. This is simply due to App Store propagation times – App Store data must be replicated to hundreds of servers around the world and this is apparently a slow, error-prone process for the App Store.

Once your app/update is 'Ready for Sale' your products should be available for purchase soon, but be prepared for it to take up to 24 hours. We recommend releasing the app at least 24 hours before mentioning the app publicly or kicking off any marketing efforts.

Just to be sure there's nothing wrong in the production environment, you can also follow this guide to [testing in the production environment prior to releasing an app](https://www.revenuecat.com/blog/the-ultimate-guide-to-subscription-testing-on-ios#production).
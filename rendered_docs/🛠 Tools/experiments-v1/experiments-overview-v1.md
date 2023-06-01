---
title: Experiments Overview
slug: experiments-overview-v1
hidden: false
createdAt: '2022-10-13T18:43:40.091Z'
updatedAt: '2023-03-01T21:04:14.252Z'
category: 6478b863220f0f117e2e3cb3
---
Experiments allow you to answer questions about your users' behaviors and app's business by A/B testing two offerings in your app and analyzing the full subscription lifecycle to understand which variant is producing more value for your business.

While price testing is one of the most common forms of A/B testing in mobile apps, Experiments are based on RevenueCat Offerings, allowing you A/B test more than just prices, including: trial length, subscription length, different groupings of products, etc.

[block:callout]
{
  "type": "info",
  "body": "Experiments is available to Pro & Enterprise customers. [Learn more about pricing here](https://www.revenuecat.com/pricing/)."
}
[/block]

[block:api-header]
{
  "title": "How does it work?"
}
[/block]
After configuring the two Offerings you want and adding them to an Experiment, RevenueCat will randomly assign users to a cohort where they will only see one of the two Offerings. Everything is done server-side, so no changes to your app are required if you're already displaying the `current` offering in your app! If you need help making your paywall more dynamic, see [Displaying Products](doc:displaying-products). The [Swift sample app](https://github.com/RevenueCat/purchases-ios/tree/main/Examples) has an example of a [dynamic paywall](https://github.com/RevenueCat/purchases-ios/blob/main/Examples/MagicWeather/MagicWeather/Sources/Controllers/PaywallViewController.swift) that is Experiments-ready. Dynamic paywall examples in other languages can be found within our other [sample apps](https://www.revenuecat.com/docs/sample-apps) as well.
[block:callout]
{
  "type": "info",
  "title": "",
  "body": "To learn more about creating a new Offering to test, and some tips to keep in mind when creating new Products on the stores, [check out our guide here](doc:creating-offerings-to-test)."
}
[/block]

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/34bba5f-ab-test.png",
        "ab-test.png",
        661,
        722,
        "#000000"
      ],
      "caption": ""
    }
  ]
}
[/block]
As soon as a customer is enrolled in an experiment, they'll be included in the "Customers" count on the Experiment Results page, and you'll see any trial starts, paid conversions, status changes, etc. represented in the corresponding metrics. (Learn more [here](doc:experiments-results-v1))
[block:api-header]
{
  "title": "Implementation steps"
}
[/block]
**Experiments requires you to use offerings and have a dynamic paywall in your app that displays the current offering.** While Experiments will work with iOS and Android SDKs 3.0.0+, it is recommended to use these versions:
[block:parameters]
{
  "data": {
    "0-0": "iOS",
    "0-1": "3.5.0+",
    "1-0": "Android",
    "1-1": "3.2.0+",
    "2-0": "Flutter",
    "3-0": "React Native",
    "4-0": "Cordova",
    "5-0": "Unity",
    "3-1": "3.3.0+",
    "4-1": "1.2.0+",
    "2-1": "1.2.0+",
    "5-1": "2.0.0+",
    "h-0": "SDK",
    "h-1": "Version"
  },
  "cols": 2,
  "rows": 6
}
[/block]
If you meet these requirements, you can start using Experiments without any app changes! If not, take a look at [Displaying Products](doc:displaying-products). The [Swift sample app](https://github.com/RevenueCat/purchases-ios/tree/master/Examples/SwiftExample) has an example of a dynamic paywall that is Experiments-ready.

**Implementation Overview**

1. Create two offerings that you want to test (make sure your app displays the `current` offering.) You can skip this step if you already have the offerings you want to test.
2. Create an Experiment and choose the two offerings to test.
3. Run your experiment and monitor the results. There is no time limit on experiments, so stop it when you feel confident choosing an outcome. (Learn more about interpreting your results [here](doc:experiments-results-v1))
4. Once you’re satisfied with the results you can set the winning offering, if any, as current manually.
5. Then, you're ready to run a new experiment.
[block:api-header]
{
  "title": "Tips for Using Experiments"
}
[/block]
**Decide how long you want to run your experiments**

There’s no time limit on tests. Consider the timescales that matter for you. For example, if comparing monthly vs yearly, yearly might outperform in the short term because of the high short term revenue, but monthly might outperform in the long term.

Keep in mind that if the difference in performance between your variants is very small, then the likelihood that you're seeing statistically significant data is lower as well. "No result" from an experiment is still a result: it means your change was likely not impactful enough to help or hurt your performance either way.
[block:callout]
{
  "type": "info",
  "title": "",
  "body": "You can’t restart a test once it's been stopped."
}
[/block]
** Test only one variable at a time**

It's tempting to try to test multiple variables at once, such as free trial length and price; resist that temptation! The results are often clearer when only one variable is tested. You can run more tests for other variables as you further optimize your LTV.

** Bigger changes will validate faster**

Small differences ($3 monthly vs $2 monthly) will often show ambiguous results and may take a long time to show clear results. Try bolder changes like $3 monthly vs $10 monthly to start to triangulate your optimal price.

** You can run only one test at a time**

If you want to run another test, you must stop the one currently running. You can, however, create as many tests as you need.

** Running a test with a control**

Sometimes you want to compare a different offering to the one that is already current. If so, you can set one of the variants to the offering that is currently used in your app.

** Run follow-up tests after completing one test**

After you run a test and find that one offering won over the other, try running another test comparing the winning offering against another similar offering. This way, you can continually optimize for lifetime value (LTV). For example, if you were running a price test between a $5 product and a $7 product and the $7 offering won, try running another test between a $8 product and the $7 winner to find the optimal price for the product that results in the highest LTV.
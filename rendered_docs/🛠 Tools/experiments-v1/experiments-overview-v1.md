---
title: Experiments Overview
slug: experiments-overview-v1
hidden: false
categorySlug: tools
order: 0
parentDoc: 648c7ee8b319ba05991ce60c
---
Experiments allow you to answer questions about your users' behaviors and app's business by A/B testing two offerings in your app and analyzing the full subscription lifecycle to understand which variant is producing more value for your business.

While price testing is one of the most common forms of A/B testing in mobile apps, Experiments are based on RevenueCat Offerings, allowing you A/B test more than just prices, including: trial length, subscription length, different groupings of products, etc.

Plus, by attaching metadata to your offerings and programming your paywall to be responsive to it, you can remotely test any aspect of your paywall. [Learn more here](https://www.revenuecat.com/docs/offering-metadata).

> 📘 
> 
> Experiments is available to Pro & Enterprise customers. [Learn more about pricing here](https://www.revenuecat.com/pricing/).

## How does it work?

After configuring the two Offerings you want and adding them to an Experiment, RevenueCat will randomly assign users to a cohort where they will only see one of the two Offerings. Everything is done server-side, so no changes to your app are required if you're already displaying the `current` offering in your app! 

> 🚧 
> 
> Programmatically displaying the `current` offering in your app when you fetch offerings is **required** to ensure customers are evenly split between variants.

If you need help making your paywall more dynamic, see [Displaying Products](doc:displaying-products). The [Swift sample app](https://github.com/RevenueCat/purchases-ios/tree/main/Examples) has an example of a [dynamic paywall](https://github.com/RevenueCat/purchases-ios/blob/main/Examples/MagicWeather/MagicWeather/Sources/Controllers/PaywallViewController.swift) that is Experiments-ready. Dynamic paywall examples in other languages can be found within our other [sample apps](https://www.revenuecat.com/docs/sample-apps) as well.

> 📘 
> 
> To learn more about creating a new Offering to test, and some tips to keep in mind when creating new Products on the stores, [check out our guide here](doc:creating-offerings-to-test).

![](https://files.readme.io/34bba5f-ab-test.png "ab-test.png")

As soon as a customer is enrolled in an experiment, they'll be included in the "Customers" count on the Experiment Results page, and you'll see any trial starts, paid conversions, status changes, etc. represented in the corresponding metrics. (Learn more [here](doc:experiments-results-v1))

> 📘 
> 
> We recommend identifying customers _before_ they reach your paywall to ensure that one unique person accessing your app from two different devices is not treated as two unique anonymous customers.

## Implementation steps

**Experiments requires you to use offerings and have a dynamic paywall in your app that displays the current offering.** While Experiments will work with iOS and Android SDKs 3.0.0+, it is recommended to use these versions:

| SDK          | Version |
| :----------- | :------ |
| iOS          | 3.5.0+  |
| Android      | 3.2.0+  |
| Flutter      | 1.2.0+  |
| React Native | 3.3.0+  |
| Cordova      | 1.2.0+  |
| Unity        | 2.0.0+  |

If you meet these requirements, you can start using Experiments without any app changes! If not, take a look at [Displaying Products](doc:displaying-products). The [Swift sample app](https://github.com/RevenueCat/purchases-ios/tree/master/Examples/SwiftExample) has an example of a dynamic paywall that is Experiments-ready.

**Implementation Overview**

1. Create two offerings that you want to test (make sure your app displays the `current` offering.) You can skip this step if you already have the offerings you want to test.
2. Create an Experiment and choose the two offerings to test.
3. Run your experiment and monitor the results. There is no time limit on experiments, so stop it when you feel confident choosing an outcome. (Learn more about interpreting your results [here](doc:experiments-results-v1))
4. Once you’re satisfied with the results you can set the winning offering, if any, as current manually.
5. Then, you're ready to run a new experiment.

## Tips for Using Experiments

**Decide how long you want to run your experiments**

There’s no time limit on tests. Consider the timescales that matter for you. For example, if comparing monthly vs yearly, yearly might outperform in the short term because of the high short term revenue, but monthly might outperform in the long term.

Keep in mind that if the difference in performance between your variants is very small, then the likelihood that you're seeing statistically significant data is lower as well. "No result" from an experiment is still a result: it means your change was likely not impactful enough to help or hurt your performance either way.

> 📘 
> 
> You can’t restart a test once it's been stopped.

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
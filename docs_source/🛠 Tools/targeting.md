---
title: Targeting
slug: targeting
excerpt: Define audiences to target with unique Offerings
hidden: true
---
Targeting allows you to create rules for serving distinct audiences their own Offering. Instead of having a single Current Offering that all customers receive, you can instead create a cascading sequence of rules to deliver different Offerings to each audience that you define.

This allows you to create paywall experiences that are tailored to each of your audiences so you can make an effective pitch for your product and maximize lifetime value.

## Terminology

| Term             | Definition                                                                                                                                                                                                             |
| :--------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Offering         | The set of Packages, metadata, and an optional paywall UI you can create to remotely control your paywall experience.                                                                                                  |
| Current Offering | The Offering that is set as "Current" in the RevenueCat Dashboard. We recommend designing your app so that the paywall always shows the Current Offering so that you can remotely control which Offering is presented. |
| Targeting        | The ability to assign a distinct Offering to a distinct audience of customers based on Targeting Rules you create.                                                                                                     |
| Targeting Rule   | A collection of conditions that, when they are true for a given customer, will result in that customer matching the rule and being served the corresponding Offering.                                                  |
| Conditions       | The filters such as App, Country, and App Version that can be used to construct a Targeting Rule.                                                                                                                      |
| Live             | The Targeting Rules that are actively being used to determine which customers which receive Offerings, as determined by their conditions, assessed in order from top to bottom.                                        |
| Inactive         | The Targeting Rules that are not actively being used. These may be drafts, rules you previously used,  rules you intend to set live in the future, etc.                                                                |

## How Targeting works

Before you setup any Targeting Rules, if you use Offerings, here's how they're returned in your app:

1. RevenueCat is initialized
2. Offerings are fetched
3. Your list of Offerings is returned, along with the identifier of your **Current Offering**

As long as your app is setup to display the Current Offering on your paywall, then you can change that Offering at any time from our Dashboard, or run an Experiment to serve two different Offerings to specific audiences.

Once you setup Targeting Rules, you unlock an additional level of customization, because the **Current Offering** that gets returned for each customer will be based on the Rule they qualify for. For example:

1. RevenueCat is initialized
2. Offerings are fetched
3. Your list of Offerings is returned, along with the identifier of the Offering for the first rule that the customer matched as the **Current Offering** for that customer
   1. If the customer does not match any specified rules, the **Current Offering** will be set as your default Offering

> 📘 
> 
> Think of your "default Offering" just like your "Current Offering" if you have no Targeting Rules setup. It's the Offering that will get served if no other rules apply.

When determining which (if any) Targeting Rule a customer matches, we'll assess them from top to bottom as you've ordered them in the Dashboard.

## Creating & Ordering Targeting Rules

First, navigate to "Targeting" in the "Monetization tools" section of your Project Settings. Then click on "Create a New Rule" to begin.

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/8fa325b-Create_a_new_rule_w_highlight.png",
        null,
        ""
      ],
      "align": "center"
    }
  ]
}
[/block]


Then, create your rule by:

1. Entering a Display name
2. Selecting your desired conditions (learn more about conditions here)
3. Selecting an Offering to display when those conditions are met
4. Selecting your desired State for the rule

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/bce5dfd-Ready_to_save_w_highlight.png",
        "",
        ""
      ],
      "align": "center"
    }
  ]
}
[/block]


Once you've entered all of the required fields for your rule, click "Save". If you've set the rule as "Inactive", you'll be taken to that list. If you've set the rule as "Live", you'll be taken to that list and prompted to order it.

> 📘 Targeting Rule States
> 
> When setting a rule to be Live, if you have at least 1 existing rule you'll be prompted to order them. Ordering is used to determine which rule will take precedence if an individual customer may match multiple rules.
> 
> If you don't save your changes when ordering your new Live rule, we'll automatically place that rule at the bottom of the list so that it's served to the narrowest possible audience until you reorder it.

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/f18a508-Ordering.png",
        "",
        ""
      ],
      "align": "center"
    }
  ]
}
[/block]


> 📘 
> 
> Live rules can be reordered at any time.

## Editing, deleting, and more

Rules can also be edited, deleted, or made inactive at any time if you need to modify how Offerings are being served to your customers.

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/41120c1-Rule_actions.png",
        "",
        ""
      ],
      "align": "center"
    }
  ]
}
[/block]


In addition, if you're looking to add a new rule that's similar to an existing one, you can start by duplicating that rule and then making the desired modifications to the rule conditions.

## Learn more about conditions

### Definitions

[block:parameters]
{
  "data": {
    "h-0": "Dimension",
    "h-1": "Definition",
    "0-0": "Country",
    "0-1": "The storefront a customer is currently using on supported SDK versions\\*, or their geolocation otherwise.  \n  \n\\*Available on iOS SDK Version x and Android SDK version y",
    "1-0": "App",
    "1-1": "The App that your customer is currently using. Commonly used to target by platform.",
    "2-0": "App Version",
    "2-1": "The App Version of a specified App that your customer is currently using. When assessing App Versions using more than or less than operators, we apply semantic versioning logic.",
    "3-0": "RC SDK Version",
    "3-1": "The RC SDK Version of a specified SDK flavor of the App Versions that your customer is currently using. Commonly used to target RevenueCat Paywalls only to RC SDK Versions that explicitly support them. "
  },
  "cols": 2,
  "rows": 4,
  "align": [
    "left",
    "left"
  ]
}
[/block]


### How conditions interact with each other

- Dimensions like Country and App which have a defined set of possible values can be added with an "is any of" or  "is not any of" to select individual values or sets of values to include/exclude
- Dimensions like App Version and RC SDK Version which have an ever expanding set of possible values can be added with is/is not or more than/less than operators.
- Multiple conditions can be added for each dimension with an AND relationship, to create rules such as:
  - App version is more than or equal to 1.1.0
  - App version is less than 1.2.0
- App Version and RC SDK Version must always have a specified App or SDK (respectively), since the intended version to target may be different between the App or RC SDK flavor you're targeting.

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/bb9ce00-App_version_filter.png",
        "",
        "When filtering by App version, select the App that the filter applies to first."
      ],
      "align": "center",
      "caption": "When filtering by App version, select the App that the filter applies to first."
    }
  ]
}
[/block]


## FAQs

[block:parameters]
{
  "data": {
    "h-0": "Question",
    "h-1": "Answer",
    "0-0": "How do Targeting and Experiments interact?",
    "0-1": "**TL;DR** Experiment enrollment is checked before Targeting Rules are assessed  \n  \nWhen any Experiment is running, customer enrollment will occur before Offerings are fetched. When Offerings are fetched, we'll first check to see if a customer is enrolled in a running Experiment. If they are, their variant's Offering will be returned. If they are not, then any existing Targeting Rules will be assessed.",
    "1-0": "How can I test Targeting in my app?",
    "1-1": "The easiest way to test Targeting is to create a Targeting Rule for an app version that has not yet been released (e.g. only available in TestFlight), and serve a unique Offering to that Targeting Rule. Then, check to confirm whether your app in production displays a different Offering than your app version in TestFlight does."
  },
  "cols": 2,
  "rows": 2,
  "align": [
    "left",
    "left"
  ]
}
[/block]

---
title: "Configuring Experiments"
slug: "configuring-experiments-v1"
hidden: false
createdAt: "2022-10-13T18:44:36.495Z"
updatedAt: "2023-02-07T17:56:40.461Z"
---
Before setting up an experiment, make sure you've created the products and offerings that you want to test and added any new products to the appropriate entitlements in your project (more on this below). You should also test the offerings you've chosen on any platform your app supports.

# Setting up a new experiment
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/ba143ea-Screen_Shot_2022-11-30_at_3.39.08_PM.png",
        "Screen Shot 2022-11-30 at 3.39.08 PM.png",
        2510,
        972,
        "#000000"
      ],
      "caption": "Once enabled, you can access the **Experiments** tab under **Product Setup**."
    }
  ]
}
[/block]
Select **+ New** to create a new experiment.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/fec8c60-Screen_Shot_2023-01-05_at_1.16.48_PM.png",
        "Screen Shot 2023-01-05 at 1.16.48 PM.png",
        1864,
        1090,
        "#000000"
      ],
      "caption": "Creating a new experiment"
    }
  ]
}
[/block]
Then, enter the following details:

* Experiment name
* Enrollment criteria (optional)
* Control variant: First offering
* Treatment variant: Second offering
[block:callout]
{
  "type": "info",
  "title": "Setting up an offering for your treatment",
  "body": "If you've not setup multiple offerings before, you'll be prompted to do so now, since you'll need at least 2 available offerings to run an experiment.\n\nThe treatment offering represents the hypothesis you're looking to test with your experiment (e.g. higher or lower priced products, products with trials, etc).\n\nFor App Store apps, we recommend setting up new products to test as a new Subscription Group so that customers who are offered those products through Experiments will see only that same set of products to select from their subscription settings."
}
[/block]
## Enrollment criteria
You may choose to setup custom enrollment criteria for your experiment to target a specific segment of your customers. To do this, click on the caret to expand the "Enrollment Criteria" section.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/56a938f-Screen_Shot_2023-01-10_at_11.24.40_AM.png",
        "Screen Shot 2023-01-10 at 11.24.40 AM.png",
        974,
        784,
        "#000000"
      ]
    }
  ]
}
[/block]
You may modify any of the following enrollment criteria:
[block:parameters]
{
  "data": {
    "h-0": "Dimension",
    "h-1": "Description",
    "0-0": "Apps",
    "0-1": "Which of your RevenueCat apps the experiment will be made available to. Set to **All apps** by default.",
    "1-0": "Countries",
    "1-1": "Which countries are eligible to have their new customers enrolled in the experiment. Set to **All countries** by default.",
    "2-0": "New customers to enroll",
    "2-1": "The percent of new customers meeting the above criteria that will be enrolled in your experiment. Set to **100%** by default."
  },
  "cols": 2,
  "rows": 3
}
[/block]

Once done, select **CREATE EXPERIMENT** and view your new experiment.

# Starting an experiment

When viewing a new experiment, you can start, edit, or delete the experiment.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/3e6f895-Screen_Shot_2022-10-20_at_10.30.15_AM.png",
        "Screen Shot 2022-10-20 at 10.30.15 AM.png",
        1868,
        120,
        "#000000"
      ]
    }
  ]
}
[/block]
* Start: Starts the experiment. Customer enrollment and data collection begins immediately, but results will take up to 24 hours to begin populating.
* Edit: Change the name, enrollment criteria, or offerings in an experiment before it's been started. After it's been started, only the percent of new customers to enroll can be edited.
* Delete: Deletes the experiment.
[block:callout]
{
  "type": "warning",
  "title": "Sandbox",
  "body": "Test users will be placed into the experiment offering variants, but sandbox purchases won't be applied to your experiment.\n\nIf you want to test your paywall to make sure it can handle displaying the offerings in your experiment, you can use the [Offering Override](doc:offering-override) feature to choose a specific offering to display to a user."
}
[/block]
# FAQs
[block:parameters]
{
  "data": {
    "h-0": "Question",
    "h-1": "Answer",
    "0-0": "Can I edit the offerings in a started experiment?",
    "0-1": "Editing an offering for an active experiment would make the results unusable. Be sure to check before starting your experiment that your chosen offerings render correctly in your app(s). If you need to make a change to your offerings, stop the experiment and create a new one with the updated offerings.",
    "2-0": "Can I restart an experiment after it's been stopped?",
    "2-1": "After you choose to stop an experiment, new customers will no longer be enrolled in it, and it cannot be restarted. If you want to continue a test, create a new experiment and choose the same offerings as the stopped experiment.\n\n(NOTE: Results for stopped experiments will continue to refresh for 28 days after the experiment has ended)",
    "1-0": "Can I edit the enrollment criteria of a started experiment?",
    "1-1": "Before an experiment has been started, all aspects of enrollment criteria can be edited. However, once an experiment has been started, only new customers to enroll can be edited; since editing the apps or countries that an experiment is exposed to would alter the nature of the test.",
    "3-0": "What happens to customers that were enrolled in an experiment after it's been stopped?",
    "3-1": "New customers will no longer be enrolled in an experiment after it's been stopped, and customers who were already enrolled in the experiment will begin receiving the current offering if they reach a paywall again.\n\nSince we continually refresh results for 28 days after an experiment has been ended, you may see conversions from these customers in your results, since they were enrolled as part of the test while it was running."
  },
  "cols": 2,
  "rows": 4
}
[/block]
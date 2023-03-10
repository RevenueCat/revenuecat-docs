---
title: "Configuring Experiments"
slug: "configuring-experiments"
hidden: false
metadata: 
  title: "Configuring Experiments – RevenueCat"
  description: "Before setting up an experiment, make sure you've created the products and offerings that you want to test and added any new products to the appropriate entitlements."
  image: 
    0: "https://files.readme.io/7522b1d-OG_image.png"
    1: "OG image.png"
    2: 1200
    3: 627
    4: "#e9acb0"
createdAt: "2020-07-09T16:50:48.063Z"
updatedAt: "2021-06-10T23:57:21.919Z"
---
[block:callout]
{
  "type": "success",
  "body": "Experiments (Beta) is available on the [Grow plan](https://www.revenuecat.com/pricing)."
}
[/block]
Before setting up an experiment, make sure you've created the products and offerings that you want to test and added any new products to the appropriate entitlements. You should also test the offerings you've chosen on any platform your app supports.

# Setting up a new experiment

Click New and enter the following details:

- Experiment name
- Variant A - first offering
- Variant B - second offering
[block:callout]
{
  "type": "info",
  "title": "",
  "body": "The order of the variants doesn't matter. The experiment will try to test each offering equally."
}
[/block]
Once done, click Add and view your new experiment.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/6e3c2aa-2020-07-01_22.17.52_app.revenuecat.com_22ea176fc13f.png",
        "2020-07-01_22.17.52_app.revenuecat.com_22ea176fc13f.png",
        1216,
        623,
        "#c4c4c4"
      ],
      "caption": "Creating a new experiment"
    }
  ]
}
[/block]
# Starting an experiment

When viewing a new experiment, you can start, edit, or delete the experiment.

- Start: Starts the experiment. Data collection and LTV begins immediately, but how quickly results start showing up depends on how active your users are.
- Edit: Choose different offerings for the experiment.
- Delete: Deletes the experiment.
[block:callout]
{
  "type": "warning",
  "title": "An experiment that has been started cannot be edited.",
  "body": "Double check that your offerings work on all platforms your app supports."
}
[/block]

[block:callout]
{
  "type": "info",
  "title": "Once an experiment is stopped, it can't be restarted.",
  "body": "If you want to continue a test, create a new experiment and choose the same offerings as the stopped experiment."
}
[/block]

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/68770c0-2020-07-01_22.18.52_app.revenuecat.com_172e5fe963dc.png",
        "2020-07-01_22.18.52_app.revenuecat.com_172e5fe963dc.png",
        1216,
        623,
        "#f7f5f5"
      ]
    }
  ]
}
[/block]

[block:callout]
{
  "type": "warning",
  "title": "Sandbox",
  "body": "Test users will be placed into the experiment offering variants, but sandbox purchases won't be applied to your experiment.\n\nIf you want to test your paywall to make sure it can handle displaying the offerings in your experiment, you can use the [Offering Override](doc:offering-override) feature to choose a specific offering to display to a user."
}
[/block]
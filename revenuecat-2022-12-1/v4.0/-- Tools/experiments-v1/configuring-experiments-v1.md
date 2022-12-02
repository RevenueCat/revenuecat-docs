---
title: "Configuring Experiments"
slug: "configuring-experiments-v1"
hidden: false
createdAt: "2022-10-13T18:44:36.495Z"
updatedAt: "2022-11-30T20:39:21.431Z"
---
Before setting up an experiment, make sure you've created the products and offerings that you want to test and added any new products to the appropriate entitlements in your project. You should also test the offerings you've chosen on any platform your app supports.

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
Select **+ New** and enter the following details:

- Experiment name
- Control: First offering
- Treatment: Second offering
[block:callout]
{
  "type": "info",
  "title": "",
  "body": "The order of the variants doesn't matter. The experiment will try to test each offering equally."
}
[/block]
Once done, select **CREATE EXPERIMENT** and view your new experiment.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/d25fd17-Screen_Shot_2022-10-20_at_10.27.17_AM.png",
        "Screen Shot 2022-10-20 at 10.27.17 AM.png",
        912,
        1156,
        "#000000"
      ],
      "caption": "Creating a new experiment"
    }
  ]
}
[/block]
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
- Start: Starts the experiment. Customer enrollment and data collection begins immediately, but results will take up to 24 hours to begin populating.
- Edit: Change the name of the experiment.
- Delete: Deletes the experiment.
[block:callout]
{
  "type": "warning",
  "title": "Offerings cannot be edited in a started experiment",
  "body": "Editing an offering for an active experiment would make the results unusable. Be sure to check before starting your experiment that your chosen offerings render correctly in your app(s). If you need to make a change to your offerings, stop the experiment and create a new one with the updated offerings."
}
[/block]
When you start an experiment, 100% of the new customers for your project will be enrolled and split 50/50 between the two variants. This includes all apps within your project.

If you are looking to limit the apps, countries, or portion of new customers that are enrolled in a new experiment; contact support so we can assist you.
[block:callout]
{
  "type": "info",
  "title": "Once an experiment is stopped, it can't be restarted.",
  "body": "After you choose to stop an experiment, new customers will no longer be enrolled in it, and it cannot be restarted. If you want to continue a test, create a new experiment and choose the same offerings as the stopped experiment.\n\n(NOTE: Results for stopped experiments will continue to refresh for 28 days after the experiment has ended)"
}
[/block]

[block:callout]
{
  "type": "warning",
  "title": "Sandbox",
  "body": "Test users will be placed into the experiment offering variants, but sandbox purchases won't be applied to your experiment.\n\nIf you want to test your paywall to make sure it can handle displaying the offerings in your experiment, you can use the [Offering Override](doc:offering-override) feature to choose a specific offering to display to a user."
}
[/block]
---
title: "Slack"
slug: "slack"
excerpt: "Send your purchase events to Slack"
hidden: false
createdAt: "2018-12-12T05:02:57.119Z"
updatedAt: "2018-12-14T01:22:30.854Z"
---
[block:callout]
{
  "type": "success",
  "body": "Slack integration is only available on [paid](https://www.revenuecat.com/pricing) plans."
}
[/block]
RevenueCat can send you Slack message to a channel any time an event happens in your app. This lets you keep a close pulse on your app and celebrate those money making moments!
[block:api-header]
{
  "title": "Configure Slack workspace"
}
[/block]
Before RevenueCat can post to your Slack channel, you need to authorize a webhook to post to your workspace. Slack has a more [detailed article](https://get.slack.help/hc/en-us/articles/115005265063-Incoming-WebHooks-for-Slack) on their website explaining how to set this up if you have trouble.

## 1. Create a **Slack app**
* Navigate to [https://api.slack.com/apps](https://api.slack.com/apps?new_app=1) and create a new app. Give it a name like "RevenueCat" and select your workspace.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/a85a3f1-Screen_Shot_2018-12-13_at_4.15.50_PM.png",
        "Screen Shot 2018-12-13 at 4.15.50 PM.png",
        1164,
        966,
        "#f2f3f3"
      ]
    }
  ]
}
[/block]
* Click **Create App**

## 2. Enable **Incoming Webhooks** from the settings page
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/58be14f-Screen_Shot_2018-12-13_at_4.17.51_PM.png",
        "Screen Shot 2018-12-13 at 4.17.51 PM.png",
        1370,
        422,
        "#f1f2f3"
      ],
      "caption": ""
    }
  ]
}
[/block]
* Select **Incoming Webhooks** under *Add features and functionality*
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/14fd367-Screen_Shot_2018-12-13_at_4.21.05_PM.png",
        "Screen Shot 2018-12-13 at 4.21.05 PM.png",
        1488,
        824,
        "#f2f2f2"
      ],
      "caption": ""
    }
  ]
}
[/block]
* Enable the Incoming Webhooks toggle
* After the settings page refreshes, click **Add New Webhook to Workspace**

## 3. Pick a channel that the app will post to, then click **Authorize**

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/f5c317c-Screen_Shot_2018-12-13_at_4.23.27_PM.png",
        "Screen Shot 2018-12-13 at 4.23.27 PM.png",
        992,
        824,
        "#f4f6f4"
      ]
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "Configure RevenueCat integration"
}
[/block]
Once you've set up a webhook in your Slack workspace. Enter the details into the Slack Integration section of your [dashboard](https://app.revenuecat.com).
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/d5081f2-Screen_Shot_2018-12-13_at_4.26.05_PM.png",
        "Screen Shot 2018-12-13 at 4.26.05 PM.png",
        1340,
        950,
        "#f8f8f9"
      ]
    }
  ]
}
[/block]

[block:callout]
{
  "type": "success",
  "body": "You're all set! RevenueCat will start sending events into Slack!"
}
[/block]

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/f1167d6-unnamed.png",
        "unnamed.png",
        1130,
        438,
        "#faf9f9"
      ]
    }
  ]
}
[/block]
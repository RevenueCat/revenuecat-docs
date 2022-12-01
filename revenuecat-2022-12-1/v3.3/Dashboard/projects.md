---
title: "Projects"
slug: "projects"
excerpt: "Configuring multiple Apps under a single Project"
hidden: false
metadata: 
  image: 
    0: "https://files.readme.io/68ff104-60993e3c40039b67596bcc8c_slack-preview.png"
    1: "60993e3c40039b67596bcc8c_slack-preview.png"
    2: 1200
    3: 627
    4: "#f45476"
createdAt: "2022-01-06T20:42:37.662Z"
updatedAt: "2022-02-02T16:56:56.758Z"
---
A Project is a set of Apps, and Apps are paired with a single platform. For example, a typical Project might contain one iOS App and one Google Play Store App. All Apps within one Project share the same basic setup, including entitlements, offerings, integrations, and webhooks. 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/0e8dd03-Screen_Shot_2022-01-06_at_4.34.25_PM.png",
        "Screen Shot 2022-01-06 at 4.34.25 PM.png",
        2492,
        876,
        "#f7f7f7"
      ],
      "sizing": "full",
      "border": true
    }
  ]
}
[/block]

[block:callout]
{
  "type": "success",
  "body": "Apps created before December 2021 have automatically been converted to Projects. You will not need to make any changes in order to keep your RevenueCat setup functional. \n\nFor example, an app that was set up for both iOS and Google Play has been converted to a Project with an iOS App and a Google Play App.",
  "title": "Legacy App Setup"
}
[/block]
# Creating a Project

To create a Project, click the '+ Create new project' button in the Projects dropdown panel at the top of the RevenueCat dashboard:
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/7d37f63-Screen_Shot_2022-01-26_at_12.59.55_PM.png",
        "Screen Shot 2022-01-26 at 12.59.55 PM.png",
        646,
        370,
        "#f6f7f7"
      ],
      "sizing": "80",
      "border": true
    }
  ]
}
[/block]
You can customize your project by setting a name as well as your global [restore behavior](doc:restoring-purchases) for the apps in your Project.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/4ad2b26-Screen_Shot_2022-01-26_at_1.01.43_PM.png",
        "Screen Shot 2022-01-26 at 1.01.43 PM.png",
        1866,
        886,
        "#fdfbfb"
      ],
      "sizing": "80",
      "border": true
    }
  ]
}
[/block]
# Creating an App

To add a new App to your Project, click the 'Apps' tab in your Project settings, then click '+ New' to select a platform for the App.

Each platform requires a different configuration depending on the requirements for that platform:

#### Apple

- *Bundle ID*: The bundle identifier for the app.
- *App Store Connect App-Specific Shared Secret*: The key required to validate purchases with Apple. [Read more :fa-arrow-right:](doc:itunesconnect-app-specific-shared-secret) 
- *In-App Purchase/Subscription Key*: The Subscription key required for Promotional Offers. [Read more :fa-arrow-right:](doc:ios-subscription-offers#subscription-keys) 
- *Apple Small Business Program*: If you're a member of the App Store Small Business Program, this is the date of entry and (if applicable) exit. [Read more :fa-arrow-right:](doc:app-store-small-business-program) 

#### Google Play Store

- *Google Play package*: The package identifier specified in your app's `build.gradle` file.
- *Service Account credentials JSON*: Your service account credentials, required to validate purchases with Google. [Read more :fa-arrow-right:](doc:creating-play-service-credentials) 
- *Google Developer Notifications*: Optional, but recommended notifications to keep your transaction statuses in sync in real-time. [Read more :fa-arrow-right:](doc:google-server-notifications) 

#### Amazon

- *Amazon Store package*: The package identifier specified in your app's `build.gradle` file.
- *Amazon Store Shared Secret*: The key required to validate purchases with Amazon. [Read more :fa-arrow-right:](doc:amazon-appstore-credentials) 

#### Stripe

- *Stripe Webhook Secret*: The webhook secret from Stripe when setting up server notifications. [Read more :fa-arrow-right:](doc:stripe-server-notifications) 

# Shared App User ID Namespace

Apps within the same Project also share the same App User ID namespace, which means that they also share subscriptions. A user logged in to the same user ID in different Apps of the same Project will have access to the same entitlements. This allows sharing of subscription status between different Apps, even on the same platform.

Read more about [App User IDs :fa-arrow-right:](doc:user-ids)

# API Keys

Each individual App in a Project has a separate API key, and the Purchases SDK should be [configured](doc:configuring-sdk) with that key. The App specific API keys include a platform prefix, e.g. `appl_xxxx` for iOS apps.
[block:callout]
{
  "type": "warning",
  "title": "Legacy public API keys will continue to be supported",
  "body": "Public API keys generated prior to the launch of RevenueCat's Prokect system will continue to work as before, but we recommend using the new **App specific keys** generated for your existing project."
}
[/block]
Read more about [API Keys :fa-arrow-right:](doc:authentication)

# Considerations

## Deleting Apps

Apps can't be deleted from a Project if there are any transactions (*sandbox or production*) associated with the App.
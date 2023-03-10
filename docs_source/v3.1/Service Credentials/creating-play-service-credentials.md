---
title: "Play Store"
slug: "creating-play-service-credentials"
excerpt: "Step-by-step guide for creating your Play service credentials"
hidden: false
metadata: 
  title: "Configure Play Store Service Credentials | RevenueCat"
  description: "Step-by-step guide for creating your Play service credentials, These are needed in order for RevenueCat's servers to communicate with Google on your behalf."
  image: 
    0: "https://files.readme.io/effb9c9-OG_image.png"
    1: "OG image.png"
    2: 1200
    3: 627
    4: "#e9acb0"
createdAt: {}
updatedAt: "2021-06-01T20:42:53.702Z"
---
In order for RevenueCat's servers to communicate with Google on your behalf you need to provide a set of service credentials. The process for configuring these credentials is a bit complex, but the added level of control improves security by only providing RevenueCat with the access we need. 

# Setup
## 1. Link to a Google Developer Project

Your Play Developer account needs to be linked to a Google Developer Project. 

### 1a. Open the **Settings** > **Developer account** menus and select **API access**
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/6a5c02b-2020-10-09_18.32.18_play.google.com_7e76d714d0b0.png",
        "2020-10-09 18.32.18 play.google.com 7e76d714d0b0.png",
        406,
        494,
        "#f6f4f5"
      ],
      "caption": ""
    }
  ]
}
[/block]
### 1b. Select **Link** to connect your Play account to a Google Developer Project
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/284e284-2020-10-09_18.34.18_play.google.com_cedc0bdb00bb.png",
        "2020-10-09 18.34.18 play.google.com cedc0bdb00bb.png",
        739,
        361,
        "#edf0f1"
      ]
    }
  ]
}
[/block]
### 1c. Agree to the terms and conditions
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/b62b53c-2020-10-09_18.34.57_play.google.com_41d59660ebd9.png",
        "2020-10-09 18.34.57 play.google.com 41d59660ebd9.png",
        691,
        324,
        "#cbccd0"
      ]
    }
  ]
}
[/block]
## 2. Create Service Account

Next we need to create a service account. This is done from the Google API Console.

### 2a. Select Create Service Account

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/04a2a2a-2020-10-09_18.53.13_play.google.com_06b9e7b49642.png",
        "2020-10-09 18.53.13 play.google.com 06b9e7b49642.png",
        1514,
        485,
        "#f5f3f3"
      ]
    }
  ]
}
[/block]
### 2b. Follow the link to the Google API Console
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/9629734-2020-10-09_18.54.36_play.google.com_7b4d5427df35.png",
        "2020-10-09 18.54.36 play.google.com 7b4d5427df35.png",
        1335,
        736,
        "#dcdcde"
      ]
    }
  ]
}
[/block]
### 2c. Create Service account key credentials
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/6e9e3d9-3c6ee98-Screen_Shot_2018-09-15_at_11.33.49_AM.png",
        "3c6ee98-Screen_Shot_2018-09-15_at_11.33.49_AM.png",
        1510,
        650,
        "#f4f3f3"
      ]
    }
  ]
}
[/block]
### 2d. Name it and assign it Pub/Sub Admin Role

When you hit create, a JSON file will be downloaded. These are the credentials that RevenueCat will need to communicate with Google.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/149d38b-Screen_Shot_2020-12-22_at_3.45.45_PM.png",
        "Screen Shot 2020-12-22 at 3.45.45 PM.png",
        1484,
        1596,
        "#f9f9fa"
      ]
    }
  ]
}
[/block]
Add two Roles:
* Pub/Sub Admin (to enable [Platform Server Notifications](doc:server-notifications))
* Monitoring Viewer (to allow monitoring of the notification queue)
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/8693e7e-Screen_Shot_2021-03-09_at_12.11.12.png",
        "Screen Shot 2021-03-09 at 12.11.12.png",
        1142,
        1400,
        "#f5f6f7"
      ]
    }
  ]
}
[/block]
You can skip the optional third step, "Grant users access to this service account" by clicking Done.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/3f7a1af-Screen_Shot_2020-12-22_at_3.48.30_PM.png",
        "Screen Shot 2020-12-22 at 3.48.30 PM.png",
        1814,
        1598,
        "#f8f8f8"
      ]
    }
  ]
}
[/block]
### 2e. Create the public key

In the Google Cloud Console, click on **Actions** > **Manage keys**.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/eee645f-Screen_Shot_2021-03-02_at_4.28.00_PM.png",
        "Screen Shot 2021-03-02 at 4.28.00 PM.png",
        955,
        568,
        "#f7f6f7"
      ]
    }
  ]
}
[/block]
Click **ADD KEY** > **Create new key**.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/6b3e9c0-Screen_Shot_2021-03-02_at_4.32.13_PM.png",
        "Screen Shot 2021-03-02 at 4.32.13 PM.png",
        955,
        568,
        "#faf9fa"
      ]
    }
  ]
}
[/block]
Make sure JSON is selected and click **Create** to create and download the JSON key.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/253e4a8-Screen_Shot_2021-03-02_at_4.34.57_PM.png",
        "Screen Shot 2021-03-02 at 4.34.57 PM.png",
        702,
        595,
        "#cdcccc"
      ]
    }
  ]
}
[/block]

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/c2bcf03-Screen_Shot_2020-12-22_at_3.55.35_PM.png",
        "Screen Shot 2020-12-22 at 3.55.35 PM.png",
        1552,
        1148,
        "#c8c7c8"
      ],
      "caption": "The downloaded JSON key is what you will need to enter in RevenueCat in [step 4](https://docs.revenuecat.com/docs/creating-play-service-credentials#4-enter-the-credentials-json-in-revenuecat)."
    }
  ]
}
[/block]
## 3. Grant Financial Access to RevenueCat

### 3a. Back in the Play Console, select Grant Access on the newly created RevenueCat service account

You are all done with the Google Cloud Console. Switch back to the **Google Play Console** and click **Grant access** for the newly created service account. If you do not see the service account you created, try refreshing the page.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/810ad8e-2020-10-09_19.02.00_play.google.com_405276fa8c9e.png",
        "2020-10-09 19.02.00 play.google.com 405276fa8c9e.png",
        1534,
        506,
        "#f4f4f5"
      ],
      "caption": "This is in the Google Play Console."
    }
  ]
}
[/block]
### 3b. Grant the following permissions:

- View app information and download bulk reports (read-only)
- View financial data, orders, and cancellation survey responses
- Manage orders and subscriptions
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/f5d6b6d-2020-10-09_18.40.43_play.google.com_948497ee8728.png",
        "2020-10-09 18.40.43 play.google.com 948497ee8728.png",
        793,
        687,
        "#f6f7f7"
      ]
    }
  ]
}
[/block]
### 3c.Click **Invite User** at the bottom and send the invite
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/f6caa56-2020-10-09_19.06.28_play.google.com_cd22a9b57231.png",
        "2020-10-09 19.06.28 play.google.com cd22a9b57231.png",
        913,
        504,
        "#d8dade"
      ]
    }
  ]
}
[/block]
You will be redirected to Users and Permissions where you should see your newly created service account as Active.

### 3d. Apply permissions to your apps

In the Users and Permissions section, click on the service account and add your apps to the account. Click Apply on the sheet that appears.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/864daff-2020-10-09_18.43.25_play.google.com_0d61e4ddf1cd.png",
        "2020-10-09 18.43.25 play.google.com 0d61e4ddf1cd.png",
        784,
        483,
        "#faf7f7"
      ]
    }
  ]
}
[/block]

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/7f74c48-2020-10-09_19.17.55_play.google.com_a953924f9449.png",
        "2020-10-09 19.17.55 play.google.com a953924f9449.png",
        1086,
        868,
        "#ededed"
      ]
    }
  ]
}
[/block]

[block:callout]
{
  "type": "danger",
  "title": "Don't forget to Save Changes after applying the permissions"
}
[/block]
## 4. Enter the credentials JSON in RevenueCat

Copy and paste the credentials JSON that were downloaded in step 2 to your RevenueCat account and we'll be ready to handle Google Play purchases!
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/4ec99e7-Screenshot_2020-02-27_RevenueCat_Sample_App_Settings_RevenueCat.png",
        "Screenshot_2020-02-27 RevenueCat Sample App Settings RevenueCat.png",
        1662,
        537,
        "#f6f7f7"
      ]
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "title": "Important",
  "body": "It can take up to 36 hours for your Play Service Credentials to work properly with the Android Developer API. You may see \"Invalid Play Store credentials\" errors and be unable to make purchases with RevenueCat until this happens."
}
[/block]
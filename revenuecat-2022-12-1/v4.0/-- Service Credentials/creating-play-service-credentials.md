---
title: "Google Play Store"
slug: "creating-play-service-credentials"
excerpt: "Step-by-step guide for creating your Play service credentials"
hidden: false
metadata: 
  title: "Play Store Service Credentials – RevenueCat"
  description: "Step-by-step guide for creating your Play service credentials, These are needed in order for RevenueCat's servers to communicate with Google on your behalf."
  image: 
    0: "https://files.readme.io/c1c6ef3-RevenueCat_Docs_OG.png"
    1: "RevenueCat Docs OG.png"
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: {}
updatedAt: "2022-11-09T13:20:47.338Z"
---
In order for RevenueCat's servers to communicate with Google on your behalf, you need to provide a set of service credentials. The process for configuring these credentials is a bit complex, but the added level of control improves security by providing RevenueCat with only the access we need. 
[block:callout]
{
  "type": "info",
  "title": "Credentials can take up to 36 hours after being created to be valid",
  "body": "It can take up to 36 hours for your Play Service Credentials to work properly with the Google Play Developer API. You may see \"Invalid Play Store credentials\" errors (503 or 521) and be unable to make purchases with RevenueCat until this happens."
}
[/block]
# Setup
## 1. Link to a Google Cloud Project

Your Google Play Developer account needs to be linked to a Google Cloud Project. 

### 1a. Open the **Setup** dropdown in the sidebar menu and select **API access**
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/42a0a25-Step_1A_fixed.png",
        "Step_1A_fixed.png",
        1276,
        1002,
        "#f5f5f6"
      ],
      "caption": "",
      "sizing": "smart"
    }
  ]
}
[/block]
### 1b. Select **Link** to connect your Google Play account to a Google Cloud Project
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
## 2. Create a Service Account

Next we need to create a service account. This is done from the Google Play Console.

### 2a. Select **Create new service account**

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
### 2b. Follow the link to the Google Cloud Console
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
### 2c. Create the service account key credentials
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/cfd6f2e-Step_2C.png",
        "Step_2C.png",
        1355,
        532,
        "#f2f1f2"
      ]
    }
  ]
}
[/block]
### 2d. Name the service account and add a Pub/Sub Admin Role

These are the credentials that RevenueCat will need to communicate with Google. After filling in the details, select **Create and Continue**.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/45133c8-Step_2D.png",
        "Step_2D.png",
        1100,
        1236,
        "#f5f6f6"
      ]
    }
  ]
}
[/block]
Add two **Roles**:
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
You can skip the optional third step, **Grant users access to this service account**, by selecting **Done**.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/17423a2-Step_2D_optional.png",
        "Step_2D_optional.png",
        1744,
        1140,
        "#f5f5f6"
      ]
    }
  ]
}
[/block]
### 2e. Create and download the public key

In the Google Cloud Console, select **Actions** > **Manage keys**.
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
Select **ADD KEY** > **Create new key**.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/ee94208-Step_2E_p2.png",
        "Step_2E_p2.png",
        1278,
        894,
        "#f4f4f4"
      ]
    }
  ]
}
[/block]
Make sure **JSON** is selected and select **Create** to create and download the JSON key.
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

### 3a. Back in the Google Play Console, select **Grant Access** (under **Setup** > **API Access**) on the newly created RevenueCat service account

You are all done with the Google Cloud Console. Switch back to the **Google Play Console** and select **Grant access** for the newly created service account. If you do not see the service account you created, try refreshing the page.
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
### 3c. Select **Invite User** at the bottom of the page and send the invite
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
You will be redirected to **Users and Permissions** where you should see your newly created service account as **Active**.

### 3d. Apply permissions to your apps

In the **Users and Permissions** section, select the service account and add your apps to the account. Select **Apply** on the sheet that appears.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/5b7b403-Step_3D_p1.png",
        "Step_3D_p1.png",
        1356,
        696,
        "#f8f7f8"
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
        "https://files.readme.io/3b1a731-Step_3D_p2.png",
        "Step_3D_p2.png",
        1882,
        1420,
        "#f2f2f3"
      ]
    }
  ]
}
[/block]

[block:callout]
{
  "type": "danger",
  "title": "Don't forget to Save Changes after applying the permissions!"
}
[/block]
## 4. Enter the Credentials JSON in RevenueCat

Copy and paste the credentials JSON that was downloaded in [step 2](https://docs.revenuecat.com/docs/creating-play-service-credentials#2e-create-and-download-the-public-key) into your app settings in the RevenueCat dashboard. You can find your app under **Project Settings > Apps**. Now we'll be ready to handle Google Play purchases!
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/ef375e8-Screen_Shot_2021-12-01_at_7.12.30_PM.png",
        "Screen Shot 2021-12-01 at 7.12.30 PM.png",
        1872,
        696,
        "#fbfbfb"
      ],
      "caption": "This configuration is in the settings of your app."
    }
  ]
}
[/block]

[block:callout]
{
  "type": "danger",
  "title": "400 error when connecting to Google",
  "body": "If you're getting a 400 error when connecting to Google for [Platform Server Notifications](doc:google-server-notifications) from the RevenueCat dashboard, ensure you've enabled Pub/Sub for your project in our guide [here](doc:google-server-notifications)."
}
[/block]
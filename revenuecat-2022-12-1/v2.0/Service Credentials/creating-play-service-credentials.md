---
title: "Play Store"
slug: "creating-play-service-credentials"
excerpt: "Step-by-step guide for creating your Play service credentials"
hidden: false
createdAt: "2018-05-08T16:06:42.120Z"
updatedAt: "2019-02-05T01:00:14.027Z"
---
In order for RevenueCat's servers to communicate with Google on your behalf you need to provide a set of service credentials. The process for configuring these credentials is a bit complex, but the added level of control improves security by only providing RevenueCat with the access we need. 
[block:api-header]
{
  "type": "basic",
  "title": "1. Link to a Google Developer Project"
}
[/block]
Your Play Developer account needs to be linked to a Google Developer Project. 

### 1a. Go to your [Play Console settings](https://play.google.com/apps/publish#ApiAccessPlace)
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/0790e1c-Screen_Shot_2018-05-08_at_8.45.35_AM.png",
        "Screen Shot 2018-05-08 at 8.45.35 AM.png",
        963,
        847,
        "#efeeef"
      ],
      "caption": ""
    }
  ]
}
[/block]
### 1b. Select API access
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/07c9714-Screen_Shot_2018-05-08_at_8.45.47_AM.png",
        "Screen Shot 2018-05-08 at 8.45.47 AM.png",
        686,
        912,
        "#f6f4f4"
      ],
      "caption": ""
    }
  ]
}
[/block]
### 1c. Select **Link** to connect your Play account to a Google Developer Project
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/558b9d6-Screen_Shot_2018-05-08_at_8.45.53_AM.png",
        "Screen Shot 2018-05-08 at 8.45.53 AM.png",
        1956,
        679,
        "#f1f1f2"
      ]
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "2. Create Service Account"
}
[/block]
Next we need to create a service account. This is done from the Google API Console

### 2a. Select Create Service Account

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/1c2f015-Screen_Shot_2018-05-08_at_9.12.47_AM.png",
        "Screen Shot 2018-05-08 at 9.12.47 AM.png",
        859,
        170,
        "#efe5e4"
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
        "https://files.readme.io/b430b91-Screen_Shot_2018-05-08_at_8.47.09_AM.png",
        "Screen Shot 2018-05-08 at 8.47.09 AM.png",
        1269,
        716,
        "#efeded"
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
        "https://files.readme.io/3c6ee98-Screen_Shot_2018-09-15_at_11.33.49_AM.png",
        "Screen Shot 2018-09-15 at 11.33.49 AM.png",
        1510,
        650,
        "#f4f3f3"
      ]
    }
  ]
}
[/block]
### 2d. Name it and assign it Project Owner Role

When you hit create, a JSON file will be downloaded. These are the credentials that RevenueCat will need to communicate with Google
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/bdf6525-Screen_Shot_2018-11-07_at_3.11.18_PM.png",
        "Screen Shot 2018-11-07 at 3.11.18 PM.png",
        2196,
        1066,
        "#f9f9fa"
      ]
    }
  ]
}
[/block]
Set the Role to Project > Owner
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/343c07b-Screen_Shot_2018-11-07_at_3.15.33_PM.png",
        "Screen Shot 2018-11-07 at 3.15.33 PM.png",
        2228,
        902,
        "#f8f8f9"
      ],
      "caption": ""
    }
  ]
}
[/block]
Download your JSON credential
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/10853fd-Screen_Shot_2018-11-07_at_3.16.00_PM.png",
        "Screen Shot 2018-11-07 at 3.16.00 PM.png",
        1154,
        820,
        "#f7f5f6"
      ]
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "3. Grant Financial Access to RevenueCat"
}
[/block]
### 3a. Back in the Play Console, select Grant Access on the newly created RevenueCat service account
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/cfe8ca1-Screen_Shot_2018-05-08_at_8.56.06_AM.png",
        "Screen Shot 2018-05-08 at 8.56.06 AM.png",
        1417,
        489,
        "#ececed"
      ]
    }
  ]
}
[/block]
### 3b. Set the Role to Finance and Add Manage Orders Permissions
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/c9bfa8c-Screen_Shot_2018-11-21_at_8.49.42_AM.png",
        "Screen Shot 2018-11-21 at 8.49.42 AM.png",
        1176,
        840,
        "#f8f8f8"
      ]
    }
  ]
}
[/block]
Hit save and you're done. Upload the credentials JSON that were downloaded in step 2 to your RevenueCat account and we'll be ready to handle Google Play purchases!
[block:callout]
{
  "type": "info",
  "title": "Important",
  "body": "It can take up to 24 hours for your Play Service Credentials to work properly with the Android Developer API. You may see \"Invalid Play Store credentials\" errors and be unable to make purchases with RevenueCat until this happens. \n\nIf this state persists more than 24 hours, contact support@revenuecat.com"
}
[/block]
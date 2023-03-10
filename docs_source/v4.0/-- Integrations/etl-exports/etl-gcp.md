---
title: "Google Cloud Storage"
slug: "etl-gcp"
excerpt: "Setting up Google Cloud Storage access keys for data transfer"
hidden: false
metadata: 
  title: "Google Cloud Storage export – RevenueCat"
  description: "RevenueCat can automatically send data deliveries of all of your apps' transaction data to a Google Cloud Storage bucket. These are in the form of .csv files delivered daily."
  image: 
    0: "https://files.readme.io/8a10059-RevenueCat_Docs_OG.png"
    1: "RevenueCat Docs OG.png"
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: "2020-10-02T02:50:53.583Z"
updatedAt: "2021-12-01T20:34:36.985Z"
---
RevenueCat can automatically send data deliveries of all of your apps' transaction data to a Google Cloud Storage bucket. These are in the form of .csv files delivered daily.

To start receiving these deliveries, you'll need the following details:

1. A Google Cloud Storage Service Account [HMAC access key and secret](https://cloud.google.com/storage/docs/authentication/hmackeys)
2. Google Cloud Storage bucket name
[block:callout]
{
  "type": "info",
  "title": "Make sure the HMAC credentials have the right permissions",
  "body": "We recommend using Service Account HMAC keys instead of User Account HMAC keys. Just make sure that both \"Storage Object Viewer\" and \"Storage Object Creator\" roles are added to your Service Account HMAC key."
}
[/block]
Once you have this information, you can add it to the Google Cloud Storage integration settings for your project in RevenueCat.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/e4d01ea-Screen_Shot_2021-12-01_at_12.33.39_PM.png",
        "Screen Shot 2021-12-01 at 12.33.39 PM.png",
        938,
        532,
        "#fbfbfb"
      ],
      "caption": "Google Cloud Storage delivery configuration in RevenueCat dashboard"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "Once you've configured the Google Cloud Storage integration in RevenueCat, allow up to 24 hours before the first file is delivered.",
  "title": "Allow 24 hours for initial delivery"
}
[/block]
### Receive new and updated transactions only
When configuring the deliveries, you have the option to receive a full export daily or only new and updated transactions from the last export. The first delivery will *always* be a full export even if this option is selected.
---
title: "Google Cloud Storage"
slug: "etl-gcp"
excerpt: "Setting up Google Cloud Storage access keys for data transfer"
hidden: false
metadata: 
  title: "Google Cloud Storage export – RevenueCat"
  description: "RevenueCat can automatically send data deliveries of all of your apps' transaction data to a Google Cloud Storage bucket. These are in the form of .csv files delivered daily."
  image: 
    0: "https://files.readme.io/8215598-OG_image.png"
    1: "OG image.png"
    2: 1200
    3: 627
    4: "#e9acb0"
createdAt: "2020-10-02T02:50:53.583Z"
updatedAt: "2020-12-02T16:09:22.586Z"
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
Once you have this information, you can add it to the Google Cloud Storage integration settings for your app in RevenueCat.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/b76ed79-gcp_config.png",
        "gcp_config.png",
        1276,
        946,
        "#f9fafa"
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
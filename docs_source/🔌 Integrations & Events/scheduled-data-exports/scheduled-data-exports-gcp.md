---
title: Google Cloud Storage
slug: scheduled-data-exports-gcp
excerpt: Setting up Google Cloud Storage access keys for data transfer
hidden: false
createdAt: '2023-03-14T15:54:31.467Z'
updatedAt: '2023-03-28T22:53:17.272Z'
category: 64515c3c134c6b000bb9f128
---
RevenueCat can automatically send data deliveries of all of your apps' transaction data to a Google Cloud Storage bucket. These are in the form of .csv files delivered daily.

To start receiving these deliveries, you'll need the following details:

1. A Google Cloud Storage Service Account [HMAC access key and secret](https://cloud.google.com/storage/docs/authentication/hmackeys)
2. Google Cloud Storage bucket name

> 📘 Make sure the HMAC credentials have the right permissions
> 
> We recommend using Service Account HMAC keys instead of User Account HMAC keys. Just make sure that both "Storage Object Viewer" and "Storage Object Creator" roles are added to your Service Account HMAC key.

Once you have this information, you can add it to the Google Cloud Storage integration settings for your project in RevenueCat.

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/a6c3ffd-app.revenuecat.com_projects_85ff18c7_integrations_intercom_9.png",
        null,
        null
      ],
      "caption": "Google Cloud Storage delivery configuration in RevenueCat dashboard"
    }
  ]
}
[/block]

> 📘 Allow 24 hours for initial delivery
> 
> Once you've configured the Google Cloud Storage integration in RevenueCat, allow up to 24 hours before the first file is delivered.

### Receive new and updated transactions only

When configuring the deliveries, you have the option to receive a full export daily or only new and updated transactions from the last export. The first delivery will _always_ be a full export even if this option is selected.
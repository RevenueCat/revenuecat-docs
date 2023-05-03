---
title: Google Play Quota Increase Request
slug: google-play-quota-increase-request
excerpt: What to do when you hit the Google Play Developer API limit
hidden: false
createdAt: '2023-04-11T15:04:43.569Z'
updatedAt: '2023-04-11T15:28:07.054Z'
category: 64515c3ecacdcd0050abf7a5
---
Google Play developers may receive an email from RevenueCat indicating that their Google Play Developer API Quota has been or is at risk of being exceeded, and that you need to request a quota increase from Google.

As RevenueCat uses the Google Play Developer API to refresh your customer's purchases to ensure subscription status is up-to-date, it's critical that we are able to continue accessing the API.

## Default quota

The default quota for each Google Play Developer API is 200k queries per day.

## Prerequisites

Before requesting an increase, ensure you have Real-Time Developer Notifications (RTDN) configured as described in our guide [here](doc:google-server-notifications). RTDN reduces RevenueCat's usage of the Google Play Developer API, and is recommended to have configured.

## Requesting an increase

To request a quota increase, visit the Google Play Developer API quota request form: <https://support.google.com/googleplay/android-developer/contact/apiqr> 

Your Developer Account account ID can be found in your [Play Console Account details page](https://play.google.com/console/developers/contact-details:):

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/5d05d59-2023-04-11_10.50.20_play.google.com_4891e818ca0d.png",
        null,
        null
      ],
      "align": "center",
      "border": true
    }
  ]
}
[/block]

Your Google Cloud project ID can be found in your [Google API Console](https://console.developers.google.com/) by clicking on the Project name in the top navigation bar:

![](https://files.readme.io/ebde1e5-2023-04-11_10.34.55_console.cloud.google.com_d098505dfb5c_copy.png)

Enter your account details, and choose the `Subscription & Products Purchase` option.

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/a24a182-Screenshot_2023-04-11_at_10.48.56_AM.png",
        null,
        ""
      ],
      "align": "center",
      "sizing": "50% ",
      "border": true
    }
  ]
}
[/block]



### Justification

The form then requires additional information depending on your use-case, including a justification for needing an increase. To explain to Google Play the need for the increase, you might describe your situation as:

- 'We are using RevenueCat to manage our subscriptions and we have an increase in subscriptions that is causing us to exceed the API quota.'

### RTDN

As described above, RTDN reduce the number of API requests that RevenueCat needs to use to refresh your purchases. If you have RTDN configured, choose `Yes`  for both options.

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/79b672c-Screenshot_2023-04-11_at_10.57.38_AM.png",
        null,
        ""
      ],
      "align": "center",
      "sizing": "50% ",
      "border": true
    }
  ]
}
[/block]



### Products API

RevenueCat uses the Products API endpoints to consume purchases and once to validate the purchase.

### Quota

The specific quota value and time length you request may depend on your situation, including:

- Whether you are using the Subscription & Products API from your own backend.
- Whether you can anticipate predictable marketing efforts or seasonal surges in purchases.

Generally, we find requesting **500k** to be suitable for most apps meeting the threshold, but you can view your exact usage in the [Google Cloud Quotas dashboard](https://cloud.google.com/docs/quota#viewing_all_quota_console).
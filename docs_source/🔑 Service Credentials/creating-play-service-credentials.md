---
title: Google Play Store
slug: creating-play-service-credentials
excerpt: Step-by-step guide for creating your Play service credentials
hidden: false
---
In order for RevenueCat's servers to communicate with Google on your behalf, you need to provide a set of service credentials. The process for configuring these credentials is a bit complex, but the added level of control improves security by providing RevenueCat with only the access we need.

> 📘 Credentials can take up to 36 hours after being created to be valid
> 
> It can take up to 36 hours for your Play Service Credentials to work properly with the Google Play Developer API. You may see "Invalid Play Store credentials" errors (503 or 521) and be unable to make purchases with RevenueCat until this happens.

# Setup

Note that this setup takes place on both the Google Play Console and the Google Cloud Console. Due to the nature of the process, there’s some switching back and forth between each console that can’t be helped, but each step will make clear which console you should be looking at.

## 1. Enable the Google Developer and Reporting API

To enable the Developer and Reporting APIs for your Google Cloud Project, you’ll want to do the following:
1. Go to the [API Console](https://console.developers.google.com/).
2. From the projects list, select a project or create a new one.
3. Go to the [Google Play Android Developer API page](https://console.cloud.google.com/apis/library/androidpublisher.googleapis.com) and the [Google Play Developer Reporting API page](https://console.cloud.google.com/apis/library/playdeveloperreporting.googleapis.com) in Google Cloud Console.
4. Click **Enable**. (This will say **Manage** when it is enabled.)

<img width="1440" alt="Screen Shot 2023-10-10 at 9 13 34 AM" src="https://github.com/RevenueCat/revenuecat-docs/assets/112121235/eb11e0c6-d729-49df-861d-811b2094ecc7">
<img width="1440" alt="Screen Shot 2023-10-10 at 1 52 03 PM" src="https://github.com/RevenueCat/revenuecat-docs/assets/112121235/77a04f0b-db92-4b3b-ab24-ba408dcf5d82">

After enabling the API, you will be redirected to your Google Cloud API page. From there, if you do not have credentials, you will need to create these following the prompt. You'll want to select that you are using the Google Play Android Developer API. Note that you'll want to generate these with either the owner of the project or a user that has the permissions from step 3 enabled in Google Play Console.
<img width="1440" alt="Screen Shot 2023-10-10 at 9 19 33 AM" src="https://github.com/RevenueCat/revenuecat-docs/assets/112121235/2a1fee7d-cda6-410f-a214-81d76d3e9094">

You will then be redirected to create your form of credentials which you can follow step 2 for. If you just created your credentials, you may see the “To use this API, you may need credentials” message on your API console, this is because your credentials have not yet been validated. This will be done automatically by Google.
<img width="1440" alt="Screen Shot 2023-10-10 at 9 17 30 AM" src="https://github.com/RevenueCat/revenuecat-docs/assets/112121235/1a238dea-aae6-45ab-a753-16287b0a8a32">

## 2. Create a Service Account

- Where: Google Cloud Console
- [Cloud Console](https://console.cloud.google.com) :fa-arrow-right: [IAM & Admin](https://console.cloud.google.com/iam-admin) :fa-arrow-right: [Service Account](https://console.cloud.google.com/iam-admin/serviceaccounts)
- You can also reach this page from the last screen used in Google Play Console. Click '**Learn how to create service accounts**', then '**Google Cloud Platform**' from the pop up. This will ensure that you're in the same project that you linked in Step 1 - if using the the links above or another way, double check this before creating the service account.

### a. Create and name the service account key credentials and add roles.

Select the button to '**Create Service Account**'. These are the credentials that RevenueCat will need to communicate with Google. Name your new account, then select '**Create and continue**'.

On the step named '**Grant this service account access to project**', you'll add two Roles:

- Pub/Sub Admin - this enables Platform Server Notifications
- Monitoring Viewer - this allows monitoring of the notification queue

Note that searching by name in the filter does not always bring up both roles. You can also find each by scrolling through the list - in the Pub/Sub and Monitoring folders respectively.

You can skip the optional third step, and select done. 

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/7706775-Crede_Step2aaaa.gif",
        null,
        "Google Cloud Console"
      ],
      "align": "center",
      "caption": "Google Cloud Console"
    }
  ]
}
[/block]

### b. Create and download the public key

In the '**Service Accounts**' section of the Google Cloud Console, select the three dots for the Actions dropdown menu, then Manage Keys. 

Select Add Key, then Create new key. On the pop up, make sure JSON is selected, and then create and download the JSON Key. We'll use this in Step 4.

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/a6896be-Crede_Step2b.gif",
        null,
        "Google Cloud Console"
      ],
      "align": "center",
      "caption": "Google Cloud Console"
    }
  ]
}
[/block]

> 📘 Enable the Pub/Sub API for Google Developer Notifications
> 
> While you're in the Google Cloud Console, get a head start on setting up Google real-time developer notifications by ensuring Google Cloud Pub/Sub is enabled for your project. You can enable it [here](https://console.cloud.google.com/flows/enableapi?apiid=pubsub).

## 3. Grant Financial Access to RevenueCat

- Where: Google Play Console
- Developer homepage :fa-arrow-right: Users and permissions

In the Google Play Console, go to the '**Users and Permissions**' section' and select invite user. You'll want to invite the service account you created in Step 2. Under 'App permissions' you need to add your app. Then under 'Account permissions', you need to grant certain permissions in order for RevenueCat to properly work.

### Grant the following permissions:

- View app information and download bulk reports (read-only)
- View financial data, orders, and cancellation survey response
- Manage orders and subscriptions

All other choices are yours - the other boxes can be checked or unchecked according to your needs, as long as those three are selected.

Select invite user at the bottom of the page, and send the invite. You'll then be redirected to '**Users and Permissions**', where you should see your newly created account as active.

<img width="1440" alt="Screen Shot 2023-10-11 at 4 17 16 PM" src="https://github.com/RevenueCat/revenuecat-docs/assets/112121235/bc8ba256-3cac-4af3-95e9-742b345e11ae">
<img width="1440" alt="Screen Shot 2023-10-11 at 4 24 24 PM" src="https://github.com/RevenueCat/revenuecat-docs/assets/112121235/2854dd07-8ca8-4734-bc96-80d8adedbf05">


## 4. Enter the Credentials JSON in RevenueCat

- Where: RevenueCat Dashboard
- Project Page :fa-arrow-right: Google Play App Settings

Find your credentials JSON file that was downloaded in Step 2 and either drop it into your project settings or select it from the finder. Be sure to save changes. Within approximately 36 hours, your credentials will be activated and we’ll be ready to handle Google Play purchases!

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/c0354f7-Crede_Step4.gif",
        null,
        "RevenueCat Dashboard"
      ],
      "align": "center",
      "caption": "RevenueCat Dashboard"
    }
  ]
}
[/block]

> 📘 
> 
> There is a workaround to get this validated sooner. In Google Play Console, open your app's dashboard and visit the 'Monetize' section. Go to Products -> Subscriptions/in-app products, and change the description of any product and save the changes. This should work to enable the new service credentials right away (or very shortly) and you can revert the changes to that product. It's not guaranteed to work, but has worked for others in the past to get things working right away. Otherwise, it usually starts working within 24 hours but possibly more than 36.

> 👍 
> 
> While you’re in your RevenueCat Play Store App settings and waiting for your credentials to activate, set up your [Google Real-Time Developer Notifications](https://www.revenuecat.com/docs/google-server-notifications). If you enabled Pub/Sub in Step 2 of this doc, skip ahead to [step 2](https://www.revenuecat.com/docs/google-server-notifications#2-choose-a-pubsub-topic-id) of the setup.

# Check the status of your credentials

With our Google Play credential validation, we will validate every time Google credentials are (re)uploaded or at any time through a click of a button. A summary message will appear with the results of the validation to provide you additional information about the status of your Google credentials.

Once your credentials are valid, you will see a "Valid credentials" message under your uploaded JSON file with all permissions checked.

![](https://files.readme.io/c7680f9-Screen_Shot_2023-06-05_at_7.23.15_AM.png)

## Troubleshooting the credential validation

Before starting to dive deeper in troubleshooting your credentials, you should confirm the following:

- The JSON file uploaded to RevenueCat is the correct file
- You have re-uploaded the credentials into RevenueCat

### subscriptions API

If the permission to call subscriptions API validation is not passing, that means we were unable to use your credentials to receive a response from Google's [GET subscriptions endpoint](https://developers.google.com/android-publisher/api-ref/rest/v3/purchases.subscriptionsv2/get). 

Ensure that you have granted the following permissions:

- View financial data in [step 3a](https://docs-origin.revenuecat.com/docs/creating-play-service-credentials#a-grant-the-following-permissions)
- Manage orders and subscriptions in [step 3a](https://www.revenuecat.com/docs/creating-play-service-credentials#a-grant-the-following-permissions)
- Once this is done, try to make a test purchase using a [Sandbox user](https://www.revenuecat.com/docs/google-play-store) in order to check if the connection to the subscriptions API is working. 

You will also want to make sure that you have uploaded your signed APK or Android App Bundle and have completed all the steps to approve the release.

### inappproducts API

If the permission to call inappproducts API validation is not passing, that means we were unable to use your credentials to receive a response from Google's [GET inappproducts endpoint](https://developers.google.com/android-publisher/api-ref/rest/v3/inappproducts/get).

Ensure that you have granted the following permission:

- View app information and download bulk reports (read-only) in [step 3a](https://docs-origin.revenuecat.com/docs/creating-play-service-credentials#a-grant-the-following-permissions) 

### monetization API

If the permission to call monetization API validation is not passing, that means we were unable to use your credentials to receive a response from Google's [LIST monetization endpoint](https://developers.google.com/android-publisher/api-ref/rest/v3/monetization.subscriptions/list). 

Ensure that you have granted the following permission:

- View financial data in [step 3a](https://docs-origin.revenuecat.com/docs/creating-play-service-credentials#a-grant-the-following-permissions) 

After making changes to your Google credentials, it may take 24 hours, up to 36 hours, for the changes to populate throughout Google's servers. 

# Troubleshooting

This guide contains a lot of information and many steps, and it can be all too easy to move too quickly or simply misconfigure something. Break down each step by where it needs to take place as you're going through the guide or after the fact with our handy [Checklist](doc:google-play-checklists).

## Error Handling

Commonly occurring errors when setting up your service credentials or developer notifications and what to do when you see them.

| Error:                                       | Underlying message:                                                                                                                                                                                                       | What to do:                                                                                                                                                                                                                                                                                      |
| :------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `INVALID_GOOGLE_CREDENTIALS_ACCESS_ERROR`    | 'Your Google Service Account credentials do not have permissions to access the needed Google resources. Refer to [this guide](https://docs.revenuecat.com/docs/creating-play-service-credentials) for more information.'  | Confirm that the roles granted to your service account in Google Cloud match: **Pub/Sub Admin** and **Monitoring Viewer**. If you change them or update them at all, make sure that you re-generate your JSON key to add to RevenueCat.                                                          |
| `INVALID_GOOGLE_CREDENTIALS_ERROR`           | 'The provided Google Service Account credentials JSON is invalid.'                                                                                                                                                        | Re-generate the JSON key from Google Cloud and try uploading it to RevenueCat again. If you get the same error, try re-creating your service account.                                                                                                                                            |
| `INVALID_PLAY_STORE_CREDENTIALS`             | 'Invalid Play Store credentials.'                                                                                                                                                                                         | Unfortunately, this one is a little vague. Run through the guide again, ensuring that all steps have been followed. If you've already waited for over 36 hours and continue to get this error, try starting over from the beginning.                                                             |
| `MISSING_GOOGLE_SERVICE_ACCOUNT_CREDENTIALS` | 'Google Play service account credentials must be set up before using this feature.'                                                                                                                                       | This one is most likely to crop up if trying to perform an action that communicates with Google, such as importing products for Android, before setting up service credentials.                                                                                                                  |
| `INVALID_PERMISSIONS_FOR_ENDPOINT`           | 'Account permissions are invalid for this request.'                                                                                                                                                                       | Not all RevenueCat collaborators have the same permissions. In order to make changes to an app's configuration (such as creating service credentials), a user must be listed as an 'Admin'.                                                                                                      |
| `GOOGLE_PLAY_PUB_SUB_NOT_ENABLED`            | 'Google Play Pub/Sub integration is not currently enabled for this app.'                                                                                                                                                  | Enable access to the Pub/Sub API on the Google Cloud Console for the same project that you used to set up your service credentials.                                                                                                                                                              |
| `PUBSUB_GENERIC_USER_PERMISSION_ERROR`       | 'Your Google service account credentials do not have permissions to access the Google Cloud Pub/Sub API. Refer to [this guide](https://docs.revenuecat.com/docs/creating-play-service-credentials) for more information.' | This points to either the Pub/ Sub API access not being enabled, or the Pub/Sub role that has been added to the service account is not the admin role. Double check that your service account has the correct roles, and if changing them, re-generate the JSON key and re-add it to RevenueCat. |

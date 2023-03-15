---
title: "Firebase"
slug: "firebase-integration"
excerpt: "Integrate in-app purchase events from RevenueCat with Firebase"
hidden: false
metadata: 
  title: "Firebase Integration – RevenueCat"
  image: 
    0: "https://files.readme.io/75a16dc-RevenueCat_Docs_OG.png"
    1: "RevenueCat Docs OG.png"
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: "2022-04-06T23:08:59.811Z"
updatedAt: "2023-01-03T22:51:38.246Z"
---
[block:callout]
{
  "type": "success",
  "body": "The Firebase integration is available on the [Starter](https://www.revenuecat.com/pricing) plan."
}
[/block]
This extension uses Firebase services as your RevenueCat backend for in-app purchases on Apple App Store, Google Play Store, and Amazon Appstore to control access to premium content and sync customer purchase information to Firestore. For example, you might want to:
- Store purchase lifecycle events (e.g., trial starts, purchases, subscription renewals, billing issues) in Firestore and react to them.
- Store and update information about customers and their purchases in Firestore.
- Update information about customers' entitlements as Firebase Authentication [Custom Claims](https://firebase.google.com/docs/auth/admin/custom-claims).

This Firebase integration has 2 parts that can be used independently of each other: Google Analytics and Firebase Extension. The Google Analytics portion of this integration allows RevenueCat to send subscription lifecycle events to Firebase Analytics / Google Analytics. The Firebase Extension allows RevenueCat to store and update customer information in a Cloud Firestore collection and set custom claims on a user's auth token to check active entitlement status. 

Each part of the integration requires additional setup, which you can see outlined in the table below.
[block:parameters]
{
  "data": {
    "h-0": "Integration",
    "h-1": "What's required",
    "h-2": "",
    "0-0": "Google Analytics",
    "1-0": "Firebase Extension",
    "0-1": "✅  `$firebaseAppInstanceId` subscriber attribute\n❌  (optional, but highly recommended) Setting Firebase user identity",
    "1-1": "✅  Setting Firebase user identity",
    "0-2": "",
    "1-2": ""
  },
  "cols": 2,
  "rows": 2
}
[/block]
# 1. Set up Firebase services in your project

Before installing this extension, set up the following Firebase services in your Firebase project.
- (optional) [Cloud Firestore](https://firebase.google.com/docs/firestore) to store In-App Purchases & Subscriptions details.
  - Follow the steps in the [documentation](https://firebase.google.com/docs/firestore/quickstart#create) to create a Cloud Firestore database.
- (optional) [Firebase Authentication](https://firebase.google.com/docs/auth) to enable different sign-up options for your users to enable Custom Claims management.
  - Enable the sign-in methods in the [Firebase console](https://console.firebase.google.com/project/_/authentication/providers) that you want to offer your users.
[block:callout]
{
  "type": "warning",
  "title": "Invalid API Version",
  "body": "When connecting to Firebase, it's possible that you may see an error like:\n\n\"Invalid API Version\", with a couple of different version numbers. This is fixed as part of an automatic upgrade process when installing the extension, and generally doesn't indicate there being an issue with your setup."
}
[/block]
# 2. Set Firebase User Identity in RevenueCat 
You should make sure to use the Firebase UID as the RevenueCat app user ID when setting the Firebase user identity in RevenueCat. This step is optional, but highly recommended as a best practice for the Google Analytics portion of this integration. The Firebase Extension portion **requires** this step to be completed.

[block:code]
{
  "codes": [
    {
      "code": "import FirebaseAuth\nimport RevenueCat\n\nfunc application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {\n    \n    // Configure Purchases before Firebase\n    Purchases.configure(withAPIKey: \"public_sdk_key\")\n    Purchases.shared.delegate = self\n    \n    // Add state change listener for Firebase Authentication\n    Auth.auth().addStateDidChangeListener { (auth, user) in\n    \n            \n        if let uid = user?.uid {\n            \n            // identify Purchases SDK with new Firebase user\n            Purchases.shared.logIn(uid, { (info, created, error) in\n                if let e = error {\n                    print(\"Sign in error: \\(e.localizedDescription)\")\n                } else {\n                    print(\"User \\(uid) signed in\")\n                }\n            })\n        }\n    }\n    return true\n}\n",
      "language": "swift"
    }
  ]
}
[/block]



# 3. Send analytics events to Google Analytics
In order to send subscriber lifecycle events to Google Analytics, you must set the `$firebaseAppInstanceId` as a subscriber attribute for your users and enable the integration from the RevenueCat integration settings page.

## Set `$firebaseAppInstanceId` as a subscriber attribute

Please ensure you're getting the app instance ID from the [Firebase Analytics](https://firebase.google.com/docs/analytics/get-started) package.
[block:code]
{
  "codes": [
    {
      "code": "import FirebaseAuth\nimport RevenueCat\n\nfunc application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {\n    \n    // Configure Purchases before Firebase\n    Purchases.configure(withAPIKey: \"public_sdk_key\")\n    Purchases.shared.delegate = self\n\n    // Set the reserved $firebaseAppInstanceId subscriber attribute from Firebase Analytics\n    let instanceID = Analytics.appInstanceID();\n    if let unwrapped = instanceID {\n      print(\"Instance ID -> \" + unwrapped);\n     \tprint(\"Setting Attributes\");\n      Purchases.shared.attribution.setFirebaseAppInstanceID(unwrapped)\n     } else {\n     \tprint(\"Instance ID -> NOT FOUND!\");\n     }\n    \n    return true\n}",
      "language": "swift"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "warning",
  "body": "Setting an incorrect app instance ID will prevent events from displaying in Google Analytics."
}
[/block]

## Enable Google Analytics

You can "turn on" the integration from the RevenueCat dashboard.
1. Navigate to your project in the RevenueCat dashboard and find the *Integrations* card in the left menu. Select **+ New**

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/2bd4b4b-9ba8b4c-Screen_Shot_2021-12-01_at_12.23.10_PM.png",
        "9ba8b4c-Screen_Shot_2021-12-01_at_12.23.10_PM.png",
        332,
        410,
        "#f5f6f5"
      ]
    }
  ]
}
[/block]
2. Choose **Firebase** from the integrations menu
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/41697af-Screen_Shot_2022-04-13_at_9.21.49_AM.png",
        "Screen Shot 2022-04-13 at 9.21.49 AM.png",
        932,
        798,
        "#fafafa"
      ],
      "caption": "Firebase Google Analytics configuration screen"
    }
  ]
}
[/block]
3. Add your Firebase App ID and API secret for your iOS app and/or Android app

To set up your Firebase App ID, navigate to Google Analytics > Admin > Data Streams > iOS/Android > Add Stream. Open the App Stream to find your Firebase App ID. Copy and paste into the RevenueCat settings page.

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/a4ad055-Screen_Shot_2022-04-05_at_11.03.48.png",
        "Screen Shot 2022-04-05 at 11.03.48.png",
        2557,
        1254,
        "#dcdbdc"
      ],
      "caption": "Data stream details page"
    }
  ]
}
[/block]
To find your API secret, in the same *App stream details* page select "Measure Protocol API secrets". Create an API secret. Copy and paste into the RevenueCat settings page. 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/47ff07c-Firebase.png",
        "Firebase.png",
        1806,
        1675,
        "#fafbfb"
      ],
      "caption": "Measurement Protocol API secrets page"
    }
  ]
}
[/block]
4. Select whether you want RevenueCat to report sales in purchased currency (original currency or in US dollar)
5. Select whether you want sales reported as gross revenue (before app store commission), or after store commission and/or estimated taxes.

Remember to select 'Add Integration'. 

## Events 

The Google Analytics portion of the Firebase integration tracks the following events:
[block:parameters]
{
  "data": {
    "h-0": "Event Type",
    "h-1": "Event Name",
    "h-2": "Description",
    "4-0": "Uncancellation",
    "4-1": "rc_uncancellation",
    "6-0": "Billing Issue",
    "6-1": "rc_billing_issue",
    "7-0": "Subscription Paused",
    "7-1": "rc_subscription_paused",
    "8-0": "Transfer",
    "8-1": "rc_transfer",
    "9-0": "Expiration",
    "9-1": "rc_expiration",
    "4-2": "When a user re-enables the auto-renew status for a subscription.",
    "6-2": "When a billing issue is detected.",
    "7-2": "When a subscription is paused. Available for Google Play subscriptions only.",
    "9-2": "When a subscription expires.",
    "0-0": "Initial Purchase",
    "0-1": "purchase",
    "0-2": "A new subscription has been purchased or a lapsed user has resubscribed.",
    "2-0": "Trial Started",
    "2-1": "rc_trial_start",
    "2-2": "The start of an auto-renewing subscription product free trial.",
    "3-0": "Cancellation (incl. during trial)",
    "3-1": "rc_cancellation",
    "3-2": "When a user turns off renewals for an auto-renewing subscription product.",
    "1-0": "Renewal (incl. trial conversion)",
    "1-1": "purchase",
    "1-2": "An existing subscription has been renewed.",
    "5-0": "Non Subscription Purchase",
    "5-1": "purchase",
    "5-2": "The purchase of any product that's not an auto-renewing subscription.",
    "10-0": "Product Change",
    "10-1": "rc_product_change",
    "10-2": "When user has changed the product of their subscription.\n\nThis does not mean the new subscription is in effect immediately. See [Managing Subscriptions](doc:managing-subscriptions) for more details on updates, downgrades, and crossgrades.",
    "8-2": "A transfer of transactions and entitlements was initiated between one App User ID(s) to another."
  },
  "cols": 3,
  "rows": 11
}
[/block]
## Testing Google Analytics

### Make a sandbox purchase with a new user
Simulate a new user installing your app, and go through your app flow to complete the [sandbox purchase](doc:sandbox).

### Check Google Analytics Dashboard
Navigate to Google Analytics > Reports > Realtime. Here you will be able to confirm events have been successfully dispatched to Google Analytics. It can take up to a few seconds or minutes for your events to appear. 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/7940d21-Screen_Shot_2022-07-25_at_1.50.22_PM.png",
        "Screen Shot 2022-07-25 at 1.50.22 PM.png",
        1071,
        557,
        "#f3f5f6"
      ],
      "caption": "Google Analytics dashboard"
    }
  ]
}
[/block]
## Firebase A/B Testing

While these events will appear in Firebase, Google does not allow events that are submitted via the Google Analytics 4 Measurement Protocol API to be used with Firebase A/B testing at this time. Since the integration uses this API, these events are not yet compatible with Firebase A/B Testing.
[block:callout]
{
  "type": "success",
  "body": "You have completed the Google Analytics setup! You can stop here or continue with the rest of the documentation to learn how to set up the Firebase Extension."
}
[/block]
# 4. Send customer information to Firestore

## Prerequisites 
This section outlines steps that need to be completed in order to enable the Firebase Extension portion of this integration. 

### Billing
Your Firebase project must be on the Blaze (pay-as-you-go) plan to install an extension.

You will be charged a small amount (typically around $0.01/month) for the Firebase resources required by this extension (even if it is not used). In addition, this extension uses the following Firebase services, which may have associated charges if you exceed the service's free tier for low-volume use ([Learn more about Firebase billing](https://firebase.google.com/pricing)):

- Cloud Firestore
- Cloud Functions

### Set your Cloud Firestore security rules
Set your security rules so that only authenticated users can access customer information, and that each user can only access their own information. 
[block:code]
{
  "codes": [
    {
      "code": "rules_version = '2';\nservice cloud.firestore {\n  match /databases/{database}/documents {\n    match /${param:REVENUECAT_CUSTOMERS_COLLECTION}/{uid} {\n      allow read: if request.auth.uid == uid;\n    }\n\n    match /${param:REVENUECAT_EVENTS_COLLECTION}/{id} {\n      allow read: if request.auth.uid == resource.app_user_id\n    }\n  }\n}",
      "language": "text"
    }
  ]
}
[/block]
## Enable Firebase Extension
You can install this extension either through the [Firebase Console](doc:firebase-integration#install-firebase-extension-through-firebase-console) or [CLI](doc:firebase-integration#install-firebase-extension-through-cli) on your OS.

### Install Firebase Extension through Firebase Console
Follow [this installation link](https://console.firebase.google.com/project/_/extensions/install?ref=revenuecat/firestore-revenuecat-purchases) to start the installation prompts on Firebase Console. 

1. Select 'I acknowledge'
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/0480fb7-1.png",
        "1.png",
        1734,
        1126,
        "#f1f2f5"
      ]
    }
  ]
}
[/block]
2. If your account is not set up for billing yet, select 'Upgrade project to continue'
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/a11cefc-2.png",
        "2.png",
        1656,
        1246,
        "#eef0f3"
      ]
    }
  ]
}
[/block]
3. Enable Authentication and Secret Manager by selecting 'Enable', then select 'Next'
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/f0a1273-3.png",
        "3.png",
        1544,
        2523,
        "#f3f3f3"
      ]
    }
  ]
}
[/block]
4. Select 'Next' 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/f1021a5-4.png",
        "4.png",
        1588,
        1360,
        "#eceef1"
      ]
    }
  ]
}
[/block]
5. Configure the extension
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/99fe4d8-5.png",
        "5.png",
        1536,
        2106,
        "#f3f4f5"
      ]
    }
  ]
}
[/block]
- Select a Cloud Functions location 
- (optional) Give a name to the Firestore collection where "events" will be stored
- (optional) Give a name to the Firestore collection where "customers" will be stored
- Enable or disable custom claims set in Firebase Auth with user's active entitlements. If set to “ENABLED”, the extension will consider the `app_user_id` of the user to match the user’s Firebase Authentication UID and set a “Custom Claim” with their current active entitlements
- Enter your RevenueCat Firebase Integration Shared Secret. This can be found in the RevenueCat Firebase Extension settings page. Select 'Generate shared secret' and copy it. Paste the generated shared secret in the installation prompt.

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/d3c4c3e-Screen_Shot_2022-04-14_at_11.25.06.png",
        "Screen Shot 2022-04-14 at 11.25.06.png",
        934,
        490,
        "#faf9f9"
      ]
    }
  ]
}
[/block]
- (optional) Enable events to write custom event handlers via [Eventarc](https://firebase.google.com/docs/extensions/install-extensions?authuser=0&hl=en&platform=console#eventarc) 

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/2265dfc-enable_events.png",
        "enable_events.png",
        1478,
        742,
        "#f6f7f7"
      ]
    }
  ]
}
[/block]
#### Available Events:
[block:parameters]
{
  "data": {
    "h-0": "Event",
    "h-1": "Description",
    "0-0": "`test`",
    "0-1": "Occurs whenever a test event issued through the RevenueCat dashboard.",
    "1-0": "`initial_purchase`",
    "1-1": "Occurs whenever a new subscription has been purchased or a lapsed user has resubscribed.",
    "2-0": "`non_renewing_puchase`",
    "2-1": "Occurs whenever a customer has made a purchase that will not auto-renew.",
    "3-0": "`renewal `",
    "3-1": "Occurs whenever an existing subscription has been renewed.",
    "4-0": "`product_change`",
    "4-1": "Occurs whenever a subscriber has changed the product of their subscription.",
    "5-0": "`cancellation`",
    "5-1": "Occurs whenever a subscription or non-renewing purchase has been cancelled. See cancellation reasons for more details.",
    "6-0": "`uncancellation `",
    "6-1": "Occurs whenever an auto-renew status has been re-enabled for a subscription.",
    "7-0": "`billing_issue`",
    "7-1": "Occurs whenever there has been a problem trying to charge the subscriber. This does not mean the subscription has expired.",
    "8-0": "`subscriber_alias`",
    "8-1": "Deprecated. Occurs whenever a new app_user_id has been registered for an existing subscriber.",
    "9-0": "`subscription_paused`",
    "9-1": "Occurs whenever a subscription has been paused.",
    "10-0": "`transfer `",
    "10-1": "Occurs whenever a transfer of transactions and entitlements was initiated between one App User ID(s) to another.",
    "11-0": "`expiration `",
    "11-1": "Occurs whenever a subscription has expired and access should be removed."
  },
  "cols": 2,
  "rows": 12
}
[/block]
- Select 'Install extension'. This will take about 3-5 minutes to complete

6. Once the extension is installed, navigate to Firebase > Functions in the sidebar. Copy the 'Trigger URL' and paste this into the RevenueCat Firebase Extension settings page.

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/4416a89-Screen_Shot_2022-04-14_at_11.18.59.png",
        "Screen Shot 2022-04-14 at 11.18.59.png",
        2549,
        1255,
        "#bbbcbf"
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
        "https://files.readme.io/a8c5e19-Screen_Shot_2022-04-15_at_2.08.18_PM.png",
        "Screen Shot 2022-04-15 at 2.08.18 PM.png",
        932,
        622,
        "#f9f6f6"
      ]
    }
  ]
}
[/block]
Remember to select 'Save' 
[block:callout]
{
  "type": "success",
  "body": "You have successfully installed your instance of Enable In-App Purchases with RevenueCat! Skip to [Testing Firebase Extension](doc:firebase-integration#testing-firebase-extension) section of the docs."
}
[/block]
### Install Firebase Extension through CLI
If you installed the Firebase Extension through the Firebase Console, skip to [Testing Firebase Extension](doc:firebase-integration#testing-firebase-extension) of the docs. 

This portion of the installation is done through the command-line interface (CLI). Clone this [Github repo](https://github.com/RevenueCat/firestore-revenuecat-purchases) and open the CLI for your respective operating system.

1. Run `firebase ext:install . --project [project-id]`
To find your `project-id`, go to your [Firebase console](https://console.firebase.google.com/u/0/). Select your project and navigate to Project settings to copy the ID and replace `[project-id]` in the command. 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/5a32c66-Screen_Shot_2022-04-14_at_11.30.52.png",
        "Screen Shot 2022-04-14 at 11.30.52.png",
        1311,
        935,
        "#c0d2f1"
      ],
      "caption": ""
    }
  ]
}
[/block]

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/9ab4401-Screen_Shot_2022-04-14_at_11.31.32.png",
        "Screen Shot 2022-04-14 at 11.31.32.png",
        2068,
        935,
        "#dbdde0"
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
        "https://files.readme.io/3f08828-unnamed.png",
        "unnamed.png",
        2533,
        416,
        "#030303"
      ]
    }
  ]
}
[/block]

2. For the next 2 `Do you wish to continue?` prompts, press `y`
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/6dc5e66-2.png",
        "2.png",
        1046,
        269,
        "#121414"
      ]
    }
  ]
}
[/block]
3. `Please enter a new name for this instance:` Give the extension a name of your choice
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/e107a6d-3.png",
        "3.png",
        1750,
        322,
        "#0a0b0b"
      ]
    }
  ]
}
[/block]
4. `Which option do you want enabled for this parameter (Cloud Functions location)?` Select your desired location
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/01786f5-4.png",
        "4.png",
        1535,
        697,
        "#090a0a"
      ]
    }
  ]
}
[/block]
5. `Enter a value for RevenueCat Webhook Events Firestore collection:` Give a name to the Firestore collection where "events" will be stored. If left blank, RevenueCat will not save events.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/b9cfb9a-5.png",
        "5.png",
        1713,
        699,
        "#080909"
      ]
    }
  ]
}
[/block]
6. `Enter a value for location of the customers collection:` Give a name to the Firestore collection where the customer information will be stored. If left blank, RevenueCat will not save customer information.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/5260f64-6.png",
        "6.png",
        2480,
        878,
        "#070808"
      ]
    }
  ]
}
[/block]
7. `Which option do you want enabled for this parameter (custom claims set in Firebase Auth with the user's active entitlements):` If you want to use the custom claims feature, which allows for automatic checking for Entitlements, select `ENABLED`.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/42cb394-7.png",
        "7.png",
        2476,
        874,
        "#090909"
      ]
    }
  ]
}
[/block]
8. `Enter a value for RevenueCat Firebase Integration Shared Secret:` This can be found in the RevenueCat Firebase Extension settings page. Select 'Generate shared secret' and copy it. Paste the generated shared secret in the installation prompt.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/aaca9b3-Screen_Shot_2022-04-13_at_9.43.19_AM.png",
        "Screen Shot 2022-04-13 at 9.43.19 AM.png",
        1858,
        980,
        "#fbfafa"
      ],
      "caption": "RevenueCat Firebase Extension page"
    }
  ]
}
[/block]

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/32e8934-8.png",
        "8.png",
        1972,
        916,
        "#0c0d0d"
      ]
    }
  ]
}
[/block]
9. Wait about 3 to 5 minutes for the installation
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/2caa47a-9.png",
        "9.png",
        2249,
        1037,
        "#090909"
      ]
    }
  ]
}
[/block]
10. Once the extension is installed, navigate to Firebase > Functions in the sidebar. Copy the 'Trigger URL' and paste this into the RevenueCat Firebase Extension settings page.

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/4416a89-Screen_Shot_2022-04-14_at_11.18.59.png",
        "Screen Shot 2022-04-14 at 11.18.59.png",
        2549,
        1255,
        "#bbbcbf"
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
        "https://files.readme.io/a8c5e19-Screen_Shot_2022-04-15_at_2.08.18_PM.png",
        "Screen Shot 2022-04-15 at 2.08.18 PM.png",
        932,
        622,
        "#f9f6f6"
      ]
    }
  ]
}
[/block]
Remember to select 'Save'. 
[block:callout]
{
  "type": "success",
  "body": "You have successfully installed your instance of Enable In-App Purchases with RevenueCat!"
}
[/block]
## Testing Firebase Extension

### Make a sandbox purchase with a new user
Simulate a new user installing your app, and go through your app flow to complete the [sandbox purchase](doc:sandbox).

### Check that the Firebase event delivered successfully
While still on the Customer View, select the purchase event in the [Customer History](doc:customer-history) page and make sure that the Firebase (Firebase function) integration event exists and was delivered successfully.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/02ff787-Screen_Shot_2022-05-09_at_7.09.39_PM.png",
        "Screen Shot 2022-05-09 at 7.09.39 PM.png",
        2802,
        436,
        "#f9f9fa"
      ]
    }
  ]
}
[/block]
### Check Firestore Database Collections
Navigate to your Firebase dashboard > Firestore Database to find events sent for your collections.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/6e4ad8e-Screen_Shot_2022-04-25_at_13.19.54.png",
        "Screen Shot 2022-04-25 at 13.19.54.png",
        2561,
        1233,
        "#e1e4e7"
      ],
      "caption": "Customers collection"
    }
  ]
}
[/block]

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/8d67ecd-Screen_Shot_2022-04-25_at_13.20.16.png",
        "Screen Shot 2022-04-25 at 13.20.16.png",
        2563,
        1234,
        "#e1e4e7"
      ],
      "caption": "Events collection"
    }
  ]
}
[/block]
### Sample Event
Below is a sample JSON that is delivered to Firestore Database for a renewal event. 
[block:code]
{
  "codes": [
    {
      "code": "{\n  \"request_body\": \"{\\\"event\\\": {\\\"event_timestamp_ms\\\": 1650416910722, \\\"product_id\\\": \\\"monthly_pro\\\", \\\"period_type\\\": \\\"NORMAL\\\", \\\"purchased_at_ms\\\": 1650416898000, \\\"expiration_at_ms\\\": 1650417198000, \\\"environment\\\": \\\"SANDBOX\\\", \\\"entitlement_id\\\": null, \\\"entitlement_ids\\\": [\\\"pro\\\"], \\\"presented_offering_id\\\": \\\"default\\\", \\\"transaction_id\\\": \\\"2000000036373963\\\", \\\"original_transaction_id\\\": \\\"1000000976812525\\\", \\\"is_family_share\\\": false, \\\"country_code\\\": \\\"US\\\", \\\"app_user_id\\\": \\\"21kYSQxa0Ga61JqXtup1T2tibAe2\\\", \\\"aliases\\\": [\\\"$RCAnonymousID:7fd423d73f8240edbc186360f14a3f97\\\", \\\"21kYSQxa0Ga61JqXtup1T2tibAe2\\\"], \\\"original_app_user_id\\\": \\\"$RCAnonymousID:7fd423d73f8240edbc186360f14a3f97\\\", \\\"currency\\\": \\\"USD\\\", \\\"is_trial_conversion\\\": false, \\\"price\\\": 2.49, \\\"price_in_purchased_currency\\\": 2.49, \\\"subscriber_attributes\\\": {\\\"$attConsentStatus\\\": {\\\"value\\\": \\\"notDetermined\\\", \\\"updated_at_ms\\\": 1650416909148}}, \\\"store\\\": \\\"APP_STORE\\\", \\\"takehome_percentage\\\": 0.7, \\\"offer_code\\\": null, \\\"type\\\": \\\"RENEWAL\\\", \\\"id\\\": \\\"2700D251-95AF-4A28-A460-130A7CC23F66\\\", \\\"app_id\\\": \\\"app5b6fd8d088\\\"}, \\\"customer_info\\\": {\\\"original_app_user_id\\\": \\\"$RCAnonymousID:7fd423d73f8240edbc186360f14a3f97\\\", \\\"first_seen\\\": \\\"2022-04-20T00:11:30Z\\\", \\\"last_seen\\\": \\\"2022-04-20T01:06:49Z\\\", \\\"subscriptions\\\": {\\\"monthly_pro\\\": {\\\"purchase_date\\\": \\\"2022-04-20T01:08:18Z\\\", \\\"expires_date\\\": \\\"2022-04-20T01:13:18Z\\\", \\\"period_type\\\": \\\"normal\\\", \\\"original_purchase_date\\\": \\\"2022-02-25T04:21:45Z\\\", \\\"store\\\": \\\"app_store\\\", \\\"is_sandbox\\\": true, \\\"unsubscribe_detected_at\\\": null, \\\"billing_issues_detected_at\\\": null, \\\"grace_period_expires_date\\\": null, \\\"ownership_type\\\": \\\"PURCHASED\\\"}}, \\\"non_subscriptions\\\": {}, \\\"other_purchases\\\": {}, \\\"original_application_version\\\": \\\"1.0\\\", \\\"original_purchase_date\\\": \\\"2013-08-01T07:00:00Z\\\", \\\"entitlements\\\": {\\\"pro\\\": {\\\"expires_date\\\": \\\"2022-04-20T01:13:18Z\\\", \\\"purchase_date\\\": \\\"2022-04-20T01:08:18Z\\\", \\\"product_identifier\\\": \\\"monthly_pro\\\", \\\"grace_period_expires_date\\\": null}}, \\\"management_url\\\": \\\"https://apps.apple.com/account/subscriptions\\\"}, \\\"api_version\\\": \\\"1.0.0\\\"}\",\n  \"signed_jws_body\": \"{\\\"token\\\": \\\"...\\\"}\"\n}",
      "language": "json"
    }
  ]
}
[/block]
## Using the Extension 

### Checking Entitlement access
To check access to entitlements, you can either [use the RevenueCat SDK](https://docs.revenuecat.com/docs/getting-started#10-get-subscription-status) or use Firebase Authentication custom claims. For example, to check whether the current user has access to an entitlement called `premium`, you could use the following Firebase code:

[block:code]
{
  "codes": [
    {
      "code": "getAuth().currentUser.getIdTokenResult()\n  .then((idTokenResult) => {\n     // Confirm the user has a premium entitlement.\n     if (!!idTokenResult.claims.activeEntitlements.includes(\"premium\")) {\n       // Show premium UI.\n       showPremiumUI();\n     } else {\n       // Show regular user UI.\n       showFreeUI();\n     }\n  })\n  .catch((error) => {\n    console.log(error);\n  });",
      "language": "javascript"
    }
  ]
}
[/block]
### List a user's active subscriptions
To list a user's active subscriptions, you could use the following Firebase code:
[block:code]
{
  "codes": [
    {
      "code": "getDoc(doc(db, \"${param:REVENUECAT_CUSTOMERS_COLLECTION}\", getAuth().currentUser.uid))\n  .then((snapshot) => {\n    if (snapshot.exists()) {\n      snapshot.subscriptions\n        .filter(subscription => new Date(subscription.expires_date) >= new Date())\n        .forEach(subscription => console.log(JSON.stringify(subscription)));\n    }\n  });",
      "language": "javascript"
    }
  ]
}
[/block]
### React to subscription lifecycle events
Subscription lifecycle events get stored as events in the Firestore collection `${param:REVENUECAT_EVENTS_COLLECTION}`. By listening to changes in this collection, for example, through [Cloud Firestore triggered Firebase Cloud Functions](https://firebase.google.com/docs/functions/firestore-events), you can trigger any custom behavior that you want. An example could be sending push notifications to customers with billing issues to prompt them to update their credit cards. To do that, you would:

- Store a push notification token for each of your app users, e.g., using [Firebase Cloud Messaging](https://firebase.google.com/docs/cloud-messaging)
- Create a new Cloud Function triggered whenever a new document is created in the `${param:REVENUECAT_EVENTS_COLLECTION}` collection
- In the Cloud Function, determine if the `type` field of the new document is `"BILLING_ISSUE"`
- If so, look up the app user ID from the `app_user_id` field of the new document
- Look up the push token for that app user ID and send a push notification
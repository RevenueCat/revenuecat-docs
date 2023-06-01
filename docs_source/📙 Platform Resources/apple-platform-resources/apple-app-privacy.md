---
title: Apple App Privacy
slug: apple-app-privacy
excerpt: How to fill out the questionnaire
hidden: false
metadata:
  title: Apple App Privacy Disclosure – RevenueCat
  description: Starting December 8, 2020, Apple requires a privacy disclosure for
    all new apps and app updates. As RevenueCat is a third-party to your app, you’ll
    need to ensure you are properly disclosing to your users the ways you are using
    RevenueCat in regards to their data.
  image:
    0: https://files.readme.io/99cd8f8-RevenueCat_Docs_OG.png
    1: RevenueCat Docs OG.png
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: '2020-11-10T18:05:47.960Z'
updatedAt: '2020-12-11T16:34:47.391Z'
category: 6478b8643a66a114558bdd69
---
Starting December 8, 2020, Apple requires a privacy disclosure for all new apps and app updates. As RevenueCat is a third-party to your app, you’ll need to ensure you are properly disclosing to your users the ways you are using RevenueCat in regards to their data.

# Data Types

✅ = Required when using RevenueCat
💡 = May be required when using RevenueCat
❌ = Not required when using RevenueCat
[block:parameters]
{
  "data": {
    "h-0": "Data Type",
    "h-1": "Required?",
    "0-0": "Contact Info, including name or email address",
    "0-1": "💡 If you use subscriber attributes to collect identifiable contact information including name, email address, or phone number",
    "1-0": "Health & Fitness",
    "1-1": "❌ RevenueCat does not collect health or fitness data from users",
    "2-0": "Financial Info",
    "2-1": "❌ RevenueCat does not collect payment information from users",
    "3-0": "Location",
    "3-1": "❌ RevenueCat does not collect precise or coarse location data, only locale and currency code",
    "4-0": "Sensitive Info",
    "4-1": "❌ RevenueCat does not collect sensitive information including racial or ethnic data, political opinions, or biometric data from users",
    "5-0": "Contacts",
    "5-1": "❌ RevenueCat does not collect address books or contact lists from users",
    "6-0": "Browsing History",
    "6-1": "❌ RevenueCat does not collect browsing history from users",
    "7-0": "Search History",
    "7-1": "❌ RevenueCat does not collect search history from users",
    "8-0": "[Identifiers](https://docs.revenuecat.com/docs/apple-app-privacy#type-identifiers)",
    "8-1": "💡 If you are identifying users with a custom app user ID, you will need to select 'User ID'\n\n💡 If you are using integrations that utilize an advertising identifier, like IDFA, you will need to select 'Device ID'",
    "9-0": "[Purchases](https://docs.revenuecat.com/docs/apple-app-privacy#type-purchases)",
    "9-1": "✅ RevenueCat collects purchase history from users",
    "10-0": "Usage Data",
    "10-1": "💡 If you are using analytics SDK's such as Mixpanel, Firebase, or Amplitude, this may be required",
    "11-0": "Diagnostics",
    "11-1": "❌ RevenueCat does not collect device diagnostic information"
  },
  "cols": 2,
  "rows": 12
}
[/block]
# Required Data Types

## Type: Purchases

If you are using RevenueCat, you must disclose that your app collects ‘Purchases’ information from the App Privacy tab in App Store Connect.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/2232c73-Screen_Shot_2020-11-10_at_1.18.06_PM.png",
        "Screen Shot 2020-11-10 at 1.18.06 PM.png",
        1120,
        168,
        "#f9f9f9"
      ],
      "border": true,
      "sizing": "80"
    }
  ]
}
[/block]
### 1. Purchase History Usage

At the **bare minimum**, you must select the following options for 'Purchase History':
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/2330c00-Screen_Shot_2020-11-11_at_9.48.00_AM.png",
        "Screen Shot 2020-11-11 at 9.48.00 AM.png",
        1134,
        1382,
        "#f5f6f6"
      ],
      "border": true,
      "sizing": "80"
    }
  ]
}
[/block]
**All RevenueCat users must select these two options.**

- Selecting ‘Analytics’ ensures compliance for RevenueCat’s dashboard features including Customer History, Charts, and Experiments.
- Selecting ‘App Functionality’ ensures compliance for RevenueCat’s receipt validation in order to prevent fraud, as well as enabling features via Entitlements.
[block:callout]
{
  "type": "info",
  "body": "If you are using RevenueCat for any of the other options listed, such as collecting data for Third-Party Advertising, you will need to select those options as well.",
  "title": "Additional Selections"
}
[/block]
After selecting these options for Purchase History, click ‘Next’.

### 2. Purchase History Linked to Identity

Apple will now ask if you are linking purchase history to a user’s identity. If you are using RevenueCat’s anonymous app user ID’s, and do not have a way to identify individual users, you can select ‘No’.

If you are using an app user ID that can be tied to a user’s email address or other contact information via your own server or other third-parties, you should select ‘Yes’.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/1520bb4-Screen_Shot_2020-11-10_at_1.23.21_PM.png",
        "Screen Shot 2020-11-10 at 1.23.21 PM.png",
        1112,
        222,
        "#f2f2f2"
      ],
      "border": true,
      "sizing": "80"
    }
  ]
}
[/block]
### 3. Purchase History User Tracking

Finally, to indicate if purchase history data will be used for tracking purposes, you will need to read Apple’s examples and determine if your app meets their definitions of tracking. 

RevenueCat, as a third-party, does not inherently use purchase history to track users across different apps for advertising. If you are using integrations or other SDK’s that do this, you may need to disclose that here.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/e9c42f6-Screen_Shot_2020-11-10_at_1.40.53_PM.png",
        "Screen Shot 2020-11-10 at 1.40.53 PM.png",
        1112,
        488,
        "#f5f5f5"
      ],
      "border": true,
      "sizing": "80"
    }
  ]
}
[/block]
## Type: Identifiers

If you selected 'Yes' to linking purchase history to a user's identity, you will likely need to disclose which user identifiers you use in your app.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/191ea58-Screen_Shot_2020-11-10_at_2.01.59_PM.png",
        "Screen Shot 2020-11-10 at 2.01.59 PM.png",
        1120,
        392,
        "#f6f6f6"
      ],
      "border": true,
      "sizing": "80"
    }
  ]
}
[/block]
If you are [identifying users](https://docs.revenuecat.com/docs/user-ids) with a custom app user ID, you will need to select 'User ID'.

If you are using integrations that utilize an advertising identifier, like IDFA, you will need to select 'Device ID'.

After making your selections, you'll need to indicate how the data is used similar to the Purchases section.

# What's Next

After making your privacy selections, Apple will show a preview of your app's privacy section. If you have chosen Purchases and Identifiers as described above, your privacy details should look something like this:
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/8906e83-Screen_Shot_2020-11-11_at_11.30.35_AM.png",
        "Screen Shot 2020-11-11 at 11.30.35 AM.png",
        1194,
        374,
        "#eeeeee"
      ],
      "border": true,
      "sizing": "80"
    }
  ]
}
[/block]
If you're ready to submit your app to App Review,  head over to our [Launch Checklist](https://docs.revenuecat.com/docs/launch-checklist) doc for more information about preparing your app for submission.
---
title: mParticle
slug: mparticle
excerpt: Integrate in-app subscription events from RevenueCat with mParticle
hidden: false
metadata:
  title: mParticle Integration – RevenueCat
  description: RevenueCat can automatically send subscription events into mParticle.
    From there, you pass these events on to any of the hundreds of other integrations
    on their platform.
  image:
    0: https://files.readme.io/650ba44-RevenueCat_Docs_OG.png
    1: RevenueCat Docs OG.png
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: '2020-06-17T19:13:08.598Z'
updatedAt: '2022-08-19T01:38:02.192Z'
category: 640a7bf1c7bae2004235517b
---
[block:callout]
{
  "type": "success",
  "body": "The mParticle integration is available on the [Pro](https://www.revenuecat.com/pricing) plan."
}
[/block]
mParticle can be a useful integration tool for seeing all events and revenue that occur for your app even if it’s not active for a period of time. You can use mParticle to clean up your data infrastructure and collect new customer data, which can then be connected with other tools through mParticle’s powerful API.

With our mParticle integration, you can:
- Use the API to identify users who are at risk of churning and begin a campaign to win them back.
- Set up push notifications and emails to users who have subscribed to your product but do not engage very much.

With accurate and up-to-date subscription data in Mixpanel, you'll be set to turbocharge your campaigns ⚡️

# Events

The mParticle integration tracks the following events:
[block:parameters]
{
  "data": {
    "h-0": "Event",
    "h-1": "Description",
    "0-0": "Initial Purchase",
    "1-0": "Trial Started",
    "2-0": "Trial Converted",
    "3-0": "Trial Cancelled",
    "4-0": "Renewal",
    "5-0": "Cancellation",
    "8-0": "Non Subscription Purchase",
    "0-1": "The first purchase of an auto-renewing subscription product that does not contain a free trial.",
    "1-1": "The start of an auto-renewing subscription product free trial.",
    "2-1": "When an auto-renewing subscription product converts from a free trial to normal paid period.",
    "3-1": "When a user turns off renewals for an auto-renewing subscription product during a free trial period.",
    "4-1": "When an auto-renewing subscription product renews OR a user repurchases the auto-renewing subscription product after a lapse in their subscription.",
    "5-1": "When a user turns off renewals for an auto-renewing subscription product during the normal paid period.",
    "8-1": "The purchase of any product that's not an auto-renewing subscription.",
    "7-0": "Uncancellation",
    "7-1": "When a user re-enables the auto-renew status for a subscription.",
    "6-0": "Refund",
    "6-1": "When a user canceled their subscription via customer support",
    "9-0": "Expiration",
    "9-1": "A subscription has expired and access should be removed.",
    "10-0": "Billing Issues",
    "10-1": "There has been a problem trying to charge the subscriber. \n \nThis does not mean the subscription has expired (in the case of a grace period enabled).",
    "11-0": "Product Change",
    "11-1": "When user has changed the product of their subscription.\n\nThis does not mean the new subscription is in effect immediately. See [Managing Subscriptions](doc:managing-subscriptions) for more details on updates, downgrades, and crossgrades."
  },
  "cols": 2,
  "rows": 12
}
[/block]
For events that have revenue, such as trial conversions and renewals, RevenueCat will automatically record this amount along with the event in mParticle.

# Setup

## 1. Set mParticle User Identity and Send Device Data to RevenueCat

If you're using the mParticle SDK, you can set the User ID to match the RevenueCat App User Id. This way, events sent from the mParticle SDK and events sent from RevenueCat can be synced to the same user.

The mParticle integration also requires some device-specific data. RevenueCat will only send events into mParticle if the below [Subscriber Attributes](doc:subscriber-attributes) keys have been set for the device.
[block:parameters]
{
  "data": {
    "h-0": "Key",
    "h-1": "Description",
    "h-2": "Required",
    "0-0": "`$mparticleId`",
    "2-0": "`$idfv`",
    "3-0": "`$gpsAdId`",
    "4-0": "`$androidId`",
    "0-2": "✅ (recommended)",
    "2-2": "❌ (optional)",
    "3-2": "❌ (optional)",
    "4-2": "❌ (optional)",
    "5-2": "❌ (optional)",
    "5-0": "`$ip`",
    "0-1": "The unique mParticle user identifier (mpid).",
    "2-1": "iOS [vender identifier](https://developer.apple.com/documentation/uikit/uidevice/1620059-identifierforvendor) UUID",
    "3-1": "Google [advertising identifier](https://developers.google.com/android/reference/com/google/android/gms/ads/identifier/AdvertisingIdClient.Info)",
    "5-1": "The IP address of the device",
    "4-1": "Android [device identifier](https://developer.android.com/reference/android/provider/Settings.Secure#ANDROID_ID)",
    "1-1": "iOS [advertising identifier](https://developer.apple.com/documentation/adsupport/asidentifiermanager/1614151-advertisingidentifier) UUID",
    "1-2": "❌ (optional)",
    "1-0": "`$idfa`"
  },
  "cols": 3,
  "rows": 6
}
[/block]
These properties can be set manually, like any other [Subscriber Attributes](doc:subscriber-attributes), or through the helper methods `collectDeviceIdentifiers()` and `setMparticleId()`. 

Create an `identityRequest` and add it to the `MParticleOptions` that you pass to the `start()` method on the mParticle SDK to set the same App User Id that is set in RevenueCat.
[block:file]
swift->code_blocks/🔌 Integrations/integrations/mparticle_1.swift
objectivec->code_blocks/🔌 Integrations/integrations/mparticle_1.m
java->code_blocks/🔌 Integrations/integrations/mparticle_1.java
[/block]
mParticle also allows you to log a user in after starting the SDK and log a user out; you should handle both of these cases:
[block:file]
swift->code_blocks/🔌 Integrations/integrations/mparticle_2.swift
objectivec->code_blocks/🔌 Integrations/integrations/mparticle_2.m
java->code_blocks/🔌 Integrations/integrations/mparticle_2.java
[/block]

[block:file]
swift->code_blocks/🔌 Integrations/integrations/mparticle_3.swift
objectivec->code_blocks/🔌 Integrations/integrations/mparticle_3.m
java->code_blocks/🔌 Integrations/integrations/mparticle_3.java
[/block]

[block:callout]
{
  "type": "danger",
  "title": "Device identifiers with iOS App Tracking Transparency (iOS 14.5+)",
  "body": "If you are requesting the App Tracking permission through ATT to access the IDFA, you can call `.collectDeviceIdentifiers()` *again* if the customer accepts the permission to update the `$idfa` attribute in RevenueCat."
}
[/block]
## 2. Add RevenueCat Feed Inputs in mParticle

In mParticle, add the RevenueCat feed input and create two feeds: one for the Android platform and one for the iOS platform. Copy each feed's Server to Server Key and Server to Server Secret for setup on RevenueCat. Refer to [mParticle's documentation](https://docs.mparticle.com/guides/feeds/) to learn more about feeds.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/adc36bb-2020-06-17_22.04.49_app.mparticle.com_a4031d73e6bc.png",
        "2020-06-17 22.04.49 app.mparticle.com a4031d73e6bc.png",
        1152,
        1300,
        "#e7ebeb"
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
        "https://files.readme.io/595280f-mParticle.png",
        "mParticle.png",
        1819,
        1009,
        "#fbfbfb"
      ]
    }
  ]
}
[/block]
## 3. Send RevenueCat events to mParticle

After you've set up the *Purchases SDK* and mParticle SDK to have the same user identity, you can "turn on" the integration and configure the event names from the RevenueCat dashboard.

1. Navigate to your project in the RevenueCat dashboard and find the *Integrations* card in the left menu. Select **+ New** 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/9e35ec7-Screen_Shot_2021-12-01_at_12.23.10_PM.png",
        "Screen Shot 2021-12-01 at 12.23.10 PM.png",
        332,
        410,
        "#f5f6f5"
      ]
    }
  ]
}
[/block]
2. Choose **mParticle** from the Integrations menu
3. Add your **Server to Server Keys** and **Server to Server Secrets** for each platform from step 2
4. Enter the event names that RevenueCat will send or choose the default event names
5. Select whether you want sales reported as gross revenue (before app store commission), or after store commission and/or estimated taxes.

## 4. Testing the mParticle integration

You can test the mParticle integration end-to-end before going live. It's recommended that you test the integration is working properly for new users, and any existing users that may update their app to a new version.

### Make a sandbox purchase with a new user
Simulate a new user installing your app, and go through your app flow to complete a sandbox purchase.

### Check that the required device data is collected
Navigate the the [Customer View](doc:customers) for the test user that just made a purchase. Make sure that all of the required data from step 1 above is listed as attributes for the user.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/a74e628-Screen_Shot_2020-07-29_at_5.31.46_PM.png",
        "Screen Shot 2020-07-29 at 5.31.46 PM.png",
        366,
        342,
        "#f7f4f3"
      ]
    }
  ]
}
[/block]
### Check that the mParticle event delivered successfully
While still on the Customer View, click into the test purchase event in the [Customer History](doc:customer-history) and make sure that the mParticle integration event exists and was delivered successfully. 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/cba3350-Screen_Shot_2020-09-15_at_5.17.49_PM.png",
        "Screen Shot 2020-09-15 at 5.17.49 PM.png",
        698,
        223,
        "#f7f2f1"
      ]
    }
  ]
}
[/block]

[block:callout]
{
  "type": "success",
  "title": "You've done it!",
  "body": "You should start seeing events from RevenueCat appear in mParticle"
}
[/block]
# Sample Event
Below is sample JSON that is delivered to mParticle for a trial conversion event.
[block:file]
json->code_blocks/🔌 Integrations/integrations/mparticle_4.json
[/block]
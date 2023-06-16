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
---
> 👍 
> 
> The mParticle integration is available on the [Pro](https://www.revenuecat.com/pricing) plan.

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
    "h-1": "Default Event Name",
    "h-2": "Description",
    "h-3": "App Store",
    "h-4": "Play Store",
    "h-5": "Amazon",
    "h-6": "Stripe",
    "h-7": "Promo",
    "0-0": "Initial Purchase",
    "0-1": "initial_purchase",
    "0-2": "A new subscription has been purchased or a lapsed user has resubscribed.",
    "0-3": "✅",
    "0-4": "✅",
    "0-5": "✅",
    "0-6": "✅",
    "0-7": "❌",
    "1-0": "Trial Started",
    "1-1": "trial_started",
    "1-2": "The start of an auto-renewing subscription product free trial.",
    "1-3": "✅",
    "1-4": "✅",
    "1-5": "✅",
    "1-6": "✅",
    "1-7": "❌",
    "2-0": "Trial Converted",
    "2-1": "trial_converted",
    "2-2": "When an auto-renewing subscription product converts from a free trial to normal paid period.",
    "2-3": "✅",
    "2-4": "✅",
    "2-5": "✅",
    "2-6": "✅",
    "2-7": "❌",
    "3-0": "Trial Cancelled",
    "3-1": "trial_cancelled",
    "3-2": "When a user turns off renewals for an auto-renewing subscription product during a free trial period.",
    "3-3": "✅",
    "3-4": "✅",
    "3-5": "✅",
    "3-6": "✅",
    "3-7": "❌",
    "4-0": "Renewal",
    "4-1": "renewal",
    "4-2": "An existing subscription has been renewed.",
    "4-3": "✅",
    "4-4": "✅",
    "4-5": "✅",
    "4-6": "✅",
    "4-7": "❌",
    "5-0": "Cancellation",
    "5-1": "cancellation",
    "5-2": "A subscription or non-renewing purchase has been cancelled. See [cancellation reasons](https://www.revenuecat.com/docs/event-types-and-fields#cancellation-and-expiration-reasons) for more details.",
    "5-3": "✅",
    "5-4": "✅",
    "5-5": "✅",
    "5-6": "✅",
    "5-7": "✅",
    "6-0": "Uncancellation",
    "6-1": "uncancellation",
    "6-2": "A non-expired cancelled subscription has been re-enabled.",
    "6-3": "✅",
    "6-4": "✅",
    "6-5": "✅",
    "6-6": "❌",
    "6-7": "❌",
    "7-0": "Non Subscription Purchase",
    "7-1": "non_renewing_purchase",
    "7-2": "A customer has made a purchase that will not auto-renew.",
    "7-3": "✅",
    "7-4": "✅",
    "7-5": "✅",
    "7-6": "✅",
    "7-7": "✅",
    "8-0": "Expiration",
    "8-1": "expiration",
    "8-2": "A subscription has expired and access should be removed.  \n  \nIf you have [Platform Server Notifications](https://www.revenuecat.com/docs/server-notifications) configured, this event will occur as soon as we are notified (within seconds to minutes) of the expiration.  \n  \nIf you do not have notifications configured, delays may be approximately 1 hour.",
    "8-3": "✅",
    "8-4": "✅",
    "8-5": "✅",
    "8-6": "✅",
    "8-7": "✅",
    "9-0": "Billing Issues",
    "9-1": "billing_issue",
    "9-2": "There has been a problem trying to charge the subscriber. This does not mean the subscription has expired.  \n  \nCan be safely ignored if listening to CANCELLATION event + cancel_reason=BILLING_ERROR.",
    "9-3": "✅",
    "9-4": "✅",
    "9-5": "✅",
    "9-6": "✅",
    "9-7": "❌",
    "10-0": "Product Change",
    "10-1": "product_change",
    "10-2": "A subscriber has changed the product of their subscription.  \n  \nThis does not mean the new subscription is in effect immediately. See [Managing Subscriptions](https://www.revenuecat.com/docs/managing-subscriptions) for more details on updates, downgrades, and crossgrades.",
    "10-3": "✅",
    "10-4": "✅",
    "10-5": "❌",
    "10-6": "✅",
    "10-7": "❌",
    "11-0": "Refund",
    "11-1": "refund",
    "11-2": "When a user canceled their subscription via customer support",
    "11-3": "✅",
    "11-4": "✅",
    "11-5": "✅",
    "11-6": "✅",
    "11-7": "❌"
  },
  "cols": 8,
  "rows": 12,
  "align": [
    "left",
    "left",
    "left",
    "left",
    "left",
    "left",
    "left",
    "left"
  ]
}
[/block]

For events that have revenue, such as trial conversions and renewals, RevenueCat will automatically record this amount along with the event in mParticle.

# Setup

## 1. Set mParticle User Identity and Send Device Data to RevenueCat

If you're using the mParticle SDK, you can set the User ID to match the RevenueCat App User Id. This way, events sent from the mParticle SDK and events sent from RevenueCat can be synced to the same user.

The mParticle integration also requires some device-specific data. RevenueCat will only send events into mParticle if the below [Subscriber Attributes](doc:subscriber-attributes) keys have been set for the device.

| Key            | Description                                                                                                                                     | Required        |
| :------------- | :---------------------------------------------------------------------------------------------------------------------------------------------- | :-------------- |
| `$mparticleId` | The unique mParticle user identifier (mpid).                                                                                                    | ✅ (recommended) |
| `$idfa`        | iOS [advertising identifier](https://developer.apple.com/documentation/adsupport/asidentifiermanager/1614151-advertisingidentifier) UUID        | ❌ (optional)    |
| `$idfv`        | iOS [vender identifier](https://developer.apple.com/documentation/uikit/uidevice/1620059-identifierforvendor) UUID                              | ❌ (optional)    |
| `$gpsAdId`     | Google [advertising identifier](https://developers.google.com/android/reference/com/google/android/gms/ads/identifier/AdvertisingIdClient.Info) | ❌ (optional)    |
| `$androidId`   | Android [device identifier](https://developer.android.com/reference/android/provider/Settings.Secure#ANDROID_ID)                                | ❌ (optional)    |
| `$ip`          | The IP address of the device                                                                                                                    | ❌ (optional)    |

These properties can be set manually, like any other [Subscriber Attributes](doc:subscriber-attributes), or through the helper methods `collectDeviceIdentifiers()` and `setMparticleId()`. 

Create an `identityRequest` and add it to the `MParticleOptions` that you pass to the `start()` method on the mParticle SDK to set the same App User Id that is set in RevenueCat.

[block:file]
{"language":"swift","name":"","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/mparticle_1.swift"}
[/block]
[block:file]
{"language":"objectivec","name":"","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/mparticle_2.m"}
[/block]
[block:file]
{"language":"java","name":"","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/mparticle_3.java"}
[/block]



mParticle also allows you to log a user in after starting the SDK and log a user out; you should handle both of these cases:

[block:file]
{"language":"swift","name":"","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/mparticle_4.swift"}
[/block]
[block:file]
{"language":"objectivec","name":"","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/mparticle_5.m"}
[/block]
[block:file]
{"language":"java","name":"","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/mparticle_6.java"}
[/block]



[block:file]
{"language":"swift","name":"","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/mparticle_7.swift"}
[/block]
[block:file]
{"language":"objectivec","name":"","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/mparticle_8.m"}
[/block]
[block:file]
{"language":"java","name":"","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/mparticle_9.java"}
[/block]



> ❗️ Device identifiers with iOS App Tracking Transparency (iOS 14.5+)
> 
> If you are requesting the App Tracking permission through ATT to access the IDFA, you can call `.collectDeviceIdentifiers()` _again_ if the customer accepts the permission to update the `$idfa` attribute in RevenueCat.

## 2. Add RevenueCat Feed Inputs in mParticle

In mParticle, add the RevenueCat feed input and create two feeds: one for the Android platform and one for the iOS platform. Copy each feed's Server to Server Key and Server to Server Secret for setup on RevenueCat. Refer to [mParticle's documentation](https://docs.mparticle.com/guides/feeds/) to learn more about feeds.

![](https://files.readme.io/adc36bb-2020-06-17_22.04.49_app.mparticle.com_a4031d73e6bc.png "2020-06-17 22.04.49 app.mparticle.com a4031d73e6bc.png")

![](https://files.readme.io/595280f-mParticle.png "mParticle.png")

## 3. Send RevenueCat events to mParticle

After you've set up the _Purchases SDK_ and mParticle SDK to have the same user identity, you can "turn on" the integration and configure the event names from the RevenueCat dashboard.

1. Navigate to your project in the RevenueCat dashboard and find the _Integrations_ card in the left menu. Select **+ New** 

![](https://files.readme.io/61bd652-app.revenuecat.com_projects_85ff18c7_collaborators_1.png)

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

![](https://files.readme.io/f7066d9-app.revenuecat.com_activity_777004e5_event_1b2e7407-a1bc-416a-84cf-b65688412bbe_2.png)

### Check that the mParticle event delivered successfully

While still on the Customer View, click into the test purchase event in the [Customer History](doc:customer-history) and make sure that the mParticle integration event exists and was delivered successfully. 

![](https://files.readme.io/b7eef58-app.revenuecat.com_activity_40779aaf_event_92499ad6-350b-455a-a2ec-4c28c4ca0b28_4.png)

> 👍 You've done it!
> 
> You should start seeing events from RevenueCat appear in mParticle

# Sample Events

Below are sample JSONs that are delivered to mParticle for the different event types.

[block:file]
{"language":"json","name":"Initial Purchase","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/mparticle_10.json"}
[/block]
[block:file]
{"language":"json","name":"Trial Started","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/mparticle_11.json"}
[/block]
[block:file]
{"language":"json","name":"Trial Converted","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/mparticle_12.json"}
[/block]
[block:file]
{"language":"json","name":"Trial Cancelled","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/mparticle_13.json"}
[/block]
[block:file]
{"language":"json","name":"Renewal","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/mparticle_14.json"}
[/block]
[block:file]
{"language":"json","name":"Cancellation","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/mparticle_15.json"}
[/block]
[block:file]
{"language":"json","name":"Uncancellation","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/mparticle_16.json"}
[/block]



[block:file]
{"language":"json","name":"Expiration","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/mparticle_17.json"}
[/block]
[block:file]
{"language":"json","name":"Billing Issue","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/mparticle_18.json"}
[/block]
[block:file]
{"language":"json","name":"Product Change","file":"code_blocks/🔌 Integrations & Events/third-party-integrations/mparticle_19.json"}
[/block]
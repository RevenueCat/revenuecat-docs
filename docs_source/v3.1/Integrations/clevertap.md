---
title: "CleverTap"
slug: "clevertap"
excerpt: "Integrate in-app subscription events from RevenueCat with CleverTap"
hidden: false
metadata: 
  title: "CleverTap in-app purchase integration – RevenueCat"
  description: "RevenueCat can automatically send subscription events into CleverTap. This is useful for seeing all events and revenue that occur for your app even if it's not active for a period of time."
  image: 
    0: "https://files.readme.io/b72a195-OG_image.png"
    1: "OG image.png"
    2: 1200
    3: 627
    4: "#e9acb0"
createdAt: "2020-10-23T02:20:59.696Z"
updatedAt: "2021-06-02T15:33:35.921Z"
---
[block:callout]
{
  "type": "success",
  "body": "The CleverTap integration is available on the [Pro](https://www.revenuecat.com/pricing) plan."
}
[/block]
RevenueCat can automatically send subscription events into CleverTap. This is useful for seeing all events and revenue that occur for your app even if it's not active for a period of time.

# Events

The CleverTap integration tracks the following events:
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
    "7-0": "Non Subscription Purchase",
    "0-1": "The first purchase of an auto-renewing subscription product that does not contain a free trial.",
    "1-1": "The start of an auto-renewing subscription product free trial.",
    "2-1": "When an auto-renewing subscription product converts from a free trial to normal paid period.",
    "3-1": "When a user turns off renewals for an auto-renewing subscription product during a free trial period.",
    "4-1": "When an auto-renewing subscription product renews OR a user repurchases the auto-renewing subscription product after a lapse in their subscription.",
    "5-1": "When a user turns off renewals for an auto-renewing subscription product during the normal paid period.",
    "7-1": "The purchase of any product that's not an auto-renewing subscription.",
    "6-0": "Uncancellation",
    "6-1": "When a user re-enables the auto-renew status for a subscription."
  },
  "cols": 2,
  "rows": 8
}
[/block]
For events that have revenue, such as trial conversions and renewals, RevenueCat will automatically record this amount along with the event in CleverTap.

# Setup

## 1. Send CleverTap Identity to RevenueCat

The OneSignal integration requires some device-specific data. RevenueCat will only update users in OneSignal if the below data has been added as [Subscriber Attributes](doc:subscriber-attributes) for the user.
[block:parameters]
{
  "data": {
    "h-0": "Key",
    "h-1": "Description",
    "h-2": "Required",
    "0-2": "✅",
    "0-0": "`$cleverTapId`",
    "0-1": "The [CleverTap ID](https://developer.clevertap.com/docs/concepts-user-profiles#section-identifying-a-user) for the user."
  },
  "cols": 3,
  "rows": 1
}
[/block]
This property can be set manually, like any other [Subscriber Attribute](doc:subscriber-attributes). 

[block:code]
{
  "codes": [
    {
      "code": "// Configure Purchases SDK\nPurchases.configure(withAPIKey: \"public_sdk_key\", appUserID: \"my_app_user_id\")\n\n// Configure CleverTap SDK\nCleverTap.autoIntegrate()\n\n// ...\n\nif let cleverTapId = CleverTap.sharedInstance()?.profileGetCleverTapID() {\n\tPurchases.shared.setAttributes([\"$cleverTapId\" : cleverTapId])\n}",
      "language": "swift"
    },
    {
      "code": "// Configure Purchases SDK\n[RCPurchases configureWithAPIKey:@\"public_sdk_key\" appUserID:@\"my_app_user_id\"];\n\n// Configure CleverTap SDK\n[CleverTap autoIntegrate];\n\n//...\n\nNSString *cleverTapId = [[CleverTap sharedInstance] profileGetCleverTapID];\nif (cleverTapId != nil) {\n  [[RCPurchases sharedPurchases] setAttributes:@{@\"$cleverTapId\": cleverTapId}];\n}",
      "language": "objectivec",
      "name": "Objective-C"
    },
    {
      "code": "// Configure Purchases SDK\nPurchases.configure(this, \"public_sdk_key\", \"my_app_user_id\")\n\n// Configure CleverTap SDK\ncleverTapDefaultInstance = CleverTapAPI.getDefaultInstance(this)\n\nval cleverTapId = cleverTapDefaultInstance?.cleverTapID?.also {\n   Purchases.sharedInstance.setAttributes(mapOf(\"$cleverTapId\" to it))\n}",
      "language": "kotlin"
    },
    {
      "code": "// Configure Purchases SDK\nPurchases.configure(this, \"public_sdk_key\", \"my_app_user_id\");\n\n// Configure CleverTap SDK\nCleverTapAPI clevertapDefaultInstance = CleverTapAPI.getDefaultInstance(this);\n\nString cleverTapId = cleverTapDefaultInstance.getCleverTapId();\nif (cleverTapId != null) {\n  Map<String, String> attributes = new HashMap<String, String>();\n\tattributes.put(\"$cleverTapId\", cleverTapId);\n\n\tPurchases.getSharedInstance().setAttributes(attributes);\n}",
      "language": "java",
      "name": "Java"
    }
  ]
}
[/block]
## 2. Send RevenueCat Events to CleverTap

After you've set up the *Purchase* SDK and CleverTap SDK to have the same user identity, you can "turn on" the integration and configure the event names from the RevenueCat dashboard.

1. Navigate to your app in the RevenueCat dashboard and choose 'CleverTap' from the integrations menu
2. Add your [CleverTap Account ID and Passcode](https://developer.clevertap.com/docs/api-quickstart-guide).
3. If you want to test in sandbox, also add your Passcode from your testing account.
3. Enter the event names that RevenueCat will send or choose the default event names
4. Select whether you want RevenueCat to report proceeds (after app store cut) or revenue (gross sales)
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/ce09730-2020-10-23_14.21.10_app-sandbox.revenuecat.com_14ffcac2728c.png",
        "2020-10-23 14.21.10 app-sandbox.revenuecat.com 14ffcac2728c.png",
        1715,
        3154,
        "#f8f9f9"
      ],
      "caption": "CleverTap configuration page"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "warning",
  "body": "By default, RevenueCat sends data through CleverTap's EU data center. For CleverTap customers who have a regional data center configured, please email support@revenuecat.com to enable this for your integration."
}
[/block]
# Sample Event
Below is sample JSON that is delivered to CleverTap for an initial purchase event.
[block:code]
{
  "codes": [
    {
      "code": "{\n    'd': [\n        {\n            'type': 'event',\n            'evtName': 'initial_purchase',\n            'evtData': {\n                'amount': 9.99,\n                'currency': 'USD',\n            },\n            'ts': 1580602110000,\n            'objectId': 'yourCustomClevertapId',\n        }\n    ]\n}",
      "language": "json",
      "name": "JSON"
    }
  ]
}
[/block]
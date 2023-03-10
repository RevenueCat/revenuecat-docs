---
title: "Segment"
slug: "segment"
excerpt: "Integrate in-app subscription events from RevenueCat with Segment"
hidden: false
metadata: 
  title: "Segment Integration – RevenueCat"
  description: "RevenueCat can automatically send subscription events into Segment. From there, you pass these events on to any of the hundreds of other integrations on their platform. This is useful for tracking all events and revenue that occur for your app even if it's not active for a period of time."
  image: 
    0: "https://files.readme.io/fd03751-RevenueCat_Docs_OG.png"
    1: "RevenueCat Docs OG.png"
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: {}
updatedAt: "2023-02-21T15:01:03.574Z"
---
[block:callout]
{
  "type": "success",
  "body": "The Segment integration is available on the [Pro](https://www.revenuecat.com/pricing) plan."
}
[/block]
Segment can be a useful integration tool for seeing all events and revenue that occur for your app even if it’s not active for a period of time. You can use Segment to collect data on customer events to create a single view customer portfolio using an API.

With our Segment integration, you can:
- Create an onboarding flow for users who have subscribed but have not yet engaged with the tutorial or first steps of your product.
- Send personalized messages to users who have free trials that are about to expire.

With accurate and up-to-date subscription data in Segment, you'll be set to turbocharge your user engagement ⚡️

# Events

The Segment integration tracks the following events:
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
    "0-1": "A new subscription has been purchased or a lapsed user has resubscribed.",
    "1-1": "The start of an auto-renewing subscription product free trial.",
    "2-1": "When an auto-renewing subscription product converts from a free trial to normal paid period.",
    "3-1": "When a user turns off renewals for an auto-renewing subscription product during a free trial period.",
    "4-1": "An existing subscription has been renewed.",
    "5-1": "When a user turns off renewals for an auto-renewing subscription product during the normal paid period.",
    "7-1": "A customer has made a purchase that will not auto-renew.",
    "6-0": "Uncancellation",
    "6-1": "When a user re-enables the auto-renew status for a subscription.",
    "8-0": "Subscription paused",
    "8-1": "A subscription has been paused.",
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
For events that have revenue, such as trial conversions and renewals, RevenueCat will automatically record this amount along with the event in Segment.

# Setup

## 1. Set Segment User Identity

If you're using the Segment SDK, you can set the User ID to match the RevenueCat App User Id. This way, events sent from the Segment SDK and events sent from RevenueCat can be synced to the same user.

Use the `.identify()` method on the Segment SDK to set the same App User Id that is set in RevenueCat.
[block:code]
{
  "codes": [
    {
      "code": "// Configure Purchases SDK\nPurchases.configure(withAPIKey: \"public_sdk_key\", appUserID: \"my_app_user_id\")\n\n// Set App User Id in Segment\nSEGAnalytics.sharedAnalytics().identify(\"my_app_user_id\")",
      "language": "swift"
    },
    {
      "code": "// Configure Purchases SDK\n[RCPurchases configureWithAPIKey:@\"public_sdk_key\" appUserID:@\"my_app_user_id\"];\n\n// Set App User Id in Segment\n[[SEGAnalytics sharedAnalytics] identify:@\"my_app_user_id\"];",
      "language": "objectivec"
    },
    {
      "code": "// Configure Purchases SDK\nPurchases.configure(this, \"public_sdk_key\", \"my_app_user_id\");\n\n// Set App User Id in Segment\nAnalytics.with(context).identify(\"my_app_user_id\", null, null);",
      "language": "java"
    }
  ]
}
[/block]
## 2. Generate a Segment Write Key

In Segment, add a HTTP API as a source and copy the Write Key.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/4ae883d-Screen_Shot_2019-04-19_at_12.22.24_PM.png",
        "Screen Shot 2019-04-19 at 12.22.24 PM.png",
        1282,
        647,
        "#f5f7f8"
      ]
    }
  ]
}
[/block]

## 3. Send RevenueCat events to Segment

After you've set up the *Purchases SDK* and Segment SDK to have the same user identity, you can "turn on" the integration and configure the event names from the RevenueCat dashboard.

1. Navigate to your project in the RevenueCat dashboard and find the *Integrations* card in the left menu. Select **+ New**  
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/0ec7506-Screen_Shot_2021-12-01_at_12.23.10_PM.png",
        "Screen Shot 2021-12-01 at 12.23.10 PM.png",
        332,
        410,
        "#f5f6f5"
      ]
    }
  ]
}
[/block]
2. Choose **Segment** from the integrations menu.
3. Choose your Segment region.
4. Add your **Segment Write Key** from step 2.
5. Enter the event names that RevenueCat will send or choose the default event names.
6. Select whether you want sales reported as gross revenue (before app store commission), or after store commission and/or estimated taxes.
7. Select whether you want RevenueCat to send sandbox events into Segment or not. You can check the `environment` key in the `context` property of the event to determine if it was triggered in a sandbox or production environment.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/6e3d114-2023-01-19_22.21.34_app-development.revenuecat.com_b1071b5197f4.png",
        "2023-01-19 22.21.34 app-development.revenuecat.com b1071b5197f4.png",
        1097,
        1986,
        "#000000"
      ],
      "caption": "Segment configuration screen"
    }
  ]
}
[/block]
# Sample Events
Below are sample JSONs that are delivered to Segment for each event type.
[block:code]
{
  "codes": [
    {
      "code": "{\n    \"track_event\": {\n        \"user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"event\": \"initial_purchase\",\n        \"properties\": {\n            \"revenue\": 99.99,\n            \"currency\": \"USD\",\n            \"store\": \"APP_STORE\",\n            \"expires_at\": 1594019532,\n            \"entitlement\": \"premium\",\n            \"product_id\": \"annual\",\n            \"app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n            \"original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        },\n        \"context\": {\n            \"environment\": \"production\",\n            \"library\": {\n                \"name\": \"RevenueCat Segment events\",\n                \"version\": \"1.0\"\n            }\n        },\n        \"timestamp\": \"2019-07-06T07:12:12\"\n    },\n    \"identify\": {\n        \"user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"traits\": {\n            \"last_seen_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n            \"aliases\": [\n                \"12abc345d67e890fgh12j3lm456n7890\"\n            ]\n        },\n        \"context\": {\n            \"environment\": \"production\",\n            \"library\": {\n                \"name\": \"RevenueCat Segment events\",\n                \"version\": \"1.0\"\n            }\n        },\n        \"timestamp\": 1562397132\n    }\n}",
      "language": "json",
      "name": "Initial Purchase"
    },
    {
      "code": "{\n    \"track_event\": {\n        \"user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"event\": \"trial_started\",\n        \"properties\": {\n            \"price\": 0.0,\n            \"store\": \"APP_STORE\",\n            \"expires_at\": 1556693063,\n            \"entitlement\": \"premium\",\n            \"product_id\": \"monthly\",\n            \"app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n            \"original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        },\n        \"context\": {\n            \"environment\": \"production\",\n            \"library\": {\n                \"name\": \"RevenueCat Segment events\",\n                \"version\": \"1.0\"\n            }\n        },\n        \"timestamp\": \"2019-04-24T06:44:23\"\n    },\n    \"identify\": {\n        \"user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"traits\": {\n            \"last_seen_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n            \"aliases\": [\n                \"12abc345d67e890fgh12j3lm456n7890\"\n            ]\n        },\n        \"context\": {\n            \"environment\": \"production\",\n            \"library\": {\n                \"name\": \"RevenueCat Segment events\",\n                \"version\": \"1.0\"\n            }\n        },\n        \"timestamp\": 1556088263\n    }\n}",
      "language": "json",
      "name": "Trial Started"
    },
    {
      "code": "{\n    \"track_event\": {\n        \"user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"event\": \"trial_converted\",\n        \"properties\": {\n            \"price\": 7.99,\n            \"store\": \"APP_STORE\",\n            \"expires_at\": 1558701211,\n            \"entitlement\": \"premium\",\n            \"product_id\": \"monthly\",\n            \"app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n            \"original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        },\n        \"context\": {\n            \"environment\": \"production\",\n            \"library\": {\n                \"name\": \"RevenueCat Segment events\",\n                \"version\": \"1.0\"\n            }\n        },\n        \"timestamp\": \"2019-04-24T12:33:31\"\n    },\n    \"identify\": {\n        \"user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"traits\": {\n            \"last_seen_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n            \"aliases\": [\n                \"12abc345d67e890fgh12j3lm456n7890\"\n            ]\n        },\n        \"context\": {\n            \"environment\": \"production\",\n            \"library\": {\n                \"name\": \"RevenueCat Segment events\",\n                \"version\": \"1.0\"\n            }\n        },\n        \"timestamp\": 1556109211\n    }\n}",
      "language": "json",
      "name": "Trial Converted"
    },
    {
      "code": "{\n    \"track_event\": {\n        \"user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"event\": \"trial_converted\",\n        \"properties\": {\n            \"price\": 7.99,\n            \"store\": \"APP_STORE\",\n            \"expires_at\": 1558701211,\n            \"entitlement\": \"premium\",\n            \"product_id\": \"monthly\",\n            \"app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n            \"original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        },\n        \"context\": {\n            \"environment\": \"production\",\n            \"library\": {\n                \"name\": \"RevenueCat Segment events\",\n                \"version\": \"1.0\"\n            }\n        },\n        \"timestamp\": \"2019-04-24T12:33:31\"\n    },\n    \"identify\": {\n        \"user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"traits\": {\n            \"last_seen_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n            \"aliases\": [\n                \"12abc345d67e890fgh12j3lm456n7890\"\n            ]\n        },\n        \"context\": {\n            \"environment\": \"production\",\n            \"library\": {\n                \"name\": \"RevenueCat Segment events\",\n                \"version\": \"1.0\"\n            }\n        },\n        \"timestamp\": 1556109211\n    }\n}",
      "language": "json",
      "name": "Trial Cancelled"
    },
    {
      "code": "{\n    \"track_event\": {\n        \"user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"event\": \"renewal\",\n        \"properties\": {\n            \"price\": 7.99,\n            \"store\": \"APP_STORE\",\n            \"expires_at\": 1558699811,\n            \"entitlement\": \"premium\",\n            \"product_id\": \"monthly\",\n            \"app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n            \"original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        },\n        \"context\": {\n            \"environment\": \"production\",\n            \"library\": {\n                \"name\": \"RevenueCat Segment events\",\n                \"version\": \"1.0\"\n            }\n        },\n        \"timestamp\": \"2019-04-24T12:10:11\"\n    },\n    \"identify\": {\n        \"user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"traits\": {\n            \"last_seen_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n            \"aliases\": [\n                \"12abc345d67e890fgh12j3lm456n7890\"\n            ]\n        },\n        \"context\": {\n            \"environment\": \"production\",\n            \"library\": {\n                \"name\": \"RevenueCat Segment events\",\n                \"version\": \"1.0\"\n            }\n        },\n        \"timestamp\": 1556107811\n    }\n}",
      "language": "json",
      "name": "Renewal"
    },
    {
      "code": "{\n    \"track_event\": {\n        \"user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"event\": \"cancellation\",\n        \"properties\": {\n            \"price\": 0.0,\n            \"store\": \"APP_STORE\",\n            \"expires_at\": 1558116196,\n            \"entitlement\": \"premium\",\n            \"product_id\": \"monthly\",\n            \"app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n            \"original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        },\n        \"context\": {\n            \"environment\": \"production\",\n            \"library\": {\n                \"name\": \"RevenueCat Segment events\",\n                \"version\": \"1.0\"\n            }\n        },\n        \"timestamp\": \"2019-04-24T06:32:11\"\n    },\n    \"identify\": {\n        \"user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"traits\": {\n            \"last_seen_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n            \"aliases\": [\n                \"12abc345d67e890fgh12j3lm456n7890\"\n            ]\n        },\n        \"context\": {\n            \"environment\": \"production\",\n            \"library\": {\n                \"name\": \"RevenueCat Segment events\",\n                \"version\": \"1.0\"\n            }\n        },\n        \"timestamp\": 1556087531\n    }\n}",
      "language": "json",
      "name": "Cancellation"
    },
    {
      "code": "{\n    \"track_event\": {\n        \"user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"event\": \"uncancellation\",\n        \"properties\": {\n            \"revenue\": 0.0,\n            \"currency\": \"USD\",\n            \"store\": \"APP_STORE\",\n            \"purchased_at\": 1663820576,\n            \"expires_at\": 1664425376,\n            \"entitlement\": null,\n            \"entitlements\": [\n                \"premium\"\n            ],\n            \"product_id\": \"annual_3d\",\n            \"app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n            \"original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n            \"subscriber_attributes\": {\n                \"$idfa\": \"00000000-0000-0000-0000-000000000000\",\n                \"$idfv\": \"12345A6B-C789-0D1E-FG23-456H6I7J890K\",\n                \"$email\": \"firstlast@gmail.com\",\n                \"$appsflyerId\": \"1234567890123-1234567890123456789\",\n                \"updateId\": \"12345678-9012-3456-7890-123456789012\", \n                \"nativeAppVersion\": \"3.12.0\",\n                \"nativeBuildVersion\": \"589\"\n            },\n            \"period_type\": \"TRIAL\",\n            \"environment\": \"PRODUCTION\",\n            \"presented_offering_id\": \"annual_trial\",\n            \"transaction_id\": \"123456789012345\",\n            \"original_transaction_id\": \"123456789012345\",\n            \"aliases\": [\n                \"12abc345d67e890fgh12j3lm456n7890\"\n            ],\n            \"app_id\": \"12345678-1234-1234-1234-123456789012\"\n        },\n        \"context\": {\n            \"environment\": \"production\",\n            \"library\": {\n                \"name\": \"RevenueCat Segment events\",\n                \"version\": \"1.0\"\n            }\n        },\n        \"timestamp\": \"2022-09-23T23:13:28\"\n    },\n    \"identify\": {\n        \"user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"traits\": {\n            \"last_seen_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n            \"aliases\": [\n                \"12abc345d67e890fgh12j3lm456n7890\"\n            ]\n        },\n        \"context\": {\n            \"environment\": \"production\",\n            \"library\": {\n                \"name\": \"RevenueCat Segment events\",\n                \"version\": \"1.0\"\n            }\n        },\n        \"timestamp\": \"2022-09-23T23:13:28\"\n    }\n}",
      "language": "json",
      "name": "Uncancellation"
    }
  ]
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "{\n    \"track_event\": {\n        \"user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"event\": \"non_subscription_purchase\",\n        \"properties\": {\n            \"revenue\": 1.99,\n            \"currency\": \"USD\",\n            \"store\": \"PLAY_STORE\",\n            \"expires_at\": null,\n            \"entitlement\": null,\n            \"product_id\": \"100_credits\",\n            \"app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n            \"original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        },\n        \"context\": {\n            \"environment\": \"production\",\n            \"library\": {\n                \"name\": \"RevenueCat Segment events\",\n                \"version\": \"1.0\"\n            }\n        },\n        \"timestamp\": \"2018-10-30T16:54:53\"\n    },\n    \"identify\": {\n        \"user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"traits\": {\n            \"last_seen_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n            \"aliases\": [\n                \"12abc345d67e890fgh12j3lm456n7890\"\n            ]\n        },\n        \"context\": {\n            \"environment\": \"production\",\n            \"library\": {\n                \"name\": \"RevenueCat Segment events\",\n                \"version\": \"1.0\"\n            }\n        },\n        \"timestamp\": 1540918493\n    }\n}",
      "language": "json",
      "name": "Non Subscription Purchase"
    },
    {
      "code": "{\n    \"track_event\": {\n        \"user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"event\": \"subscription_paused\",\n        \"properties\": {\n            \"revenue\": 0.0,\n            \"currency\": \"USD\",\n            \"store\": \"PLAY_STORE\",\n            \"purchased_at\": 1662828058,\n            \"expires_at\": 1665427258,\n            \"entitlement\": null,\n            \"entitlements\": null,\n            \"product_id\": \"annual_7day\",\n            \"app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n            \"original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n            \"subscriber_attributes\": {\n                \"$email\": \"firstlast@gmail.com\"\n            },\n            \"period_type\": \"NORMAL\",\n            \"environment\": \"PRODUCTION\",\n            \"presented_offering_id\": null,\n            \"transaction_id\": \"GPA.1234-5678-9012-34567\",\n            \"original_transaction_id\": \"GPA.1234-5678-9012-34567\",\n            \"aliases\": [\n                \"12abc345d67e890fgh12j3lm456n7890\"\n            ],\n            \"auto_resumes_at\": 1668098458,\n            \"app_id\": \"12345678-1234-1234-1234-123456789012\"\n        },\n        \"context\": {\n            \"environment\": \"production\",\n            \"library\": {\n                \"name\": \"RevenueCat Segment events\",\n                \"version\": \"1.0\"\n            }\n        },\n        \"timestamp\": \"2022-09-23T22:21:51\"\n    },\n    \"identify\": {\n        \"user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"traits\": {\n            \"last_seen_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n            \"aliases\": [\n                \"12abc345d67e890fgh12j3lm456n7890\"\n            ]\n        },\n        \"context\": {\n            \"environment\": \"production\",\n            \"library\": {\n                \"name\": \"RevenueCat Segment events\",\n                \"version\": \"1.0\"\n            }\n        },\n        \"timestamp\": \"2022-09-23T22:21:51\"\n    }\n}",
      "language": "json",
      "name": "Subscription Paused"
    },
    {
      "code": "{\n    \"track_event\": {\n        \"user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"event\": \"expiration\",\n        \"properties\": {\n            \"revenue\": 0.0,\n            \"currency\": \"USD\",\n            \"store\": \"APP_STORE\",\n            \"purchased_at\": 1644953137,\n            \"expires_at\": 1647368737,\n            \"entitlement\": null,\n            \"entitlements\": [\n                \"premium\"\n            ],\n            \"product_id\": \"monthly\",\n            \"app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n            \"original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n            \"subscriber_attributes\": {\n                \"$idfa\": \"00000000-0000-0000-0000-000000000000\",\n                \"$idfv\": \"12345A6B-C789-0D1E-FG23-456H6I7J890K\",\n                \"$email\": \"firstlast@gmail.com\",\n                \"$appsflyerId\": \"1234567890123-1234567890123456789\",\n                \"$displayName\": \"First Last\", \n            },\n            \"period_type\": \"NORMAL\",\n            \"environment\": \"PRODUCTION\",\n            \"presented_offering_id\": \"default_offering\",\n            \"transaction_id\": \"123456789012345\",\n            \"original_transaction_id\": \"123456789012345\",\n            \"aliases\": [\n                \"12abc345d67e890fgh12j3lm456n7890\"\n            ],\n            \"expiration_reason\": \"UNSUBSCRIBE\"\n        },\n        \"context\": {\n            \"environment\": \"production\",\n            \"library\": {\n                \"name\": \"RevenueCat Segment events\",\n                \"version\": \"1.0\"\n            }\n        },\n        \"timestamp\": \"2022-03-15T18:25:37\"\n    },\n    \"identify\": {\n        \"user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"traits\": {\n            \"last_seen_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n            \"aliases\": [\n                \"12abc345d67e890fgh12j3lm456n7890\"\n            ]\n        },\n        \"context\": {\n            \"environment\": \"production\",\n            \"library\": {\n                \"name\": \"RevenueCat Segment events\",\n                \"version\": \"1.0\"\n            }\n        },\n        \"timestamp\": \"2022-03-15T18:25:37\"\n    }\n}",
      "language": "json",
      "name": "Expiration"
    },
    {
      "code": "{\n    \"track_event\": {\n        \"user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"event\": \"billing_issue\",\n        \"properties\": {\n            \"revenue\": 0.0,\n            \"currency\": \"USD\",\n            \"store\": \"APP_STORE\",\n            \"purchased_at\": 1634712778,\n            \"expires_at\": 1644047578,\n            \"entitlement\": null,\n            \"entitlements\": [\n                \"premium\"\n            ],\n            \"product_id\": \"monthly_3\",\n            \"app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n            \"original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n            \"subscriber_attributes\": {\n                \"$idfa\": \"00000000-0000-0000-0000-000000000000\",\n                \"$idfv\": \"12345A6B-C789-0D1E-FG23-456H6I7J890K\",\n                \"$email\": \"firstlast@gmail.com\",\n                \"$displayName\": \"First Last\"\n            },\n            \"period_type\": \"NORMAL\",\n            \"environment\": \"PRODUCTION\",\n            \"presented_offering_id\": \"plus\",\n            \"transaction_id\": \"123456789012345\",\n            \"original_transaction_id\": \"123456789012345\",\n            \"aliases\": [\n                \"12abc345d67e890fgh12j3lm456n7890\"\n            ],\n            \"grace_period_expires_at\": 1644047578\n        },\n        \"context\": {\n            \"environment\": \"production\",\n            \"library\": {\n                \"name\": \"RevenueCat Segment events\",\n                \"version\": \"1.0\"\n            }\n        },\n        \"timestamp\": \"2022-01-20T07:53:01\"\n    },\n    \"identify\": {\n        \"user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"traits\": {\n            \"last_seen_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n            \"aliases\": [\n                \"12abc345d67e890fgh12j3lm456n7890\"\n            ]\n        },\n        \"context\": {\n            \"environment\": \"production\",\n            \"library\": {\n                \"name\": \"RevenueCat Segment events\",\n                \"version\": \"1.0\"\n            }\n        },\n        \"timestamp\": \"2022-01-20T07:53:01\"\n    }\n}",
      "language": "json",
      "name": "Billing Issue"
    },
    {
      "code": "{\n    \"track_event\": {\n        \"user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"event\": \"product_change\",\n        \"properties\": {\n            \"revenue\": 0.0,\n            \"currency\": \"USD\",\n            \"store\": \"APP_STORE\",\n            \"purchased_at\": 1663531427,\n            \"expires_at\": 1664136227,\n            \"entitlement\": \"pro\",\n            \"entitlements\": [\n                \"pro\"\n            ],\n            \"product_id\": \"annual\",\n            \"app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n            \"original_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n            \"subscriber_attributes\": {\n                \"$idfa\": \"00000000-0000-0000-0000-000000000000\",\n                \"$idfv\": \"12345A6B-C789-0D1E-FG23-456H6I7J890K\",\n                \"$adjustId\": \"12abc345d67e890fgh12j3lm456n7890\",\n                \"$fbAnonId\": \"1234567890-1234-5678-9012-345678901234\"\n            },\n            \"period_type\": \"TRIAL\",\n            \"environment\": \"PRODUCTION\",\n            \"presented_offering_id\": null,\n            \"transaction_id\": \"123456789012345\",\n            \"original_transaction_id\": \"123456789012345\",\n            \"aliases\": [\n                \"12abc345d67e890fgh12j3lm456n7890\"\n            ],\n            \"new_product_id\": \"annual_3\",\n            \"app_id\": \"12345678-1234-1234-1234-123456789012\"\n        },\n        \"context\": {\n            \"environment\": \"production\",\n            \"library\": {\n                \"name\": \"RevenueCat Segment events\",\n                \"version\": \"1.0\"\n            }\n        },\n        \"timestamp\": \"2022-09-23T23:05:36\"\n    },\n    \"identify\": {\n        \"user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n        \"traits\": {\n            \"last_seen_app_user_id\": \"$RCAnonymousID:87c6049c58069238dce29853916d624c\",\n            \"aliases\": [\n                \"12abc345d67e890fgh12j3lm456n7890\"\n            ]\n        },\n        \"context\": {\n            \"environment\": \"production\",\n            \"library\": {\n                \"name\": \"RevenueCat Segment events\",\n                \"version\": \"1.0\"\n            }\n        },\n        \"timestamp\": \"2022-09-23T23:05:36\"\n    }\n}",
      "language": "json",
      "name": "Product Change"
    }
  ]
}
[/block]
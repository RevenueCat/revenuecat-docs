---
title: Braze
slug: braze
excerpt: Integrate in-app subscription events from RevenueCat with Braze
hidden: false
metadata:
  title: Braze Integration – RevenueCat
  description: RevenueCat can automatically send subscription revenue events to Braze.
    This can be helpful in understanding what stage a customer is in to react accordingly.
    With accurate and up-to-date subscription data in Braze, you'll be set to turbocharge
    your campaigns.
  image:
    0: https://files.readme.io/5b41162-RevenueCat_Docs_OG.png
    1: RevenueCat Docs OG.png
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: '2023-01-03T22:48:35.313Z'
updatedAt: '2023-01-03T22:48:35.313Z'
category: 640a7bf1c7bae2004235517b
---
[block:callout]
{
  "type": "success",
  "body": "The Braze integration is available on the [Pro](https://www.revenuecat.com/pricing) plan."
}
[/block]
Braze can be a helpful integration tool in understanding what stage a customer is in and reacting accordingly. Using Braze can help you to create content that understands the context of your customers and their actions. 

With our Braze integration, you can:
- Send an onboarding campaign to a user towards the end of their free trial.
- Allow customer support to grant a promotional subscription to a loyal user that experience issues.
- Send campaigns to users who canceled their subscription or didn’t pursue after their free trial.

With accurate and up-to-date subscription data in Braze, you'll be set to turbocharge your campaigns ⚡️

# Events

The Braze integration tracks the following events:
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
    "7-1": "The purchase of any product that's not an auto-renewing subscription.",
    "8-0": "Expiration",
    "8-1": "A subscription has expired and access should be removed.",
    "9-0": "Billing Issues",
    "9-1": "There has been a problem trying to charge the subscriber. \n \nThis does not mean the subscription has expired (in the case of a grace period enabled).",
    "10-1": "When user has changed the product of their subscription.\n\nThis does not mean the new subscription is in effect immediately. See [Managing Subscriptions](doc:managing-subscriptions) for more details on updates, downgrades, and crossgrades.",
    "10-0": "Product Change",
    "6-0": "Uncancellation",
    "6-1": "When a user re-enables the auto-renew status for a subscription."
  },
  "cols": 2,
  "rows": 11
}
[/block]

For events that have revenue, such as trial conversions and renewals, RevenueCat will automatically record this amount along with the event in Braze.

RevenueCat subscriber attributes will be dispatched to Braze with the events detailed above and will populate in Braze's [custom attributes](https://www.braze.com/docs/user_guide/data_and_analytics/custom_data/custom_attributes/) for a customer as `rc_customer_attribute_*` (where `*` is replaced by the attribute name) and the value is set to that key (e.g: `rc_customer_attribute_naps_logged: "123”`). If you are setting the optional Braze User Alias Object fields in RevenueCat, these subscriber attributes will be filtered out from the collection before we dispatch the custom attributes to Braze. 

RevenueCat will also send your customer's active entitlement ID(s) as an array of `rc_active_entitlement_ids`.

# Setup

## 1. Set Braze User Identity

If you're using the Braze SDK, you can set the User Id to match the RevenueCat App User Id. This way, events sent from the Braze SDK and events sent from RevenueCat can be synced to the same user.

Configure the Braze SDK with the same App User Id as RevenueCat or use the `.changeUser()` method on the Braze SDK.
```swift
// Configure Purchases SDK
Purchases.configure(withAPIKey: "public_sdk_key", appUserID: "my_app_user_id")

// Change user in Braze SDK
Appboy.sharedInstance()?.changeUser("my_app_user_id")

// Optional User Alias Object attributes
Purchases.shared.attribution.setAttributes(["$brazeAliasName" : "name", 
                             "$brazeAliasLabel" : "label"])
```
```objectivec
// Configure Purchases SDK
[RCPurchases configureWithAPIKey:@"public_sdk_key" appUserID:@"my_app_user_id"];

// Change user in Braze SDK
[[Appboy sharedInstance] changeUser:@"my_app_user_id"];

// Optional User Alias Object attributes
[[RCPurchases sharedPurchases] setAttributes:@{
    @"$brazeAliasName": @"name",
    @"$brazeAliasLabel": @"label"
}];
```
```java
// Configure Purchases SDK
Purchases.configure(this, "public_sdk_key", "my_app_user_id");

// Change user in Braze SDK
Braze.getInstance(context).changeUser(my_app_user_id);

// Optional User Alias Object attributes
Map<String, String> attributes = new HashMap<String, String>();
attributes.put("$brazeAliasName", "name");
attributes.put("$brazeAliasLabel", "label");

Purchases.getSharedInstance().setAttributes(attributes);
```

## (Optional) Send User Alias Object fields to RevenueCat

If you are looking to send an alternative unique user identifier that is different than your App User ID, update users with the below data as [Subscriber Attributes](doc:subscriber-attributes).
[block:parameters]
{
  "data": {
    "h-0": "Key",
    "h-1": "Description",
    "h-2": "Required",
    "0-0": "`$brazeAliasName`",
    "1-0": "`$brazeAliasLabel`",
    "0-1": "The Braze 'alias_name' in [User Alias Object](https://www.braze.com/docs/api/objects_filters/user_alias_object/)",
    "1-1": "The Braze 'alias_label' in [User Alias Object](https://www.braze.com/docs/api/objects_filters/user_alias_object/)"
  },
  "cols": 2,
  "rows": 2
}
[/block]
Both attributes are required for the [User Alias Object](https://www.braze.com/docs/api/objects_filters/user_alias_object/) to be sent alongside your event data. These properties can be set and removed manually, like any other [Subscriber Attribute](doc:subscriber-attributes). 

RevenueCat will always use the User Alias Object to identify events into Braze, if set, as opposed to the RevenueCat App User ID.

[block:callout]
{
  "type": "danger",
  "title": "Remove any client-side purchase tracking",
  "body": "Make sure to remove all client-side tracking of revenue. Since RevenueCat will be sending events for all revenue actions, tracking purchases with the Braze SDK directly can lead to double counting of revenue in Braze."
}
[/block]
## 2. Send RevenueCat Events to Braze

After you've set up the *Purchases SDK* and Braze SDK to have the same user identity, you can "turn on" the integration and configure the event names from the RevenueCat dashboard.

1. Navigate to your project in the RevenueCat dashboard and find the *Integrations* card in the left menu. Select **+ New** 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/6054ab0-Screen_Shot_2021-12-01_at_12.23.10_PM.png",
        "Screen Shot 2021-12-01 at 12.23.10 PM.png",
        332,
        410,
        "#f5f6f5"
      ]
    }
  ]
}
[/block]
2. Choose **Braze** from the Integrations menu
3. Add your Braze instance and API key
4. Enter the event names that RevenueCat will send or choose the default event names
5. Select whether you want sales reported as gross revenue (before app store commission), or after store commission and/or estimated taxes.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/ab99087-Screen_Shot_2022-10-25_at_9.25.49_AM.png",
        "Screen Shot 2022-10-25 at 9.25.49 AM.png",
        773,
        1651,
        "#000000"
      ],
      "caption": "Braze configuration page"
    }
  ]
}
[/block]
# Sample event
Below is the sample JSON that is delivered to Braze for a renewal event.
```json
{
    "events":
    [
        {
            "name": "rc_renewal_event",
            "time": "2022-10-19T11:02:13.000000",
            "properties":
            {
                "product_id": "your_product_id",
                "store": "APP_STORE",
                "revenue": 9.99,
                "app_id": "your_app_id"
            },
            "external_id": "app_user_id"
        }
    ],
    "attributes":
    [
        {
            "external_id": "app_user_id",
            "email": "garfield@revenuecat.com",
            "rc_customer_attribute_$displayName": "Garfield",
            "rc_active_entitlements":
            [
                "Premium Cat"
            ]
        }
    ]
}
```
---
title: Braze
slug: braze
excerpt: Integrate in-app subscription events from RevenueCat with Braze
hidden: false
categorySlug: integrations-events
order: 2
parentDoc: 6499848d103e5f0042e4802e
---
> 👍 
> 
> The Braze integration is available on the [Pro](https://www.revenuecat.com/pricing) plan.

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
    "h-1": "Default Event Name",
    "h-2": "Description",
    "h-3": "App Store",
    "h-4": "Play Store",
    "h-5": "Amazon",
    "h-6": "Stripe",
    "h-7": "Promo",
    "0-0": "Initial Purchase",
    "0-1": "rc_initial_purchase_event",
    "0-2": "A new subscription has been purchased or a lapsed user has resubscribed.",
    "0-3": "✅",
    "0-4": "✅",
    "0-5": "✅",
    "0-6": "✅",
    "0-7": "❌",
    "1-0": "Trial Started",
    "1-1": "rc_trial_started_event",
    "1-2": "The start of an auto-renewing subscription product free trial",
    "1-3": "✅",
    "1-4": "✅",
    "1-5": "✅",
    "1-6": "✅",
    "1-7": "❌",
    "2-0": "Trial Converted",
    "2-1": "rc_trial_converted_event",
    "2-2": "When an auto-renewing subscription product converts from a free trial to normal paid period.",
    "2-3": "✅",
    "2-4": "✅",
    "2-5": "✅",
    "2-6": "✅",
    "2-7": "❌",
    "3-0": "Trial Cancelled",
    "3-1": "rc_trial_cancelled_event",
    "3-2": "When a user turns off renewals for an auto-renewing subscription product during a free trial period.",
    "3-3": "✅",
    "3-4": "✅",
    "3-5": "✅",
    "3-6": "✅",
    "3-7": "❌",
    "4-0": "Renewal",
    "4-1": "rc_renewal_event",
    "4-2": "An existing subscription has been renewed.",
    "4-3": "✅",
    "4-4": "✅",
    "4-5": "✅",
    "4-6": "✅",
    "4-7": "❌",
    "5-0": "Cancellation",
    "5-1": "rc_cancellation_event",
    "5-2": "A subscription or non-renewing purchase has been cancelled. See [cancellation reasons](https://www.revenuecat.com/docs/event-types-and-fields#cancellation-and-expiration-reasons) for more details.",
    "5-3": "✅",
    "5-4": "✅",
    "5-5": "✅",
    "5-6": "✅",
    "5-7": "✅",
    "6-0": "Uncancellation",
    "6-1": "rc_uncancellation_event",
    "6-2": "A non-expired cancelled subscription has been re-enabled.",
    "6-3": "✅",
    "6-4": "✅",
    "6-5": "✅",
    "6-6": "❌",
    "6-7": "❌",
    "7-0": "Non Subscription Purchase",
    "7-1": "rc_non_subscription_purchase_event",
    "7-2": "A customer has made a purchase that will not auto-renew.",
    "7-3": "✅",
    "7-4": "✅",
    "7-5": "✅",
    "7-6": "✅",
    "7-7": "✅",
    "8-0": "Expiration",
    "8-1": "rc_expiration_event",
    "8-2": "A subscription has expired and access should be removed.  \n  \nIf you have [Platform Server Notifications](https://www.revenuecat.com/docs/server-notifications) configured, this event will occur as soon as we are notified (within seconds to minutes) of the expiration.  \n  \nIf you do not have notifications configured, delays may be approximately 1 hour.",
    "8-3": "✅",
    "8-4": "✅",
    "8-5": "✅",
    "8-6": "✅",
    "8-7": "✅",
    "9-0": "Billing Issues",
    "9-1": "rc_billing_issue_event",
    "9-2": "There has been a problem trying to charge the subscriber. This does not mean the subscription has expired.  \n  \nCan be safely ignored if listening to CANCELLATION event + cancel_reason=BILLING_ERROR.",
    "9-3": "✅",
    "9-4": "✅",
    "9-5": "✅",
    "9-6": "✅",
    "9-7": "❌",
    "10-0": "Product Change",
    "10-1": "rc_product_change_event",
    "10-2": "A subscriber has changed the product of their subscription.  \n  \nThis does not mean the new subscription is in effect immediately. See [Managing Subscriptions](https://www.revenuecat.com/docs/managing-subscriptions) for more details on updates, downgrades, and crossgrades.",
    "10-3": "✅",
    "10-4": "✅",
    "10-5": "❌",
    "10-6": "✅",
    "10-7": "❌"
  },
  "cols": 8,
  "rows": 11,
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

| Key                | Description                                                                                                       |
| :----------------- | :---------------------------------------------------------------------------------------------------------------- |
| `$brazeAliasName`  | The Braze 'alias_name' in [User Alias Object](https://www.braze.com/docs/api/objects_filters/user_alias_object/)  |
| `$brazeAliasLabel` | The Braze 'alias_label' in [User Alias Object](https://www.braze.com/docs/api/objects_filters/user_alias_object/) |

Both attributes are required for the [User Alias Object](https://www.braze.com/docs/api/objects_filters/user_alias_object/) to be sent alongside your event data. These properties can be set and removed manually, like any other [Subscriber Attribute](doc:subscriber-attributes). 

RevenueCat will always use the User Alias Object to identify events into Braze, if set, as opposed to the RevenueCat App User ID.

> ❗️ Remove any client-side purchase tracking
> 
> Make sure to remove all client-side tracking of revenue. Since RevenueCat will be sending events for all revenue actions, tracking purchases with the Braze SDK directly can lead to double counting of revenue in Braze.

## 2. Send RevenueCat Events to Braze

After you've set up the _Purchases SDK_ and Braze SDK to have the same user identity, you can "turn on" the integration and configure the event names from the RevenueCat dashboard.

1. Navigate to your project in the RevenueCat dashboard and find the _Integrations_ card in the left menu. Select **+ New** 

![](https://files.readme.io/cf5de31-app.revenuecat.com_projects_85ff18c7_collaborators_1.png)

2. Choose **Braze** from the Integrations menu
3. Add your Braze instance and API key
4. Enter the event names that RevenueCat will send or choose the default event names
5. Select whether you want sales reported as gross revenue (before app store commission), or after store commission and/or estimated taxes.

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/b4afeec-app.revenuecat.com_projects_85ff18c7_integrations_branch_8.png",
        null,
        "Braze configuration page"
      ],
      "align": "center",
      "caption": "Braze configuration page"
    }
  ]
}
[/block]

# Sample events

Below are sample JSONs that are delivered to Braze for most events.

```json Initial Purchase
{
    "events": [
        {
            "name": "rc_initial_purchase_event",
            "time": "2022-09-04T18: 06: 21.000000",
            "properties": {
                "product_id": "monthly.sub.1",
                "store": "APP_STORE",
                "revenue": 7.99,
                "app_id": "1234567890"
            },
            "external_id": "$RCAnonymousID:87c6049c58069238dce29853916d624c"
        }
    ]
}
```
```json Trial Started
{
    "events": [
        {
            "name": "rc_trial_started_event",
            "time": "2022-09-13T16: 16: 19.000000",
            "properties": {
                "product_id": "weekly.sub",
                "store": "APP_STORE",
                "revenue": 0,
                "app_id": "1234567890"
            },
            "external_id": "$RCAnonymousID:87c6049c58069238dce29853916d624c"
        }
    ]
}
```
```json Trial Converted
{
    "events": [
        {
            "name": "rc_trial_converted_event",
            "time": "2022-09-13T16: 16: 39.000000",
            "properties": {
                "product_id": "weekly.sub",
                "store": "APP_STORE",
                "revenue": 2.99,
                "app_id": "1234567890"
            },
            "external_id": "$RCAnonymousID:87c6049c58069238dce29853916d624c"
        }
    ]
}
```
```json Trial Cancelled
{
    "events": [
        {
            "name": "rc_trial_cancelled_event",
            "time": "2022-09-13T16: 15: 48.000000",
            "properties": {
                "product_id": "monthly.sub.1",
                "store": "APP_STORE",
                "revenue": 0,
                "cancel_reason": "UNSUBSCRIBE",
                "app_id": "1234567890"
            },
            "external_id": "$RCAnonymousID:87c6049c58069238dce29853916d624c"
        }
    ]
}
```
```json Renewal
{
    "events": [
        {
            "name": "rc_renewal_event",
            "time": "2022-09-14T00: 16: 36.000000",
            "properties": {
                "product_id": "monthly.sub.1",
                "store": "APP_STORE",
                "revenue": 6.99,
                "app_id": "1234567890"
            },
            "external_id": "$RCAnonymousID:87c6049c58069238dce29853916d624c"
        }
    ]
}
```



```json Cancellation
{
    "events": [
        {
            "name": "rc_cancellation_event",
            "time": "2022-09-13T16: 15: 19.000000",
            "properties": {
                "product_id": "yearly.sub",
                "store": "APP_STORE",
                "revenue": 0,
                "cancel_reason": "UNSUBSCRIBE",
                "app_id": "1234567890"
            },
            "external_id": "$RCAnonymousID:87c6049c58069238dce29853916d624c"
        }
    ]
}
```
```json Non Subscription Purchase
{
    "events": [
        {
            "name": "rc_non_subscription_purchase_event",
            "time": "2019-01-21T16: 55: 44.000000",
            "properties": {
                "product_id": "tokens.pack.100",
                "store": "APP_STORE",
                "revenue": 4.99,
                "app_id": "1234567890"
            },
            "external_id": "$RCAnonymousID:87c6049c58069238dce29853916d624c"
        }
    ]
}
```
```json Expiration
{
    "events": [
        {
            "name": "rc_expiration_event",
            "time": "2022-09-13T15: 45: 50.000000",
            "properties": {
                "product_id": "monthly.sub.1",
                "store": "APP_STORE",
                "revenue": 0,
                "expiration_reason": "UNSUBSCRIBE",
                "app_id": "1234567890"
            },
            "external_id": "$RCAnonymousID:87c6049c58069238dce29853916d624c"
        }
    ]
}
```
```json Billing Issues
{
    "events": [
        {
            "name": "rc_billing_issue_event",
            "time": "2022-09-13T16: 18: 06.000000",
            "properties": {
                "product_id": "yearly,sub",
                "store": "PLAY_STORE",
                "revenue": 0,
                "grace_period_expiration_at": "2022-09-27T15: 57: 26.000000",
                "app_id": "1234567890"
            },
            "external_id": "$RCAnonymousID:87c6049c58069238dce29853916d624c"
        }
    ]
}
```
```json Product Change
{
    "events": [
        {
            "name": "rc_product_change_event",
            "time": "2022-06-09T02: 30: 35.000000",
            "properties": {
                "product_id": "monthly.sub.1",
                "store": "APP_STORE",
                "revenue": 0.0,
                "new_product_id": "yearly.sub"
            },
            "external_id": "$RCAnonymousID:87c6049c58069238dce29853916d624c"
        }
    ]
}
```

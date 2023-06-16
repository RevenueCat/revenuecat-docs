---
title: Iterable
slug: iterable
excerpt: Integrate in-app purchase events from RevenueCat with Iterable
hidden: false
metadata:
  title: Iterable Integration – RevenueCat
  image:
    0: https://files.readme.io/61f2c22-RevenueCat_Docs_OG.png
    1: RevenueCat Docs OG.png
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: '2022-01-31T17:07:33.480Z'
category: 648c78a54082791c882e2686
order: 6
parentDoc: 648c7ee701881d1af934bf16
updatedAt: '2023-06-16T16:42:09.540Z'
---
> 👍 
> 
> The Iterable integration is available on the [Pro](https://www.revenuecat.com/pricing) plan.

Iterable can be a helpful integration tool in understanding what stage a customer is in and reacting accordingly. Iterable is a cross-channel platform that powers unified customer experiences and empowers marketers to create, optimize and measure every interaction taking place throughout the customer journey. With Iterable, brands create individualized marketing touch points that earn engagement, solidify trust and galvanize loyal consumer-brand relationships.

With our Iterable integration, you can:

- Create an event to track unsubscribes that automatically triggers an email to users who cancel.
- Start a campaign to send users who have been with you for over a certain length of time a discount code for being a loyal customer.

With accurate and up-to date subscription data in Iterable, you’ll be set to turbocharge your users’ engagement  ⚡️

# Events

The Iterable integration tracks the following events:

[block:parameters]
{
  "data": {
    "h-0": "RevenueCat Event Type",
    "h-1": "Iterable Event Type",
    "h-2": "Default Event Name",
    "h-3": "Description",
    "h-4": "App Store",
    "h-5": "Play Store",
    "h-6": "Amazon",
    "h-7": "Stripe",
    "h-8": "Promo",
    "0-0": "Initial Purchase",
    "0-1": "Purchase",
    "0-2": "rc_initial_purchase_event",
    "0-3": "A new subscription has been purchased or a lapsed user has resubscribed.",
    "0-4": "✅",
    "0-5": "✅",
    "0-6": "✅",
    "0-7": "✅",
    "0-8": "❌",
    "1-0": "Trial Started",
    "1-1": "Purchase",
    "1-2": "rc_trial_started_event",
    "1-3": "The start of an auto-renewing subscription product free trial.",
    "1-4": "✅",
    "1-5": "✅",
    "1-6": "✅",
    "1-7": "✅",
    "1-8": "❌",
    "2-0": "Trial Converted",
    "2-1": "Purchase",
    "2-2": "rc_trial_converted_event",
    "2-3": "When an auto-renewing subscription product converts from a free trial to normal paid period.",
    "2-4": "✅",
    "2-5": "✅",
    "2-6": "✅",
    "2-7": "✅",
    "2-8": "❌",
    "3-0": "Trial Cancelled",
    "3-1": "Custom",
    "3-2": "rc_trial_cancelled_event",
    "3-3": "When a user turns off renewals for an auto-renewing subscription product during a free trial period.",
    "3-4": "✅",
    "3-5": "✅",
    "3-6": "✅",
    "3-7": "✅",
    "3-8": "❌",
    "4-0": "Renewal",
    "4-1": "Purchase",
    "4-2": "rc_renewal_event",
    "4-3": "An existing subscription has been renewed.",
    "4-4": "✅",
    "4-5": "✅",
    "4-6": "✅",
    "4-7": "✅",
    "4-8": "❌",
    "5-0": "Cancellation",
    "5-1": "Custom",
    "5-2": "rc_cancellation_event",
    "5-3": "A subscription or non-renewing purchase has been cancelled. See [cancellation reasons](https://www.revenuecat.com/docs/event-types-and-fields#cancellation-and-expiration-reasons) for more details.",
    "5-4": "✅",
    "5-5": "✅",
    "5-6": "✅",
    "5-7": "✅",
    "5-8": "✅",
    "6-0": "Uncancellation",
    "6-1": "Custom",
    "6-2": "rc_uncancellation_event",
    "6-3": "A non-expired cancelled subscription has been re-enabled.",
    "6-4": "✅",
    "6-5": "✅",
    "6-6": "✅",
    "6-7": "❌",
    "6-8": "❌",
    "7-0": "Non Subscription Purchase",
    "7-1": "Purchase",
    "7-2": "rc_non_subscription_purchase_event",
    "7-3": "A customer has made a purchase that will not auto-renew.",
    "7-4": "✅",
    "7-5": "✅",
    "7-6": "✅",
    "7-7": "✅",
    "7-8": "✅",
    "8-0": "Subscription Paused",
    "8-1": "Custom",
    "8-2": "rc_subscription_paused_event",
    "8-3": "A subscription has been paused.",
    "8-4": "❌",
    "8-5": "✅",
    "8-6": "❌",
    "8-7": "❌",
    "8-8": "❌",
    "9-0": "Expiration",
    "9-1": "Custom",
    "9-2": "rc_expiration_event",
    "9-3": "A subscription has expired and access should be removed.  \n  \nIf you have [Platform Server Notifications](https://www.revenuecat.com/docs/server-notifications) configured, this event will occur as soon as we are notified (within seconds to minutes) of the expiration.  \n  \nIf you do not have notifications configured, delays may be approximately 1 hour.",
    "9-4": "✅",
    "9-5": "✅",
    "9-6": "✅",
    "9-7": "✅",
    "9-8": "✅",
    "10-0": "Billing Issue",
    "10-1": "Custom",
    "10-2": "rc_billing_issue_event",
    "10-3": "There has been a problem trying to charge the subscriber. This does not mean the subscription has expired.  \n  \nCan be safely ignored if listening to CANCELLATION event + cancel_reason=BILLING_ERROR.",
    "10-4": "✅",
    "10-5": "✅",
    "10-6": "✅",
    "10-7": "✅",
    "10-8": "❌",
    "11-0": "Product Change",
    "11-1": "Custom",
    "11-2": "rc_product_change_event",
    "11-3": "A subscriber has changed the product of their subscription.  \n  \nThis does not mean the new subscription is in effect immediately. See [Managing Subscriptions](https://www.revenuecat.com/docs/managing-subscriptions) for more details on updates, downgrades, and crossgrades.",
    "11-4": "✅",
    "11-5": "✅",
    "11-6": "❌",
    "11-7": "✅",
    "11-8": "❌"
  },
  "cols": 9,
  "rows": 12,
  "align": [
    "left",
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

For events that have revenue, such as trial conversions and renewals, RevenueCat will automatically record this amount along with the event in Iterable. 

# Setup

## 1. Set Iterable User Identity

In order to associate RevenueCat data with the Iterable User Profile, either the RevenueCat `$email` or `$iterableUserId` [Subscriber Attributes](doc:subscriber-attributes) should be set in RevenueCat. The preferred method is to send the `$email` attribute. If neither of these fields exist, RevenueCat will fallback to the RevenueCat app user ID. You can read more about Iterable user profiles in Iterable's [Identifying the User](https://support.iterable.com/hc/en-us/articles/360035402531-Identifying-the-User-) documentation. 

> 📘 $iterableUserId character limit
> 
> The `$iterableUserId` can be up to 52 characters long.

## (optional) Set Iterable Campaign ID and/or Template ID

To attribute an event to an Iterable Campaign ID and/or Template ID, set the `$iterableCampaignId` and/or `$iterableTemplateId` subscriber attributes through the RevenueCat SDK or [REST API](https://docs.revenuecat.com/reference/update-subscriber-attributes).

```swift 
// Configure Purchases
Purchases.configure(this, "public_sdk_key", "my_app_user_id");

// Initialize Iterable
IterableAPI.initialize(apiKey: "<YOUR_API_KEY>", launchOptions: launchOptions, config: config)

// Setting Iterable email or userId
IterableAPI.email = "user@example.com"
IterableAPI.userId = "user123"


// Set $email or $iterableUserId, (optional) $iterableCampaignId, $iterableTemplateId
Purchases.shared.attribution.setAttributes(["$email" : IterableAPI.email],
                               ["$iterableUserId" : IterableAPI.userId,
                               ["$iterableCampaignId" : "123"],
                               ["$iterableTemplateId" : "123"])
```
```objectivec 
// Configure Purchases
[RCPurchases configureWithAPIKey:@"public_sdk_key"];

// Initialize Iterable
[IterableAPI initializeWithApiKey:@"<YOUR_API_KEY>" launchOptions:launchOptions config:config]

// Setting Iterable email or userId
IterableAPI.email = @"user@example.com";
IterableAPI.userId = @"user123";

// Set $email or $iterableUserId, (optional) $iterableCampaignId, $iterableTemplateId
[[RCPurchases sharedPurchases] setAttributes:@{
  @"$email": IterableAPI.email,
  @"iterableUserId": IterableAPI.userId ,
  @"$iterableCampaignId": @"123",
  @"$iterableTemplateId": @"123"
}];
```
```java 
// Configure Purchases
Purchases.configure(new PurchasesConfiguration.Builder(this, "public_google_sdk_key").build());

// Initialize Iterable
IterableApi.initialize(context, "<YOUR_API_KEY>", config);

// Setting Iterable email or userId
IterableApi.getInstance().setEmail("user@example.com");
IterableApi.getInstance().setUserId("user123");

// Set $email or $iterableUserId, (optional) $iterableCampaignId, $iterableTemplateId
Map<String, String> attributes = new HashMap<String, String>();
attributes.put("$email", IterableApi.getInstance().getEmail());
attributes.put("$iterableUserId", IterableApi.getInstance().getUserId());
attributes.put("$iterableCampaignId", "123");
attributes.put("$iterableTemplateId", "123");
Purchases.getSharedInstance().setAttributes(attributes);
```
```javascript React Native
// Configure Purchases
if (Platform.OS === 'ios') {
	await Purchases.setup("public_ios_sdk_key");
} else if (Platform.OS === 'android') {
	await Purchases.setup("public_google_sdk_key");
	// OR: if building for Amazon, be sure to follow the installation instructions then:
	await Purchases.setup({ apiKey: "public_amazon_sdk_key", useAmazon: true });
}

// Initialize Iterable
Iterable.initialize('<YOUR_API_KEY>', config);

// Setting Iterable email or userId
Iterable.setEmail("user@example.com");
Iterable.setUserId("user123");

// Set $email or $iterableUserId, (optional) $iterableCampaignId, $iterableTemplateId
Iterable.getEmail().then(email => {
	console.log("Current email: " + email);
  	Purchases.setAttributes({ "$email" : email });
});

Iterable.getUserId().then(userId => {
	console.log("Current userId: " + userId);
  	Purchases.setAttributes({ "$iterableUserId" : userId });
});

Purchases.setAttributes({ "$iterableCampaignId" : "123", "$iterableTemplateId" : "123" });
```
```curl 
curl --request POST \
  --url https://api.revenuecat.com/v1/subscribers/app_user_id/attributes \
  --header 'Authorization: Bearer ' \
  --header 'Content-Type: application/json' \
  --data \ 
  '{ 
	"attributes" :  {
		"$iterableCampaignId": {
			"value": "123"
		},
		"$iterableTemplateId": {
			"value": "123"
		}
	}
}'
```



## 2. Send RevenueCat Events to Iterable

After you've set up the Purchase SDK and Iterable SDK to have the same user identity, you can "turn on" the integration and configure the event names from the RevenueCat dashboard.

1. Navigate to your app in the RevenueCat and find the _Integrations_ card in the left menu. Select **+ New**

![](https://files.readme.io/82692c7-app.revenuecat.com_projects_85ff18c7_collaborators_1.png)

2. Choose **Iterable** from the Integrations menu
3. Add your Iterable [Server-side API key](https://support.iterable.com/hc/en-us/articles/360043464871-API-Keys-#creating-api-keys) to the **API key** field in RevenueCat
4. Enter the event names that RevenueCat will send or choose the default event names
5. Select whether you want sales reported as gross revenue (before app store commission), or after store commission and/or estimated taxes.

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/519b30e-app.revenuecat.com_projects_85ff18c7_integrations_intercom.png",
        null,
        "Iterable configuration page"
      ],
      "align": "center",
      "caption": "Iterable configuration page"
    }
  ]
}
[/block]

> 📘 Iterable sandbox environment
> 
> Iterable recommends having a production and sandbox project to separate live and testing environments. You can input both keys in the RevenueCat Iterable settings page.

# Testing the Iterable integration

## Make a sandbox purchase with a new user

Simulate a new user installing your app, and go through your app flow to complete the [sandbox purchase](doc:sandbox).

## Check that the Iterable event delivered successfully

While still on the Customer View, select the purchase event in the [Customer History](doc:customer-history) page and make sure that the Iterable integration event exists and was delivered successfully.

![](https://files.readme.io/470e07f-Screen_Shot_2022-02-11_at_4.36.22_PM.png "Screen Shot 2022-02-11 at 4.36.22 PM.png")

## Check Iterable dashboard for the delivered event

Navigate to your Iterable dashboard > Insights > Logs. To find Purchase events navigate to 'Purchases' and to find Custom events navigate to 'Events'. You will see events RevenueCat has dispatched to the Iterable under 'Purchase Log' and 'Events log'  respectively. 

![](https://files.readme.io/2b00ee8-Screen_Shot_2022-02-11_at_4.34.52_PM.png "Screen Shot 2022-02-11 at 4.34.52 PM.png")

![](https://files.readme.io/666b2e3-Screen_Shot_2022-02-11_at_4.35.04_PM.png "Screen Shot 2022-02-11 at 4.35.04 PM.png")

# Sample Events

Below are sample JSONs that are delivered to Iterable for events.

```json Initial Purchase
{
    "id": "12345678-1234-1234-1234-123456789012",
    "total": 29.99,
    "user": {
        "userId": "$RCAnonymousID:87c6049c58069238dce29853916d624c",
        "preferUserId": true,
        "dataFields": {
            "subscriber_attributes": {},
            "app_user_id": "$RCAnonymousID:87c6049c58069238dce29853916d624c",
            "original_app_user_id": "$RCAnonymousID:87c6049c58069238dce29853916d624c"
        }
    },
    "items": [
        {
            "id": "premium_freetrial",
            "name": "rc_initial_purchase_event",
            "price": 29.99,
            "quantity": 1,
            "dataFields": {
                "country_code": "US",
                "currency": "USD",
                "entitlement_ids": [
                    "premium"
                ],
                "expiration_at_ms": 1683233732021,
                "environment": "PRODUCTION",
                "is_family_share": false,
                "offer_code": null,
                "period_type": "NORMAL",
                "presented_offering_id": null,
                "store": "PLAY_STORE",
                "takehome_percentage": 0.85,
                "original_transaction_id": "GPA.1234-5678-9012-34567"
            }
        }
    ],
    "createdAt": 1651691577776
}
```
```json Trial Started
{
    "id": "12345678-1234-1234-1234-123456789012",
    "total": 0,
    "user": {
        "userId": "$RCAnonymousID:87c6049c58069238dce29853916d624c",
        "preferUserId": true,
        "dataFields": {
            "subscriber_attributes": {},
            "app_user_id": "$RCAnonymousID:87c6049c58069238dce29853916d624c",
            "original_app_user_id": "$RCAnonymousID:87c6049c58069238dce29853916d624c"
        }
    },
    "items": [
        {
            "id": "annual_sub_1week_trial",
            "name": "rc_trial_started_event",
            "price": 0,
            "quantity": 1,
            "dataFields": {
                "country_code": "US",
                "currency": "USD",
                "entitlement_ids": null,
                "expiration_at_ms": 1644623383000,
                "environment": "SANDBOX",
                "is_family_share": false,
                "offer_code": null,
                "period_type": "TRIAL",
                "presented_offering_id": "default",
                "store": "APP_STORE",
                "takehome_percentage": 0.7,
                "original_transaction_id": "123456789012345"
            }
        }
    ],
    "createdAt": 1644623203000
}
```
```json Trial Converted
{
    "id": "12345678-1234-1234-1234-123456789012",
    "total": 29.99,
    "user": {
        "userId": "$RCAnonymousID:87c6049c58069238dce29853916d624c",
        "preferUserId": true,
        "dataFields": {
            "subscriber_attributes": {},
            "app_user_id": "$RCAnonymousID:87c6049c58069238dce29853916d624c",
            "original_app_user_id": "$RCAnonymousID:87c6049c58069238dce29853916d624c"
        }
    },
    "items": [
        {
            "id": "annual_sub",
            "name": "rc_trial_converted_event",
            "price": 29.99,
            "quantity": 1,
            "dataFields": {
                "country_code": "US",
                "currency": "USD",
                "entitlement_ids": null,
                "expiration_at_ms": 1644626983000,
                "environment": "SANDBOX",
                "is_family_share": false,
                "offer_code": null,
                "period_type": "NORMAL",
                "presented_offering_id": "default",
                "store": "APP_STORE",
                "takehome_percentage": 0.7,
                "original_transaction_id": "123456789012345"
            }
        }
    ],
    "createdAt": 1644623383000
}
```
```json Trial Cancelled
{
    "createdAt": 1663964010781,
    "dataFields": {
        "app_id": "app1234567890",
        "event_properties": {
            "cancel_reason": "BILLING_ERROR",
            "environment": "PRODUCTION",
            "expiration_at_ms": 1664050410466,
            "original_transaction_id": "GPA.1234-5678-9012-34567",
            "period_type": "TRIAL",
            "product_id": "annual_sub_1week_trial",
            "store": "PLAY_STORE",
            "transaction_id": "GPA.1234-5678-9012-34567",
        }
    },
    "email": null,
    "eventName": "rc_trial_cancelled_event",
    "id": "12345678-1234-1234-1234-123456789012",
    "userId": "$RCAnonymousID:87c6049c58069238dce29853916d624c",
}
```
```json Renewal
{
    "id": "12345678-1234-1234-1234-123456789012",
    "total": 29.99,
    "user": {
        "userId": "$RCAnonymousID:87c6049c58069238dce29853916d624c",
        "preferUserId": true,
        "dataFields": {
            "subscriber_attributes": {
                "$email": {
                    "value": "first_last@gmail.com",
                    "updated_at_ms": 1644624942354
                },
                "$iterableCampaignId": {
                    "value": "01234",
                    "updated_at_ms": 1644634297590
                },
                "$iterableTemplateId": {
                    "value": "5678",
                    "updated_at_ms": 1644634301306
                }
            },
            "app_user_id": "$RCAnonymousID:87c6049c58069238dce29853916d624c",
            "original_app_user_id": "$RCAnonymousID:87c6049c58069238dce29853916d624c"
        },
        "email": "first_last@gmail.com"
    },
    "items": [
        {
            "id": "annual_sub",
            "name": "rc_renewal_event",
            "price": 29.99,
            "quantity": 1,
            "dataFields": {
                "country_code": "US",
                "currency": "USD",
                "entitlement_ids": null,
                "expiration_at_ms": 1644648719000,
                "environment": "SANDBOX",
                "is_family_share": false,
                "offer_code": null,
                "period_type": "NORMAL",
                "presented_offering_id": "default",
                "store": "APP_STORE",
                "takehome_percentage": 0.7,
                "original_transaction_id": "123456789012345"
            }
        }
    ],
    "createdAt": 1644645119000,
    "campaignId": "01234",
    "templateId": "5678"
}
```
```json Cancellation
{
    "createdAt": 1663963037855,
    "dataFields": {
        "app_id": "app1234567890",
        "event_properties": {
            "cancel_reason": "UNSUBSCRIBE",
            "environment": "PRODUCTION",
            "expiration_at_ms": 1666381224082,
            "original_transaction_id": "GPA.1234-5678-9012-34567",
            "period_type": "NORMAL",
            "product_id": "annual_sub",
            "store": "PLAY_STORE",
            "transaction_id": "GPA.1234-5678-9012-34567",
        }
    },
    "email": null,
    "eventName": "rc_cancellation_event",
    "id": "12345678-1234-1234-1234-123456789012",
    "userId": "$RCAnonymousID:87c6049c58069238dce29853916d624c",
}
```
```json Uncancellation
{
    "id": "12345678-1234-1234-1234-123456789012",
    "eventName": "rc_uncancellation_event",
    "userId": "$RCAnonymousID:87c6049c58069238dce29853916d624c",
    "dataFields": {
        "event_properties": {
            "environment": "SANDBOX",
            "expiration_at_ms": 1646073127000,
            "original_transaction_id": "123456789012345",
            "period_type": "NORMAL",
            "product_id": "annual_sub",
            "store": "APP_STORE",
            "transaction_id": "123456789012345",
            "email": "first_last@gmail.com"
        }
    },
    "createdAt": 1646069715718,
    "campaignId": "0123",
    "templateId": "4564"
}
```



```json Non Subscription Purchase
{
    "id": "12345678-1234-1234-1234-123456789012",
    "total": 4.99,
    "user": {
        "userId": "$RCAnonymousID:87c6049c58069238dce29853916d624c",
        "preferUserId": true,
        "dataFields": {
            "subscriber_attributes": {
                "$email": {
                    "value": "first_last@gmail.com",
                    "updated_at_ms": 1659292070233
                },
                "$iterableUserId": {
                    "value": "12345A6B-C789-0D1E-FG23-456H6I7J890K",
                    "updated_at_ms": 1659292070233
                },
            },
            "app_user_id": "$RCAnonymousID:87c6049c58069238dce29853916d624c",
            "original_app_user_id": "$RCAnonymousID:87c6049c58069238dce29853916d624c"
        },
        "email": "first_last@gmail.com"
    },
    "items": [
        {
            "id": "100_tokens",
            "name": "rc_non_subscription_purchase_event",
            "price": 4.99,
            "quantity": 1,
            "dataFields": {
                "country_code": null,
                "currency": "USD",
                "entitlement_ids": [
                    "pro"
                ],
                "expiration_at_ms": 1659897848466,
                "environment": "PRODUCTION",
                "is_family_share": null,
                "offer_code": null,
                "period_type": "NORMAL",
                "presented_offering_id": null,
                "store": "APP_STORE",
                "takehome_percentage": 1.0,
                "original_transaction_id": "123456789012345"
            }
        }
    ],
    "createdAt": 1659293048466
}
```
```json Subscription Paused
{
    "id": "12345678-1234-1234-1234-123456789012",
    "email": null,
    "eventName": "rc_subscription_paused_event",
    "userId": "$RCAnonymousID:87c6049c58069238dce29853916d624c",
    "dataFields": {
        "event_properties": {
            "environment": "PRODUCTION",
            "expiration_at_ms": 1654366688509,
            "original_transaction_id": "GPA.1234-5678-9012-34567",
            "period_type": "NORMAL",
            "product_id": "monthly_sub_trial",
            "store": "PLAY_STORE",
            "transaction_id": "GPA.1234-5678-9012-34567",
            "auto_resumes_at": 1656951488509
        }
    },
    "createdAt": 1651679019206
}
```
```json Expiration
{
    "createdAt": 1663963579936,
    "dataFields": {
        "app_id": "app1234567890",
        "event_properties": {
            "environment": "PRODUCTION",
            "expiration_at_ms": 1663963579936,
            "expiration_reason": "UNSUBSCRIBE",
            "original_transaction_id": "GPA.1234-5678-9012-34567",
            "period_type": "NORMAL",
            "product_id": "weekly_sub",
            "store": "PLAY_STORE",
            "transaction_id": "GPA.1234-5678-9012-34567",
        }
    },
    "email": null,
    "eventName": "rc_expiration_event",
    "id": "12345678-1234-1234-1234-123456789012",
    "userId": "$RCAnonymousID:87c6049c58069238dce29853916d624c",
}
```
```json Billing Issues
{
    "createdAt": 1663964010781,
    "dataFields": {
        "app_id": "app1234567890",
        "event_properties": {
            "environment": "PRODUCTION",
            "expiration_at_ms": 1664050410466,
            "grace_period_expires_at": 1664580986800,
            "original_transaction_id": "GPA.1234-5678-9012-34567",
            "period_type": "TRIAL",
            "product_id": "annual_sub_one_week_trial",
            "store": "PLAY_STORE",
            "transaction_id": "GPA.1234-5678-9012-34567",
        }
    },
    "email": null,
    "eventName": "rc_billing_issue_event",
    "id": "12345678-1234-1234-1234-123456789012",
    "userId": "$RCAnonymousID:87c6049c58069238dce29853916d624c",
}
```
```json Product Change
{
    "id": "12345678-1234-1234-1234-123456789012",
    "email": null,
    "eventName": "rc_product_change_event",
    "userId": "$RCAnonymousID:87c6049c58069238dce29853916d624c",
    "dataFields": {
        "event_properties": {
            "environment": "PRODUCTION",
            "expiration_at_ms": 1652327468000,
            "original_transaction_id": "123456789012345",
            "period_type": "TRIAL",
            "product_id": "annual_sub_trial",
            "store": "APP_STORE",
            "transaction_id": "123456789012345",
            "new_product_id": "annual_sub_trial"
        }
    },
    "createdAt": 1651722668000
}
```



# Considerations

## Refunds

Revenue for Iterable campaign reporting will not be accurate due to refund events. You can build custom workflows around a "refund" event and independently calculate the total revenue refunded for your campaigns.
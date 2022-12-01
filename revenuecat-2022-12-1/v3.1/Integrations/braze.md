---
title: "Braze"
slug: "braze"
excerpt: "Integrate in-app subscription events from RevenueCat with Braze"
hidden: false
metadata: 
  title: "Braze in-app purchase integration – RevenueCat"
  description: "RevenueCat can automatically send subscription revenue events to Braze. This can be helpful in understanding what stage a customer is in to react accordingly. With accurate and up-to-date subscription data in Braze, you'll be set to turbocharge your campaigns."
  image: 
    0: "https://files.readme.io/ab139cd-OG_image.png"
    1: "OG image.png"
    2: 1200
    3: 627
    4: "#e9acb0"
createdAt: {}
updatedAt: "2021-06-02T15:33:03.882Z"
---
[block:callout]
{
  "type": "success",
  "body": "The Braze integration is available on the [Pro](https://www.revenuecat.com/pricing) plan."
}
[/block]
RevenueCat can automatically send subscription events to Braze. This can be helpful in understanding what stage a customer is in to react accordingly. For example, you might want to:
- Send an onboarding campaign to a user in a free trial
- Allow customer support grant a [promotional subscription](doc:customers#section-granting-promotional-subscriptions) to a loyal user that experienced issues
- Send campaigns to users that cancelled free trials

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
    "6-0": "Non Subscription Purchase",
    "0-1": "The first purchase of an auto-renewing subscription product that does not contain a free trial.",
    "1-1": "The start of an auto-renewing subscription product free trial.",
    "2-1": "When an auto-renewing subscription product converts from a free trial to normal paid period.",
    "3-1": "When a user turns off renewals for an auto-renewing subscription product during a free trial period.",
    "4-1": "When an auto-renewing subscription product renews OR a user repurchases the auto-renewing subscription product after a lapse in their subscription.",
    "5-1": "When a user turns off renewals for an auto-renewing subscription product during the normal paid period.",
    "6-1": "The purchase of any product that's not an auto-renewing subscription."
  },
  "cols": 2,
  "rows": 7
}
[/block]

For events that have revenue, such as trial conversions and renewals, RevenueCat will automatically record this amount along with the event in Braze.

# Setup

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
Both attributes are required for the [User Alias Object](https://www.braze.com/docs/api/objects_filters/user_alias_object/) to be sent alongside your event data. These properties can be set manually, like any other [Subscriber Attribute](doc:subscriber-attributes). 

## 1. Set Braze User Identity

If you're using the Braze SDK, you can set the User Id to match the RevenueCat App User Id. This way, events sent from the Braze SDK and events sent from RevenueCat can be synced to the same user.

Configure the Braze SDK with the same App User Id as RevenueCat or use the `.changeUser()` method on the Braze SDK.
[block:code]
{
  "codes": [
    {
      "code": "// Configure Purchases SDK\nPurchases.configure(withAPIKey: \"public_sdk_key\", appUserID: \"my_app_user_id\")\n\n// Configure Braze SDK\nAppboy.sharedInstance()?.changeUser(\"my_app_user_id\")\n\n// Optional User Alias Object attributes\nPurchases.shared.setAttributes([\"$brazeAliasName\" : \"name\", \n                             \"$brazeAliasLabel\" : \"label\"])",
      "language": "swift"
    },
    {
      "code": "// Configure Purchases SDK\n[RCPurchases configureWithAPIKey:@\"public_sdk_key\" appUserID:@\"my_app_user_id\"];\n\n// Configure Amplitude SDK\n[[Appboy sharedInstance] changeUser:@\"my_app_user_id\"];\n\n// Optional User Alias Object attributes\n[[RCPurchases sharedPurchases] setAttributes:@{\n    @\"$brazeAliasName\": @\"name\",\n    @\"$brazeAliasLabel\": @\"label\"\n}];",
      "language": "objectivec"
    },
    {
      "code": "// Configure Purchases SDK\nPurchases.configure(this, \"public_sdk_key\", \"my_app_user_id\");\n\n// Configure Amplitude SDK\nAppboy.getInstance(YOUR_ACTIVITY.this).changeUser(my_app_user_id);\n\n// Optional User Alias Object attributes\nMap<String, String> attributes = new HashMap<String, String>();\nattributes.put(\"$brazeAliasName\", \"name\");\nattributes.put(\"$brazeAliasLabel\", \"label\");\n\nPurchases.getSharedInstance().setAttributes(attributes);",
      "language": "java"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "danger",
  "title": "Remove any client-side purchase tracking",
  "body": "Make sure to remove all client-side tracking of revenue. Since RevenueCat will be sending events for all revenue actions, tracking purchases with the Braze SDK directly can lead to double counting of revenue in Braze."
}
[/block]
## 2. Send RevenueCat Events to Braze

After you've set up the *Purchase* SDK and Braze SDK to have the same user identity, you can "turn on" the integration and configure the event names from the RevenueCat dashboard.

1. Navigate to your app in the RevenueCat dashboard and choose 'Braze' from the integrations menu
2. Add your Braze instance and api key
3. Enter the event names that RevenueCat will send or choose the default event names
4. Select whether you want RevenueCat to report proceeds (after app store cut) or revenue (gross sales)
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/1e36c3f-braze.png",
        "braze.png",
        1423,
        3037,
        "#f8f8f9"
      ],
      "caption": "Braze configuration page"
    }
  ]
}
[/block]
---
title: "Subscriber Attributes"
slug: "subscriber-attributes"
excerpt: "Adding custom properties to users in RevenueCat"
hidden: false
metadata: 
  title: "Subscriber Attributes – RevenueCat"
  description: "Subscriber attributes are useful for storing additional, structured information on a user. For example, you could store your user's email address and additional system identifiers directly in RevenueCat."
  image: 
    0: "https://files.readme.io/5a7533d-RevenueCat_Docs_OG.png"
    1: "RevenueCat Docs OG.png"
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: "2020-03-02T07:47:34.104Z"
updatedAt: "2023-02-04T00:31:48.514Z"
---
Subscriber attributes are useful for storing additional, structured information on a user. For example, you could store your user's email address and additional system identifiers directly in RevenueCat. Attributes will not be seen by your users unless you choose to explicitly show them yourself.
[block:callout]
{
  "type": "info",
  "body": "Subscriber attributes are only synced with RevenueCat servers when Purchases.configure() is called, app backgrounded, and when purchases are made or restored."
}
[/block]
# Setting Attributes

Subscriber attributes can be set through the SDK by passing a dictionary of strings to the `setAttributes()` method on the shared Purchases instance. 
[block:code]
{
  "codes": [
    {
      "code": "Purchases.shared.setAttributes([\"age\" : \"24\", \n                             \"custom_group_id\" : \"abc123\"])",
      "language": "swift",
      "name": "Swift"
    },
    {
      "code": "[[RCPurchases sharedPurchases] setAttributes:@{\n    @\"age\": @\"24\",\n    @\"custom_group_id\": @\"abc123\"\n}];\n    ",
      "language": "objectivec",
      "name": "Objective-C"
    },
    {
      "code": "Purchases.sharedInstance.setAttributes(mapOf(\"age\" to \"24\", \"custom_group_id\" to \"abc123\"))",
      "language": "kotlin",
      "name": "Kotlin"
    },
    {
      "code": "Map<String, String> attributes = new HashMap<String, String>();\nattributes.put(\"age\", \"24\");\nattributes.put(\"custom_group_id\", \"abc123\");\n\nPurchases.getSharedInstance().setAttributes(attributes);",
      "language": "java",
      "name": "Java"
    },
    {
      "code": "Purchases.setAttributes({ \"age\" : \"24\", \"custom_group_id\" : \"abc123\" });",
      "language": "javascript",
      "name": "Flutter"
    },
    {
      "code": "Purchases.setAttributes({ \"age\" : \"24\", \"custom_group_id\" : \"abc123\" });",
      "language": "javascript",
      "name": "React Native"
    },
    {
      "code": "var purchases = GetComponent<Purchases>();\nvar attributes = new Dictionary<string, string>\n{\n    { \"age\", \"24\" }, \n    { \"custom_group_id\", \"abc123\" }\n};\npurchases.SetAttributes(attributes);",
      "language": "csharp",
      "name": "Unity"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "warning",
  "body": "Since subscriber attributes are writable using a [public key](doc:authentication) they should not be used for managing secure or sensitive information such as subscription status, coins, etc.",
  "title": ""
}
[/block]
## Restrictions
You can specify up to 50 attributes, with key names up to 40 characters long and values up to 500 characters long. Keys cannot start with `$` unless it's for one of the reserved attributes below.

**Attribute key checklist:**
✅ Key does not contain whitespace
✅ Key must start with a letter for non-reserved attributes or "$" for reserved attributes
✅ Key does not include any non-alphanumeric characters except `-` and `_`
✅ Key is not more than 40 characters
✅ Value is not more than 500 characters
✅ No more than 50 custom attributes


## Reserved attributes
Attribute keys beginning with `$` are reserved for RevenueCat. The current list of reserved keys are below:

### General
[block:parameters]
{
  "data": {
    "h-0": "Key",
    "h-1": "Description",
    "0-0": "`$displayName`",
    "0-1": "Name that should be used to reference the user",
    "1-0": "`$apnsTokens`",
    "1-1": "Apple push notification tokens for the user.",
    "2-0": "`$fcmTokens`",
    "2-1": "Google push notification tokens for the user.",
    "3-0": "`$attConsentStatus`",
    "3-1": "Apple App Tracking Transparency consent status for the user.",
    "4-0": "`$ipAddress`",
    "4-1": "Ip Address for the user.",
    "5-0": "`$clevertapId `",
    "5-1": "Clever Tap ID for the user.",
    "6-0": "`$idfa`",
    "7-0": "`$idfv`",
    "8-0": "`$gpsAdId`",
    "9-0": "`$androidId`",
    "10-0": "`$amazonAdId`",
    "11-0": "`$adjustId`",
    "12-0": "`$amplitudeDeviceId`",
    "13-0": "`$amplitudeUserId`",
    "14-0": "`$appsflyerId`",
    "15-0": "`$brazeAliasName`",
    "16-0": "`$brazeAliasLabel`",
    "17-0": "`$clevertapId`",
    "18-0": "`$fbAnonId`",
    "19-0": "`$attConsentStatus`",
    "20-0": "`$mparticleId`",
    "21-0": "`$onesignalId`",
    "22-0": "`$airshipChannelId`",
    "23-0": "`$iterableUserId`",
    "24-0": "`$iterableCampaignId`",
    "25-0": "`$iterableTemplateId`",
    "26-0": "`$firebaseAppInstanceId`",
    "27-0": "`$mixpanelDistinctId`",
    "28-0": "`$ip`",
    "29-0": "`$email`",
    "30-0": "`$phoneNumber`",
    "29-1": "Email address for the user.",
    "6-1": "iOS advertising identifier UUID.",
    "7-1": "iOS vender identifier UUID.",
    "8-1": "The advertising ID that is provided by Google Play services.",
    "9-1": "Android device identifier.",
    "10-1": "Amazon Advertising ID.",
    "11-1": "The unique Adjust identifier for the user.",
    "12-1": "The Amplitude Device ID.",
    "13-1": "The Amplitude User ID.",
    "14-1": "Appsflyer Id. The unique Appsflyer identifier for the user.",
    "28-1": "The IP address of the device.",
    "15-1": "The Braze 'alias_name' in User Alias Object.",
    "16-1": "The Braze 'alias_label' in User Alias Object.",
    "17-1": "The CleverTap ID for the user.",
    "18-1": "The Facebook Anonymous ID for the user.",
    "19-1": "Apple App Tracking Transparency consent status for the user.",
    "20-1": "The unique mParticle user identifier (mpid).",
    "21-1": "The OneSignal Player Id for the user.",
    "22-1": "The Airship channel ID for the user.",
    "23-1": "The Iterable ID for the user.",
    "24-1": "The Iterable campaign ID.",
    "25-1": "The Iterable template ID.",
    "26-1": "The Firebase instance identifier.",
    "27-1": "The Mixpanel user identifier.",
    "30-1": "Phone number for the user."
  },
  "cols": 2,
  "rows": 31
}
[/block]

[block:callout]
{
  "type": "warning",
  "body": "The RevenueCat SDK sends the current ATT status for the `$attConsentStatus` subscriber attribute regardless of if you are or aren't requesting any ATT permission. So just as a heads-up, you can expect to see this attribute filled.\n\nNote: The RevenueCat SDK reads the current App Tracking Transparency Consent Status for the user, but will not modify it or request for further permission.\n\nYou may see the following as a response from this attribute: \n* `restricted` - Can be returned if the user is using a mobile device management profile that disallows some aspects of tracking regardless of consent. This might be returned even if you never ask for permissions.\n* `denied` - Can be returned if the user’s phone has set “Ask Apps Not To Track” in OS Settings or denied access for the specific app.\n* `accepted` - Returned if you ask for permission and the permission gets accepted by the user. \n* `unknown` - The user hasn’t set “Ask Apps Not to Track” in OS Settings, and you have never asked the user for consent to track activity.",
  "title": "attConsentStatus is populated regardless of requesting any permission"
}
[/block]
### Device Identifiers
[block:parameters]
{
  "data": {
    "h-0": "Key",
    "h-1": "Description",
    "0-0": "`$idfa`",
    "1-0": "`$idfv`",
    "2-0": "`$gpsAdId`",
    "3-0": "`$androidId`",
    "0-1": "Apple advertising identifier",
    "1-1": "Apple vendor identifier",
    "2-1": "Google advertising identifier",
    "3-1": "Android device identifier",
    "4-0": "`$ip`",
    "4-1": "IP Address"
  },
  "cols": 2,
  "rows": 5
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "Once a device identifier is set for a subscriber, it can't be changed in order to keep these identifiers associated with the original installation. This allows RevenueCat to send events generated by a particular device to downstream integrations with a consistent identifier unaffected by uninstalls and reinstalls.",
  "title": "Device identifiers can't be changed once set"
}
[/block]
### Third-party Identifiers
[block:parameters]
{
  "data": {
    "h-0": "Key",
    "h-1": "Description",
    "0-0": "`$adjustId`",
    "0-1": "[Adjust](https://www.adjust.com/) user identifier",
    "3-0": "`$appsflyerId`",
    "3-1": "[Appsflyer](https://www.appsflyer.com/) user identifier",
    "4-0": "`$fbAnonId`",
    "4-1": "[Facebook SDK](https://developers.facebook.com/docs/apis-and-sdks/) anonymous user identifier",
    "8-0": "`$mparticleId`",
    "8-1": "[mParticle](https://www.mparticle.com/) user identifier",
    "9-0": "`$onesignalId`",
    "9-1": "[OneSignal](https://onesignal.com/) player identifier",
    "6-0": "`$iterableUserId`",
    "6-1": "[Iterable](https://iterable.com/) user identifier",
    "7-0": "`$mixpanelDistinctId`",
    "7-1": "[Mixpanel](https://mixpanel.com) user identifier",
    "1-0": "`$amplitudeDeviceId`",
    "1-1": "[Amplitude](https://amplitude.com/) device identifier",
    "2-0": "`$amplitudeUserId`",
    "2-1": "[Amplitude](https://amplitude.com/) user identifier",
    "5-0": "`$firebaseAppInstanceId`",
    "5-1": "[Firebase](doc:firebase-integration) instance identifier",
    "10-0": "`$clevertapId`",
    "10-1": "[CleverTap](https://clevertap.com/) user identifier",
    "11-0": "`$airshipChannelId`",
    "11-1": "[Airship](https://www.airship.com/) channel identifier"
  },
  "cols": 2,
  "rows": 12
}
[/block]
### Braze User Alias Object
[block:parameters]
{
  "data": {
    "h-0": "Key",
    "h-1": "Description",
    "0-0": "`$brazeAliasName`",
    "0-1": "Braze 'alias_name' in [User Alias Object](https://www.braze.com/docs/api/objects_filters/user_alias_object/)",
    "1-0": "`$brazeAliasLabel`",
    "1-1": "Braze 'alias_label' in [User Alias Object](https://www.braze.com/docs/api/objects_filters/user_alias_object/)"
  },
  "cols": 2,
  "rows": 2
}
[/block]
### Iterable Data
[block:parameters]
{
  "data": {
    "h-0": "Key",
    "0-0": "`$iterableCampaignId`",
    "1-0": "`$iterableTemplateId`"
  },
  "cols": 1,
  "rows": 2
}
[/block]
### Attribution Data
[block:parameters]
{
  "data": {
    "h-0": "Key",
    "h-1": "Description",
    "0-0": "`$mediaSource`",
    "1-0": "`$campaign`",
    "2-0": "`$adGroup`",
    "3-0": "`$ad`",
    "4-0": "`$keyword`",
    "5-0": "`$creative`"
  },
  "cols": 1,
  "rows": 6
}
[/block]

[block:callout]
{
  "type": "info",
  "title": "",
  "body": "If you have access to install attribution data, you can set it using the reserved keys above. RevenueCat itself is not an attribution network and can not automatically populate this information.\n\nOnce attribution data is set for a subscriber, it can't be changed. This way attribution data can be associated with the original installation without getting overwritten."
}
[/block]
Reserved attributes can be written directly by setting the key (don't forget the `$` prefix) or with special helper methods:
[block:code]
{
  "codes": [
    {
      "code": "Purchases.shared.setEmail(\"test@example.com\")\nPurchases.shared.setPhoneNumber(\"+16505551234\")\nPurchases.shared.setDisplayName(\"John Appleseed\")",
      "language": "swift",
      "name": "Swift"
    },
    {
      "code": "Purchases.sharedInstance.setEmail(\"test@example.com\")\nPurchases.sharedInstance.setPhoneNumber(\"+16505551234\")\nPurchases.sharedInstance.setDisplayName(\"John Appleseed\")",
      "language": "kotlin",
      "name": "Kotlin"
    },
    {
      "code": "Purchases.setEmail(\"test@example.com\")\nPurchases.setPhoneNumber(\"+16505551234\")\nPurchases.setDisplayName(\"John Appleseed\")",
      "language": "javascript",
      "name": "Flutter"
    },
    {
      "code": "Purchases.setEmail(\"test@example.com\")\nPurchases.setPhoneNumber(\"+16505551234\")\nPurchases.setDisplayName(\"John Appleseed\")",
      "language": "javascript",
      "name": "React Native"
    },
    {
      "code": "var purchases = GetComponent<Purchases>();\npurchases.SetEmail(\"asdf@asdfa.com\");\npurchases.SetPhoneNumber(\"asdga\");\npurchases.SetDisplayName(\"asdgas\");",
      "language": "csharp",
      "name": "Unity"
    }
  ]
}
[/block]
## Setting push tokens
Push tokens can be used to engage with your users through Apple apns or Google cloud messaging. These can be saved in RevenueCat through system callbacks after the user accepts the push notification permissions in your app.
[block:code]
{
  "codes": [
    {
      "code": "func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {\n    Purchases.shared.setPushToken(deviceToken)\n}",
      "language": "swift",
      "name": "Swift"
    },
    {
      "code": "Purchases.sharedInstance.setPushToken(deviceToken)",
      "language": "kotlin",
      "name": "Kotlin"
    },
    {
      "code": "Purchases.setPushToken(deviceToken);",
      "language": "javascript",
      "name": "Flutter"
    },
    {
      "code": "Purchases.setPushToken(deviceToken)",
      "language": "javascript",
      "name": "React Native"
    },
    {
      "code": "var purchases = GetComponent<Purchases>();\npurchases.SetPushToken(deviceToken);",
      "language": "csharp",
      "name": "Unity"
    }
  ]
}
[/block]
# Deleting Attributes

Any attribute can be cleared by passing `null` or an empty string as the key value. Individual attributes can also be cleared for a specific user in their [customer view](doc:customers).
[block:code]
{
  "codes": [
    {
      "code": "Purchases.shared.setAttributes([\"age\" : \"\"])",
      "language": "swift",
      "name": "Swift"
    },
    {
      "code": "Purchases.sharedInstance.setAttributes(mapOf(\"age\" to \"\"))",
      "language": "kotlin",
      "name": "Kotlin"
    },
    {
      "code": "Purchases.setAttributes({\"age\" : \"\"});",
      "language": "javascript",
      "name": "Flutter"
    },
    {
      "code": "Purchases.setAttributes({\"age\" : \"\"})",
      "language": "javascript",
      "name": "React Native"
    },
    {
      "code": "var purchases = GetComponent<Purchases>();\nvar attributes = new Dictionary<string, string>\n{\n    { \"age\", \"\" }, \n    { \"custom_group_id\", \"\" }\n};\npurchases.SetAttributes(attributes);",
      "language": "csharp",
      "name": "Unity"
    }
  ]
}
[/block]
# Reading Attributes

You can access subscriber attributes through the [REST API](https://docs.revenuecat.com/reference) using a secret key, in [webhooks](doc:webhooks), and through analytics integrations ([Amplitude](doc:amplitude), [Mixpanel](doc:mixpanel), [Segment](doc:segment)). The [customer view dashboard](doc:customers) will also show a list of attributes for the individual user that you can edit.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/b4de652-Screen_Shot_2022-01-04_at_7.51.08_AM.png",
        "Screen Shot 2022-01-04 at 7.51.08 AM.png",
        718,
        922,
        "#fafafa"
      ],
      "sizing": "80"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "Subscriber attributes are write-only from the SDK. Reading attributes should only be done server-side through the webhooks or REST API.\n\nSubscriber attributes are also included with transaction data for [ETL exports](https://docs.revenuecat.com/docs/etl-exports)."
}
[/block]
# Next Steps

* Enrich your app by [reacting to the user's current subscription status :fa-arrow-right:](doc:purchaserinfo)
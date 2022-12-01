---
title: "Subscription Status"
slug: "purchaserinfo"
excerpt: "Determining the subscription status for a user."
hidden: false
metadata: 
  title: "Determining subscription status – RevenueCat"
  description: "RevenueCat makes it easy to determine subscription status and more with the Purchases SDK and REST API."
  image: 
    0: "https://files.readme.io/f4b88f7-OG_image.png"
    1: "OG image.png"
    2: 1200
    3: 627
    4: "#e9acb0"
createdAt: {}
updatedAt: "2021-07-23T22:56:10.747Z"
---
RevenueCat makes it easy to determine subscription status and more with the *Purchases SDK* and [REST API](https://docs.revenuecat.com/reference). 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/8aa5ecd-Screen_Shot_2019-08-19_at_8.44.10_AM.png",
        "Screen Shot 2019-08-19 at 8.44.10 AM.png",
        509,
        844,
        "#e6dfde"
      ]
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "Get User Information"
}
[/block]
The `PurchaserInfo` object contains all of the purchase and subscription data available about the user. This object is updated whenever a purchase or restore occurs and periodically throughout the lifecycle of your app. The latest information can always be retrieved by calling `getPurchaserInfo()`:
[block:code]
{
  "codes": [
    {
      "code": "Purchases.shared.purchaserInfo { (purchaserInfo, error) in\n    // access latest purchaserInfo\n}",
      "language": "swift"
    },
    {
      "code": "[[RCPurchases sharedPurchases] purchaserInfoWithCompletionBlock:^(RCPurchaserInfo * purchaserInfo, NSError * error) {\n     // access latest purchaserInfo\n}];",
      "language": "objectivec"
    },
    {
      "code": "Purchases.sharedInstance.getPurchaserInfoWith({ error -> /* Optional error handling */ }) { purchaserInfo ->\n  // access latest purchaserInfo\n}",
      "language": "kotlin"
    },
    {
      "code": "Purchases.getSharedInstance().getPurchaserInfo(new ReceivePurchaserInfoListener() {\n  @Override\n  public void onReceived(@NonNull PurchaserInfo purchaserInfo) {\n    // access latest purchaserInfo\n  }\n  \n  @Override\n  public void onError(@NonNull PurchasesError error) {\n\n  }\n});",
      "language": "java"
    },
    {
      "code": "try {\n  PurchaserInfo purchaserInfo = await Purchases.getPurchaserInfo();\n  // access latest purchaserInfo\n} on PlatformException catch (e) {\n  // Error fetching purchaser info\n}",
      "language": "javascript",
      "name": "Flutter"
    },
    {
      "code": "try {\n  const purchaserInfo = await Purchases.getPurchaserInfo();\n  // access latest purchaserInfo\n} catch (e) {\n // Error fetching purchaser info\n}",
      "language": "javascript",
      "name": "React Native"
    },
    {
      "code": "Purchases.getPurchaserInfo(\n  purchaserInfo => {\n     // access latest purchaserInfo\n  },\n  error => {\n    // Error fetching purchaser info\n  }\n);",
      "language": "javascript",
      "name": "Cordova"
    },
    {
      "code": "var purchases = GetComponent<Purchases>();\npurchases.GetPurchaserInfo((purchaserInfo, error) =>\n{\n  // access latest purchaserInfo\n});",
      "language": "csharp",
      "name": "Unity"
    }
  ]
}
[/block]
It's safe to call `getPurchaserInfo()` frequently throughout your app. Since the *Purchases SDK* updates and caches the latest `PurchaserInfo` when the app becomes active, the completion block won't need to make a network request in most cases. 
[block:callout]
{
  "type": "info",
  "title": "Working with the cache",
  "body": "The SDK caches the user's subscription information to reduce your app's reliance on the network. Users who unlock entitlements will be able to access them even without an internet connection. The SDK will update the cache if it's older than 5 minutes, but only if you call `getPurchaserInfo()`, make a purchase, or restore purchases, so it's a good idea to call `getPurchaserInfo()` any time a user accesses premium content."
}
[/block]
The `PurchaserInfo` object gives you access to the following information about a user:
[block:parameters]
{
  "data": {
    "h-0": "Name",
    "h-1": "Description",
    "9-0": "Entitlements",
    "9-1": "`EntitlementInfo` objects that contain information about the user's entitlements, such as subscription state. See more [below](doc:purchaserinfo#section-get-entitlement-information).",
    "1-0": "Original App User ID",
    "1-1": "The original app user id recorded for this user. May be the same as their current app user id. See our [guide on user ids](doc:user-ids) for more information.",
    "2-0": "First Seen",
    "2-1": "The date this user was first seen in RevenueCat. This is the install date in most cases",
    "0-0": "Request Date",
    "0-1": "The server date when the current `PurchaserInfo` object was fetched. This should be used for date comparison operators instead of relying on the device time.",
    "8-0": "Active Subscriptions",
    "8-1": "An array of subscription product identifiers that are active. You should be using [entitlement](doc:entitlements) though.",
    "3-0": "Original Application Version",
    "3-1": "iOS only. The version number for the first version of the app this user downloaded. Will be `nil` unless a receipt has been recorded for the user through a purchase, restore, or import.\n\nNote in sandbox this will always be \"1.0\"\n\nUseful for [migrating existing apps to subscriptions](doc:migrating-existing-subscriptions).",
    "6-0": "All Purchased Product Identifiers",
    "6-1": "An array of product identifiers purchased by the user regardless of expiration.",
    "7-0": "Non Consumable Purchases",
    "7-1": "An array of all the non-consumable product identifiers purchased by the user.",
    "5-0": "Management URL",
    "5-1": "URL to manage the active subscription of the user. If the user has an active iOS subscription, this will point to the App Store, if the user has an active Play Store subscription it will point there.\n\nIf there are no active subscriptions it will be null.\n\nIf there are multiple for different platforms, it will point to the App Store",
    "4-0": "Original Purchase Date",
    "4-1": "iOS only. The date that the app was first purchased/downloaded by the user. Will be `nil` if no receipt is recorded for the user. Useful for [migrating existing apps to subscriptions](doc:migrating-existing-subscriptions)."
  },
  "cols": 2,
  "rows": 10
}
[/block]

[block:api-header]
{
  "title": "Get Entitlement Information"
}
[/block]
The `EntitlementInfo` object gives you access to all of the information about the status of a users entitlements.
[block:parameters]
{
  "data": {
    "h-0": "Name",
    "h-1": "Description",
    "0-0": "Identifier",
    "0-1": "The entitlement identifier configured in the RevenueCat dashboard.",
    "2-0": "Is Active",
    "2-1": "Whether or not the user has access to this entitlement.",
    "3-0": "Will Renew",
    "3-1": "Whether or not the entitlement is set to renew at the end of the current period. \n\nNote there may be a multiple hour delay between the value of this property and the actual state in the App Store / Play Store.",
    "4-0": "Period Type",
    "4-1": "The period type this entitlement is in, can be one of:\n- Trial: In a free trial period\n- Intro: In an introductory price period\n- Normal: In the default period",
    "5-0": "Latest Purchase Date",
    "5-1": "The latest purchase or renewal date for this entitlement.",
    "6-0": "Original Purchase Date",
    "6-1": "The first date this entitlement was purchased. May be the same as the latest purchase date.",
    "7-0": "Expiration Date",
    "7-1": "The expiration date for the entitlement, can be null for lifetime access. If the period type is trial then this is the trial expiration date.",
    "8-0": "Store",
    "8-1": "The store that unlocked this entitlement, can be one of:\n- App Store\n- Mac App Store\n- Play Store\n- Stripe\n- Promotional (RevenueCat)",
    "1-0": "Product Identifier",
    "1-1": "The underlying product identifier that unlocked this entitlement.",
    "9-0": "Is Sandbox",
    "9-1": "Whether this entitlement was unlocked from a sandbox or production purchase.",
    "10-0": "Unsubscribe Detected At",
    "10-1": "The date an unsubscribe was detected. An unsubscribe **does not** mean that the entitlement is inactive.\n\n\nNote there may be a multiple hour delay between the value of this property and the actual state in the App Store / Play Store.",
    "11-0": "Billing Issue Detected At",
    "11-1": "The date a billing issue was detected, will be null again once billing issue resolved. A billing issue **does not** mean that the entitlement is inactive.\n\n\nNote there may be a multiple hour delay between the value of this property and the actual state in the App Store / Play Store."
  },
  "cols": 2,
  "rows": 12
}
[/block]

[block:api-header]
{
  "title": "Checking If A User Is Subscribed"
}
[/block]
The subscription status for a user can easily be determined with the `PurchaserInfo` and `EntitlementInfo` objects.

For most apps that only have one entitlement, the `isActive` status can be quickly checked for your entitlement Id. 
[block:code]
{
  "codes": [
    {
      "code": "if purchaserInfo.entitlements[\"your_entitlement_id\"]?.isActive == true {\n  // user has access to \"your_entitlement_id\"                \n}",
      "language": "swift"
    },
    {
      "code": "if (purchaserInfo.entitlements[@\"your_entitlement_id\"].isActive) {\n  // user has access to \"your_entitlement_id\"\n}",
      "language": "objectivec"
    },
    {
      "code": "if (purchaserInfo.entitlements[\"your_entitlement_id\"]?.isActive == true) {\n\t// user has access to \"your_entitlement_id\"                \n}",
      "language": "kotlin"
    },
    {
      "code": "if (purchaserInfo.getEntitlements().get(\"your_entitlement_id\").isActive()) {\n\t// user has access to \"your_entitlement_id\"\n}",
      "language": "java"
    },
    {
      "code": "if (purchaserInfo.entitlements.all[\"my_entitlement_identifier\"].isActive) {\n  // Grant user \"pro\" access\n}",
      "language": "javascript",
      "name": "Flutter"
    },
    {
      "code": "if(typeof purchaserInfo.entitlements.active.my_entitlement_identifier !== \"undefined\") {\n  // Grant user \"pro\" access\n}",
      "language": "javascript",
      "name": "React Native"
    },
    {
      "code": "if(typeof purchaserInfo.entitlements.active.my_entitlement_identifier !== \"undefined\") {\n  // Grant user \"pro\" access\n}",
      "language": "javascript",
      "name": "Cordova"
    },
    {
      "code": "if (purchaserInfo.Entitlements.Active.ContainsKey(\"my_entitlement_identifier\")) {\n  // Unlock that great \"pro\" content\n}",
      "language": "csharp",
      "name": "Unity"
    }
  ]
}
[/block]
If your app has multiple entitlements and you need to check if a user is subscribed to at least one you can also check for the entitlement Id in the `active` dictionary of `EntitlementInfo` objects.
[block:code]
{
  "codes": [
    {
      "code": "if !purchaserInfo.entitlements.active.isEmpty {\n    //user has access to some entitlement\n}",
      "language": "swift"
    },
    {
      "code": "if ([purchaserInfo.entitlements.active count] > 0) {\n    //user has access to some entitlement\n}",
      "language": "objectivec"
    },
    {
      "code": "if (purchaserInfo.entitlements.active.isNotEmpty()) {\n  //user has access to some entitlement\n}",
      "language": "kotlin"
    },
    {
      "code": "if (!purchaserInfo.getEntitlements().getActive().isEmpty()) {\n\t//user has access to some entitlement\n}",
      "language": "java"
    },
    {
      "code": "if (purchaserInfo.entitlements.active.isNotEmpty) {\n  //user has access to some entitlement\n}",
      "language": "javascript",
      "name": "Flutter"
    },
    {
      "code": "if (Object.entries(purchaserInfo.entitlements.active).length) {\n  //user has access to some entitlement\n}",
      "language": "javascript",
      "name": "React Native"
    },
    {
      "code": "if (Object.entries(purchaserInfo.entitlements.active).length) {\n  //user has access to some entitlement\n}",
      "language": "javascript",
      "name": "Cordova"
    },
    {
      "code": "if (purchaserInfo.Entitlements.Active.Count != 0) {\n\t//user has access to some entitlement\n}",
      "language": "csharp",
      "name": "Unity"
    }
  ]
}
[/block]
It's important to note that PurchaserInfo will be empty if no purchases have been made and no transactions have been synced. This means that entitlements may not exist in PurchaserInfo even if they have been set up in the RevenueCat dashboard.
[block:api-header]
{
  "title": "Listening For Purchaser Info Updates"
}
[/block]
Since *Purchases* SDK works seamlessly on any platform, a user's purchase info may change from a variety of sources. You can respond to any changes in purchaser info by conforming to an optional delegate method, `didReceivePurchaserInfo:`. This will fire whenever we receive a *change* in purchaser info *on the current device* and you should expect it to be called at launch and throughout the life of the app.

Depending on your app, it may be sufficient to ignore the delegate and simply handle changes to purchaser information the next time your app is launched. Or throughout your app as you request new `PurchaserInfo` objects.
[block:code]
{
  "codes": [
    {
      "code": "// Additional configure setup\nfunc application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {\n  \n    Purchases.logLevel = .debug\n    Purchases.configure(withAPIKey: \"public_sdk_key\")\n    Purchases.shared.delegate = self // make sure to set this after calling configure\n}\n\nextension AppDelegate: PurchasesDelegate {\n    func purchases(_ purchases: Purchases, didReceiveUpdated purchaserInfo: Purchases.PurchaserInfo) {\n        // handle any changes to purchaserInfo\n    }\n}",
      "language": "swift"
    },
    {
      "code": "- (void)purchases:(nonnull RCPurchases *)purchases didReceiveUpdatedPurchaserInfo:(nonnull RCPurchaserInfo *)purchaserInfo {\n    // handle any changes to purchaserInfo\n}",
      "language": "objectivec"
    },
    {
      "code": "class UpsellActivity : AppCompatActivity(), UpdatedPurchaserInfoListener {\n  override fun onReceived(purchaserInfo: PurchaserInfo) {\n    // handle any changes to purchaserInfo\n  }\n  \n  override fun onCreate(savedInstanceState: Bundle?) {\n    super.onCreate(savedInstanceState)\n    Purchases.sharedInstance.updatedPurchaserInfoListener = this\n  }   \n}\n\n",
      "language": "kotlin"
    },
    {
      "code": "public class UpsellActivity extends AppCompatActivity implements UpdatedPurchaserInfoListener {\n  @Override public void onReceived(PurchaserInfo purchaserInfo) {\n    // handle any changes to purchaserInfo\n  } \n  \n  @Override public void onCreate(Bundle savedInstanceState) {\n    super.onCreate(savedInstanceState);\nPurchases.getSharedInstance().setUpdatedPurchaserInfoListener(this);\n  }   \n}",
      "language": "java"
    },
    {
      "code": "Purchases.addPurchaserInfoUpdateListener((info) {\n\t// handle any changes to purchaserInfo\n});",
      "language": "javascript",
      "name": "Flutter"
    },
    {
      "code": "Purchases.addPurchaserInfoUpdateListener((info) => {\n\t// handle any changes to purchaserInfo\n});",
      "language": "javascript",
      "name": "React Native"
    },
    {
      "code": "window.addEventListener(\"onPurchaserInfoUpdated\", (info) => {\n\t// handle any changes to purchaserInfo\n});",
      "language": "javascript",
      "name": "Cordova"
    },
    {
      "code": "public class PurchasesListener : Purchases.UpdatedPurchaserInfoListener\n{\n\tpublic override void PurchaserInfoReceived(Purchases.PurchaserInfo purchaserInfo)\n    {\n       // handle any changes to purchaserInfo\n    }\n}\n",
      "language": "csharp",
      "name": "Unity"
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "Web Apps"
}
[/block]
If you also have a web app, or need to get a user's subscription status from outside of the *Purchases SDK*, you should use the REST API. You can read the full API reference [here](https://docs.revenuecat.com/reference).
[block:code]
{
  "codes": [
    {
      "code": "curl --request GET \\\n  --url https://api.revenuecat.com/v1/subscribers/app_user_id \\\n  --header 'Content-Type: application/json' \\\n  --header 'Authorization: Bearer PUBLIC_API_KEY'",
      "language": "curl"
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "Handling Refunds"
}
[/block]
RevenueCat can handle refunds across iOS, Android, and Stripe for both subscription and non-subscription products. As soon as RevenueCat detects a refund, the `purchaserInfo` will be updated to reflect the correct entitlement status - no action required on your part! If you have questions about refunds, take a look at our [community article](https://community.revenuecat.com/general-questions-7/how-do-i-issue-a-refund-115) covering the topic.
[block:callout]
{
  "type": "info",
  "title": "Granting refunds on Android",
  "body": "In order for RevenueCat to detect refunds on Android, you must grant the refund via the [RevenueCat dashboard](https://docs.revenuecat.com/docs/customer-history#refunding-purchases) or [API](https://docs.revenuecat.com/reference#revoke-a-google-subscription).\n\nRefunds granted via the Google Play Console are not properly detected as refunds in RevenueCat."
}
[/block]

[block:api-header]
{
  "title": "Next Steps"
}
[/block]
* Once you're ready to test your integration, you can follow our guides on [testing and debugging :fa-arrow-right:](doc:debugging)
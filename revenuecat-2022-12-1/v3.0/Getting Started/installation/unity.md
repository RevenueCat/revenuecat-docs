---
title: "Unity"
slug: "unity"
excerpt: "Instructions for installing Purchases SDK for Unity"
hidden: false
metadata: 
  title: "Unity in-app purchases guide | RevenueCat"
  description: "The RevenueCat Purchases SDK handles the pain points of in-app purchases and subscriptions for Unity, so you can get back to building your app."
  image: 
    0: "https://files.readme.io/29840bc-Reddit__E.jpg"
    1: "Reddit – E.jpg"
    2: 1200
    3: 630
    4: "#fbabaf"
createdAt: {}
updatedAt: "2020-08-24T19:06:15.442Z"
---
###What is RevenueCat?

RevenueCat is an in-app subscription platform that makes it easy to build and manage IAPs on any platform. With the RevenueCat SDK, you can build and manage your app business on any platform without having to maintain purchase infrastructure. You can read more about [how RevenueCat fits into your app](https://www.revenuecat.com/blog/where-does-revenuecat-fit-in-your-app) or you can [sign up free](https://app.revenuecat.com/signup) to start building.
[block:api-header]
{
  "title": "Installation"
}
[/block]
## 1. Import the Purchases Unity package

Download the latest version of [**Purchases.unitypackage**](https://github.com/RevenueCat/purchases-unity/releases/download/2.2.1/Purchases.unitypackage).

Import the downloaded unitypackage to your Unity project. Make sure the `PlayServiceResolver` and the `ExternalDependencyManager` folders are also added. These folders will install the [EDM4U](https://github.com/googlesamples/unity-jar-resolver) plugin, which will add all the Android and iOS dependencies automatically when building your project.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/db7fc97-Screen_Shot_2020-08-06_at_9.58.34_AM.png",
        "Screen Shot 2020-08-06 at 9.58.34 AM.png",
        488,
        647,
        "#b5b5b4"
      ]
    }
  ]
}
[/block]

[block:callout]
{
  "type": "warning",
  "title": "ExternalDependencyManager plugin",
  "body": "Make sure the ExternalDependencyManager is properly installed. Otherwise our plugin will not be able to compile. If you don't see the option under the Assets menu after restarting the editor, try reinstalling the RevenueCat plugin or manually importing the [EDM4U](https://github.com/googlesamples/unity-jar-resolver) plugin."
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "If using RevenueCat alongside Unity IAP or other plugin that includes the Android InAppBillingService class, or you are getting `Duplicate class com.android.vending.billing.IInAppBillingService` please follow [this instructions](doc:unity#installation-with-unity-iap-side-by-side)",
  "title": "Android InAppBillingService"
}
[/block]
## 2. Create a GameObject with the Purchases behavior
The Purchases package will include a MonoBehavior called Purchases. This will be your access point to RevenueCat from inside Unity. It should be instantiated once and kept as a singleton. You can use properties to configure your API Key, app user ID (if you have one), and product identifiers you want to fetch.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/9c094e8-Screen_Shot_2018-05-31_at_11.24.09_AM.png",
        "Screen Shot 2018-05-31 at 11.24.09 AM.png",
        768,
        364,
        "#bbbbbb"
      ],
      "sizing": "80",
      "border": false,
      "caption": "The Purchases behavior is configured with your RevenueCat API key and the product identifiers you want to fetch."
    }
  ]
}
[/block]
## 3. On iOS, add *StoreKit.framework* to *Linked Frameworks and Libraries* in Xcode

## 4. Subclass Purchases.Listener MonoBehavior
The Purchases behavior takes one additional parameter, a GameObject with a Purchases.Listener component. This will be where you handle purchase events, and updated subscriber information from RevenueCat. Here is a simple example:
[block:code]
{
  "codes": [
    {
      "code": "using System;\nusing UnityEngine;\nusing UnityEngine.Events;\nusing UnityEngine.UI;\n\npublic class PurchasesListener : Purchases.UpdatedPurchaserInfoListener\n{\n  \n  private void Start()\n    {\n        CreateButton(\"Restore Purchases\", RestoreClicked, 100);\n\n        CreateButton(\"Do Other Stuff\", DoOtherStuff, 300);\n\n        var purchases = GetComponent<Purchases>();\n        purchases.SetDebugLogsEnabled(true);\n        purchases.GetOfferings((offerings, error) =>\n        {\n            if (error != null)\n            {\n                LogError(error);\n            }\n            else\n            {\n               var package = offerings.Current.Monhtly;\n               if (package == null) continue;\n                    var label = package.PackageType + \" \" + package.Product.priceString;\n                    CreateButton(label, () => ButtonClicked(package), 500);\n                }\n            }\n        });\n    }\n  \n    void ButtonClicked(Purchases.Package package)\n    {\n        Purchases purchases = GetComponent<Purchases>();\n        purchases.PurchasePackage(package, (productIdentifier, purchaserInfo, userCancelled, error) =>\n        {\n            if (!userCancelled)\n            {\n                if (error != null)\n                {\n                    LogError(error);\n                }\n                else\n                {\n                    DisplayPurchaserInfo(purchaserInfo);\n                }\n            } else\n            {\n                Debug.Log(\"Subtester: User cancelled, don't show an error\");\n            }\n        });\n    }\n    \n    void DoOtherStuff()\n    {\n        var purchases = GetComponent<Purchases>();\n        var data = new AdjustData\n        {\n            adid = \"test\",\n            network = \"network\",\n            adgroup = \"adgroup\",\n            campaign = \"campaign\",\n            creative = \"creative\",\n            clickLabel = \"clickLabel\",\n            trackerName = \"trackerName\",\n            trackerToken = \"trackerToken\"\n        };\n\n        purchases.AddAttributionData(JsonUtility.ToJson(data), Purchases.AttributionNetwork.ADJUST);\n        \n        purchases.GetPurchaserInfo((info, error) =>\n        {\n            Debug.Log(\"purchaser info \" + info.ActiveSubscriptions);\n            if (error != null) {\n                LogError(error);\n            }\n        });\n        \n        Debug.Log(\"user ID \" + purchases.GetAppUserId());\n    }\n\n    void RestoreClicked()\n    {\n        var purchases = GetComponent<Purchases>();\n        purchases.RestoreTransactions((purchaserInfo, error) =>\n        {\n            if (error != null)\n            {\n                LogError(error);\n            }\n            else\n            {\n                DisplayPurchaserInfo(purchaserInfo);\n            }\n        });\n    }\n\n    \n    public override void PurchaserInfoReceived(Purchases.PurchaserInfo purchaserInfo)\n    {\n        DisplayPurchaserInfo(purchaserInfo);\n    }\n    \n    private void logError(Purchases.Error error)\n    {\n        Debug.Log(\"Subtester: \" + JsonUtility.ToJson(error));\n    }\n\n\n    private void DisplayPurchaserInfo(Purchases.PurchaserInfo purchaserInfo)\n    {\n        // Show purchaser info on screen\n    }\n}",
      "language": "csharp"
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "Installation with Unity IAP side by side"
}
[/block]

[block:callout]
{
  "type": "danger",
  "body": "Follow this instruction if using RevenueCat alongside Unity IAP, other plugin that includes the Android InAppBillingService class, or for some other reason you get an error similar to:\n\n`Duplicate class com.android.vending.billing.IInAppBillingService found in modules classes.jar (:GoogleAIDL:) and classes.jar (com.android.billingclient:billing:2.0.3)`"
}
[/block]
If using RevenueCat alongside Unity IAP or other plugin that includes the Android InAppBillingService class you will be getting an error when compiling that warns about IInAppBillingService being duplicated. 


Download the [**Purchases_NoInAppBillingService.unitypackage**](https://github.com/RevenueCat/purchases-unity/releases/download/2.2.1/Purchases_NoInAppBillingService.unitypackage) version of the package. This version doesn't include the `PlayServiceResolver` plugin and uses a modified version of BillingClient that doesn't include the IInAppBillingService.


Make sure you have custom Main Gradle Template selected in the Android Player Settings... That should create a `mainTemplate.gradle` inside the `Assets/Plugins/Android`.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/8925eda-Screen_Shot_2020-05-05_at_1.49.57_PM.png",
        "Screen Shot 2020-05-05 at 1.49.57 PM.png",
        326,
        170,
        "#bdbdbd"
      ]
    }
  ]
}
[/block]
Modify the `mainTemplate.gradle` dependencies block to look like the following:
[block:code]
{
  "codes": [
    {
      "code": "dependencies {\n    implementation fileTree(dir: 'libs', include: ['*.jar'])\n**DEPS**\n    // ** ADD THIS **\n    implementation ('com.revenuecat.purchases:purchases-hybrid-common:1.2.0') {\n        exclude group: 'com.android.billingclient', module: 'billing'\n    }\n}",
      "language": "groovy"
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "Next Steps"
}
[/block]
* Now that you've installed the Purchases SDK in your Unity app, get started [building with Purchases :fa-arrow-right:](doc:getting-started-1#section-displaying-available-products)
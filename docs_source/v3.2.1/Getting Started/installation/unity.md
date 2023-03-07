---
title: "Unity"
slug: "unity"
excerpt: "Instructions for installing Purchases SDK for Unity"
hidden: false
metadata: 
  title: "In-App Purchase Installation for Unity – RevenueCat"
  description: "The RevenueCat Purchases SDK handles the pain points of in-app purchases and subscriptions for Unity, so you can get back to building your app."
  image: 
    0: "https://files.readme.io/beea902-OG_image.png"
    1: "OG image.png"
    2: 1200
    3: 627
    4: "#e9acb0"
createdAt: {}
updatedAt: "2021-11-16T23:39:29.239Z"
---
# What is RevenueCat?

RevenueCat provides a backend and a wrapper around StoreKit and Google Play Billing to make implementing in-app purchases and subscriptions easy. With our SDK, you can build and manage your app business on any platform without having to maintain IAP infrastructure. You can read more about [how RevenueCat fits into your app](https://www.revenuecat.com/blog/where-does-revenuecat-fit-in-your-app) or you can [sign up free](https://app.revenuecat.com/signup) to start building.

# Installation

## Import the Purchases Unity package

Download the latest version of [**Purchases.unitypackage**](https://github.com/RevenueCat/purchases-unity/releases/latest/download/Purchases.unitypackage).

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
  "body": "If using the RevenueCat plugin older than 2.3.0 alongside Unity IAP or other plugin that includes the Android InAppBillingService class, or you are getting `Duplicate class com.android.vending.billing.IInAppBillingService` please update to the latest Unity SDK or see the [legacy install instructions](https://docs.revenuecat.com/v3.0/docs/unity#installation-with-unity-iap-side-by-side)",
  "title": "Android InAppBillingService in versions of purchases-unity < 2.3.0"
}
[/block]
## Create a GameObject with the Purchases behavior
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
## Link StoreKit

On iOS, add *StoreKit.framework* to *Linked Frameworks and Libraries* in Xcode.

## Subclass Purchases.Listener MonoBehavior

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
# Installation with Unity IAP side by side
[block:callout]
{
  "type": "danger",
  "body": "Make sure to use version [3.2.0](https://github.com/RevenueCat/purchases-unity/releases/tag/3.2.0) of our plugin. Due to incompatibilities with the version of BillingClient used by Unity IAP, the latest versions of the plugin won't work alongside Unity IAP until Unity IAP gets updated to BillingClient 4.x.x.",
  "title": "Unity IAP doesn't work with version 3.3.0+ of the purchases plugin"
}
[/block]

[block:callout]
{
  "type": "danger",
  "body": "Follow this instruction if using RevenueCat alongside Unity IAP 2.2.0+, other plugin that includes the Android InAppBillingService class, or for some other reason you get an error regarding duplicated classes."
}
[/block]
If using RevenueCat alongside Unity IAP 2.2.0+ or other plugin that includes the Android BillingClient library you will be getting an error when compiling that warns about some BillingClient classes being duplicated.

The easiest way to remove the error would be to tell Gradle to not include the billingclient library that Unity IAP is already including.

In order to do that, make sure you have `Custom Main Gradle Template` selected in the Android Player Settings... That should create a `mainTemplate.gradle` inside the `Assets/Plugins/Android`.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/711eca6-8925eda-Screen_Shot_2020-05-05_at_1.49.57_PM.png",
        "8925eda-Screen_Shot_2020-05-05_at_1.49.57_PM.png",
        326,
        170,
        "#bdbdbd"
      ]
    }
  ]
}
[/block]
Modify the `mainTemplate.gradle` to include the following at the end of the dependencies block:
[block:code]
{
  "codes": [
    {
      "code": "dependencies {\n    ...\n    \n    // ** ADD THIS **\n    configurations.all {\n        exclude group: 'com.android.billingclient', module: 'billing'\n    }\n}",
      "language": "groovy"
    }
  ]
}
[/block]
Perform a clean up of the resolved dependencies using the `Assets/External Dependency Manager/Android Resolver/Delete Resolved Libraries` menu. This will cleanup the previously downloaded .aars in `Assets/Plugins/Android`. Otherwise you could end up with duplicated classes errors. 

Also make sure to perform a resolve, so External Dependency Manager adds the right dependencies to the generated `build.gradle`.

# Next Steps

* Now that you've installed the Purchases SDK in your Unity app, get started [building with Purchases :fa-arrow-right:](doc:getting-started-1#section-displaying-available-products)
---
title: "Unity"
slug: "unity"
excerpt: "Instructions for installing Purchases SDK for Unity"
hidden: false
createdAt: "2018-05-31T17:46:29.585Z"
updatedAt: "2020-12-16T19:26:09.054Z"
---
The Purchases SDK provided by RevenueCat allows you to implement subscriptions in your Unity app easily.
[block:api-header]
{
  "title": "Installation"
}
[/block]
## 1. Add the Purchases Unity package
Download the latest version of [**Purchases.unitypackage**](https://github.com/RevenueCat/purchases-unity/releases). Add it to your Unity project.

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
## 3. On iOS, add *StoreKit.framework* to *Linked Frameworks and Libraries* in XCode

## 4. Subclass Purchases.Listener MonoBehavior
The Purchases behavior takes one additional parameter, a GameObject with a Purchases.Listener component. This will be where you handle purchase events, and updated subscriber information from RevenueCat. Here is a simple example:
[block:code]
{
  "codes": [
    {
      "code": "using System;\nusing UnityEngine;\nusing UnityEngine.Events;\nusing UnityEngine.UI;\n\npublic class PurchasesListener : Purchases.UpdatedPurchaserInfoListener\n{\n    void ButtonClicked(string product)\n    {\n        Purchases purchases = GetComponent<Purchases>();\n        purchases.MakePurchase(product, (productIdentifier, purchaserInfo, userCancelled, error) =>\n        {\n            if (!userCancelled)\n            {\n                if (error != null)\n                {\n                    LogError(error);\n                }\n                else\n                {\n                    DisplayPurchaserInfo(purchaserInfo);\n                }\n            } else\n            {\n                Debug.Log(\"Subtester: User cancelled, don't show an error\");\n            }\n        });\n    }\n    \n    void DoOtherStuff()\n    {\n        var purchases = GetComponent<Purchases>();\n        var data = new AdjustData\n        {\n            adid = \"test\",\n            network = \"network\",\n            adgroup = \"adgroup\",\n            campaign = \"campaign\",\n            creative = \"creative\",\n            clickLabel = \"clickLabel\",\n            trackerName = \"trackerName\",\n            trackerToken = \"trackerToken\"\n        };\n\n        purchases.AddAttributionData(JsonUtility.ToJson(data), Purchases.AttributionNetwork.ADJUST);\n        \n        purchases.GetPurchaserInfo((info, error) =>\n        {\n            Debug.Log(\"purchaser info \" + info.ActiveSubscriptions);\n            if (error != null) {\n                LogError(error);\n            }\n        });\n        \n        Debug.Log(\"user ID \" + purchases.GetAppUserId());\n    }\n\n    void RestoreClicked()\n    {\n        var purchases = GetComponent<Purchases>();\n        purchases.RestoreTransactions((purchaserInfo, error) =>\n        {\n            if (error != null)\n            {\n                LogError(error);\n            }\n            else\n            {\n                DisplayPurchaserInfo(purchaserInfo);\n            }\n        });\n    }\n\n    \n    public override void PurchaserInfoReceived(Purchases.PurchaserInfo purchaserInfo)\n    {\n        DisplayPurchaserInfo(purchaserInfo);\n    }\n    \n    private void logError(Purchases.Error error)\n    {\n        Debug.Log(\"Subtester: \" + JsonUtility.ToJson(error));\n    }\n\n\n    private void DisplayPurchaserInfo(Purchases.PurchaserInfo purchaserInfo)\n    {\n        // Show purchaser info on screen\n    }\n}",
      "language": "csharp"
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
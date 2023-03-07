---
title: "Unity"
slug: "setting-up-unity-sdk"
excerpt: "Instructions for installing Purchases SDK for Unity"
hidden: false
createdAt: "2018-05-31T17:46:29.585Z"
updatedAt: "2019-01-03T00:31:06.918Z"
---
The Purchases SDK provided by RevenueCat allows you to implement subscriptions in your Unity app easily.
[block:api-header]
{
  "title": "Installation"
}
[/block]
## 1. Add the Purchases Unity package
Get the latest version of Purchases.unitypackage from [Github](https://github.com/RevenueCat/purchases-unity/releases/). Add it to your Unity project.

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
      "caption": "The Purchases behaviour is configured with your RevenueCat API key and the product identifiers you want to fetch."
    }
  ]
}
[/block]
## 3. Subclass Purchases.Listener MonoBehavior
The Purchases behavior takes one additional parameter, a GameObject with a Purchases.Listener component. This will be where you handle purchase events, and updated subscriber information from RevenueCat. Here is a simple example:
[block:code]
{
  "codes": [
    {
      "code": "using System;\nusing System.Collections;\nusing System.Collections.Generic;\nusing UnityEngine;\nusing UnityEngine.Events;\nusing UnityEngine.UI;\n\npublic class PurchasesListener : Purchases.Listener\n{\n    void SendAttribution()\n    {\n        Purchases purchases = GetComponent<Purchases>();\n        Purchases.AdjustData data = new Purchases.AdjustData();\n\n        data.adid = \"test\";\n        data.network = \"network\";\n        data.adgroup = \"adgroup\";\n        data.campaign = \"campaign\";\n        data.creative = \"creative\";\n        data.clickLabel = \"clickLabel\";\n        data.trackerName = \"trackerName\";\n        data.trackerToken = \"trackerToken\";\n\n        purchases.AddAdjustAttributionData(data);\n    }\n\n    void ButtonClicked(string product)\n    {\n        Purchases purchases = GetComponent<Purchases>();\n        purchases.MakePurchase(product);\n    }\n\n    void RestoreClicked()\n    {\n        Purchases purchases = GetComponent<Purchases>();\n        purchases.RestoreTransactions();\n    }\n\n    public override void PurchaseSucceeded(string productIdentifier, Purchases.PurchaserInfo purchaserInfo)\n    {\n        DisplayPurchaserInfo(purchaserInfo);\n    }\n\n    public override void PurchaseFailed(string productIdentifier, Purchases.Error error, bool userCanceled)\n    {\n        if (userCanceled)\n        {\n            Debug.Log(\"Subtester: User canceled, don't show an error\");\n        }\n        else\n        {\n            logError(error);\n        }\n    }\n\n    public override void PurchaserInfoReceived(Purchases.PurchaserInfo purchaserInfo)\n    {\n        DisplayPurchaserInfo(purchaserInfo);\n    }\n\n    public override void PurchaserInfoReceiveFailed(Purchases.Error error)\n    {\n        logError(error);\n    }\n\n    public override void RestoredPurchases(Purchases.PurchaserInfo purchaserInfo)\n    {\n        Debug.Log(\"Subtester: Restore Succeeded\");\n        DisplayPurchaserInfo(purchaserInfo);\n    }\n\n    public override void RestorePurchasesFailed(Purchases.Error error)\n    {\n        Debug.Log(\"Subtester: Restore Failed\");\n        logError(error);\n    }\n\n    private void logError(Purchases.Error error)\n    {\n        Debug.Log(\"Subtester: \" + JsonUtility.ToJson(error));\n    }\n\n\n    private void DisplayPurchaserInfo(Purchases.PurchaserInfo purchaserInfo)\n    {\n        // Show purchaser info on screen\n    }\n}\n",
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
* Now that you've installed the Purchases SDK in your Unity app, get started by [initializing an instance of Purchases :fa-arrow-right:](doc:getting-started-1#section-4-initialize-purchases)
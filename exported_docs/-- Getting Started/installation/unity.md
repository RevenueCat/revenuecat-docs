---
title: "Unity"
slug: "unity"
excerpt: "Instructions for installing Purchases SDK for Unity"
hidden: false
metadata: 
  title: "Install Unity SDK – RevenueCat"
  description: "The RevenueCat Purchases SDK handles the pain points of in-app purchases and subscriptions for Unity, so you can get back to building your app."
  image: 
    0: "https://files.readme.io/3bedede-RevenueCat_Docs_OG.png"
    1: "RevenueCat Docs OG.png"
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: {}
updatedAt: "2022-08-03T21:29:36.336Z"
---
# What is RevenueCat?

RevenueCat provides a backend and a wrapper around StoreKit and Google Play Billing to make implementing in-app purchases and subscriptions easy. With our SDK, you can build and manage your app business on any platform without having to maintain IAP infrastructure. You can read more about [how RevenueCat fits into your app](https://www.revenuecat.com/blog/where-does-revenuecat-fit-in-your-app) or you can [sign up free](https://app.revenuecat.com/signup) to start building.

# Installation

## Import the Purchases Unity package

Download the latest version of [**Purchases.unitypackage**](https://github.com/RevenueCat/purchases-unity/releases/latest/download/Purchases.unitypackage).

Import the downloaded unitypackage to your Unity project. Make sure the `PlayServiceResolver` and the `ExternalDependencyManager` folders are also added. These folders will install the [EDM4U](https://github.com/googlesamples/unity-jar-resolver) plugin, which will add all the Android and iOS dependencies automatically when building your project.
If you're running `purchases-unity` v3.5.1 or later, also make sure that the `RevenueCatPostInstall` script is added, since it will set up `StoreKit` for iOS and prevent issues when uploading builds to App Store Connect in Unity 2020.
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
        "https://files.readme.io/a20fb79-Screen_Shot_2022-08-03_at_3.04.56_PM.png",
        "Screen Shot 2022-08-03 at 3.04.56 PM.png",
        1706,
        910,
        "#313231"
      ]
    }
  ]
}
[/block]
## Link StoreKit (iOS only)

`StoreKit` should automatically be linked. If you run into any issues, add *StoreKit.framework* to *Linked Frameworks and Libraries* in Xcode.

## Subclass Purchases.Listener MonoBehavior

The Purchases behavior takes one additional parameter, a GameObject with a Purchases.Listener component. This will be where you handle purchase events, and updated subscriber information from RevenueCat. Here is a simple example:
[block:code]
{
  "codes": [
    {
      "code": "using System;\nusing System.Collections.Generic;\nusing UnityEngine;\n\npublic class PurchasesListener : Purchases.UpdatedCustomerInfoListener\n{\n    public override void CustomerInfoReceived(Purchases.CustomerInfo customerInfo)\n    {\n        // display new CustomerInfo\n    }\n\n    private void Start()\n    {\n        var purchases = GetComponent<Purchases>();\n        purchases.SetDebugLogsEnabled(true);\n        purchases.GetOfferings((offerings, error) =>\n        {\n            if (error != null)\n            {\n                // show error\n            }\n            else\n            {\n                // show offering\n            }\n        });\n    }\n\n    public void BeginPurchase(Purchases.Package package)\n    {\n        var purchases = GetComponent<Purchases>();\n        purchases.PurchasePackage(package, (productIdentifier, customerInfo, userCancelled, error) =>\n        {\n            if (!userCancelled)\n            {\n                if (error != null)\n                {\n                    // show error\n                }\n                else\n                {\n                    // show updated Customer Info\n                }\n            }\n            else\n            {\n                // user cancelled, don't show an error\n            }\n        });\n    }\n\n    void RestoreClicked()\n    {\n        var purchases = GetComponent<Purchases>();\n        purchases.RestorePurchases((customerInfo, error) =>\n        {\n            if (error != null)\n            {\n                // show error\n            }\n            else\n            {\n                // show updated Customer Info\n            }\n        });\n    }\n}",
      "language": "csharp"
    }
  ]
}
[/block]
# Proguard rules

If you have enabled Minify in Unity, make sure to add these custom rules to your `Assets/Plugins/Android/proguard-user.txt` and enable the Custom Proguard File setting in Publishing Settings:

```
-keep class com.revenuecat.** { *; }
```

# Installation with Unity IAP side by side

## Purchases Unity 4.0.0+ 
![RevenueCat's Purchases Unity SDK 4.0.0+](https://img.shields.io/badge/Purchases%20Unity-4.0.0%2B-%23f25a5a?style=flat-square)

**side by side with Unity IAP 4.4.0+**

Download `Purchases.unityPackage` and install as normal. Skip the rest of the instructions in this page. 

**side by side with Unity IAP 3.3.0 < 4.4.0**

Download `Purchases-UnityIAP.unityPackage` and install as normal. Skip the rest of the instructions in this page. 

---

## Purchases Unity versions 3.0.0 < 4.0.0
![RevenueCat's Purchases Unity SDK 3.x](https://img.shields.io/badge/Purchases%20Unity-3.x-%23f25a5a?style=flat-square)

Purchases Unity versions 3.0.0 < 4.0.0 are not compatible with Unity IAP. Please update to the latest version if you need compatibility with Unity IAP. 

[block:callout]
{
  "type": "danger",
  "body": "Make sure to use version [3.2.0](https://github.com/RevenueCat/purchases-unity/releases/tag/3.2.0) of our plugin. Due to incompatibilities with the version of BillingClient used by Unity IAP, the latest versions of the plugin won't work alongside Unity IAP until Unity IAP gets updated to BillingClient 4.x.x.",
  "title": "Unity IAP doesn't work with version 3.3.0<4.0.0 of the purchases plugin"
}
[/block]
---

## Troubleshooting "duplicated class" errors
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
---
title: Unity
slug: unity
excerpt: Instructions for installing Purchases SDK for Unity
hidden: false
categorySlug: documentation
order: 6
parentDoc: 649983b4c31b2e000a3c1864
---
# What is RevenueCat?

RevenueCat provides a backend and a wrapper around StoreKit and Google Play Billing to make implementing in-app purchases and subscriptions easy. With our SDK, you can build and manage your app business on any platform without having to maintain IAP infrastructure. You can read more about [how RevenueCat fits into your app](https://www.revenuecat.com/blog/where-does-revenuecat-fit-in-your-app) or you can [sign up free](https://app.revenuecat.com/signup) to start building.

# Installation

We provide 2 ways to install our SDK: via Unity Package Manager (UPM) in the OpenUPM registry, or as a `.unitypackage`.

## Option 1 (recommended): Install using OpenUPM
  
1. First you need to import the [EDM4U](https://github.com/googlesamples/unity-jar-resolver) plugin into your project if you haven't already. This plugin will add all the Android and iOS dependencies automatically when building your project. To do this, you can:
   - Download the `external-dependency-manager-latest.unitypackage` file from the root of the [EDM4U](https://github.com/googlesamples/unity-jar-resolver) repo.
   - [Import](https://docs.unity3d.com/Manual/AssetPackagesImport.html) the downloaded `unitypackage` to your project.
2. Then, you can add the OpenUPM scoped registry. To do this, go to your project's settings -> Package Manager, and add a new scoped registry with URL `https://package.openupm.com` and scopes: `com.openupm` and `com.revenuecat.purchases-unity`. It should look like this:
![](https://files.readme.io/2284314-project-settings-openupm.jpg "project-settings-openupm.jpg")
3. Then, go to the Package Manager and from "My Registries", select the RevenueCat package and click on Install.
![](https://files.readme.io/368ba43-package-manager-revenuecat.jpg "package-manager-revenuecat.jpg")

[block:callout]
{
  "type": "info",
  "title": "Using OpenUPM-CLI",
  "body": "If you prefer, you can also use OpenUPM-CLI to add the scoped registry and the package through the command line. To do that, install the [OpenUPM-CLI](https://openupm.com/docs/getting-started.html) if you haven't already, then run `openupm add com.revenuecat.purchases-unity`. That should be it!"
}
[/block]

[block:callout]
{
  "type": "warning",
  "title": "If using UnityIAP alongside RevenueCat",
  "body": "If you're using `UnityIAP`, you need to follow special instructions outlined below."
}
[/block]

### Configure a Main Gradle Template

Go to Project -> Build Settings -> Player Settings -> Android tab -> Publishing Settings, and check "Custom Base Gradle Template", then close that window.

<img width="537" alt="Screenshot 2024-02-02 at 12 52 35 PM" src="https://github.com/RevenueCat/revenuecat-docs/assets/3922667/af2757ff-d156-4aef-af78-7ec0edbf1de2">

Go to Assets -> External Dependency Manager -> Android Resolver -> Settings, then check "Patch mainTemplate.gradle"

<img width="722" alt="Screenshot 2024-02-01 at 12 13 50 PM" src="https://github.com/RevenueCat/revenuecat-docs/assets/3922667/ece21dbe-bfc6-478f-ab68-d15456810a60">

<img width="537" alt="Screenshot 2024-02-02 at 12 52 35 PM" src="https://github.com/RevenueCat/revenuecat-docs/assets/3922667/d480097d-c873-4f9d-92d3-2114b64d71b4">

## Option 2: Import the Purchases Unity package

Download the latest version of [**Purchases.unitypackage**](https://github.com/RevenueCat/purchases-unity/releases/latest/download/Purchases.unitypackage).

Import the downloaded unitypackage to your Unity project. Make sure the `PlayServiceResolver` and the `ExternalDependencyManager` folders are also added. These folders will install the [EDM4U](https://github.com/googlesamples/unity-jar-resolver) plugin, which will add all the Android and iOS dependencies automatically when building your project.
If you're running `purchases-unity` v3.5.1 or later, also make sure that the `RevenueCatPostInstall` script is added, since it will set up `StoreKit` for iOS and prevent issues when uploading builds to App Store Connect in Unity 2020.
![](https://files.readme.io/db7fc97-Screen_Shot_2020-08-06_at_9.58.34_AM.png "Screen Shot 2020-08-06 at 9.58.34 AM.png")

[block:callout]
{
  "type": "warning",
  "title": "ExternalDependencyManager plugin",
  "body": "Make sure the ExternalDependencyManager is properly installed. Otherwise our plugin will not be able to compile. If you don't see the option under the Assets menu after restarting the editor, try reinstalling the RevenueCat plugin or manually importing the [EDM4U](https://github.com/googlesamples/unity-jar-resolver) plugin."
}
[/block]

### Configure a Main Gradle Template

Go to Project -> Build Settings -> Player Settings -> Android tab -> Publishing Settings, and check "Custom Base Gradle Template", then close that window.

<img width="537" alt="Screenshot 2024-02-02 at 12 52 35 PM" src="https://github.com/RevenueCat/revenuecat-docs/assets/3922667/af2757ff-d156-4aef-af78-7ec0edbf1de2">

Go to Assets -> External Dependency Manager -> Android Resolver -> Settings, then check "Patch mainTemplate.gradle"

<img width="722" alt="Screenshot 2024-02-01 at 12 13 50 PM" src="https://github.com/RevenueCat/revenuecat-docs/assets/3922667/ece21dbe-bfc6-478f-ab68-d15456810a60">

<img width="537" alt="Screenshot 2024-02-02 at 12 52 35 PM" src="https://github.com/RevenueCat/revenuecat-docs/assets/3922667/d480097d-c873-4f9d-92d3-2114b64d71b4">

## Create a GameObject with the Purchases behavior
The Purchases package will include a MonoBehavior called Purchases. This will be your access point to RevenueCat from inside Unity. It should be instantiated once and kept as a singleton. You can use properties to configure your API Key, app user ID (if you have one), and product identifiers you want to fetch.
![](https://files.readme.io/a20fb79-Screen_Shot_2022-08-03_at_3.04.56_PM.png "Screen Shot 2022-08-03 at 3.04.56 PM.png")
## Link StoreKit (iOS only)

`StoreKit` should automatically be linked. If you run into any issues, add *StoreKit.framework* to *Linked Frameworks and Libraries* in Xcode.

## Subclass Purchases.Listener MonoBehavior

The Purchases behavior takes one additional parameter, a GameObject with a Purchases.Listener component. This will be where you handle purchase events, and updated subscriber information from RevenueCat. Here is a simple example:
```csharp 
using System;
using System.Collections.Generic;
using UnityEngine;

public class PurchasesListener : Purchases.UpdatedCustomerInfoListener
{
    public override void CustomerInfoReceived(Purchases.CustomerInfo customerInfo)
    {
        // display new CustomerInfo
    }

    private void Start()
    {
        var purchases = GetComponent<Purchases>();
        purchases.SetDebugLogsEnabled(true);
        purchases.GetOfferings((offerings, error) =>
        {
            if (error != null)
            {
                // show error
            }
            else
            {
                // show offering
            }
        });
    }

    public void BeginPurchase(Purchases.Package package)
    {
        var purchases = GetComponent<Purchases>();
        purchases.PurchasePackage(package, (productIdentifier, customerInfo, userCancelled, error) =>
        {
            if (!userCancelled)
            {
                if (error != null)
                {
                    // show error
                }
                else
                {
                    // show updated Customer Info
                }
            }
            else
            {
                // user cancelled, don't show an error
            }
        });
    }

    void RestoreClicked()
    {
        var purchases = GetComponent<Purchases>();
        purchases.RestorePurchases((customerInfo, error) =>
        {
            if (error != null)
            {
                // show error
            }
            else
            {
                // show updated Customer Info
            }
        });
    }
}
```

# Unity Editor

Running the Purchases SDK is unsupported in the Unity Editor at this time, and may result in `NullReferenceException: Object reference not set to an instance of an object` errors. Please build and run your app instead.

# Proguard rules

If you have enabled Minify in Unity, make sure to add these custom rules to your `Assets/Plugins/Android/proguard-user.txt` and enable the Custom Proguard File setting in Publishing Settings:

```
-keep class com.revenuecat.** { *; }
```

# Installation with Unity IAP side by side

[block:callout]
{
  "type": "danger",
  "body": "Make sure to use version [5.3.0](https://github.com/RevenueCat/purchases-unity/releases/tag/5.3.0) of our plugin. Due to incompatibilities with the version of BillingClient used by Unity IAP, the latest versions of the plugin won't work alongside Unity IAP until Unity IAP gets updated to BillingClient 6.x.x.",
  "title": "Unity IAP doesn't work with version 6 of the purchases plugin"
}
[/block]

## Purchases Unity 5.0.0+
![RevenueCat's Purchases Unity SDK 5.0.0+](https://img.shields.io/badge/Purchases%20Unity-5.0.0%2B-%23f25a5a?style=flat-square)

**side by side with Unity IAP 4.8.0**

This version is only compatible with version 4.8.0 and above of Unity IAP which are the ones that include BillingClient 5.

To install download `Purchases.unityPackage` and install as normal. Then follow the instructions indicated in the "Troubleshooting "duplicated class" errors"

If using RevenueCat alongside Unity IAP 2.2.0+ or other plugin that includes the Android BillingClient library you will be getting an error when compiling that warns about some BillingClient classes being duplicated.

The easiest way to remove the error would be to tell Gradle to not include the billingclient library that Unity IAP is already including.

In order to do that, make sure you have `Custom Main Gradle Template` selected in the Android Player Settings... That should create a `mainTemplate.gradle` inside the `Assets/Plugins/Android`.
![](https://files.readme.io/711eca6-8925eda-Screen_Shot_2020-05-05_at_1.49.57_PM.png "8925eda-Screen_Shot_2020-05-05_at_1.49.57_PM.png")

Modify the `mainTemplate.gradle` to include the following at the end of the dependencies block:

```groovy 
dependencies {
    ...
    
    // ** ADD THIS **
    configurations.all {
        exclude group: 'com.android.billingclient', module: 'billing'
    }
}
```

Perform a clean up of the resolved dependencies using the `Assets/External Dependency Manager/Android Resolver/Delete Resolved Libraries` menu. This will cleanup the previously downloaded .aars in `Assets/Plugins/Android`. Otherwise you could end up with duplicated classes errors. 

Also make sure to perform a resolve, so External Dependency Manager adds the right dependencies to the generated `build.gradle`.

[block:callout]
{
  "type": "danger",
  "body": "The above instructions instructions will also apply if using other plugin that includes the Android InAppBillingService class, or for some other reason you get an error regarding duplicated classes."
}
[/block]

## Troubleshooting "ClassNotFoundException" errors at Runtime in Android

When exporting your project to Android, in the Build Settings window, make sure you uncheck the `Symlink Sources` checkbox. That will make it so Unity actually uses the correct source files for our SDK.

![](https://files.readme.io/98a2d95-unity-symlink-sources-unchecked.jpg "unity-symlink-sources-unchecked.jpg")

## Installing old versions of the plugin

### Purchases Unity 4.2.0+
![RevenueCat's Purchases Unity SDK 4.2.0+](https://img.shields.io/badge/Purchases%20Unity-4.2.0%2B-%23f25a5a?style=flat-square)

**side by side with Unity IAP 4.4.0 < 4.8.0**

Download `Purchases-UnityIAP.unityPackage` and install as normal. Skip the rest of the instructions in this page.

### Purchases Unity 4.0.0 and 4.1.0
![RevenueCat's Purchases Unity SDK 4.1.0+](https://img.shields.io/badge/Purchases%20Unity-4.1.0%2B-%23f25a5a?style=flat-square)

**side by side with Unity IAP 3.3.0 < 4.4.0**

Download `Purchases-UnityIAP.unityPackage` and install as normal. Skip the rest of the instructions in this page. 

# Next Steps

* Now that you've installed the Purchases SDK in your Unity app, get started [building with Purchases :fa-arrow-right:](https://www.revenuecat.com/docs/getting-started#4-using-revenuecats-purchases-sdk)

---
title: Ionic
slug: ionic
excerpt: Instructions for Installing Purchases SDK for Ionic
hidden: false
metadata:
  title: Install Ionic SDK – RevenueCat
  description: The RevenueCat Purchases SDK handles the pain points of in-app purchases
    and subscriptions for Ionic, so you can get back to building your app.
  image:
    0: https://files.readme.io/8d46db6-RevenueCat_Docs_OG.png
    1: RevenueCat Docs OG.png
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: '2020-04-07T20:32:01.037Z'
category: 648c78a1dbb1aa005e52ed52
order: 5
parentDoc: 648c7f084ca0960014e5d032
---
Please refer to our [documentation](https://ionicframework.com/docs/native/purchases) in Ionic Native Plugin documentation for installation instructions.
```text Cordova
// Install Cordova plugin
ionic cordova plugin add cordova-plugin-purchases

// Install TypeScript wrapper
npm install @awesome-cordova-plugins/purchases

// Install Ionic Native core library (once per project)
npm install @awesome-cordova-plugins/core
```
```text Capacitor
// Install Cordova plugin
npm install cordova-plugin-purchases

// Install Ionic Native core library (once per project)
npm install @awesome-cordova-plugins/core --save

// Install TypeScript wrapper
npm install @awesome-cordova-plugins/purchases

// Update native platform project(s) to include newly added plugin
ionic cap sync
```


[block:callout]
{
  "type": "warning",
  "body": "If you run into issues when running on Android, try going to Android Studio -> File -> Sync project with Gradle files.",
  "title": "Note:"
}
[/block]

[block:api-header]
{
  "title": "Angular"
}
[/block]
Angular apps can use either Cordova or Capacitor to build native mobile apps. For Angular, the import path should end with `/ngx`.
```typescript 
import { Platform } from "@ionic/angular";
import { Purchases } from "@awesome-cordova-plugins/purchases/ngx";

constructor(public platform: Platform, private purchases: Purchases) {
    platform.ready().then(() => {
        this.purchases.setDebugLogsEnabled(true); // Enable to get debug logs
        this.purchases.configureWith({
            apiKey: "my_api_key",
            appUserID: "my_app_user_id"
        });
    }
}
```


[block:api-header]
{
  "title": "React"
}
[/block]
Import the plugin object then use its static methods:
```typescript 
import { Purchases } from '@awesome-cordova-plugins/purchases';

const Tab1: React.FC = () => {
  Purchases.setDebugLogsEnabled(true);
  Purchases.purchases.configureWith({
    apiKey: "my_api_key",
    appUserID: "my_app_user_id"
  });
  return (
    <IonPage>
      <IonHeader>
        <IonToolbar>
          <IonTitle>Tab 1</IonTitle>
        </IonToolbar>
      </IonHeader>
      <IonContent>
        <IonButton onClick={openScanner}>Scan barcode</IonButton>
      </IonContent>
    </IonPage>
  );
};
```

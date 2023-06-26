---
title: Ionic
slug: ionic
excerpt: Instructions for Installing Purchases SDK for Ionic
hidden: false
categorySlug: getting-started
order: 5
parentDoc: 6499848d103e5f0042e480fb
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

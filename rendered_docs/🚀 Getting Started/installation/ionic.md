---
title: Ionic
slug: ionic
excerpt: Instructions for Installing Purchases SDK for Ionic
hidden: false
categorySlug: documentation
order: 5
parentDoc: 649983b4c31b2e000a3c1864
---

We currently only offer an official Cordova plugin. Install the plugin depending on your framework: 

```text Cordova
npm install cordova-plugin-purchases

ionic cordova plugin add cordova-plugin-purchases
```
```text Capacitor
// Install Cordova plugin
npm install cordova-plugin-purchases

// Update native platform project(s) to include newly added plugin
ionic cap sync
```

## TypeScript

The types are shipped inside the npm package. You can import them like this:

```typescript TypeScript types
import Purchases, {
    PurchasesOfferings, // Types for TypeScript
} from 'cordova-plugin-purchases/www/plugin';
```

## Angular

Wait for the Platform to be ready, then configure the plugin in your `src/app/app.component.ts`:

```typescript 
import { Platform } from "@ionic/angular";
// TS typings for the plugin
import Purchases, { LOG_LEVEL } from 'cordova-plugin-purchases/www/plugin';

constructor(platform: Platform) {
    platform.ready().then(() => {
        Purchases.setLogLevel(LOG_LEVEL.DEBUG); // Enable to get debug logs
        Purchases.configureWith({
            apiKey: "my_api_key",
            appUserID: "my_app_user_id"
        });
    });
}
```

## React

Import the plugin object then use its static methods:

```typescript 
import Purchases, { LOG_LEVEL } from 'cordova-plugin-purchases/www/plugin';

const Tab1: React.FC = () => {
  Purchases.setLogLevel(LOG_LEVEL.DEBUG); // Enable to get debug logs
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

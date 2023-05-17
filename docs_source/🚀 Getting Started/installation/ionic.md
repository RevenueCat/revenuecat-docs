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
updatedAt: '2023-02-02T14:19:47.927Z'
category: 6465151171aace1d6f6388e2
---
Please refer to our [documentation](https://ionicframework.com/docs/native/purchases) in Ionic Native Plugin documentation for installation instructions.
[block:code]
{
  "codes": [
    {
      "code": "// Install Cordova plugin\nionic cordova plugin add cordova-plugin-purchases\n\n// Install TypeScript wrapper\nnpm install @awesome-cordova-plugins/purchases\n\n// Install Ionic Native core library (once per project)\nnpm install @awesome-cordova-plugins/core",
      "language": "text",
      "name": "Cordova"
    },
    {
      "code": "// Install Cordova plugin\nnpm install cordova-plugin-purchases\n\n// Install Ionic Native core library (once per project)\nnpm install @awesome-cordova-plugins/core --save\n\n// Install TypeScript wrapper\nnpm install @awesome-cordova-plugins/purchases\n\n// Update native platform project(s) to include newly added plugin\nionic cap sync",
      "language": "text",
      "name": "Capacitor"
    }
  ]
}
[/block]

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
[block:code]
{
  "codes": [
    {
      "code": "import { Platform } from \"@ionic/angular\";\nimport { Purchases } from \"@awesome-cordova-plugins/purchases/ngx\";\n\nconstructor(public platform: Platform, private purchases: Purchases) {\n    platform.ready().then(() => {\n        this.purchases.setDebugLogsEnabled(true); // Enable to get debug logs\n        this.purchases.configureWith({\n            apiKey: \"my_api_key\",\n            appUserID: \"my_app_user_id\"\n        });\n    }\n}",
      "language": "typescript"
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "React"
}
[/block]
Import the plugin object then use its static methods:
[block:code]
{
  "codes": [
    {
      "code": "import { Purchases } from '@awesome-cordova-plugins/purchases';\n\nconst Tab1: React.FC = () => {\n  Purchases.setDebugLogsEnabled(true);\n  Purchases.purchases.configureWith({\n    apiKey: \"my_api_key\",\n    appUserID: \"my_app_user_id\"\n  });\n  return (\n    <IonPage>\n      <IonHeader>\n        <IonToolbar>\n          <IonTitle>Tab 1</IonTitle>\n        </IonToolbar>\n      </IonHeader>\n      <IonContent>\n        <IonButton onClick={openScanner}>Scan barcode</IonButton>\n      </IonContent>\n    </IonPage>\n  );\n};",
      "language": "typescript"
    }
  ]
}
[/block]
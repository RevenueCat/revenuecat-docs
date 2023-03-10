---
title: "Ionic"
slug: "ionic"
excerpt: "Instructions for Installing Purchases SDK for Ionic"
hidden: false
metadata: 
  title: "In-App Purchase Installation for Ionic – RevenueCat"
  description: "The RevenueCat Purchases SDK handles the pain points of in-app purchases and subscriptions for Ionic, so you can get back to building your app."
  image: 
    0: "https://files.readme.io/60008e8-60993e3c40039b67596bcc8c_slack-preview.png"
    1: "60993e3c40039b67596bcc8c_slack-preview.png"
    2: 1200
    3: 627
    4: "#f45476"
createdAt: "2020-04-07T20:32:01.037Z"
updatedAt: "2020-05-20T18:20:37.111Z"
---
Please refer to our [documentation](https://ionicframework.com/docs/native/purchases) in Ionic Native Plugin documentation for installation instructions.
[block:code]
{
  "codes": [
    {
      "code": "// Install Cordova plugin\nionic cordova plugin add cordova-plugin-purchases\n\n// Install TypeScript wrapper\nnpm install @ionic-native/purchases\n\n// Install Ionic Native core library (once per project)\nnpm install @ionic-native/core\n\n\n\n",
      "language": "text",
      "name": "Cordova"
    },
    {
      "code": "// Install Cordova plugin\nnpm install cordova-plugin-purchases\n\n// Install Ionic Native core library (once per project)\nnpm install @ionic-native/core\n\n// Install TypeScript wrapper\nnpm install @ionic-native/purchases\n\n// Update native platform project(s) to include newly added plugin\nionic cap sync",
      "language": "text",
      "name": "Capacitor"
    }
  ]
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
      "code": " import { Platform } from \"@ionic/angular\";\n import { Purchases } from \"@ionic-native/purchases/ngx\";\n\n constructor(public platform: Platform, private purchases: Purchases) {\n     platform.ready().then(() => {\n         this.purchases.setDebugLogsEnabled(true); // Enable to get debug logs\n         this.purchases.setup(\"my_api_key\", \"my_app_user_id\");\n     }\n }",
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
      "code": "import { Purchases } from '@ionic-native/purchases';\n\nconst Tab1: React.FC = () => {\n  Purchases.setDebugLogsEnabled(true);\n  Purchases.setup(\"my_api_key\", \"my_app_user_id\");\n  return (\n    <IonPage>\n      <IonHeader>\n        <IonToolbar>\n          <IonTitle>Tab 1</IonTitle>\n        </IonToolbar>\n      </IonHeader>\n      <IonContent>\n        <IonButton onClick={openScanner}>Scan barcode</IonButton>\n      </IonContent>\n    </IonPage>\n  );\n};",
      "language": "typescript"
    }
  ]
}
[/block]
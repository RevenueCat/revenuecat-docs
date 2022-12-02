---
title: "Firebase Apps"
slug: "firebase"
excerpt: "Integrate your Firebase app with RevenueCat"
hidden: false
metadata: 
  title: "Firebase in-app purchases | RevenueCat"
  description: "RevenueCat handles the pain points of in-app purchases and subscriptions, so you can get back to building your app. Have in-app purchases working in hours, not months."
  image: 
    0: "https://files.readme.io/a8700be-Reddit__E.jpg"
    1: "Reddit – E.jpg"
    2: 1200
    3: 630
    4: "#fbabaf"
createdAt: {}
updatedAt: "2020-07-22T16:22:39.158Z"
---
###What is RevenueCat?

RevenueCat is a scalable backend for in-app subscriptions and purchases. With RevenueCat, you can build and manage your mobile app business without having to set up or maintain any purchase infrastructure. Here you can read more about [how RevenueCat fits into your app](https://www.revenuecat.com/blog/where-does-revenuecat-fit-in-your-app).
[block:callout]
{
  "type": "success",
  "body": "This section assumes you've followed our [Quickstart](doc:getting-started-1) section of our Getting Started guide to install and configure our SDK into your app that's using Firebase."
}
[/block]
Firebase is a popular backend-as-a-service by Google for building mobile apps.
[block:api-header]
{
  "title": "Keeping User IDs In Sync"
}
[/block]
Firebase has a well documented authentication mechanism that works with Email/Password, Github, Google Sign-In, anonymous authentication and more. 

It's simple to keep your user IDs from Firebase in sync with the RevenueCat backend by listening to authentication state change notifications posted by Firebase.

Below are practical examples of setting this up in your application:

## iOS
[block:code]
{
  "codes": [
    {
      "code": "import Firebase\nimport Purchases\n\nfunc application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {\n    \n    // Configure Purchases before Firebase\n    Purchases.configure(withAPIKey: \"public_sdk_key\")\n    Purchases.shared.delegate = self\n    \n    // Configure Firebase\n    FirebaseApp.configure()\n    \n    // Add state change listener for Firebase Authentication\n    Auth.auth().addStateDidChangeListener { (auth, user) in\n    \n    \t\t\n        if let uid = user?.uid {\n            \n            // identify Purchases with new Firebase user\n            Purchases.shared.identify(uid, { (info, error) in\n                if let e = error {\n                    print(\"Sign in error: \\(e.localizedDescription)\")\n                } else {\n                    print(\"User \\(uid) signed in\")\n                }\n            })\n        }\n    }\n    \n    return true\n}\n\n// MARK: - Purchases delegate (optional)\nfunc purchases(_ purchases: Purchases, didReceiveUpdated purchaserInfo: PurchaserInfo) {\n\n    // You can optionally post to the notification center whenever \n    // purchaser info changes.\n    \n    // You can subscribe to this notification throughout your app \n    // to refresh tableViews or change the UI based on the user's \n    // subscription status\n    \n    NotificationCenter.default.post(name: Notification.Name(rawValue: \"com.RevenueCat.purchaserInfoUpdatedNotification\"), object: nil)\n}",
      "language": "swift"
    }
  ]
}
[/block]
## Android
[block:code]
{
  "codes": [
    {
      "code": "class MainApplication: Application() {\n\n    private lateinit var auth: FirebaseAuth\n      \n    override fun onCreate() {\n        super.onCreate()\n          \n        // Configure Purchases\n        Purchases.configure(this, \"public_sdk_key\")\n    }\n}\n  \nclass MainActivity: Activity() {\n    public override fun onCreate() {\n\n        // Initialize Firebase Auth\n        firebaseAuth = FirebaseAuth.getInstance()  \n    }\n\n    public override fun onStart() {\n        super.onStart()\n        \n        val authStateListener = FirebaseAuth.AuthStateListener { auth ->\n        \n            val user = auth.currentUser\n\n            if(user != null) {\n\n                // identify Purchases with new Firebase user\n                Purchases.sharedInstance.identifyWith(user.uid, \n                { error ->\n                    Log.d(TAG, \"Sign in error.\")\n                },\n                { purchaserInfo ->\n                    Log.d(TAG, \"User signed in.\")\n                })\n                    \n            }\n        }\n    \n        firebaseAuth.addAuthStateListener(authStateListener)\n    }\n}\n\n\n\n// Purchases Change Listener (Optional)\nclass UpsellActivity : AppCompatActivity(), UpdatedPurchaserInfoListener {\n\t\toverride fun onReceived(purchaserInfo: PurchaserInfo?) {\n        \n    // You can optionally react to any changes in purchaser info\n    // such as updating the UI throughout your app\n    }\n}",
      "language": "kotlin"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "Always test authentication in your own app and make sure everything is working as expected. Since every app is different, the above helpers can get you started but may need to be modified to work with the authentication flow specific to your app."
}
[/block]

[block:api-header]
{
  "title": "Handling Events With Cloud Functions"
}
[/block]
Firebase Cloud Functions are a great way to run server-side code without having to manage your own server. This makes them excellent for things like catching webhooks.

Below is an example that uses a combination of HTTP triggers and Pub/Sub triggers to handle webhook events from RevenueCat.

The URL of the `incomingWebhook` function should be pasted into the RevenueCat dashboard along with a secret auth key that the function will use to verify it is actually RevenueCat that's sending the event.

## Setup
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/34b99de-Screen_Shot_2019-03-08_at_5.49.26_PM.png",
        "Screen Shot 2019-03-08 at 5.49.26 PM.png",
        885,
        416,
        "#f3f5f6"
      ]
    }
  ]
}
[/block]
## Function Code
[block:code]
{
  "codes": [
    {
      "code": "\nconst functions = require('firebase-functions');\nconst {PubSub} = require('@google-cloud/pubsub');\n\n// Your Firebase project ID\nconst projectId = '<YOUR_FIREBASE_PROJECT_ID>';\n\n// Instantiates a client\nconst pubsubClient = new PubSub({\n  projectId: projectId,\n});\n\n\nfunction isAuthorized(req) {\n  // Check authorization header\n  if (!req.headers.authorization || !req.headers.authorization.startsWith('Bearer ')) {\n    return false;\n  }\n  const authToken = req.headers.authorization.split('Bearer ')[1];\n  if (authToken !== '<YOUR_REVENUECAT_WEBHOOK_AUTH_TOKEN>') {\n    return false;\n  }\n\n  return true;\n}\n\n\n// Respond to incoming message\nexports.incomingWebhook = functions.https.onRequest((req, res) => {\n  \n  // Only allow POST requests\n  if (req.method !== 'POST') {\n    return res.status(403).send('Forbidden');\n  }\n\n  // Make sure the authorization key matches what we\n  // set in the RevenueCat dashboard\n  if (!isAuthorized(req)) {\n    return res.status(401).send('Unauthorized'); \n  }\n\n  const event = req.body.event;\n  \n  var topic = '';\n\n\n  // Check for the event types that you want to respond to\n  // You may only need a subset of these events \n  switch(event.type) {\n    case 'INITIAL_PURCHASE':\n      topic = 'rc-initial-purchase';\n      break;\n    case 'NON_RENEWING_PURCHASE':\n      topic = 'rc-non-renewing-purchase';\n      break;\n    case 'RENEWAL':\n      topic = 'rc-renewal';\n      break;\n    case 'PRODUCT_CHANGE':\n      topic = 'rc-product-change';\n      break;\n    case 'CANCELLATION':\n      topic = 'rc-cancellation';\n      break;\n    case 'BILLING_ISSUE':\n      topic = 'rc-billing-issue';\n      break;\n    case 'SUBSCRIBER_ALIAS':\n      topic = 'rc-subscriber-alias';\n      break;\n    default:\n      console.log('Unhandled event type: ', event.type);\n      return res.sendStatus(200);\n  }\n\n  // Set the pub/sub data to the event body\n  const dataBuffer = Buffer.from(JSON.stringify(event));\n\n  // Publishes a message\n  return pubsubClient.topic(topic)\n    .publish(dataBuffer)\n    .then(() => res.sendStatus(200))\n    .catch(err => {\n      console.error(err);\n      res.sendStatus(500);\n      return Promise.reject(err);\n   });\n});\n\nexports.handleInitialPurchase = functions.pubsub.topic('rc-initial-purchase').onPublish((message, context) => {\n  \n  // Handle initial purchases of subscription products\n  console.log('INITIAL_PURCHASE: ', message.json);\n  return null;\n});\n\nexports.handleInitialPurchase = functions.pubsub.topic('rc-non-renewing-purchase').onPublish((message, context) => {\n  \n  // Handle a non-subscription purchase\n  console.log('NON_RENEWING_PURCHASE: ', message.json);\n  return null;\n});\n\nexports.handleRenewal = functions.pubsub.topic('rc-renewal').onPublish((message, context) => {\n  \n  // Handle subscription renewal\n  console.log('RENEWAL: ', message.json);\n  return null;\n});\n\nexports.handleProductChange = functions.pubsub.topic('rc-product-change').onPublish((message, context) => {\n  \n  // Handle subscription product change\n  console.log('PRODUCT_CHANGE: ', message.json);\n  return null;\n});\n\nexports.handleCancellation = functions.pubsub.topic('rc-cancellation').onPublish((message, context) => {\n  \n  // Handle subscription cancellations. Note that\n  // a subscription may still be active depending\n  // on the cancellation type and you shouldn't\n  // automatically cut off access.\n  console.log('CANCELLATION: ', message.json);\n  return null;\n});\n\nexports.handleBillingIssue = functions.pubsub.topic('rc-billing-issue').onPublish((message, context) => {\n  \n  // Handle billing issues with subscription renewals\n  console.log('BILLING_ISSUE: ', message.json);\n  return null;\n});\n\nexports.handleSubscriberAlias = functions.pubsub.topic('rc-subscriber-alias').onPublish((message, context) => {\n  \n  // Handle subscriber alias events\n  console.log('SUBSCRIBER_ALIAS: ', message.json);\n  return null;\n});\n\n\n",
      "language": "javascript",
      "name": "index.js"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "title": "Write idempotent functions",
  "body": "Firebase PubSub functions should be idempotent, that is, they should produce the same result even if they are called multiple times. See Firebase guides for more information"
}
[/block]
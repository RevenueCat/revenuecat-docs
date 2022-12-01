---
title: "Apple Server-to-Server Notifications"
slug: "apple-server-notifications"
excerpt: "Sending App Store server notifications to RevenueCat"
hidden: false
metadata: 
  title: "Apple server-to-server notifications – RevenueCat"
  description: "RevenueCat does not require server notifications from the App Store, however doing so can speed up webhook and integration delivery times and reduce lag time for Charts."
  image: 
    0: "https://files.readme.io/3392da5-OG_image.png"
    1: "OG image.png"
    2: 1200
    3: 627
    4: "#e9acb0"
createdAt: "2020-09-29T15:21:09.333Z"
updatedAt: "2021-11-03T14:19:50.387Z"
---
RevenueCat does not require server notifications from the App Store, however doing so can speed up webhook and integration delivery times and reduce lag time for [Charts](doc:charts).

# Setup Instructions

[Apple server-to-server notifications](https://developer.apple.com/documentation/storekit/in-app_purchase/enabling_server-to-server_notifications) should be set up in App Store Connect with the URL provided in the RevenueCat dashboard.

1. Navigate to your **app settings** in the RevenueCat dashboard.
2. Scroll to the **App Store configuration** section, and copy the entire URL provided under **Apple Server Notification URL**.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/fcd7738-fad91b4-Screen_Shot_2019-09-12_at_5.33.03_PM.png",
        "fad91b4-Screen_Shot_2019-09-12_at_5.33.03_PM.png",
        679,
        124,
        "#eaeceb"
      ],
      "sizing": "80"
    }
  ]
}
[/block]
3. Log in to **[App Store Connect](https://appstoreconnect.apple.com/)** and select your app.
4. Under the **App Information > App Store Server Notifications** section, paste the entire URL from RevenueCat in both the **Production Server URL** field and the **Sandbox Server URL** field. You can use either *Version 1* or *Version 2* notifications.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/f870a23-Screen_Shot_2021-11-03_at_10.03.27_AM.png",
        "Screen Shot 2021-11-03 at 10.03.27 AM.png",
        1252,
        940,
        "#eeeeee"
      ],
      "sizing": "80",
      "border": true
    }
  ]
}
[/block]
# Considerations
[block:callout]
{
  "type": "info",
  "title": "Only one server notification URL supported",
  "body": "Apple supports separate URLs for production as well as sandbox purchases, but only allows one of each. You should enter the RevenueCat URL for both of these fields if you don't want to receive these notifications on your own server.\n\nIf you want to first receive these notifications on your own server for one or both environments, see our guide on [forwarding the notifications to RevenueCat](doc:apple-server-notifications#forwarding-apple-notifications-to-revenuecat) below."
}
[/block]

[block:callout]
{
  "type": "success",
  "title": "Apple S2S notifications update subscriptions for existing users",
  "body": "If RevenueCat receives a notification for a user that doesn't have any purchases in RevenueCat, a 200 code will be sent and the request will be ignored, so the last received notification timestamp won't be updated. Keep this in mind when forwarding events yourself."
}
[/block]
# Forwarding Apple notifications to RevenueCat

Apple only supports a single server notification URL. If you're already using the notifications on your server, you can still forward the payload to the **Apple Server Notification URL** provided in the app settings of your RevenueCat dashboard. 

Here's how we recommend doing this:

## 1. Configure your server to receive Apple notifications

First, make sure your server meets the criteria outlined in Apple's [Enabling App Store Notifications](https://developer.apple.com/documentation/storekit/in-app_purchase/subscriptions_and_offers/enabling_app_store_server_notifications) page or you won't receive notifications.

Then, in your app settings on App Store Connect, enter a subscription status URL that links to your server (see step 4 of the [Setup Instructions](doc:apple-server-notifications#setup-instructions) above).

## 2. Receive Apple notifications on your server

Apple sends notifications as JSON data via an HTTP POST request to the URL you provided on App Store Connect. 

Wherever you handle this POST request in your code, be sure to respond to Apple with a status code. Responding with a 4xx or 5xx status code will permit Apple to retry the post a few more times.

## 3. Forward Apple notifications to RevenueCat

As soon as your server successfully receives a notification, send the payload to RevenueCat. To do this, make an HTTP POST request to the **Apple Server Notification URL** provided in the app settings of your RevenueCat dashboard. 

The payload should be passed along **as-is** in the data value of your request. Any manipulation you want to do with the data should happen after forwarding to RevenueCat.

Here's a basic example of these steps using Node, Express, and Axios:
[block:code]
{
  "codes": [
    {
      "code": "app.post('/subscription-update', (req, res) => {\n  // - Let Apple know we received the notification\n  res.status(200).json();\n\n  // - Forward the request body as-is to RevenueCat\n  axios.post(process.env.REVENUECAT_URL, req.body)\n  .then(response => {\n    // - Successfully forwarded to RevenueCat\n    console.log(\"Successfully forwarded to RevenueCat\", response);\n  })\n  .catch(error => {\n    // - Consider a retry to RevenueCat if there's a network error or status code is 5xx\n    // - This is optional as RevenueCat should recheck the receipt within a few hours\n    console.error(\"Failed to send notification to RevenueCat\", error);\n  });\n\n  // - Anything else you want to do with the request can go here\n});",
      "language": "javascript"
    }
  ]
}
[/block]
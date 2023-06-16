---
title: Debugging
slug: debugging
excerpt: View and understand Purchases logs
hidden: false
metadata:
  title: Debugging – RevenueCat
  description: Purchases will log important information and errors to help you understand
    what is going on behind the scenes. You can enable more detailed debug logs with
    the `debugLogsEnabled` flag. You can set this immediately in your app while testing,
    before you configure Purchases.
  image:
    0: https://files.readme.io/126dacb-RevenueCat_Docs_OG.png
    1: RevenueCat Docs OG.png
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: '2023-05-01T23:06:34.463Z'
---
> 👍 
> 
> This section assumes you've followed our [Quickstart](doc:getting-started-1) section of our Getting Started guide to install and configure our SDK.

RevenueCat's SDK will log important information and errors to help you understand what is going on behind the scenes. You can enable more detailed debug logs with the `debugLogsEnabled` flag. You can set this immediately in your app while testing, **before you configure Purchases**.

[block:file]
{"language":"swift","name":"","file":"code_blocks/🧰 Test - Launch/debugging_1.swift"}
[/block]
[block:file]
{"language":"objectivec","name":"","file":"code_blocks/🧰 Test - Launch/debugging_2.m"}
[/block]
[block:file]
{"language":"kotlin","name":"","file":"code_blocks/🧰 Test - Launch/debugging_3.kt"}
[/block]
[block:file]
{"language":"java","name":"","file":"code_blocks/🧰 Test - Launch/debugging_4.java"}
[/block]
[block:file]
{"language":"javascript","name":"React Native","file":"code_blocks/🧰 Test - Launch/debugging_5.js"}
[/block]
[block:file]
{"language":"javascript","name":"Flutter","file":"code_blocks/🧰 Test - Launch/debugging_6.js"}
[/block]
[block:file]
{"language":"javascript","name":"Unity","file":"code_blocks/🧰 Test - Launch/debugging_7.js"}
[/block]
[block:file]
{"language":"javascript","name":"Cordova","file":"code_blocks/🧰 Test - Launch/debugging_8.js"}
[/block]

> 📘 OS_ACTIVITY_MODE and Common iOS Issues
> 
> On iOS, disabling `OS_ACTIVITY_MODE` in your Xcode scheme will block debug logs from printing in the console. If you have debug logs enabled, but don't see any output, go to `Product -> Scheme -> Edit Scheme...` in Xcode and uncheck the `OS_ACTIVITY_MODE` environment variable.
> 
> Flutter projects using Swift may fail to show debug logs in the console if you are using Visual Studio Code, Android Studio, or other IDE's to run your project. We recommend running your Flutter project using Xcode to view debug logs from the Purchases SDK.

# Debug UI

RevenueCat's iOS 4.22.0+ SDK provides an overlay for your iOS app that displays relevant details of the SDK configuration. The debug overlay includes each of your configured Offerings, with the option to purchase any of the products and validate access to entitlements.

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/03f4de1-simulator_screenshot_0e51e44b-dd33-41f6-9c26-ca3bed754b34.png",
        null,
        "RevenueCat iOS Debug UI"
      ],
      "align": "center",
      "sizing": "240px",
      "border": true
    }
  ]
}
[/block]

[block:file]
{"language":"swift","name":"SwiftUI","file":"code_blocks/🧰 Test - Launch/debugging_9.swift"}
[/block]
[block:file]
{"language":"swift","name":"UIKit","file":"code_blocks/🧰 Test - Launch/debugging_10.swift"}
[/block]

You can export your configuration details in JSON format to share with RevenueCat support if you need to open a support ticket.

Note: The debug UI won't compile for release builds, so you'll need to disable the behavior before archiving for release.

## Reference

| Debug Section | Details                                                                                                                                                                                        |
| :------------ | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Diagnostics   | The status of your configuration based on access to the RevenueCat API with your API key                                                                                                       |
| Configuration | SDK configuration based on your `configure` parameters                                                                                                                                         |
| Customer Info | The configured users’ IDs as well as entitlement details                                                                                                                                       |
| Offerings     | Each of your configured Offerings, packages, and products. Only includes Offerings with products accessible via StoreKit. See our guide on Empty Offerings if your Offerings aren’t populating |

# Debug Logs

All logs from the SDK are prepended with "`[Purchases]`", you can use this string as a filter in your log output to clearly see the logs that are from _Purchases_.

## Reference

Emojis currently available on the following platforms:

- Android version >= 4.0.2
- iOS version >= 3.10.1

[block:parameters]
{
  "data": {
    "h-0": "Icon(s)",
    "h-1": "Log Level",
    "h-2": "Description",
    "h-3": "Required Actions",
    "0-0": "🍎 ‼️",
    "0-1": "Error  \nWarn",
    "0-2": "Error/warning messages generated from Apple",
    "0-3": "View [error handling doc](doc:errors) if on Error level",
    "1-0": "🤖 ‼️",
    "1-1": "Error  \nWarn",
    "1-2": "Error/warning messages generated from Google",
    "1-3": "View [error handling doc](doc:errors) if on Error level",
    "2-0": "📦 ‼️",
    "2-1": "Error  \nWarn",
    "2-2": "Error/warning messages generated from Amazon",
    "2-3": "View [error handling doc](doc:errors) if on Error level",
    "3-0": "😿 ‼️",
    "3-1": "Error",
    "3-2": "Error messages generated from RevenueCat",
    "3-3": "View [error handling doc](doc:errors)",
    "4-0": "😻",
    "4-1": "Debug",
    "4-2": "Success messages generated from RevenueCat",
    "4-3": "No action required, for informational purposes.",
    "5-0": "😻💰",
    "5-1": "Info",
    "5-2": "RevenueCat received purchase information",
    "5-3": "No action required, for informational purposes.",
    "6-0": "💰",
    "6-1": "Debug",
    "6-2": "Messages related to your products",
    "6-3": "No action required, for informational purposes.",
    "7-0": "ℹ️",
    "7-1": "Debug  \nInfo",
    "7-2": "Messages detailing events that occur in your app cycle",
    "7-3": "No action required, for informational purposes.",
    "8-0": "👤",
    "8-1": "Debug",
    "8-2": "Messages related to a user's App User ID",
    "8-3": "No action required, for informational purposes.",
    "9-0": "⚠️",
    "9-1": "Warn",
    "9-2": "Warning messages about implementation",
    "9-3": "View log message for additional information."
  },
  "cols": 4,
  "rows": 10,
  "align": [
    "left",
    "left",
    "left",
    "left"
  ]
}
[/block]

Messages that have the double red exclamation marks prefix (‼️) attached provides important information regarding your implementation and may require your attention. Paying attention to the source of the message will assist you during the development process. Be sure to address these logs before shipping your app. 

## Sample Output

Below are sample logs generated when setting `debugLogsEnabled = true`. Keep an eye out for any `ERROR` level logs, status codes other than `200`, or any `Invalid Product Identifiers`.

[block:file]
{"language":"text","name":"","file":"code_blocks/🧰 Test - Launch/debugging_11.txt"}
[/block]
[block:file]
{"language":"text","name":"With emojis","file":"code_blocks/🧰 Test - Launch/debugging_12.txt"}
[/block]

# Next Steps

- If you spotted any errors while debugging, make sure you're [handling errors correctly ](doc:errors)
- You've verified that _Purchases_ is running correctly, time to start [making purchases in sandbox ](doc:sandbox)
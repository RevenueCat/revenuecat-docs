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
updatedAt: '2023-05-01T23:06:34.463Z'
category: 64515c3aa16590000a27cd9d
---
[block:callout]
{
  "type": "success",
  "body": "This section assumes you've followed our [Quickstart](doc:getting-started-1) section of our Getting Started guide to install and configure our SDK."
}
[/block]
# Debugging

RevenueCat's SDK will log important information and errors to help you understand what is going on behind the scenes. You can enable more detailed debug logs with the `debugLogsEnabled` flag. You can set this immediately in your app while testing, **before you configure Purchases**.
[block:file]
swift->code_blocks/🧰 Test - Launch/debugging_1.swift
objectivec->code_blocks/🧰 Test - Launch/debugging_1.m
kotlin->code_blocks/🧰 Test - Launch/debugging_1.kt
java->code_blocks/🧰 Test - Launch/debugging_1.java
javascript->code_blocks/🧰 Test - Launch/debugging_1.js
[/block]

[block:callout]
{
  "type": "info",
  "title": "OS_ACTIVITY_MODE and Common iOS Issues",
  "body": "On iOS, disabling `OS_ACTIVITY_MODE` in your Xcode scheme will block debug logs from printing in the console. If you have debug logs enabled, but don't see any output, go to `Product -> Scheme -> Edit Scheme...` in Xcode and uncheck the `OS_ACTIVITY_MODE` environment variable.\n\nFlutter projects using Swift may fail to show debug logs in the console if you are using Visual Studio Code, Android Studio, or other IDE's to run your project. We recommend running your Flutter project using Xcode to view debug logs from the Purchases SDK."
}
[/block]

## Filtering *Purchases* Logs
All logs from the SDK are prepended with "`[Purchases]`", you can use this string as a filter in your log output to clearly see the logs that are from *Purchases*.

## Debug Logs Legend
Emojis currently available on the following platforms:
* Android version >= 4.0.2
* iOS version >= 3.10.1
[block:parameters]
{
  "data": {
    "h-0": "Icon(s)",
    "h-1": "Log Level",
    "h-2": "Description",
    "0-0": "🍎 ‼️",
    "0-1": "Error\nWarn",
    "0-2": "Error/warning messages generated from Apple",
    "1-0": "🤖 ‼️",
    "1-1": "Error\nWarn",
    "1-2": "Error/warning messages generated from Google",
    "3-0": "😿 ‼️",
    "3-1": "Error",
    "3-2": "Error messages generated from RevenueCat",
    "4-0": "😻",
    "4-1": "Debug",
    "4-2": "Success messages generated from RevenueCat",
    "5-0": "😻💰",
    "5-1": "Info",
    "5-2": "RevenueCat received purchase information",
    "6-0": "💰",
    "6-1": "Debug",
    "6-2": "Messages related to your products",
    "7-0": "ℹ️",
    "7-1": "Debug\nInfo",
    "7-2": "Messages detailing events that occur in your app cycle",
    "8-0": "👤",
    "8-1": "Debug",
    "8-2": "Messages related to a user's App User ID",
    "9-0": "⚠️",
    "9-1": "Warn",
    "9-2": "Warning messages about implementation",
    "h-3": "Required Actions",
    "0-3": "View [error handling doc](doc:errors) if on Error level",
    "1-3": "View [error handling doc](doc:errors) if on Error level",
    "3-3": "View [error handling doc](doc:errors)",
    "4-3": "No action required, for informational purposes.",
    "5-3": "No action required, for informational purposes.",
    "6-3": "No action required, for informational purposes.",
    "7-3": "No action required, for informational purposes.",
    "8-3": "No action required, for informational purposes.",
    "9-3": "View log message for additional information.",
    "2-1": "Error\nWarn",
    "2-2": "Error/warning messages generated from Amazon",
    "2-3": "View [error handling doc](doc:errors) if on Error level",
    "2-0": "📦 ‼️"
  },
  "cols": 4,
  "rows": 10
}
[/block]
Messages that have the double red exclamation marks prefix (‼️) attached provides important information regarding your implementation and may require your attention. Paying attention to the source of the message will assist you during the development process. Be sure to address these logs before shipping your app. 

# Sample Output

Below are sample logs generated when setting `debugLogsEnabled = true`. Keep an eye out for any `ERROR` level logs, status codes other than `200`, or any `Invalid Product Identifiers`.
[block:file]
text->code_blocks/🧰 Test - Launch/debugging_2.txt
[/block]
# Next Steps

* If you spotted any errors while debugging, make sure you're [handling errors correctly :fa-arrow-right:](doc:errors)
* You've verified that *Purchases* is running correctly, time to start [making purchases in sandbox :fa-arrow-right:](doc:sandbox)
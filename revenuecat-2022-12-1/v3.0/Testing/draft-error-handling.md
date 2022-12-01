---
title: "[DRAFT] Error Handling"
slug: "draft-error-handling"
excerpt: "Handling errors in Purchases SDK"
hidden: true
createdAt: "2020-09-10T22:13:34.697Z"
updatedAt: "2020-09-11T22:52:41.347Z"
---
[block:callout]
{
  "type": "success",
  "body": "This section assumes you've followed our [Quickstart](doc:getting-started-1) section of our Getting Started guide to install and configure our SDK."
}
[/block]
If the completion callbacks or listeners on asynchronous methods receive an error argument that is not nil, an error has occurred. 

With the exception of `NetworkError`, `PurchaseCancelledError` or `StoreProblemError`, retrying a failed operation with the same arguments won't succeed. For failed purchases, assume the user wasn't charged, unless a `StoreProblemError` occurred - in which case the user may or may not have been charged.

##iOS Errors
On iOS, when an error has occurred the completion callback will receive an `NSError` object. 

When investigating or logging errors, review the `userInfo` dictionary, paying attention to the following keys: 
- `RCReadableErrorCodeKey` contains a cross-platform error name string that can be used for identifying the error. 
- `NSLocalizedDescriptionKey` contains a description of the error. This description is meant for the developer. 
- `NSUnderlyingErrorKey` contains the underlying error that caused the error in question, if an underlying error is present.

###Examples:
[block:code]
{
  "codes": [
    {
      "code": "if let err = error as NSError? {\n                \n    // log error details\n    print(\"Error: \\(err.userInfo[ReadableErrorCodeKey])\")\n    print(\"Message: \\(err.localizedDescription)\")\n    print(\"Underlying Error: \\(err.userInfo[NSUnderlyingErrorKey])\")\n\n    // handle specific errors\n    switch Purchases.ErrorCode(_nsError: err).code {\n    case .purchaseNotAllowedError:\n        showAlert(\"Purchases not allowed on this device.\")\n    case .purchaseInvalidError:\n        showAlert(\"Purchase invalid, check payment source.\")\n    default:\n        break\n    }\n}",
      "language": "swift"
    },
    {
      "code": "if (error) {\n\n    // log error details\n    NSLog(@\"RCError: %@\", [error.userInfo objectForKey:RCReadableErrorCodeKey]);\n    NSLog(@\"Message: %@\", error.localizedDescription);\n    NSLog(@\"Underlying Error: %@\", [error.userInfo objectForKey:NSUnderlyingErrorKey]);\n\n    switch ([error code]) {\n        case RCNetworkError:\n            showError(@\"Network error, check your connection and try again.\");\n        case RCPurchaseNotAllowedError:\n            showError(@\"Purchases not allowed on this device.\");\n        case RCPurchaseInvalidError:\n            showError(@\"Purchase invalid, check payment source.\");\n        default:\n            break;\n    }\n\n}",
      "language": "objectivec"
    }
  ]
}
[/block]
##Android Errors
On Android, when an error has occurred the `onError` listener will receive a `PurchasesError` object.

When investigating or logging errors, reveiw the properties of `PurchasesError`:
- `code` contains the `PurchasesErrorCode` that can be used for identifying the error.
- `message` contains a description of the error. This description is meant for the developer.
- `underlyingErrorMessage ` contains a description of the underlying error that caused the error in question, if an underlying error is present.

###Examples:
[block:code]
{
  "codes": [
    {
      "code": "with(error) {\n    // log error details\n    print(\"Error: $code\")\n    print(\"Message: $message\")\n    print(\"Underlying Error: $underlyingErrorMessage\")\n    when (code) {\n        PurchasesErrorCode.PurchaseNotAllowedError -> {\n            showAlert(\"Purchases not allowed on this device.\")\n        }\n        PurchasesErrorCode.PurchaseInvalidError -> {\n            showAlert(\"Purchase invalid, check payment source.\")\n        }\n        else -> {}\n    }\n}",
      "language": "kotlin"
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "Error codes common to all methods"
}
[/block]
####😿 `INVALID_APP_USER_ID`
**Problem:**
Indicates the [App User Id](doc:user-ids) is set to an invalid value.

**Resolution:**
Make sure you're not sending an empty string as the user id.
_______________________________________________________________________________
####🍎 🤖 `INVALID_CREDENTIALS`
**Problem:** 
Indicates the application has been configured with an invalid API key.

**Resolution:** 
Ensure you're using the correct API Key from the RevenueCat dashboard and your [Play Store Credentials](https://docs.revenuecat.com/docs/creating-play-service-credentials) More details [here](https://support.revenuecat.com/hc/en-us/articles/360046398913-Invalid-Play-Store-credentials-errors). / [App Store Shared Secret](https://docs.revenuecat.com/docs/itunesconnect-app-specific-shared-secret) are configured correctly. 
_______________________________________________________________________________
####😿 `NETWORK_ERROR`
**Problem:** 
Indicates a network error occurred during the operation.

**Resolution:** 
Make sure the device has an internet connection and try again. If you are testing in sandbox, make sure your outgoing connections is turned on. You can find this in xCode under signing & capabilities > App Sandbox > Outgoing connections (Client).
_______________________________________________________________________________
####😿 `OPERATION_ALREADY_IN_PROGRESS`
**Problem:**  
Indicates an identical operation is already in progress.

**Resolution:**
Wait for the original operation to complete.
_______________________________________________________________________________
####🍎 🤖 `STORE_PROBLEM`
**Problem:**
Indicates there was a problem connecting to the App Store or Play Store.

**Resolution:**
Retry the operation. More details [here](https://support.revenuecat.com/hc/en-us/articles/360046399333-App-Store-STORE-PROBLEM-error).
_______________________________________________________________________________
####😿 `UNEXPECTED_BACKEND_RESPONSE_ERROR` 
**Problem:** 
Indicates the SDK received an unexpected response from the server.

**Resolution:** 
[Report the error](https://www.revenuecat.com/support) with the full error object.
_______________________________________________________________________________
####😿 `UNKNOWN_BACKEND_ERROR`
**Problem:**
Indicates there was an unknown server error.

**Resolution:**
[Report the error](https://www.revenuecat.com/support) with the full error object.
_______________________________________________________________________________
####🤷 `UNKNOWN`
**Problem:**
Indicates an unknown error occurred.

**Resolution:**
Help us [fix it](https://www.revenuecat.com/jobs/).
_______________________________________________________________________________
[block:api-header]
{
  "title": "Purchasing Errors"
}
[/block]
####🍎 🤖 `INVALID_RECEIPT`
**Problem:**
Indicates the receipt is invalid.

**Resolution:**
Receipt validation failed.
_______________________________________________________________________________
####🍎 🤖 `MISSING_RECEIPT_FILE`
**Problem:**
Indicates there is no receipt file available on the device. This is common in sandbox testing.

**Resolution:**
In Sandbox, make sure you make a purchase before attempting the operation.
_______________________________________________________________________________
####🤖 `PAYMENT_PENDING`
**Problem:**
Additional action is required before granting entitlement. For example, a user might choose to purchase your in-app product at a physical store using cash.

**Resolution:**
Confirm to the user that they've started the pending purchase, and to complete it, they should follow instructions that are given to them from Google.
_______________________________________________________________________________
####🍎 🤖 `PRODUCT_ALREADY_PURCHASED`
**Problem:**
Indicates this product is already active for the user.

**Resolution:**
The device account already owns this product.
_______________________________________________________________________________
####🍎 🤖 `PRODUCT_NOT_AVAILABLE_FOR_PURCHASE`
**Problem:**
Indicates the product is not available for purchase by the device or user.

**Resolution:**
Ensure you're attempting to purchase a product that's available for the device / user.
_______________________________________________________________________________
####🍎 🤖 `PURCHASE_CANCELLED`
**Problem:**
 Indicates the user cancelled their purchase and was not charged.

**Resolution:**
No action required.
_______________________________________________________________________________
####🍎 🤖 `PURCHASE_INVALID`
**Problem:**
Indicates one of the provided arguments was invalid, including the payment method.

**Resolution:**
Ensure the device payment method is valid.
_______________________________________________________________________________
####🤖 `PURCHASE_NOT_ALLOWED`
**Problem:**
Indicates the device or user is not allowed to make the purchase.

**Resolution:**
The device / user is not allowed to make purchases. More details [here](https://support.revenuecat.com/hc/en-us/articles/360046528893--The-device-or-user-is-not-allowed-to-make-the-purchase-error).
_______________________________________________________________________________
####🍎 `RECEIPT_ALREADY_IN_USE`
**Problem:**
Indicates there is an identical receipt already in use by another subscriber. 

**Resolution:**
See [allowSharingAppStoreAccount](https://sdk.revenuecat.com/ios/Classes/RCPurchases.html#/c:objc(cs)RCPurchases(py)allowSharingAppStoreAccount) for details on handling.
_______________________________________________________________________________
[block:api-header]
{
  "title": "Restoring Errors"
}
[/block]
####🍎 🤖 `MISSING_RECEIPT_FILE`
**Problem:**
Indicates there is no receipt file available on the device. This is common in sandbox testing.

**Resolution:**
In Sandbox, make sure you make a purchase before attempting the operation.
_______________________________________________________________________________
####🍎 🤖 `INVALID_RECEIPT`
**Problem:**
Indicates the receipt is invalid.

**Resolution:**
Receipt validation failed.
[block:callout]
{
  "type": "info",
  "body": "In iOS, the `MISSING_RECEIPT_FILE` can populate fairly often in the sandbox environment. In sandbox a receipt is generated when a user makes a purchase and is saved against the sandbox account. While in production a receipt is generated when a user downloads the app and is saved against the Apple account."
}
[/block]

[block:api-header]
{
  "title": "Next Steps"
}
[/block]
* You're set up to handle errors, time to start [making purchases in sandbox :fa-arrow-right:](doc:sandbox)
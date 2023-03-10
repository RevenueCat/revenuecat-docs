---
title: "Error Handling"
slug: "errors"
excerpt: "Handling errors in Purchases SDK"
hidden: false
metadata: 
  title: "Error Handling | RevenueCat"
  description: "With the exception of NetworkError, PurchaseCancelledError or StoreProblemError, retrying a failed operation with the same arguments won't succeed. For failed purchases, assume the user wasn't charged, unless a `StoreProblemError` occurred - in which case the user may or may not have been charged."
  image: 
    0: "https://files.readme.io/9a452b9-Reddit__E.jpg"
    1: "Reddit – E.jpg"
    2: 1200
    3: 630
    4: "#fbabaf"
createdAt: {}
updatedAt: "2020-07-02T03:19:30.370Z"
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

[block:parameters]
{
  "data": {
    "h-0": "Code",
    "h-1": "Meaning",
    "h-2": "",
    "0-0": "NetworkError\n(`NETWORK_ERROR`)",
    "2-0": "UnknownBackendError\n(`UNKNOWN_BACKEND_ERROR`)",
    "0-1": "❌ Indicates a network error occurred during the operation.  \n\n----------------------\n✅ Check network connectivity and retry the operation.",
    "2-1": "❌ Indicates there was an unknown server error.\n\n----------------------\n✅ [Report the error](https://support.revenuecat.com/hc/en-us/requests/new) with the full error object.",
    "4-0": "OperationAlreadyInProgressError\n(`OPERATION_ALREADY_IN_PROGRESS`)",
    "4-1": "❌ Indicates an identical operation is already in progress.\n\n----------------------\n✅ Wait for the original operation to complete.",
    "1-0": "UnexpectedBackendResponseError\n(`UNEXPECTED_BACKEND_RESPONSE_ERROR`)",
    "1-1": "❌ Indicates the SDK received an unexpected response from the server.\n\n----------------------\n✅ [Report the error](https://www.revenuecat.com/support) with the full error object.",
    "5-0": "InvalidCredentialsError\n(`INVALID_CREDENTIALS`)",
    "6-0": "InvalidAppUserIdError\n(`INVALID_APP_USER_ID`)",
    "6-1": "❌ Indicates the [App User Id](doc:user-ids) is set to an invalid value.\n\n----------------------\n✅ Make sure you're not sending an empty string as the user id.",
    "5-1": "❌ Indicates the application has been configured with an invalid API key.\n\n----------------------\n✅ Ensure you're using the correct API Key from the RevenueCat dashboard and your [Play Store Credentials](https://docs.revenuecat.com/docs/creating-play-service-credentials) / [App Store Shared Secret](https://docs.revenuecat.com/docs/itunesconnect-app-specific-shared-secret) are configured correctly.",
    "7-0": "UnknownError\n(`UNKNOWN`)",
    "7-1": "❌ Indicates an unknown error occurred.\n\n-----------------\n✅ Help us [fix it](https://www.revenuecat.com/jobs/).",
    "3-0": "StoreProblemError\n(`STORE_PROBLEM`)",
    "3-1": "❌ Indicates there was a problem connecting to the App Store or Play Store.\n\n----------------------\n✅ Retry the operation.",
    "0-2": ""
  },
  "cols": 2,
  "rows": 8
}
[/block]

[block:api-header]
{
  "title": "Method specific error codes"
}
[/block]
##Make Purchase
[block:parameters]
{
  "data": {
    "h-0": "Code",
    "h-1": "Meaning",
    "0-0": "PurchaseCancelledError\n(`PURCHASE_CANCELLED`)",
    "0-1": "❌ Indicates the user cancelled their purchase and was not charged.\n\n-------------------------\n✅ No action required.",
    "2-0": "InvalidReceiptError\n(`INVALID_RECEIPT`)",
    "2-1": "❌ Indicates the receipt is invalid.\n\n-------------------------\n✅ Receipt validation failed.",
    "4-0": "ReceiptAlreadyInUseError\n(`RECEIPT_ALREADY_IN_USE`)",
    "4-1": "❌ Indicates there is an identical receipt already in use by another subscriber. \n\n------------------------\n✅ See [allowSharingAppStoreAccount](https://sdk.revenuecat.com/ios/Classes/RCPurchases.html#/c:objc(cs)RCPurchases(py)allowSharingAppStoreAccount) for details on handling.",
    "6-0": "PurchaseNotAllowedError\n(`PURCHASE_NOT_ALLOWED`)",
    "6-1": "❌ Indicates the device or user is not allowed to make the purchase.\n\n--------------------------\n✅ The device / user is not allowed to make purchases.",
    "8-0": "PurchaseInvalidError\n(`PURCHASE_INVALID`)",
    "8-1": "❌ Indicates one of the provided arguments was invalid, including the payment method.\n\n--------------------------\n✅ Ensure the device payment method is valid.",
    "3-0": "ProductNotAvailableForPurchaseError\n(`PRODUCT_NOT_AVAILABLE_FOR_PURCHASE`)",
    "3-1": "❌ Indicates the product is not available for purchase by the device or user.\n\n------------------------\n✅ Ensure you're attempting to purchase a product that's available for the device / user.",
    "1-0": "ProductAlreadyPurchasedError\n(`PRODUCT_ALREADY_PURCHASED`)",
    "1-1": "❌ Indicates this product is already active for the user.\n\n-------------------------\n✅ The device account already owns this product.",
    "5-0": "MissingReceiptFileError\n(`MISSING_RECEIPT_FILE`)",
    "5-1": "❌ Indicates there is no receipt file available on the device. This is common in sandbox testing.\n\n--------------------------\n✅ In Sandbox, make sure you make a purchase before attempting the operation.",
    "7-0": "PaymentPendingError\n(`PAYMENT_PENDING`)",
    "7-1": "❌ Additional action is required before granting entitlement. For example, a user might choose to purchase your in-app product at a physical store using cash.\n\n--------------------------\n✅ Confirm to the user that they've started the pending purchase, and to complete it, they should follow instructions that are given to them from Google."
  },
  "cols": 2,
  "rows": 9
}
[/block]
##Restore Transactions
[block:parameters]
{
  "data": {
    "h-0": "Code",
    "h-1": "Meaning",
    "0-0": "MissingReceiptFileError\n(`MISSING_RECEIPT_FILE`)",
    "0-1": "❌ Indicates there is no receipt file available on the device. This is common in sandbox testing.\n\n--------------------------\n✅ In Sandbox, make sure you make a purchase before attempting the operation.",
    "1-0": "InvalidReceiptError\n(`INVALID_RECEIPT`)",
    "1-1": "❌ Indicates the receipt is invalid.\n\n-------------------------\n✅ Receipt validation failed."
  },
  "cols": 2,
  "rows": 2
}
[/block]

[block:api-header]
{
  "title": "Next Steps"
}
[/block]
* You're set up to handle errors, time to start [making purchases in sandbox :fa-arrow-right:](doc:sandbox)
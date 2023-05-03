---
title: Error Handling
slug: errors
excerpt: Handling errors in Purchases SDK
hidden: false
metadata:
  title: Error Handling – RevenueCat
  description: With the exception of NetworkError, PurchaseCancelledError or StoreProblemError,
    retrying a failed operation with the same arguments won't succeed. For failed
    purchases, assume the user wasn't charged, unless a `StoreProblemError` occurred
    - in which case the user may or may not have been charged.
  image:
    0: https://files.readme.io/a5a8894-RevenueCat_Docs_OG.png
    1: RevenueCat Docs OG.png
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: '2023-03-27T15:08:14.630Z'
updatedAt: '2023-03-27T15:08:14.630Z'
category: 64515c3aa16590000a27cd9d
---
[block:callout]
{
  "type": "success",
  "body": "This section assumes you've followed our [Quickstart](doc:getting-started-1) section of our Getting Started guide to install and configure our SDK."
}
[/block]
# Error Handling

If the completion callbacks or listeners on asynchronous methods receive an error argument that is not nil, an error has occurred. 

With the exception of `NetworkError`, `PurchaseCancelledError` or `StoreProblemError`, retrying a failed operation with the same arguments won't succeed. For failed purchases, assume the user wasn't charged, unless a `StoreProblemError` occurred - in which case the user may or may not have been charged.

## iOS Errors
On iOS, when an error has occurred the completion callback will receive a `RevenueCat.ErrorCode` object. 

When investigating or logging errors, review the `errorUserInfo` dictionary, paying attention to the following keys: 
- `rc_code_name` contains a cross-platform error name string that can be used for identifying the error. 
- `NSDebugDescriptionErrorKey` contains a description of the error. This description is meant for the developer.

### Examples
[block:file]
swift->code_blocks/🧰 Test - Launch/errors_1.swift
objectivec->code_blocks/🧰 Test - Launch/errors_1.m
[/block]
## Android Errors
On Android, when an error has occurred, the `onError` listener will receive a `PurchasesError` object.

When investigating or logging errors, review the properties of `PurchasesError`:
- `code` contains the `PurchasesErrorCode` that can be used for identifying the error.
- `message` contains a description of the error. This description is meant for the developer.
- `underlyingErrorMessage ` contains a description of the underlying error that caused the error in question, if an underlying error is present.

### Examples
[block:file]
kotlin->code_blocks/🧰 Test - Launch/errors_2.kt
[/block]
# Legend
When debugging errors, it's important to consider whether the error was thrown by RevenueCat, Apple, or Google. This can help you pinpoint where to look for a resolution. 
[block:parameters]
{
  "data": {
    "h-0": "Icon",
    "h-1": "Description",
    "0-0": "😿",
    "0-1": "Error generated from RevenueCat",
    "1-0": "🍎",
    "1-1": "Error generated from Apple",
    "2-0": "🤖",
    "2-1": "Error generated from Google",
    "3-0": "📦",
    "3-1": "Error generated from Amazon"
  },
  "cols": 2,
  "rows": 4
}
[/block]
# Error codes common to all methods

####😿 `INVALID_APP_USER_ID`
**Problem:**
Indicates the [App User Id](doc:user-ids) is set to an invalid value.

**Resolution:**
Make sure you're not sending a string over 100 characters or a [blocked app user Id](doc:user-ids#blocked-app-user-ids).
_______________________________________________________________________________
####😿 🍎 🤖 📦 `INVALID_CREDENTIALS`
**Problem:** 
Indicates the application has been configured with an invalid credentials.

**Resolution:** 
If this error occurs before a purchase, ensure you're using the [correct API Key](doc:authentication) from the RevenueCat dashboard.
If this error happens during the purchase flow, make sure your [Play Store Credentials](doc:creating-play-service-credentials) and/or [App Store Shared Secret](doc:itunesconnect-app-specific-shared-secret) and/or [Amazon Appstore Credentials](doc:amazon-appstore-credentials) are configured correctly in the RevenueCat dashboard.
_______________________________________________________________________________
####😿 `INVALID_SUBSCRIBER_ATTRIBUTES`
**Problem:**
Indicates subscriber attributes were unable to be saved.

**Resolution:**
Make sure that there are no formatting issues when [setting subscriber attributes](https://docs.revenuecat.com/docs/subscriber-attributes#restrictions).
_______________________________________________________________________________
####😿 `NETWORK_ERROR`
**Problem:** 
Indicates a network error occurred during the operation.

**Resolution:** 
Make sure the device has an internet connection and try again. If you are testing in sandbox, make sure your outgoing connections is turned on. You can find this in XCode under signing & capabilities > App Sandbox > Outgoing connections (Client).
_______________________________________________________________________________
####😿 `OPERATION_ALREADY_IN_PROGRESS`
**Problem:**  
Indicates an identical operation is already in progress. For example, making two identical purchase attempts at the same time.

**Resolution:**
Wait for the original operation to complete.
_______________________________________________________________________________
####🍎 🤖 📦 `STORE_PROBLEM`
**Problem:**
This error is forwarded from Apple/Google/Amazon and indicates there was a problem connecting to the App Store, Play Store, or Amazon Appstore. 

The problems that will trigger this on iOS:
- Apple server is down (more common in sandbox than production)
- [SKErrorUnknown](https://developer.apple.com/documentation/storekit/skerrorcode/skerrorunknown)
- [SKErrorCloudServiceNetworkConnectionFailed](https://developer.apple.com/documentation/storekit/skerrorcode/skerrorcloudservicenetworkconnectionfailed)
- [SKErrorCloudServiceRevoked](https://developer.apple.com/documentation/storekit/skerrorcode/SKErrorCloudServiceRevoked)
- An [SCA purchase flow](https://developer.apple.com/support/psd2/) was initiated.

The problems that will trigger this on Android:
- Google server is down
- [Google Play Developer API Quota exceeded](https://developers.google.com/android-publisher/quotas)
- Invalid Android package name in the RevenueCat dashboard
- Google Billing Client [SERVICE_TIMEOUT](https://developer.android.com/reference/com/android/billingclient/api/BillingClient.BillingResponseCode#service_timeout) error

**Resolution:**
If everything was working while testing, you shouldn't have to do anything to handle this error in production. RevenueCat will automatically retry any purchase failures so no data is lost.

If this occurs while testing in sandbox you can try:
- Repeating the operation later.
- Create a new sandbox user on iOS.
_______________________________________________________________________________
####😿 `UNEXPECTED_BACKEND_RESPONSE_ERROR` 
**Problem:** 
Indicates the SDK received an unexpected response from the server.

**iOS sub error codes:**
- `loginResponseDecoding`: Unable to decode response returned from login.
- `postOfferIdBadResponse`: Unable to decode response returned from posting offer for signing.
- `postOfferIdMissingOffersInResponse`: Missing offers from response returned from posting offer for signing.
- `postOfferIdSignature`: Signature error encountered in response returned from posting offer for signing.
- `getOfferUnexpectedResponse`: Unknown error encountered while getting offerings.
- `customerInfoNil`: Unable to instantiate a CustomerInfoResponse, CustomerInfo in response was nil.
- `customerInfoResponseParsing`: Unable to instantiate a CustomerInfoResponse due to malformed json.

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
Indicates an unknown error occurred. Possible causes:
- The subscriber has reached the maximum number of Apple receipts allowed. This can be an indication of an implementation error regarding identifying users. Take a look at our [best practices for identifying users](https://docs.revenuecat.com/docs/user-ids#aliasing) for common implementation mistakes. 

**Resolution:**
Help us [fix it](https://www.revenuecat.com/jobs/).
_______________________________________________________________________________

# Purchasing Errors

####😿 `RECEIPT_ALREADY_IN_USE`
**Problem:**
Indicates there is an identical receipt already in use by another subscriber. 

**Resolution:**
The user will either need to log in as the App User Id that already owns the receipt or [restore purchases](doc:restoring-purchases) to re-sync the receipt with their current account. We recommend checking out the ['Transfer purchases'](doc:restoring-purchases#transfer-purchases) restore behavior. 
_______________________________________________________________________________
####🍎 🤖 📦 `INVALID_RECEIPT`
**Problem:**
Indicates the receipt is malformed or invalid.

**Resolution:**
This error indicates an error with configuration and usually occurs in the sandbox environment.

If testing with StoreKit Configuration Files:
- Follow [StoreKit test guide](doc:apple-app-store#ios-14-only-testing-on-the-simulator) 
- Re-upload the StoreKit certificate after making any changes to products or code-signing
- All products in StoreKit file are listed in the [RevenueCat dashboard](doc:entitlements#revenuecat-configuration)

Some other places to check:
- Bundle ID and [shared secret](doc:itunesconnect-app-specific-shared-secret) are set correctly for your app
_______________________________________________________________________________
####🍎 `INVALID_APPLE_SUBSCRIPTION_KEY`
**Problem:**
Indicates that the Apple Subscription Key is invalid or not present.

**Resolution:**
In order to provide Subscription Offers you must first generate a [subscription key](https://docs.revenuecat.com/docs/ios-subscription-offers#subscription-keys).
_______________________________________________________________________________
####🍎 `MISSING_RECEIPT_FILE`
**Problem:**
Indicates there is no receipt file available on the device. This is more common in sandbox testing.

**Resolution:**
Make sure you're signed into the device with a valid Apple account. In Sandbox, you may have to make a purchase to generate a receipt before attempting the operation. This error can occur fairly often in the sandbox environment. In sandbox a receipt is generated when a user makes a purchase and is saved against the sandbox account. While in production a receipt is generated when a user downloads the app and is saved against the Apple account.
_______________________________________________________________________________
####🍎 `INELIGIBLE_ERROR`
**Problem:**
Indicates that the user is ineligible for the specific Subscription Offer. 

Some possible causes:
- User has already used this Offer
- Offer not available in specific region

**Resolution:**
If a user is not eligible for a Subscription Offer, be sure to update your UI to reflect normal pricing or terms. [`.paymentDiscount(...)`](https://docs.revenuecat.com/docs/ios-subscription-offers#fetch-payment-discount) is the best way to check for Subscription Offer eligibility. If you are testing in sandbox and already tested a purchase with that offer, you may want to [create a new sandbox user](https://docs.revenuecat.com/docs/apple-app-store#create-a-sandbox-test-account) to try again.
_______________________________________________________________________________
####🍎 🤖 `INSUFFICIENT_PERMISSIONS_ERROR`
**Problem:**
Indicates the device does not have sufficient permissions to make in-app purchases.

**Resolution:**
Make sure you're signed into a physical device with a valid Apple or Google account that has permissions to make purchases.
_______________________________________________________________________________
####🍎 🤖 `PAYMENT_PENDING_ERROR`
**Problem:**
Additional action is required by the user before granting entitlement. For example, a user might choose to purchase your in-app product at a physical store using cash, or a parental control on a child's device may require approval before purchasing. 

**Resolution:**
Confirm to the user that they've started the pending purchase, and to complete it, they should follow instructions that are given to them from Apple or Google.
_______________________________________________________________________________
####🍎 `PRODUCT_ALREADY_PURCHASED`
####🤖 `ITEM_ALREADY_OWNED`
**Problem:**
Indicates that the product is already active for the user.

**Resolution:**
If testing in sandbox:
- Subscription IAP: Wait for the subscription to automatically cancel and try again.
- Non-subscription IAP: Create a new sandbox user.

If this occurs in production, make sure the user [restores purchases](doc:restoring-purchases) to re-sync any transactions with their current App User Id.
_______________________________________________________________________________
####🍎 `PRODUCT_NOT_AVAILABLE_FOR_PURCHASE`
####🤖 `ITEM_UNAVAILABLE`
**Problem:**
Indicates the product is not available for purchase by the device or user.

**Resolution:**
Ensure you're attempting to purchase a product that's available for the device / user.
_______________________________________________________________________________
####🍎 🤖 `PURCHASE_CANCELLED`
**Problem:**
Indicates the user cancelled their purchase and was not charged. 

On iOS, this can also mean the Apple account already owns the product. The user can [restore purchases](doc:restoring-purchases) to re-sync any transactions with their current App User Id.

**Resolution:**
No action required. The user decided not to proceed with their in-app purchase.
_______________________________________________________________________________
####🍎 📦  `PURCHASE_INVALID`
####🤖 `DEVELOPER_ERROR`
**Problem:**
Indicates one of the provided arguments for the purchase was invalid, including the payment method.

The problems that will trigger this on Android:
- Google Billing Client [DEVELOPER_ERROR](https://developer.android.com/reference/com/android/billingclient/api/BillingClient.BillingResponseCode#developer_error)

The problems that will trigger this on iOS:
- [SKErrorInvalidOfferIdentifier](https://developer.apple.com/documentation/storekit/skerrorcode/skerrorinvalidofferidentifier)

**Resolution:**
Ensure the device payment method is valid and all arguments passed in are correct.
_______________________________________________________________________________
####🍎 🤖 `PURCHASE_NOT_ALLOWED`
**Problem:**
Indicates the device or user is not allowed to make the purchase.

The problems that will trigger this on Android:
- Google Billing Client [FEATURE_NOT_SUPPORTED](https://developer.android.com/reference/com/android/billingclient/api/BillingClient.BillingResponseCode#feature_not_supported)

The problems that will trigger this on iOS:
- [SKErrorPrivacyAcknowledgementRequired](https://developer.apple.com/documentation/storekit/skerrorcode/skerrorprivacyacknowledgementrequired)
- [SKErrorPaymentNotAllowed](https://developer.apple.com/documentation/storekit/skerror/2330535-paymentnotallowed)
- [SKErrorCloudServicePermissionDenied](https://developer.apple.com/documentation/storekit/skerror/2335083-cloudservicepermissiondenied)
- [SKErrorOverlayInvalidConfiguration](https://developer.apple.com/documentation/storekit/skerror/3656407-overlayinvalidconfiguration)
- [SKErrorUnsupportedPlatform](https://developer.apple.com/documentation/storekit/skerror/3689489-unsupportedplatform)
- [SKErrorIneligibleForOffer](https://developer.apple.com/documentation/storekit/skerror/3663443-ineligibleforoffer)
- [SKErrorClientInvalid](https://developer.apple.com/documentation/storekit/skerror/2330533-clientinvalid)

**Resolution:**
Make sure the device and user are allowed to make in-app purchases. Try the following troubleshooting steps:
- Make sure your device/emulator is completely updated.
- Try running on device. Sometimes the emulator glitches out and it must be restarted. Overall, testing on device is more reliable.
- Restart your device/emulator.
- Make sure you're logged in with a Google account.
- If you're running on an emulator, make sure it has Google Play installed.
_______________________________________________________________________________

# Restoring Errors

####🍎 🤖 `INVALID_RECEIPT`
**Problem:**
Indicates the receipt is malformed or invalid.

**Resolution:**
Receipt validation failed, no action required.
_______________________________________________________________________________

####🍎 `MISSING_RECEIPT_FILE`
**Problem:**
Indicates there is no receipt file available on the device. This is more common in sandbox testing.

**Resolution:**
Make sure you're signed into the device with a valid Apple account. For Sandbox testing, you may have to make a purchase to generate a receipt before attempting the operation. In Sandbox a receipt is generated when a user makes a purchase and is saved against the sandbox account. While in production a receipt is generated when a user downloads the app and is saved against the Apple account.

_______________________________________________________________________________

#### 📦 `ERROR_FINDING_RECEIPT_SKU`
**Problem:**
Indicates there is no SKU available from the token.

_______________________________________________________________________________

#### 📦 `ERROR_FETCHING_RECEIPTS`
**Problem:**
Indicates there was an error fetching receipts.

_______________________________________________________________________________

#### 📦 `ERROR_FETCHING_RECEIPT_INFO`
**Problem:**
Indicates there was an error fetching information about the receipt.

_______________________________________________________________________________

#### 📦 `ERROR_OBSERVER_MODE_NOT_SUPPORTED`
**Problem:**
Observer Mode is [not currently supported](doc:observer-mode) for Amazon.

**Resolution:**
Disable Observer Mode.

# Next Steps

* You're set up to handle errors, time to start [making purchases in sandbox :fa-arrow-right:](doc:sandbox)
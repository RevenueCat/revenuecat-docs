---
title: Trusted Entitlements
slug: trusted-entitlements
excerpt: Protect your purchases from attackers by enabling Response Signature Verification
hidden: false
categorySlug: customers-subscription-status
---

# Purpose

As data travels between your app, RevenueCat, and the app stores, a malicious user could intercept and modify requests by performing a machine-in-the-middle ([MitM](https://en.wikipedia.org/wiki/Man-in-the-middle_attack)) attack to grant themselves entitlements without actually paying you.

To prevent this, our native (iOS/Android) SDKs, together with our backend, will verify responses by checking a cryptographic signature.

> 📘
>
> Trusted entitlements is supported in iOS SDK version 4.25.0 and up, and Android SDK version 6.6.0 and up.
>
> Flutter, React Native, Cordova and Unity support coming soon.

## Configuration

SDKs can be configured in one of 3 `EntitlementVerificationMode`'s:

- Disabled (*default*): equivalent to no verification. Susceptible to MiTM attacks.
- Informational (*beta*): No behavior change, but the result of verification is included in `EntitlementInfos` / `EntitlementInfo`.
- Enforced (*coming soon*): verification failures result in `ErrorCode.signatureVerificationFailed` error being thrown.

```swift 
Purchases.configure(
    with: Configuration.Builder(withAPIKey: <api_key>)
        .with(entitlementVerificationMode: .informational)
)
```
```objectivec 
[RCPurchases configureWithConfigurationBuilder:[[RCConfiguration builderWithAPIKey:<api_key>]
                        withEntitlementVerificationMode:RCEntitlementVerificationModeInformational]];
```
```kotlin 
Purchases.configure(
    PurchasesConfiguration.Builder(context, apiKey = <api_key>)
        .entitlementVerificationMode(EntitlementVerificationMode.INFORMATIONAL)
        .build()
)
```

## Verification

When configuring the SDK with `EntitlementVerificationMode.informational`, `EntitlementInfo` contains the verification result:

```swift 
let user = try await Purchases.shared.customerInfo()

switch user.entitlements.verificationResult {
    /// No verification was done.
    ///
    /// This can happen for multiple reasons:
    ///  1. Verification is not enabled in ``Configuration``
    ///  2. Verification can't be performed prior to iOS 13.0
    case .notRequested:
        break

    /// Entitlements were verified with our server.
    case .verified:
        break

    /// Entitlements were created and verified on device through `StoreKit 2`.
    case .verifiedOnDevice:
        break

    /// Entitlement verification failed, possibly due to a MiTM attack.
    case .failed:
        break
}
```
```objectivec 
[[RCPurchases sharedPurchases] getCustomerInfoWithCompletion:^(RCPurchaserInfo * customerInfo, NSError * error) {
    switch (customerInfo.entitlements.verificationResult) {
        /// No verification was done.
        ///
        /// This can happen for multiple reasons:
        ///  1. Verification is not enabled in ``Configuration``
        ///  2. Verification can't be performed prior to iOS 13.0
        case RCVerificationResultNotRequested:
            break;

        /// Entitlements were verified with our server.
        case RCVerificationResultVerified:
            break;

        /// Entitlements were created and verified on device through `StoreKit 2`.
        case RCVerificationResultVerifiedOnDevice:
            break;

        /// Entitlement verification failed, possibly due to a MiTM attack.
        case RCVerificationResultFailed:
            break;
    }
}]
```
```kotlin 
Purchases.sharedInstance.getCustomerInfoWith({ error -> /* Optional error handling */ }) { customerInfo ->
    when (customerInfo.entitlements.verificationResult) {
        /// No verification was done.
        ///
        /// This can happen for multiple reasons:
        ///  1. Verification is not enabled in Configuration
        ///  2. Verification can't be performed prior to Android 4.4
        VerificationResult.NOT_REQUESTED

        /// Entitlements were verified with our server.
        VerificationResult.VERIFIED,

        /// Entitlements were verified on device.
        VerificationResult.VERIFIED_ON_DEVICE -> {}

        /// Entitlement verification failed, possibly due to a MiTM attack.
        VerificationResult.FAILED,
        -> {}
    }
}
```

Additionally, verification errors are always forwarded to `Purchases.errorHandler`.

## Edge cases

### Cache invalidation

Transitioning an app from `EntitlementVerificationMode.disabled` to `EntitlementVerificationMode.informational` means that cached data would not be verified. In order for a user to be able to rely on this new behavior, the SDKs invalidate caches when this change is detected, so that all subsequent data requests are guaranteed to have validation information.

### Key replacement

In the very unlikely event that the public/private key needed to be replaced, this would be the process:

- The old pair would be considered insecure
- A new version of API endpoints would be added
- A new version of the SDK that uses the new set of endpoints and the new public key would be rolled out

In this way, apps using the old version of the SDK would continue to work, but they would have to be updated to the new set of keys if they want to continue being secure.

## Compatibility

- Android 4.4+
- iOS 13.x+
- _Coming soon to our other SDKs_

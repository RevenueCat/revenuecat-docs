---
title: Trusted Entitlements
slug: trusted-entitlements
excerpt: Protect your purchases from attackers by enabling Response Signature Verification
hidden: false
---

# Purpose

As data travels between your app, RevenueCat, and the app stores, a malicious user could intercept and modify requests by performing a machine-in-the-middle ([MitM](https://en.wikipedia.org/wiki/Man-in-the-middle_attack)) attack to grant themselves entitlements without actually paying you.

To prevent this, our native (iOS/Android) SDKs, together with our backend, will verify responses by checking a cryptographic signature.

## Configuration

SDKs can be configured in one of 3 `EntitlementVerificationMode`'s:

- Disabled (*default*): equivalent to no verification. Susceptible to MiTM attacks.
- Informational (*beta*): No behavior change, but the result of verification is included in `EntitlementInfos` / `EntitlementInfo`.
- Enforced (*coming soon*): verification failures result in `ErrorCode.signatureVerificationFailed` error being thrown.

[block:file]
[
  {
    "language": "swift",
    "name": "",
    "file": "code_blocks/👥 Customers/trusted-entitlements.swift"
  },
  {
    "language": "objectivec",
    "name": "",
    "file": "code_blocks/👥 Customers/trusted-entitlements.m"
  },
  {
    "language": "kotlin",
    "name": "",
    "file": "code_blocks/👥 Customers/trusted-entitlements.kt"
  }
]
[/block]

## Verification

When configuring the SDK with `EntitlementVerificationMode.informational`, `EntitlementInfo` contains the verification result:

[block:file]
[
  {
    "language": "swift",
    "name": "",
    "file": "code_blocks/👥 Customers/verification-result.swift"
  },
  {
    "language": "objectivec",
    "name": "",
    "file": "code_blocks/👥 Customers/verification-result.m"
  },
  {
    "language": "kotlin",
    "name": "",
    "file": "code_blocks/👥 Customers/verification-result.kt"
  }
]
[/block]

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

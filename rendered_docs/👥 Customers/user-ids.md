---
title: Identifying Customers
slug: user-ids
excerpt: How RevenueCat handles user identity
hidden: false
metadata:
  title: Identifying users – RevenueCat
  description: RevenueCat provides a source of truth for a subscriber's status across
    different platforms. To do this, each subscriber has an App User ID that uniquely
    identifies them within your application.
  image:
    0: https://files.readme.io/f9d72a3-RevenueCat_Docs_OG.png
    1: RevenueCat Docs OG.png
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: '2023-05-09T18:27:09.193Z'
category: 648c78a343e9f503a273d2d6
order: 0
updatedAt: '2023-06-16T16:41:51.826Z'
---
RevenueCat provides a source of truth for a customer's [subscription status](https://www.revenuecat.com/docs/customer-info) across different platforms. User identity is one of the most important components of many mobile applications, and it's crucial to make sure the subscription status that RevenueCat is tracking is associated with the correct user.

# What is a customer in RevenueCat?

In RevenueCat, the term "customer" refers to the person using an app that utilizes RevenueCat to handle or track the user's purchases. Every customer has a unique <<glossary:CustomerInfo>> object that can be referenced via their App User ID. As described below, the RevenueCat SDK will automatically generate anonymous App User IDs for customers unless a custom App User ID is provided by the developer. Some apps will use a combination of both custom and anonymous App User IDs, or only one App User ID type.

If you use a combination of anonymous and custom App User IDs, it’s expected that Customers may be merged over time due to various actions they perform within the app, like [logins](https://www.revenuecat.com/docs/user-ids#login-method-alias-behavior) or [restores](https://www.revenuecat.com/docs/restoring-purchases). Scenarios explaining when merges occur are covered in more detail below, and will depend on the [restore behavior](https://www.revenuecat.com/docs/restoring-purchases#restore-behavior) you select for your project. When a merge of customers occurs, there will be only one App User ID within the `original_app_user_id` field. If you’re listening to [Webhooks](https://www.revenuecat.com/docs/webhooks), the other App User IDs associated with the customer will be within an array in the `aliases` field. When referenced via the [SDK](https://www.revenuecat.com/docs/configuring-sdk) or [API](https://www.revenuecat.com/reference/basic), any merged App User IDs will all be treated as the same “customer”. Looking up any of the merged App User IDs in RevenueCat will return the same `CustomerInfo`, customer history, subscriber attributes, subscription status, etc.

Overall, the concept of a customer in RevenueCat is central to the platform's ability to track and manage in-app purchases and subscriptions. By this form of maintaining a detailed record of each customer's activity, developers can gain insights into their app's revenue streams and make informed decisions to optimize their monetization strategies.

# Anonymous App User IDs

If you don't provide an App User ID when instantiating the Purchases SDK, RevenueCat will generate a new random App User ID for you and cache it on the device. In the event that the user deletes and reinstalls the app, a new random App User ID will be generated.

```swift 
Purchases.configure(withAPIKey: <my_api_key>)
```
```objectivec 
[RCPurchases configureWithAPIKey:@<my_api_key>];
```
```kotlin 
Purchases.configure(PurchasesConfiguration.Builder(this, <api_key>).build())
```
```java 
Purchases.configure(new PurchasesConfiguration.Builder(context, <api_key>).build());
```
```javascript Flutter
await Purchases.configure(PurchasesConfiguration(<public_sdk_key>));
```
```javascript React Native
Purchases.configure({apiKey: <public_sdk_key>});
```
```javascript Cordova
Purchases.setup(<public_sdk_key>);
```
```csharp Unity
// The SDK can be configured through the Unity Editor. 
// See Unity installation instructions https://docs.revenuecat.com/docs/unity

// If you'd like to do it programmatically instead, 
// make sure to check "Use runtime setup" in the Editor and then: 

Purchases.PurchasesConfiguration.Builder builder = Purchases.PurchasesConfiguration.Builder.Init("api_key");
Purchases.PurchasesConfiguration purchasesConfiguration = builder.Build();
purchases.Configure(purchasesConfiguration);
```

> 📘 
> 
> Anonymous App User IDs are always prefixed with `$RCAnonymousID:` for SDK versions 3+. This can be useful for working with anonymous users on your server.

# Logging In with a Custom App User ID

Setting your own App User ID will allow you to reference users in the RevenueCat dashboard, via the API, as well as in the [webhooks](doc:webhooks) and other integrations.

Using an externally managed App User ID also provides a mechanism by which to restore purchases in a few scenarios: 

- When a user deletes and reinstalls your app - using the same App User ID will ensure they still have access to subscriptions previously started without requiring a [restore](doc:restoring-purchases) .
- When the user logs in on multiple devices - you can honor a subscription that was purchased on one device across any other platform.

> 📘 
> 
> App User IDs are case-sensitive.

## Provide App User ID on configuration

> ❗️ iOS 15+ Prewarming
> 
> In certain cases, iOS may [prewarm](https://developer.apple.com/documentation/uikit/app_and_environment/responding_to_the_launch_of_your_app/about_the_app_launch_sequence?language=objc) your app - this essentially means your app will be launched silently in the background to improve app launch times for your users.
> 
> If you are **not** using RevenueCat's anonymous IDs as described above, and are instead providing your own app user ID on configuration, **do not** call `configure` in `application:didFinishLaunchingWithOptions:`. Instead, call the `configure` method in your root view controller's initialization method.

If you have your own App User IDs at app launch, you can pass those on instantiation to _Purchases_.

```swift 
Purchases.configure(withAPIKey: <my_api_key>, appUserID: <my_app_user_id>)
```
```objectivec 
[RCPurchases configureWithAPIKey:@<my_api_key> appUserID:@<my_app_user_id>];
```
```kotlin 
Purchases.configure(PurchasesConfiguration.Builder(this, <api_key>).appUserID(<my_app_user_id>).build())
```
```java 
Purchases.configure(new PurchasesConfiguration.Builder(context, <api_key>).appUserID(<my_app_user_id>).build());
```
```javascript Flutter
await Purchases.configure(
    PurchasesConfiguration(<public_sdk_key>)
      ..appUserID = <my_app_user_id>
);
```
```javascript React Native
Purchases.configure({apiKey: <public_sdk_key>, appUserID: <my_app_user_id>});
```
```javascript Cordova
Purchases.setup(<public_sdk_key>, <my_app_user_id>);
```
```csharp Unity
// The appUserID can be set through the Unity Editor. 
// See Unity installation instructions https://docs.revenuecat.com/docs/unity

// If you'd like to do it programmatically instead, 
// make sure to check "Use runtime setup" in the Editor and then: 

Purchases.PurchasesConfiguration.Builder builder = Purchases.PurchasesConfiguration.Builder.Init("api_key");
Purchases.PurchasesConfiguration purchasesConfiguration =
    builder.SetUserDefaultsSuiteName("user_default")
    .SetDangerousSettings(new Purchases.DangerousSettings(false))
    .SetObserverMode(true)
    .SetUseAmazon(false)
    .SetAppUserId(appUserId)
    .Build();
purchases.Configure(purchasesConfiguration);
```

Often times, you may not have your own App User IDs until later in the application lifecycle. In these cases, you can pass the App User ID  later through the `.logIn()` method.

## Provide App User ID after configuration

If your app doesn't receive its own App User ID until later in its lifecycle, you can set (or change) the App User ID at any time by calling `.logIn()`. If the logged in identity does not already exist in RevenueCat, it will be created automatically. 

```swift 
// Configure Purchases on app launch
Purchases.configure(withAPIKey: <my_api_key>)

//...

// Later log in provided user Id
Purchases.shared.logIn(<my_app_user_id>) { (customerInfo, created, error) in
    // customerInfo updated for my_app_user_id
}
```
```objectivec 
// Configure Purchases on app launch
[RCPurchases configureWithAPIKey:@<my_api_key>];

//...

// Later log in provided user Id
[[RCPurchases sharedPurchases] logIn:@<my_app_user_id> completion:^(RCCustomerInfo *customerInfo, BOOL created, NSError *error) {
    // customerInfo updated for my_app_user_id
}];
```
```kotlin 
// Configure Purchases on app launch
Purchases.configure(PurchasesConfiguration.Builder(this, <api_key>).build())
  
//...

// Later log in provided user Id
Purchases.sharedInstance.loginWith(<my_app_user_id>, ::showError) { customerInfo, created ->
  // customerInfo updated for my_app_user_id
}
```
```java 
// Configure Purchases on app launch
Purchases.configure(new PurchasesConfiguration.Builder(context, <api_key>).build());

//...

// Later log in provided user Id
Purchases.getSharedInstance().logIn(<my_app_user_id>, new LogInCallback() {
	@Override
	public void onReceived(@NotNull CustomerInfo customerInfo, boolean created) {
		// customerInfo updated for my_app_user_id
	}
  
  @Override
  public void onError(@NotNull PurchasesError error) {

  }
});
```
```javascript Flutter
// Configure Purchases on app launch
await Purchases.configure(PurchasesConfiguration(<public_sdk_key>));

//...

// Later log in provided user Id
LogInResult result = await Purchases.logIn(<my_app_user_id>);
```
```javascript React Native
// Configure Purchases on app launch
Purchases.configure({apiKey: <public_sdk_key>});

//...

// Later log in provided user Id
const { customerInfo, created } = await Purchases.logIn(<my_app_user_id>);
// customerInfo updated for my_app_user_id
```
```javascript Cordova
// Configure Purchases on app launch
Purchases.setup(<public_sdk_key>);

//...

// Later log in provided user Id

Purchases.logIn(
  <my_app_user_id>, 
  ({ customerInfo, created }) => {
    // customerInfo updated for my_app_user_id
  },
  error => {
  }
);
```
```csharp Unity
// configure the SDK either through the Editor or through 
// programmatic setup (see section above), then:


var purchases = GetComponent<Purchases>();
purchases.LogIn(<myAppUserUD>, (customerInfo, created, error) =>
{
    if (error != null)
    {
        // show error
    }
    else
    {
        // show customerInfo
    }
});
```

#### `logIn()` method alias behavior

When logging in from an Anonymous ID to a provided custom App User ID, RevenueCat will decide whether the identities should be merged (aliased) into the same <<glossary:CustomerInfo>> object or not. This is decided depending on whether the provided custom App User ID already exists, and if it does exist whether it has an anonymous alias already.

| Current App User ID | Provided Custom App User ID already exists? | Provided Custom App User ID has anonymous alias? | Result                                                     |
| :------------------ | :------------------------------------------ | :----------------------------------------------- | :--------------------------------------------------------- |
| Anonymous           | No                                          | N/A                                              | Anonymous ID and Provided ID have CustomerInfo merged.     |
| Anonymous           | Yes                                         | No                                               | Anonymous ID and Provided ID have CustomerInfo merged.     |
| Anonymous           | Yes                                         | Yes                                              | CustomerInfo transfers to Provided ID, no aliases created. |
| Non-anonymous       | Any                                         | Any                                              | CustomerInfo transfers to Provided ID, no aliases created. |

# Logging Out

When an identified user logs out of your application you should call the `logOut()` method within the SDK. This will generate a new anonymous App User ID for the logged out state. However, if you plan to use only custom App User ID's, you can follow the [instructions here](https://www.revenuecat.com/docs/user-ids#how-to-only-use-custom-app-user-ids).

## Logging back in

To log in a new user, the provided App User ID should be set again with `.logIn()`.

## Switching accounts

If you need to switch from one provided App User ID to another, it's okay to call the `.logIn()` method directly - you do not need to call `logOut()` first.

# Sharing Subscriptions Across Apps and Platforms

Apps within the same RevenueCat [Project](doc:projects) share the same App User ID namespace, which means that they also share subscriptions. A user logged in to the same user ID in different apps of the same Project will have access to the same entitlements. This allows sharing of subscription status between different apps, even on different platforms. 

Note that anonymous App User IDs are not able to share subscription status across apps and platforms, so you'll need to identify with a custom App User ID via your own authentication system.

> 📘 Managing Subscriptions
> 
> A user can only [manage their subscription](doc:managing-subscriptions) on the platform it was purchased from.

# How to only use Custom App User IDs

To only use custom App User IDs, you must take care not to generate any anonymous App User IDs in the SDK. Anonymous App User IDs are generated when the SDK is configured without a provided custom App User ID, and are also created on `logOut()` as mentioned above. Many apps use a combination of anonymous App User IDs and their own custom App User IDs via an authentication system to provide flexibility in their user purchase flows. However, some applications are intended only to be used while using a known App User ID, without anonymous users at all. Some limits of anonymous IDs include added difficulty in personalization of user experiences, optimization of monetization strategies, and not being able to share subscriptions across platforms. Depending on the application's [transfer behavior](doc:restoring-purchases), a provided user's subscription may be transferred to an anonymous ID - which can only be brought back through a [restore](doc:restoring-purchases) on the original purchase platform.

In any case, to never see Anonymous IDs, you only need to make sure to do the following: Only configure the SDK with a custom App User ID, and never call `.logout()`.

## Only Configure the SDK with a custom App User ID

The most frequent place that anonymous App User IDs are created is when the SDK is first [configured](doc:configuring-sdk). Calling `.configure` on the SDK without providing a known user ID will cause the SDK to generate an Anonymous ID for the current user. To avoid anonymous IDs, you will need to identify the user’s ID, before configuring the SDK. Many applications use their own authentication system, often shared on multiple platforms, to identify users and provide their unique App User IDs.

## Do not Logout the User

After the user is logged in with a known App User ID, they may want to logout or switch accounts on your application - logout and then login with a different known ID. However, calling logout in the SDK will result in an anonymous App User ID being created. Simply do not logout the SDK. In the case of switching accounts, you can call login when the user logs in to the different account with their new App User ID.

# Tips for Setting App User IDs

| ℹ️ App User IDs Should Not Be Guessable                                                                                                                                         |
| :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| RevenueCat provides subscription status via the public API, having App User IDs that are easily guessed is not good. It is recommended to use a non-guessable pseudo-random ID. |

| ℹ️ Keep App User IDs shorter than 100 characters       |
| :----------------------------------------------------- |
| App User IDs should not be longer than 100 characters. |

| ⚠️ Don't set emails as App User IDs                                                                                     |
| :---------------------------------------------------------------------------------------------------------------------- |
| For the above reasons about guessability, and GDPR compliance, we don't recommend using email addresses as App User IDs |

| ⚠️ Don't set IDFA as App User IDs                                                                                                                            |
| :----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Advertising identifiers should not be used as App User IDs since they can be easily rotated and are not unique across users if limit ad tracking is enabled. |

[block:parameters]
{
  "data": {
    "h-0": "🚨 Don't hardcode strings as App User IDs",
    "0-0": "You should never hardcode a string as an App User ID, since every install will be treated as the same user in RevenueCat. **This will create problems and could unlock entitlements for users that haven't actually purchased.**  \n  \n**Every app user ID must be unique per user.** If you don't have your own user IDs for some of your users, you should not pass any value for the App User ID on configuration which will rely on the anonymous IDs created by RevenueCat."
  },
  "cols": 1,
  "rows": 1,
  "align": [
    "left"
  ]
}
[/block]

[block:parameters]
{
  "data": {
    "h-0": "🚨 Don't use blocked App User IDs",
    "0-0": "Certain App User IDs are blocked in RevenueCat. This is by design to help developers that may be unintentionally passing non-unique strings as user identifiers. The current block-list is:  \n`'no_user'`, `'null'`, `'none'`, `'nil'`, `'(null)'`, `'NaN`, `'\\x00'`(`NULL` character), `''`(empty string), `'unidentified'`, `'undefined'`, `'unknown'`, `'anonymous'`, `'guest'`, `'-1'`, `'0'`, `'[]'`, `'{}'`, `'[object Object]'` and any App User IDs containing the character `/`."
  },
  "cols": 1,
  "rows": 1,
  "align": [
    "left"
  ]
}
[/block]

# Next Steps

- Enrich your app by [reacting to the user's current subscription status ](doc:purchaserinfo)
- If you're moving to RevenueCat from another system, see our guide on [migrating your existing subscriptions ](doc:migrating-existing-subscriptions)
- Once you're ready to test your integration, you can follow our guides on [testing and debugging ](doc:debugging)
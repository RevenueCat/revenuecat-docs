---
title: Overview (v2)
slug: revenuecat-rest-api
hidden: false
createdAt: '2023-04-11T22:34:48.009Z'
updatedAt: '2023-04-28T00:36:19.795Z'
category: 64515c3b7df88700248e78b3
---
> 📘 New to RevenueCat?
> 
> Welcome! If you're adding subscriptions or other in-app purchases to your app, the RevenueCat SDK will handle most of the heavy-lifting without the need to interact with this API directly.
> 
> See our [Quickstart](doc:getting-started) for more information on getting started with RevenueCat.

> 📘 API v2 under development
> 
> REST API v2 is currently under development and does not yet cover all use cases from API v1. For those missing use cases, please use v1 in the meantime.

## About RevenueCat’s REST API

RevenueCat provides a REST API for developers to perform customer and transaction related actions from their own server. 

Most of this API is geared toward client usage via RevenueCat’s SDK, but there are various endpoints that can be used for refunding purchases, granting promotional entitlements, and other sensitive actions that can only be done via a Secret API key from your server.

## Should I use this REST API or the RevenueCat SDK?

If you’re adding subscriptions or other in-app purchases to your app for the first time or if you don’t have a backend that stores your user’s receipts, you’re probably looking to implement the [RevenueCat SDK](doc:installation).

If you want to start migrating your existing users to RevenueCat and you have your user’s receipts stored on your own server, or you want to check subscription status of your users from your own server, the REST API is a great solution.

## Authentication

Authentication for the RevenueCat REST API is achieved by setting the `Authorization` header with a valid API key. You'll find two types of API keys in your RevenueCat dashboard: _public_ and _secret_. 

Certain endpoints require secret keys, which should be kept out of any publicly accessible areas such as GitHub, client-side code, and so forth. See our [Authentication guide](doc:authentication) for more information.

```text Authorization Header
Authorization: Bearer YOUR_REVENUECAT_API_KEY
```



In order to utilize the RevenueCat API v2, please create new v2 secret keys and define your permissions.

## API v2 Permissions

You can create a new secret API key in your project settings page > API keys. Select _+ New_.

![](https://files.readme.io/c640edd-image.png)

Give it a name, select `V2` as the version, and set your permissions. Be sure to select _Generate_ at the top right corner.

![](https://files.readme.io/842f5ae-image.png)

Each endpoint in this documentation will contain a description informing you which permissions are required.

## Request Payload

The body of the `POST` requests should be encoded in JSON and have the 'Content-Type' header set to 'application/json'.

```text Content-Type Header
Content-Type: application/json
```



```json sample body
{
  "app_user_id": "user-1456",
  "fetch_token": "MQABC...EFH1234="
}
```



## Params

> 🚧 Encode Your URL Params
> 
> For URL params, such as the `app_user_id`, make sure you URL encode them before using them.

## Beta Interest

Our work on the APIs is not over yet. We are working on supporting a new and more consistent data model that will abstract away differences between the app stores. 

We’re also working on a more RESTful API that will allow GET operations without side effects. For example, being able to read customer information without unintentionally manipulating it. 

This will allow you to use customer endpoints without side effects of creating a new app user ID and provide you the necessary information about a customer’s subscription and purchase lifecycle.

We are looking for interested developers who want to take part in the beta program for our new REST APIs. Some key benefits of participating include:

- Being the first to gain access to our new APIs
- Being able to give feedback before launch

If you’re interested, please fill out this [Typeform](https://form.typeform.com/to/VltVNhW8) to join our waitlist and to share your use cases!
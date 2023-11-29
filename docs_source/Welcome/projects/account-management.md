---
title: Billing and account settings
slug: account-management
excerpt: Managing your account and changing plans
hidden: false
---
# Account Security & 2FA

Read more about account security and two-factor authentication in our [Account Security](doc:security) guide.

# Update your email or name

You can change your account email and name from your [account settings](https://app.revenuecat.com/settings/account) in the dashboard.

## Transfer account ownership

Projects can be transferred between RevenueCat accounts by following one of two processes:
1. If you are transferring all of the projects in your account, it is recommended that you change the email of the account to the new owner's email to give the new owner control over the account. If that's the case, use a new email. Please follow the instructions above for changing your account email.
2. If you want to transfer some but not all projects from your RevenueCat account to another RevenueCat account, [contact RevenueCat Support](https://app.revenuecat.com/settings/support) for assistance. Please note the following restrictions:
    - If your app uses Stripe and the receiving account also has Stripe apps, you need to transfer your Stripe account to them as well. RevenueCat supports only one Stripe account per developer account.
    - If your app uses the Apple Ad Services integration, the receiving developer needs to [update the public key](doc:apple-search-ads#advanced) in App Store Connect.
    - The receiving developer account must have a RevenueCat plan that has an equal or greater level of service than your account to ensure that all integrations continue working.

## How does billing work?

RevenueCat bills based on **Monthly Tracked Revenue**, or MTR, for each plan. MTR is different than Monthly Recurring Revenue, or MRR, and includes the revenue from all purchases and renewals including non-subscription products. You can see your account's current MTR [here](https://app.revenuecat.com/settings/billing).

Read more on our [Pricing](https://www.revenuecat.com/pricing) page.

## Tax & VAT details

Please reach out to [RevenueCat Support](https://app.revenuecat.com/settings/support) if you need Tax IDs or VAT information added to your invoices. 

> 📘 VAT updates apply to future invoices only
> 
> RevenueCat Support **cannot** add tax IDs and VAT information to invoices that have already been sent, and any added tax IDs and VAT information will only apply to **future** invoices.

## Address details

If needed, you can add additional address information to your invoices by clicking '**Update payment method**' and expanding the '**Invoice Details**' section: 

<img width="500" alt="update payment method button" src="https://github.com/RevenueCat/revenuecat-docs/assets/110489217/79b7b8e5-cb06-438d-91e9-9257c6921211">

<img width="500" alt="invoice details expanded" src="https://github.com/RevenueCat/revenuecat-docs/assets/110489217/a49a859b-1f45-438d-8b46-65e93ca4f48e">

# Delete your account

> ❗️ 
> 
> To delete your RevenueCat account, you'll first need to delete **all of your [Projects](doc:projects)**. Note that deleting any active Projects will prevent users from accessing their purchases via the RevenueCat SDK but **will not** cancel any of your customer's active subscriptions.
> 
> Once your projects have been deleted, reach out to RevenueCat Support via the dashboard [Contact Us](https://app.revenuecat.com/settings/support) form in your account settings and request your account to be deleted.

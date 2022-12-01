---
title: "Account Management"
slug: "account-management"
excerpt: "Managing your account and changing plans"
hidden: false
metadata: 
  title: "Account Management – RevenueCat"
  image: 
    0: "https://files.readme.io/a6df1d6-RevenueCat_Docs_OG.png"
    1: "RevenueCat Docs OG.png"
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: "2022-06-21T17:37:20.347Z"
updatedAt: "2022-06-21T18:13:46.035Z"
---
# Account Security & 2FA

Read more about account security and two-factor authentication in our [Account Security](doc:security) guide.

# Billing and plan changes

You can change your RevenueCat account plan from the [Billing](https://app.revenuecat.com/settings/billing) page in account settings. 

See available RevenueCat plans on our [Pricing](https://www.revenuecat.com/pricing) page.

## How does billing work?

RevenueCat bills based on **Monthly Tracked Revenue**, or MTR, for each plan. MTR is different than Monthly Recurring Revenue, or MRR, because Monthly Tracked Revenue includes all revenue from non-subscription products, like consumable or non-consumable purchases.

Read more on our [Pricing](https://www.revenuecat.com/pricing) page.

## Tax & VAT details
[block:callout]
{
  "type": "info",
  "title": "Applied to future invoices only",
  "body": "RevenueCat Support **cannot** add tax IDs and VAT information to invoices that have already been sent, and any added tax IDs and VAT information will only apply to **future** invoices."
}
[/block]
Please reach out to [RevenueCat Support](https://app.revenuecat.com/settings/support) if you need Tax IDs or VAT information added to your invoices. 

## Address details

Add additional address information to your invoices by clicking 'Update payment method' and expanding the 'Invoice Details' section: 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/507d16f-Screen_Shot_2022-06-21_at_1.46.26_PM.png",
        "Screen Shot 2022-06-21 at 1.46.26 PM.png",
        1292,
        858,
        "#ececec"
      ],
      "sizing": "80",
      "border": true
    }
  ]
}
[/block]
# Change your account email

You can change your account email in your [account settings](https://app.revenuecat.com/settings/account).

Please note you **cannot** change your account email to an email that has an existing RevenueCat account. In this case, you'll need to change the other account's email to an unused email first.

#### Example

**example1@test.com** wants to change their account email to **example2@test.com**, but **example2@test.com** already has a RevenueCat account.

**example2@test.com** must first change their email to an email address that isn't associated to an existing RevenueCat account, e.g. **example3@test.com**.

Once **example2@test.com** is changed to **example3@test.com**, **example1@test.com** can be changed to **example2@test.com**. 

# Transfer account ownership

To transfer a RevenueCat account to a different account, please follow the instructions above for changing your account email.

RevenueCat cannot transfer individual Projects between RevenueCat accounts at this time. If you anticipate needing to transfer ownership of a Project in the future, make a separate RevenueCat account to own that Project.

# Delete your account

To delete your RevenueCat account, you'll first need to delete **all of your [Projects](doc:projects)**. Note that deleting any active Projects will prevent users from accessing their purchases via the RevenueCat SDK but **will not** cancel any of your customer's active subscriptions.

Once your projects have been deleted, reach out to RevenueCat Support via the dashboard [Contact Us](https://app.revenuecat.com/settings/support) form in your account settings and request your account to be deleted.
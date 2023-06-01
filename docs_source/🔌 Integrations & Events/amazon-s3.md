---
title: Amazon S3 (OLD)
slug: amazon-s3
excerpt: Setting up S3 access keys for data transfer
hidden: true
metadata:
  title: S3 access keys for data transfer | RevenueCat
  description: The below steps outline how to create an Access Key in your AWS console
    that RevenueCat will need to complete data deliveries. We’re excited to do business
    together!
  image:
    0: https://files.readme.io/f79f02c-Reddit__E.jpg
    1: Reddit – E.jpg
    2: 1200
    3: 630
    4: "#fbabaf"
createdAt: '2020-10-07T00:35:55.719Z'
updatedAt: '2020-10-07T00:35:55.719Z'
category: 6478b86233165e07ab13013b
---
[block:callout]
{
  "type": "success",
  "body": "The S3 integration is only available on our [Grow](https://www.revenuecat.com/pricing) plan."
}
[/block]
RevenueCat can automatically send data deliveries of all of your apps' transaction data to an S3 bucket. These are in the form of .csv files delivered daily.

To start receiving these deliveries, you'll need the following details:
1. Access key ID
2. Secret access key
3. S3 bucket name

Once you have this information, you can add it to the S3 integration settings for your app in RevenueCat.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/d880595-Screen_Shot_2020-06-24_at_4.08.25_PM.png",
        "Screen Shot 2020-06-24 at 4.08.25 PM.png",
        1684,
        1120,
        "#f9f9fa"
      ],
      "caption": "S3 delivery configuration in RevenueCat dashboard"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "title": "Allow 24 hours for initial delivery",
  "body": "Once you've configured the S3 integration in RevenueCat, allow up to 24 hours before the first file is delivered."
}
[/block]
### Receive new and updated transactions only
When configuring the deliveries, you have the option to receive a full export daily or only new and updated transactions from the last export. The first delivery will *always* be a full export even if this option is selected.
[block:api-header]
{
  "title": "Transaction Format"
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "All dates and times are in UTC."
}
[/block]

[block:parameters]
{
  "data": {
    "h-0": "Header",
    "h-1": "Can be null",
    "h-2": "Comments",
    "0-0": "`rc_original_app_user_id`",
    "1-0": "`rc_last_seen_app_user_id_alias`",
    "2-0": "`product_identifier`",
    "3-0": "`start_time`",
    "4-0": "`end_time`",
    "5-0": "`store`",
    "6-0": "`is_auto_renewable`",
    "7-0": "`is_trial_period`",
    "8-0": "`is_in_intro_offer_period`",
    "9-0": "`is_sandbox`",
    "10-0": "`price_in_usd`",
    "11-0": "`takehome_percentage`",
    "12-0": "`store_transaction_id`",
    "13-0": "`original_store_transaction_id`",
    "14-0": "`refunded_at`",
    "15-0": "`unsubscribe_registered_at`",
    "16-0": "`billing_issues_detected_at`",
    "17-0": "`purchased_currency`",
    "18-0": "`price_in_purchased_currency`",
    "19-0": "`entitlement_identifier`",
    "20-0": "`renewal_number`",
    "21-0": "`is_trial_conversion`",
    "4-1": "✅",
    "10-1": "✅",
    "14-1": "✅",
    "15-1": "✅",
    "16-1": "✅",
    "17-1": "✅",
    "18-1": "✅",
    "19-1": "✅",
    "20-2": "Always starts at 1. Trial conversions are counted as renewals. `is_trial_conversion` is used to signify whether a transaction was a trial conversion.",
    "16-2": "When we detected billing issues, `null` if none was detected.",
    "15-2": "When we detected an unsubscribe (opt-out of auto renew)",
    "13-2": "orderId of first purchase or `original_transaction_id`. Can be used to find all related transactions for a single subscription.",
    "12-2": "orderId or transaction_identifier. **​Can be used as unique id**.",
    "11-2": "0.7 or 0.85. Use this to calculate the proceeds of a transaction.",
    "10-2": "The gross revenue generated from the transaction. All prices are converted to USD. Can be null if product prices haven't been collected from the user's device.",
    "4-2": "Expiration time of subscription. Null when `is_auto_renewable = false`\nFor Google Play, end_time can be before start_time to indicate an invalid transaction (e.g. billing issue).",
    "3-2": "Purchase time of transaction",
    "2-2": "Renamed from SKU. The product identifier that was purchased.",
    "1-2": "Renamed from `rc_last_seen_app_user_id`. Can be used together with `rc_original_app_user_id` to match transactions with user identifiers in your systems.",
    "0-2": "Renamed from `rc_app_user_id`. Can be used as a unique user identifier to find all of a user's transactions.",
    "6-2": "`true` for auto-renewable subscriptions, `false` otherwise.",
    "5-1": "",
    "5-2": "The source of the transaction. Can be `app_store`, `play_store`, `stripe`, or [`promotional`](doc:promotionals).",
    "7-2": "`true` if the transaction was a trial.",
    "8-2": "`true` if the transaction is in an introductory offer period.",
    "9-2": "`true` for transactions made in a [sandbox environment](doc:sandbox).",
    "14-2": "When a refund was detected, `null` if none was detected. Can be checked for existence to indicate transactions which have been refunded.",
    "17-2": "The currency that was used for the transaction.",
    "18-2": "The product's price in the currency that was used for the transaction.",
    "19-2": "The entitlement that the transaction unlocked or `null` if it didn't unlock any entitlements.",
    "21-2": "If `true`, this transaction is a trial conversion."
  },
  "cols": 3,
  "rows": 22
}
[/block]
### A note on transaction data
All transaction data is based on the store receipts that RevenueCat has received. Receipts often have inconsistencies and quirks which may need to be considered. For example:
- The expiration date of a purchase can be before the purchase date. This is Google's way of invalidating a transaction, for example when Google is unable to bill a user some time after a subscription renews. This doesn’t occur on iOS.
- Google returns only 90 days of recent transaction history, so some old transactions maybe missing if Google fetch tokens were imported.
- Apple and Google do not provide the transaction price directly, so we must rely on historical data for the products that we have. This isn’t 100% accurate in cases where the prices were changed or receipts were imported.
- Renewal numbers start at 1, even for trials. Trial conversions increase the renewal number.
- Data is pulled from a snapshot of the current receipt state, this means that the same transaction can be different from one delivery to another if something changed, e.g.refunds, and billing issues. You should recompute metrics for past time periods periodically to take these changes into account.

We try to normalize or at least annotate these quirks as much as possible, but by and large we consider receipts as the sources of truth, so any inconsistencies in the transaction data can always be traced back to the receipt
[block:api-header]
{
  "title": "Sample Queries"
}
[/block]

[block:file]
{"language":"sql","name":"Active Trials","file":"code_blocks/🔌 Integrations & Events/amazon-s3_1.sql"}
[/block]
[block:file]
{"language":"sql","name":"Active Subscriptions","file":"code_blocks/🔌 Integrations & Events/amazon-s3_2.sql"}
[/block]
[block:file]
{"language":"sql","name":"Revenue","file":"code_blocks/🔌 Integrations & Events/amazon-s3_3.sql"}
[/block]


[block:api-header]
{
  "title": "Creating Amazon S3 Credentials"
}
[/block]
The below steps outline how to create an Access Key in your AWS console that RevenueCat will need to complete data deliveries.

###1. Create Access Policy
You should only give RevenueCat access to the minimum resources necessary. To do this, create a new policy that only allows access to the S3 bucket where you want your deliveries to go.

Navigate to the IAM Policy dashboard in your AWS console and click **‘Create policy’**: https://console.aws.amazon.com/iam/home#/policies

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/e14f603-Screen_Shot_2019-07-10_at_7.08.18_AM.png",
        "Screen Shot 2019-07-10 at 7.08.18 AM.png",
        1704,
        622,
        "#eeeef0"
      ]
    }
  ]
}
[/block]
In the policy editor, switch to the JSON view and paste in the following code. Be sure to replace `revenuecat-deliveries` with the name of your bucket.
[block:file]
{"language":"json","name":"Access Policy","file":"code_blocks/🔌 Integrations & Events/amazon-s3_4.json"}
[/block]

This policy will allow RevenueCat to list the contents of your bucket, as well as read, write, delete files to it. When you've pasted in the code, click **Review policy***.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/e107a25-Screen_Shot_2019-07-17_at_2.19.37_PM.png",
        "Screen Shot 2019-07-17 at 2.19.37 PM.png",
        1225,
        936,
        "#faf9f6"
      ]
    }
  ]
}
[/block]
Finally, give the policy a name and description.


###2. Create IAM User
You'll next need to create an individual user that only has access to the policy you just created in Step 1. 

Navigate to the IAM User dashboard in your AWS console and click **Add user**: https://console.aws.amazon.com/iam/home#/users
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/f88e5d7-Screen_Shot_2019-07-10_at_6.52.59_AM.png",
        "Screen Shot 2019-07-10 at 6.52.59 AM.png",
        740,
        310,
        "#e6e2e5"
      ],
      "sizing": "smart",
      "border": false
    }
  ]
}
[/block]
Enter a **User name** and choose **Programmatic access**.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/4dca1f9-Screen_Shot_2019-07-10_at_6.53.47_AM.png",
        "Screen Shot 2019-07-10 at 6.53.47 AM.png",
        2038,
        1022,
        "#f9f8f8"
      ]
    }
  ]
}
[/block]
Choose the option to **Add user to a group**, and click **Create group**.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/b0cbff9-Screen_Shot_2019-07-10_at_6.54.48_AM.png",
        "Screen Shot 2019-07-10 at 6.54.48 AM.png",
        2004,
        848,
        "#f2f3f4"
      ]
    }
  ]
}
[/block]
**Select the Policy name you created from Step 1**, then click **Create group**.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/b6f169d-Screen_Shot_2019-07-10_at_7.06.58_AM.png",
        "Screen Shot 2019-07-10 at 7.06.58 AM.png",
        2364,
        980,
        "#f0f0f1"
      ]
    }
  ]
}
[/block]
Once the group is created, select it and click **Next**, optionally add any tags to the group.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/da89475-Screen_Shot_2019-07-10_at_7.10.38_AM.png",
        "Screen Shot 2019-07-10 at 7.10.38 AM.png",
        2014,
        1204,
        "#f3f5f5"
      ]
    }
  ]
}
[/block]
Review and click **Create user**.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/9a74401-Screen_Shot_2019-07-10_at_7.11.15_AM.png",
        "Screen Shot 2019-07-10 at 7.11.15 AM.png",
        1980,
        1216,
        "#f8f8f8"
      ]
    }
  ]
}
[/block]
Finally, you can download the secure access credentials or copy them from the dashboard.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/a46bfd2-Screen_Shot_2019-07-10_at_7.11.48_AM.png",
        "Screen Shot 2019-07-10 at 7.11.48 AM.png",
        2002,
        824,
        "#f2f4f1"
      ]
    }
  ]
}
[/block]
---
title: "S3 Access Keys"
slug: "aws-access-keys"
excerpt: "Setting up S3 access keys for data transfer"
hidden: false
createdAt: "2019-07-11T23:04:32.534Z"
updatedAt: "2019-07-17T21:26:44.673Z"
---
[block:callout]
{
  "type": "success",
  "body": "This guide is intended for RevenueCat partners that are receiving data via Amazon S3."
}
[/block]
The below steps outline how to create an Access Key in your AWS console that RevenueCat will need to complete data deliveries. We’re excited to do business together! 

##1. Create Access Policy
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
[block:code]
{
  "codes": [
    {
      "code": "{\n    \"Version\": \"2012-10-17\",\n    \"Statement\": [\n        {\n            \"Sid\": \"ListObjectsInBucket\",\n            \"Effect\": \"Allow\",\n            \"Action\": [\n                \"s3:ListBucket\"\n            ],\n            \"Resource\": [\n                \"arn:aws:s3:::revenuecat-deliveries\"\n            ]\n        },\n        {\n            \"Sid\": \"AllObjectActions\",\n            \"Effect\": \"Allow\",\n            \"Action\": \"s3:*Object\",\n            \"Resource\": [\n                \"arn:aws:s3:::revenuecat-deliveries/*\"\n            ]\n        }\n    ]\n}",
      "language": "json",
      "name": "Access Policy"
    }
  ]
}
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


##2. Create IAM User
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
Finally, securely share with your RevenueCat contact the:
- ** Access key ID**
- **Secret access key**
- **S3 bucket name**

You can securely transfer credentials via 1Password, LastPass or your preferred method.

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
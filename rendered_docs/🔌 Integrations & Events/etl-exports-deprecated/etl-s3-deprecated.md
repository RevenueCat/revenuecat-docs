---
title: Amazon S3
slug: etl-s3-deprecated
excerpt: Setting up S3 access keys for data transfer
hidden: true
metadata:
  title: Amazon S3 – RevenueCat
  description: Once you have this information, you can add it to the S3 integration
    settings for your app in RevenueCat.
  image:
    0: https://files.readme.io/9894d95-RevenueCat_Docs_OG.png
    1: RevenueCat Docs OG.png
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: '2020-10-02T02:49:29.429Z'
category: 648c78a54082791c882e2686
order: 0
parentDoc: 648c7ee7afbbbc001d6a0c53
updatedAt: '2023-06-16T16:42:06.895Z'
---
To start receiving these deliveries, you'll need the following details:
1. Access key ID
2. Secret access key
3. S3 bucket name

Once you have this information, you can add it to the S3 integration settings for your project in RevenueCat.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/832ce91-Screen_Shot_2021-12-01_at_12.32.04_PM.png",
        "Screen Shot 2021-12-01 at 12.32.04 PM.png",
        940,
        528,
        "#fbfbfb"
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
## Receive new and updated transactions only
When configuring the deliveries, you have the option to receive a full export daily or only new and updated transactions from the last export. The first delivery will *always* be a full export even if this option is selected.

# Creating Amazon S3 Credentials

The below steps outline how to create an Access Key in your AWS console that RevenueCat will need to complete data deliveries.

##1. Create Access Policy
You should only give RevenueCat access to the minimum resources necessary. To do this, create a new policy that only allows access to the S3 bucket where you want your deliveries to go.

Navigate to the IAM Policy dashboard in your AWS console and click **‘Create policy’**: https://console.aws.amazon.com/iam/home#/policies
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/e098c42-e14f603-Screen_Shot_2019-07-10_at_7.08.18_AM.png",
        "e14f603-Screen_Shot_2019-07-10_at_7.08.18_AM.png",
        1704,
        622,
        "#eeeef0"
      ]
    }
  ]
}
[/block]
In the policy editor, switch to the JSON view and paste in the following code. Be sure to replace `revenuecat-deliveries` with the name of your bucket.
```json Access Policy
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "ListObjectsInBucket",
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket"
            ],
            "Resource": [
                "arn:aws:s3:::revenuecat-deliveries"
            ]
        },
        {
            "Sid": "AllObjectActions",
            "Effect": "Allow",
            "Action": "s3:*Object",
            "Resource": [
                "arn:aws:s3:::revenuecat-deliveries/*"
            ]
        }
    ]
}
```

This policy will allow RevenueCat to list the contents of your bucket, as well as read, write, delete files to it. When you've pasted in the code, click **Review policy***.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/c0e73e9-e107a25-Screen_Shot_2019-07-17_at_2.19.37_PM.png",
        "e107a25-Screen_Shot_2019-07-17_at_2.19.37_PM.png",
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
        "https://files.readme.io/5cb11f9-f88e5d7-Screen_Shot_2019-07-10_at_6.52.59_AM.png",
        "f88e5d7-Screen_Shot_2019-07-10_at_6.52.59_AM.png",
        740,
        310,
        "#e6e2e5"
      ]
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
        "https://files.readme.io/267658d-4dca1f9-Screen_Shot_2019-07-10_at_6.53.47_AM.png",
        "4dca1f9-Screen_Shot_2019-07-10_at_6.53.47_AM.png",
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
        "https://files.readme.io/a6f1984-b0cbff9-Screen_Shot_2019-07-10_at_6.54.48_AM.png",
        "b0cbff9-Screen_Shot_2019-07-10_at_6.54.48_AM.png",
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
        "https://files.readme.io/128afb2-b6f169d-Screen_Shot_2019-07-10_at_7.06.58_AM.png",
        "b6f169d-Screen_Shot_2019-07-10_at_7.06.58_AM.png",
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
        "https://files.readme.io/fdd4b15-da89475-Screen_Shot_2019-07-10_at_7.10.38_AM.png",
        "da89475-Screen_Shot_2019-07-10_at_7.10.38_AM.png",
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
        "https://files.readme.io/123edce-9a74401-Screen_Shot_2019-07-10_at_7.11.15_AM.png",
        "9a74401-Screen_Shot_2019-07-10_at_7.11.15_AM.png",
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
        "https://files.readme.io/c861408-a46bfd2-Screen_Shot_2019-07-10_at_7.11.48_AM.png",
        "a46bfd2-Screen_Shot_2019-07-10_at_7.11.48_AM.png",
        2002,
        824,
        "#f2f4f1"
      ]
    }
  ]
}
[/block]
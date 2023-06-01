---
title: Amazon Store (beta)
slug: amazon-store-beta
hidden: true
createdAt: '2021-01-28T23:11:17.232Z'
updatedAt: '2021-11-16T15:48:23.637Z'
category: 6478b85cd5a60c15a01cee47
---
[block:api-header]
{
  "title": "Configuring the Products"
}
[/block]
To set up products for the Amazon Appstore, start by logging into your [Amazon developer account](https://developer.amazon.com/apps-and-games).

This guide assumes basic knowledge of the Amazon Appstore, as well as having an app set up and ready for adding in-app purchases. For more information, visit Amazon's [documentation and guides for Amazon Appstore](https://developer.amazon.com/documentation). 

### Create an In-App Purchase
To create an in-app purchase, go to [Amazon developer console](https://developer.amazon.com/dashboard) and select 'App List' under Amazon Appstore.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/1caf053-app_list.png",
        "app_list.png",
        806,
        476,
        "#000000"
      ],
      "sizing": "80"
    }
  ]
}
[/block]

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/cf73dad-app.png",
        "app.png",
        2078,
        632,
        "#000000"
      ],
      "sizing": "80"
    }
  ]
}
[/block]
In the sidebar, select **'In-App Items'**.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/9254d2c-in-app_items.png",
        "in-app_items.png",
        534,
        572,
        "#000000"
      ],
      "sizing": "80"
    }
  ]
}
[/block]
Click on **'+ Add Single IAP'**.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/c800dc2-add_iap.png",
        "add_iap.png",
        2098,
        1230,
        "#000000"
      ],
      "sizing": "80"
    }
  ]
}
[/block]
You will be presented with a dropdown where you select the type of in-app purchase you want to add to your app. We're going to show you how to set up a **Subscription** here, but the steps are similar for other types of in-app purchases.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/28999aa-iap_types.png",
        "iap_types.png",
        322,
        348,
        "#000000"
      ],
      "sizing": "80"
    }
  ]
}
[/block]
Next, you'll be asked to provide a **Subscription Title** and a **Subscription SKU**.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/af64f55-create_subscription.png",
        "create_subscription.png",
        990,
        574,
        "#000000"
      ],
      "sizing": "80"
    }
  ]
}
[/block]
* **Title**: The title is the title of your item and will not be seen by the customer. The name cannot be longer than 128 characters.
* **SKU**: The SKU is a unique string that will become the ID for the item. The SKU must be unique across all IAP items in all of your apps. Note that SKUs are case-sensitive, cannot be longer than 150 characters, and can contain the characters a-z, A-Z, 0-9, underscores, periods, and dashes. Since this is a subscription item, this SKU becomes the parent SKU for the subscription term SKUs that you will create later.

After you click 'Add Subscription', you will be directed to the item's Details page where you can configure the following additional data:
* **Description & Images**: A display name and description images for the item.
* **Subscription Terms** (Subscriptions only): Specify subscription length and free trial information for the item. This is where you also set price for the subscription.
* **Pricing** (Amazon's Consumables and Entitlements only): Set the price for the item.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/11998ba-description_images.png",
        "description_images.png",
        2030,
        1140,
        "#000000"
      ],
      "sizing": "80"
    }
  ]
}
[/block]
Under *Description & Images*, add a Display Title and Description. This is what your customers will see.

**(optional)**
* Update localization: Check off boxes for every language your app has been localized for.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/74616c3-update_localization.png",
        "update_localization.png",
        808,
        938,
        "#000000"
      ],
      "sizing": "80"
    }
  ]
}
[/block]
Add a Display Title and Description for every language.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/7414f6f-localization.png",
        "localization.png",
        2062,
        746,
        "#000000"
      ],
      "sizing": "80"
    }
  ]
}
[/block]
Next, add an **Icon** for every language you support.
* Small icon (114px x 114px)
* Large icon (512px x 512 px)

### Add Subscription Terms
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/26eb5df-terms.png",
        "terms.png",
        2040,
        282,
        "#000000"
      ],
      "sizing": "80"
    }
  ]
}
[/block]

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/2264040-blank_term.png",
        "blank_term.png",
        986,
        578,
        "#000000"
      ],
      "sizing": "80"
    }
  ]
}
[/block]
* **Term Period**: This starts on the date of purchase. Valid values are **Weekly**, **Bi-Weekly** (every two weeks), **Monthly**, **Bi-Monthly** (every two months), **Quarterly**, **Semi-Annually**) (every six months), or **Annually** (every twelve months).
* **Term SKU**: This is the SKU that corresponds to this subscription term. This SKU is a child SKU of the SKU that you entered in the item detail page. 

For the purpose of this example, we want to create an annual subscription that costs $49.99 with a 1 week free-trial
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/f7ef8ad-create_term.png",
        "create_term.png",
        990,
        576,
        "#000000"
      ],
      "sizing": "80"
    }
  ]
}
[/block]
#### Tips for creating robust term SKU

>**`<app>_<price>_<duration>_<free trial duration>0`** 

- **app:** Some prefix that will be unique to your app, since the same product Id cannot but used in any future apps you create. 
- **price:** The price you plan to charge for the product in your default currency.
- **duration:** The duration of the normal subscription period.
- **free trial duration:** The duration of the trial period, if any.

For example, using this format the identifier for a product that has a yearly subscription with a one week trial for $49.99 USD would be:
>**`rc_4999_1y_1w0`**
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/1ff8cd0-set_price.png",
        "set_price.png",
        2042,
        1290,
        "#000000"
      ],
      "sizing": "80"
    }
  ]
}
[/block]
* **Free Trial**: Specify an optional free trial period for the subscription. Valid values are No (no free trial), 7 days, 14 days, 1 month, 2 months, and 3 months.
* **Are you charging for this subscription?**: Yes, if you are charging for the subscription, No, if the subscription will be free.

If you specify Yes, a field displays allowing you to set the base price and currency for the item. After you set the base price, you will have the option of either manually setting the price for other currencies, or allowing the Amazon Appstore to set those prices for you, based on conversion rates and taxes. Valid prices (in USD) can either be $0.00 or range from $0.99 to $299.99.

If your app offers additional subscription periods, repeat this section for all terms your app provides, such as Weekly, Monthly, Bi-Annually, and so on.

Once you are ready, click on **'Submit IAP'** at the top of the page. If this button will remain greyed-out until you provide all of the required information for the in-app item.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/5578d30-submit_iap.png",
        "submit_iap.png",
        2044,
        654,
        "#000000"
      ],
      "sizing": "80"
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "Register your Amazon app"
}
[/block]
Currently, Amazon apps can only be configured in RevenueCat manually by our team. Reach out to your RevenueCat contact if you need assistance getting set up.

We will need the following items to configure your Amazon App:
* The RevenueCat Account Owner email address
* The name of your app in RevenueCat
* Amazon Shared Secret. Can be found [here](https://developer.amazon.com/sdk/shared-key.html).

If you have products configured and want to use RevenueCat [Offerings](doc:entitlements), please provide a .csv file with the following columns:
* `product_id`: The product SKU from Amazon
* `term_sku`: For any subscription product SKUs
* `offering_id`: The RevenueCat Offering you want the product to be attached to
* `entitlement_id`: The RevenueCat Entitlement you want the product to unlock
[block:api-header]
{
  "title": "Sandbox Testing"
}
[/block]
There are two options for sandbox testing: an Android device with the Amazon App Store installed (which can be downloaded [here](https://www.amazon.com/gp/mas/get/amazonapp)), or on an Amazon device running Fire OS, like a Fire TV.

There are three different testing environments in Amazon ([official docs](https://developer.amazon.com/docs/in-app-purchasing/iap-testing-overview.html)):
- Live App Testing. This is similar to a beta or TestFlight release. You create an APK, upload it to the Amazon App Store, add testers and start the test.
- App Tester. There's an app called App Tester that can be installed in your testing device and configured with a JSON to load testing products.
- Production.


[block:callout]
{
  "type": "warning",
  "title": "Purchase testing only available in the Live App Testing environment",
  "body": "While Offerings will load in the App Tester environment, **RevenueCat will only validate purchases in the Live App Testing environment**."
}
[/block]
We recommend starting by configuring the App Tester with the same products configured in the RevenueCat dashboard, which will let you get offerings and test how your paywall screen looks. 

When you're ready to test purchasing the products, start a Live App test with a debug APK and download the app in the device via the Amazon App Store. The installed app should be able to process the purchases and you can test the whole integration. You can also attach the Android Studio debugger to that debug APK downloaded from the Amazon App Store if needed.

### Live App Testing (LAT)

1. Submit your app to the [App Testing Service](https://developer.amazon.com/apps-and-games/test).
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/f701287-app_testing.png",
        "app_testing.png",
        820,
        544,
        "#000000"
      ]
    }
  ]
}
[/block]
* Submit the APK for your app to LAT.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/93bdcaa-drop_APK.png",
        "drop APK.png",
        562,
        440,
        "#000000"
      ]
    }
  ]
}
[/block]
2. Have your group of testers test your app via LAT:
* Go back to your developer dashboard and select your app from the **'App List'**. Here you will select **'Live App Testing'**.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/cbab3b9-LAT.png",
        "LAT.png",
        544,
        574,
        "#000000"
      ]
    }
  ]
}
[/block]

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/ed38e3b-start_test.png",
        "start_test.png",
        2004,
        896,
        "#000000"
      ],
      "sizing": "80"
    }
  ]
}
[/block]

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/70b62c2-confirm_test.png",
        "confirm_test.png",
        718,
        374,
        "#000000"
      ],
      "sizing": "80"
    }
  ]
}
[/block]
* Click on **'Live App Testing'** in the sidebar again, then click **'Manage testers'** to add your testers.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/d8b8f65-manage_testers.png",
        "manage_testers.png",
        764,
        516,
        "#000000"
      ],
      "sizing": "80"
    }
  ]
}
[/block]

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/5993e21-add_new_testers.png",
        "add_new_testers.png",
        1924,
        446,
        "#000000"
      ],
      "sizing": "80"
    }
  ]
}
[/block]

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/ef6f896-add_testers_button.png",
        "add_testers_button.png",
        2082,
        324,
        "#000000"
      ],
      "sizing": "80"
    }
  ]
}
[/block]

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/6ef789e-new_tester.png",
        "new_tester.png",
        1104,
        668,
        "#000000"
      ],
      "sizing": "80"
    }
  ]
}
[/block]
* Fill out the relevant details and click **'Save'**.

3. Return to **'Live App Testing'** and select **'Edit Testers'**.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/7487072-edit_testers.png",
        "edit_testers.png",
        1898,
        436,
        "#000000"
      ],
      "sizing": "80"
    }
  ]
}
[/block]
* Select the testers you want to test this app and hit **'Save'**.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/0524ef2-add_testers_1.png",
        "add_testers_1.png",
        1936,
        1120,
        "#000000"
      ],
      "sizing": "80"
    }
  ]
}
[/block]
4. After adding testers, select the three dots, and then click **'Submit'**.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/ed5a521-submit_testing.png",
        "submit_testing.png",
        1914,
        640,
        "#000000"
      ],
      "sizing": "80"
    }
  ]
}
[/block]
Once this is completed, testers will receive an email containing a link to your app's test page with instructions on how to download and install your app.

[block:api-header]
{
  "title": "Managing Subscriptions"
}
[/block]
Users can manage subscriptions through both the Amazon client and the Amazon website.

### Changing Products
Amazon does not support changing products.

### Cancel a Subscription
Once a subscription is purchased for a period, it is valid through that period and cannot be cancelled.

### Refunds
If a user has a valid reason for a pro-rated refund, they should contact Amazon customer service through the Contact Us link at [amazon.com](https://www.amazon.com)

### Price Changes
If you lower the price, new and current subscribers pay the new price (starting with their next payment). If you raise the price, only new subscribers pay the higher price.

[block:api-header]
{
  "title": "Event Generation"
}
[/block]
The following events are supported:
* initial purchase
* renewal
* cancellation
* uncancellation
* billing issues
* non-renewable purchase
* non-renewable cancellation
[block:api-header]
{
  "title": "Limitations"
}
[/block]
*  [Platform Server Notifications](doc:server-notifications) are not supported in Amazon Appstore.
* When performing a receipt import, the customer page of the subscriber will only have the most recent state.
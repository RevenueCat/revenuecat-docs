---
title: Creating Paywalls
slug: creating-paywalls
hidden: false
---

[block:embed]
{
  "html": "<iframe class=\"embedly-embed\" src=\"//cdn.embedly.com/widgets/media.html?src=https%3A%2F%2Fwww.youtube.com%2Fembed%2FPNiVCdExtkw%3Ffeature%3Doembed&display_name=YouTube&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DPNiVCdExtkw&image=https%3A%2F%2Fi.ytimg.com%2Fvi%2FPNiVCdExtkw%2Fhqdefault.jpg&key=7788cb384c9f4d5dbbdbeffd9fe4b92f&type=text%2Fhtml&schema=youtube\" width=\"854\" height=\"480\" scrolling=\"no\" title=\"YouTube embed\" frameborder=\"0\" allow=\"autoplay; fullscreen; encrypted-media; picture-in-picture;\" allowfullscreen=\"true\"></iframe>",
  "url": "https://www.youtube.com/watch?v=PNiVCdExtkw",
  "title": "How to use RevenueCat Paywalls",
  "favicon": "https://www.google.com/favicon.ico",
  "image": "https://i.ytimg.com/vi/PNiVCdExtkw/hqdefault.jpg",
  "provider": "https://www.youtube.com/",
  "href": "https://www.youtube.com/watch?v=PNiVCdExtkw",
  "typeOfEmbed": "youtube"
}
[/block]

# How to create a new Paywall

## Select an Offering

First, click on **Paywalls** in the **Products and pricing** section of the Project you’re working on.

<img width="250" alt="Products and pricing" src="https://files.readme.io/73e1721-Products_and_pricing.png">

Then, click **+ Add paywall** next to the Offering that you want to create a Paywall for.

<img width="600" alt="Add paywall" src="https://files.readme.io/5dba69c-Add_pricing.png">


> 📘 
> 
> If you’re looking to experiment with a new paywall, consider duplicating your default Offering and attaching your new paywall to the duplicated Offering.

## Select a template

The first thing to do when creating a new Paywall is to select the template you’ll use as the starting point. Templates may support different package setups, content layouts, image sizes, and much more; so we recommend browsing each template to pick the one that’s best suited for what you’re looking to accomplish with your paywall.

For example, if you’re trying to draw contrast between a few different packages you’re offering, try the **#2 - Sphynx** template. Or, if you want to try your own version of the [Blinkist Free Trial Paywall](https://uxplanet.org/how-solving-our-biggest-customer-complaint-at-blinkist-led-to-a-23-increase-in-conversion-b60ad514134b) start with the **#3 - Leopard** template.

# How to configure your Paywall

Once you’ve selected a template, you can configure any of its properties on the right side of the screen and see the change previewed immediately.

## Packages

Packages represent the individual products you want to serve a customer on your Paywall. You don’t necessarily need to display every package that’s available in your Offering, and some templates may only support displaying one or a limited number of packages, so be sure to choose a template that reflects the options you want to offer your customers.

For templates that support multiple packages, you should select packages in the order that you’d like them to display. Then, you can separately choose which package should be preselected for your customers by default.

> 📘 
> 
> To test the impact of that choice, you can duplicate your Offering, preselect a different package, and run an Experiment between the two Offerings to see how it influences customer behavior on your Paywall.

## Strings

How you describe your product has a huge impact on how likely a customer is to subscribe to it. Every descriptive string on our Paywall templates is fully configurable so you have control over exactly how you pitch your product.


> 📘 
> 
> Try using markdown formatting in any string property to add custom styling to your Paywall.

## Variables

For some Paywall strings you may want to set values based on the package that’s being displayed instead of hardcoding a single value, such as when quoting a price, or describing the duration of an Introductory Offer.

To make this easier and ensure accuracy, we recommend using **Variables** for these values that are package-specific.

For example, to show a CTA like “Try 7 Days Free & Subscribe”, you should instead use the **{{ sub_offer_duration }}** variable, and enter “Try {{ sub_offer_duration }} Free & Subscribe” to ensure the string is accurate for any product you use, even if you make changes to the nature of the offer in the future.

We support the following variables:

| Variable                  | Description                                                                                             | Example Value     |
| :------------------------ | :------------------------------------------------------------------------------------------------------ | :---------------- |
| product_name              | The name of the product from the store (e.g. product localized title from StoreKit) for a given package | CatGPT        |
| price                     | The localized price of a given package                                                                  | $39.99            |
| price_per_period          | The localized price of a given package with its period length if applicable                             | $39.99/yr         |
| total_price_and_per_month | The localized price of a given package with its monthly equivalent price if it has one                  | $39.99/yr ($3.33/mo) |
| sub_price_per_month       | The localized price of a given package converted to a monthly equivalent price                          | $3.33             |
| sub_duration              | The duration of the subscription; '1 month', '3 months', '1 year', etc.                                 | 1 year            |
| sub_duration_per_month    | The duration of the subscription in months; '3 months', '12 months', etc.                               | 12 months         |
| sub_period                | The length of each period of the standard offer on a given package                                      | Monthly           |
| sub_offer_duration        | The period of the introductory offer on a given package                                                 | 7 days               |
| sub_offer_duration_2      | The period of the second introductory offer on a given package (Google Play only)                       | 7 days               |
| sub_offer_price           | The localized price of the introductory offer of a given package                                        | $4.99                |
| sub_offer_price_2         | The localized price of the second introductory offer of a given package (Google Play only)              | $4.99                |

> 📘 
> 
> Click the **Show preview values** checkbox to see your Paywall with example preview values instead of the raw variables.

## Intro offer eligibility

RevenueCat Paywalls automatically check for Introductory Offer eligibility, and therefore for applicable fields like the **Call to action** and **Offer details** you can enter distinct strings based on the nature of the offer. For example, you may want to highlight the length of your free trial for a customer who is eligible for that Introductory Offer.

## Uploading images

Use the **Select a file** button for the applicable image to upload your own to use for your Paywall. We’ll center and scale the image to fit, regardless of its aspect ratio, so we recommend using source images that are appropriate for the area of the template they cover. We support .jpg, jpeg, and .png files up to 5MB.

## Colors

Use your own hex codes, select a custom color, or use our color picker to select background and text colors for each element that reflect your app’s branding.

> 📘 
> 
> The color picker can be used outside of your browser window as well if you need to grab colors from assets in other applications.

## Localization

RevenueCat Paywalls come with built-in support for localization. This will allow you to customize your paywall content for all the languages that your app supports.

Locales can be added to your paywall through the 'Localization' dropdown.

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/c53fb56-Screenshot_2023-08-31_at_3.51.13_PM.png",
        "",
        ""
      ],
      "align": "center"
    }
  ]
}
[/block]

Each paywall template may differ in the localized values that you will need to provide. The options that most templates have are:
- Title
- Subtitle
- Package details
- Package details for an introductory offer
- Call to action
- Call to action for an introductory offer

Since RevenueCatUI allows for dynamic text with [Variables](#variables), all the output of variables will automatically localized. This includes period lengths like "Annual", "Monthly" and "Weekly" being localized to "Anual", "Mensual", and "Semanalmente". Price per period like "$6.99/mo" and "$53.99/yr" will also be localized to "$6.99/m." and "$53.99/año".

Other paywall components like "Restore purchases", "Terms of Service", and "Privacy Policy" will also automatically be localized.

### Supported locales

We currently support all 39 locales that are supported on [App Store Connect](https://www.apple.com/ios/feature-availability/#system-language-system-language).

- Arabic (Saudi Arabia) - `ar`
- Catalan - `ca`
- Chinese (Simplified) - `zh`
- Chinese (Traditional) - `zh`
- Croatian - `hr`
- Czech - `cs`
- Danish - `da`
- Dutch (Netherlands) - `nl`
- English (Australia) - `en`
- English (Canada) - `en`
- English (United Kingdom) - `en`
- English (United States) - `en`
- Finnish - `fi`
- French (Canada) - `fr`
- French (France) - `fr`
- German (Germany) - `de`
- Greek - `el`
- Hebrew - `he`
- Hindi - `hi`
- Hungarian - `hu`
- Indonesian - `id`
- Italian - `it`
- Japanese - `ja`
- Korean - `ko`
- Malay - `ms`
- Norwegian - `no`
- Polish - `pl`
- Portuguese (Brazil) - `pt`
- Portuguese (Portugal) - `pt`
- Romanian - `ro`
- Russian - `ru`
- Slovak - `sk`
- Spanish (Mexico) - `es`
- Spanish (Spain) - `es`
- Swedish - `sv`
- Thai - `th`
- Turkish - `tr`
- Ukrainian - `uk`
- Vietnamese - `vi`

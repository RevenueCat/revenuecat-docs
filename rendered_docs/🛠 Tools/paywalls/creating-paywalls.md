---
title: Creating Paywalls
slug: creating-paywalls
hidden: true
parentDocSlug: paywalls
categorySlug: tools
---

## How to create a Paywall

### Select an Offering

First, click on **Paywalls** in the **Products and pricing** section of the Project you’re working on.

<img width="250" alt="Products and pricing" src="https://files.readme.io/73e1721-Products_and_pricing.png">

Then, click **+ Add paywall** next to the Offering that you want to create a Paywall for.

<img width="600" alt="Add paywall" src="https://files.readme.io/5dba69c-Add_pricing.png">


> 📘 
> 
> If you’re looking to experiment with a new paywall, consider duplicating your current Offering and attaching your new paywall to the duplicated Offering.

### Select a template

The first thing to do when creating a new Paywall is to select the template you’ll use as the starting point. Templates may support different package setups, content layouts, image sizes, and much more; so we recommend browsing each template to pick the one that’s best suited for what you’re looking to accomplish with your paywall.

For example, if you’re trying to draw contrast between a few different packages you’re offering, try the **#2 - Sphynx** template. Or, if you want to try your own version of the [Blinkist Free Trial Paywall](https://uxplanet.org/how-solving-our-biggest-customer-complaint-at-blinkist-led-to-a-23-increase-in-conversion-b60ad514134b) start with the **#3 - Leopard** template.

### Configure your Paywall

Once you’ve selected a template, you can configure any of its properties on the right side of the screen and see the change previewed immediately.

#### Packages

Packages represent the individual products you want to serve a customer on your Paywall. You don’t necessarily need to display every package that’s available in your Offering, and some templates may only support displaying one or a limited number of packages, so be sure to choose a template that reflects the options you want to offer your customers.

For templates that support multiple packages, you should select packages in the order that you’d like them to display. Then, you can separately choose which package should be preselected for your customers by default.

> 📘 
> 
> To test the impact of that choice, you can duplicate your Offering, preselect a different package, and run an Experiment between the two Offerings to see how it influences customer behavior on your Paywall.

#### Strings

How you describe your product has a huge impact on how likely a customer is to subscribe to it. Every descriptive string on our Paywall templates is fully configurable so you have control over exactly how you pitch your product


> 📘 
> 
> Try using markdown formatting in any string property to add custom styling to your Paywall.

#### Variables

For some Paywall strings you may want to set values based on the package that’s being displayed instead of hardcoding a single value, such as when quoting a price, or describing the duration of an Introductory Offer.

To make this easier and ensure accuracy, we recommend using **Variables** for these values that are package-specific.

For example, to show a CTA like “Try 7 Days Free & Subscribe”, you should instead use the **{{ sub_offer_duration }}** variable, and enter “Try {{ sub_offer_duration }} Free & Subscribe” to ensure the string is accurate for any product you use, even if you make changes to the nature of the offer in the future.

We support the following variables:

| Variable                  | Description                                                                                             | Example Value     |
| :------------------------ | :------------------------------------------------------------------------------------------------------ | :---------------- |
| product_name              | The name of the product from the store (e.g. product localized title from StoreKit) for a given package | CatGPT        |
| price                     | The localized price of a given package                                                                  | $39.99            |
| price_per_period          | The localized price of a given package with its period length if applicable                             | $39.99/yr         |
| total_price_and_per_month | The localized price of a given package with its monthly equivalent price if it has one                  | $39.99 ($1.67/mo) |
| sub_price_per_month       | The localized price of a given package converted to a monthly equivalent price                          | $3.33             |
| sub_duration              | The duration of the subscription; '1 month', '3 months', etc.                                           | 1 month           |
| sub_period                | The length of each period of the standard offer on a given package                                      | Monthly           |
| sub_offer_duration        | The period of the introductory offer on a given package                                                 | 7 days            |
| sub_offer_price           | The localized price of the introductory offer of a given package                                        | $4.99             |

> 📘 
> 
> Click the **Show preview values** checkbox to see your Paywall with example preview values instead of the raw variables.

#### Intro offer eligibility

RevenueCat Paywalls automatically check for Introductory Offer eligibility, and therefore for applicable fields like the **Call to action** and **Offer details** you can enter distinct strings based on the nature of the offer. For example, you may want to highlight the length of your free trial for a customer who is eligible for that Introductory Offer.

#### Uploading images

Use the **Select a file** button for the applicable image to upload your own to use for your Paywall. We’ll center and scale the image to fit, regardless of its aspect ratio, so we recommend using source images that are appropriate for the area of the template they cover. We support .jpg, jpeg, and .png files up to 5MB.

#### Colors

Use your own hex codes, select a custom color, or use our color picker to select background and text colors for each element that reflect your app’s branding.

> 📘 
> 
> The color picker can be used outside of your browser window as well if you need to grab colors from assets in other applications.

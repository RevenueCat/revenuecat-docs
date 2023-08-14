---
title: Offering metadata example use cases
slug: offering-metadata-examples
hidden: false
categorySlug: documentation
order: 999
parentDoc: 649983b4c31b2e000a3c1887
---
[Offering Metadata](doc:offering-metadata) can be utilized to create more flexible paywall experiences, target specific users with particular offerings, or make updates on the fly.  Below, we'll show some basic and advanced examples of how you can utilize offering metadata to change out the copy and button color, change the paywall description based on device language, and show a completely different paywall to customers who opened your app via a deeplink.

With the right setup, you can utilize this feature to make changes dynamically without having to push out a new app release every time you’d like to change something!

## Dynamic copy and display changes

One basic use case for this metadata is to change copy or graphic features on your paywall. This could be as simple as changing part of your header or the appearance of a button, or more significant appearance changes like swapping out a background. In this example, we’re swapping copy and button colors to see if a variation on our default appearance will result in more subscriptions.

Our control for our paywall is shown below.

<img width="400" alt="Our control paywall using default values" src="https://files.readme.io/05b8dd7-Color_Control.png">

In our current offerings, we add the metadata for the new button color and our description.

<img width="800" alt="Metadata featuring key/value pairs for description and button color overrides" src="https://files.readme.io/dea200b-Color_Experiment_Metadata.png">

In our app, we set up our code to modify the appearance of our paywall if these keys are present, or fall back to our defaults if an active offering doesn’t contain these values.

```kotlin 
// Changing the button color 
var backgroundColor = Color.parseColor(offering?.getMetadataString("button_color","#292929")

viewHolder.view.findViewById<CardView>(R.id.card_view).setCardBackgroundColor(backgroundColor))

// Changing the copy
var paywallCopy = offerings.current?.getMetadataString("description", "Go premium!")

root.findViewById<TextView>(R.id.description).text = paywallCopy
```

> 📘 
> 
> Always have a default set when utilizing offerings metadata to avoid errors and ensure a good user experience.

With this update live and our metadata set in our current offering, our paywall now looks like the below.

<img width="400" alt="Updated paywall using the new description and colors fed in via offering metadata" src="https://files.readme.io/86b4c8c-Color_Experiment.png">

While this is a fairly simple and straightforward change, this methodology can be used to change copy or visuals on the fly, or set up visual differences that can be used in conjunction with [Experiments](doc:experiments-v1) to see which versions are more effective!

## Localization

Rather than changing copy or appearance for all users, you may instead want to change things only for some users, such as in the case of wanting to localize the copy used. This still allows you to change the copy on the fly, but do so to account for elements like language.

Using the same base paywall as above, we’ll add some dynamic details for users who have their primary device language set to English or Spanish, with the default on the device itself used as the fallback, should a user have set a language not supported by our metadata.

In our metadata, we have set up keys and values for the languages and copy we want to use.

<img width="800" alt="Metadata featuring key/value pairs for English and Spanish descriptions" src="https://files.readme.io/61ebb05-Language_Metadata.png">

> 📘 
> 
> You can opt to set each of these as their own key/value pairs or pass through a JSON library instead. Keep in mind that there is a limit of 500 characters of JSON encoded key/value pairs, so for dynamic copy like this, it’s best to keep it to shorter headlines or blurbs of dynamic text, with longer copy hard coded as needed.

Within our app, we handle the logic to check the primary language set on the device, and look to see if we find a matching metadata key. Otherwise, we fall back to our default text.

```kotlin 
// Get the default device language
var lang = Locale.getDefault().displayLanguage

// Use the default device language as your metadata key
var localizedCopy = offerings.current?.getMetadataString(lang, "Go premium!")

root.findViewById<TextView>(R.id.description).text = localizedCopy
```

With this in place, a user whose device is set to English will see the below.

<img width="400" alt="Paywall with an overridden English description" src="https://files.readme.io/2ae2213-Language_English.png">

Meanwhile, a user whose device is set to Spanish will see this variation.

<img width="400" alt="Paywall with an overridden Spanish description" src="https://files.readme.io/2f92b3f-Language_Spanish.png">

This used in tandem with onboard localization options can ensure that your experiments or variations on offerings can be used in different regions or localizations based on user settings.

## Dynamic offering selection

There may be cases where you want to offer a specific set of products to a user or display a variation on your paywall based on user location, where the user came from, or other on-device information. Setting metadata in the desired offering and determining which to use based on this data will allow you to set up an offering on the fly and get it rolled out to users based on the values you’re already looking for within the app!

In this example case, we’re using a coupon code that was present on a deeplink that the user used to access the app, as you might use in a promotional email to a user who had signed up for an account but not subscribed yet. For this particular sale, we set our metadata to use the corresponding coupon code that would be passed into our app via this deeplink, along with corresponding copy.

<img width="800" alt="Metadata featuring key/value pairs for a coupon code and a custom description" src="https://files.readme.io/35e2d68-Coupon_Deeplink_Metadata.png">

In the app, we set up the logic to look for any offerings that have a matching coupon code.

```kotlin 
var selectedOffering = ""

// Search through all offerings to see if any have a matching coupon code
// Make sure to gate this with logic--there's no need to check through all offerings
// if there's no coupon code present for a user!

for (offering in offerings.all) {
    if (offering.value.getMetadataString("coupon", "") == couponCode) {
       offeringSelected = offering.key
       break
    }
}

// Fall back on the current offerings if no match was found
if (offeringSelected == "") {
    adapter.offering = offerings.current
} else {
    adapter.offering = offerings.getOffering(offeringSelected)
}
```

When we run the app and open it with a deeplink that contains the coupon code Summer2023, instead of our current offering that contains standard priced subscriptions, they’ll see the below paywall that includes our discounted ones.

<img width="400" alt="Paywall with a discounted offering set and altered description for the promotional offerings" src="https://files.readme.io/007f9fe-With_Coupon.png">

This sort of logic can be used to target users in a particular geo or audience for special offers, or could be used with any other qualifiers to ensure eligible users see the right offering set!

---
title: "Attribution"
slug: "attribution-card"
hidden: false
metadata: 
  title: "In-app purchase attribution report | RevenueCat"
  description: "If you're sending attribution information to RevenueCat through the Purchases SDK, we will display the latest information in the 'Attribution' card for the customer."
  image: 
    0: "https://files.readme.io/f20ad74-Reddit__E.jpg"
    1: "Reddit – E.jpg"
    2: 1200
    3: 630
    4: "#fbabaf"
createdAt: "2020-04-06T21:46:08.734Z"
updatedAt: "2020-06-24T20:47:45.281Z"
---
If you're sending attribution information to RevenueCat through the Purchases SDK, we will display the latest information from the network in the 'Attribution' card for the customer. If you're sending attribution data from multiple networks (e.g. Appsflyer and Apple Search Ads) only the first network will be displayed on the customer view.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/b05c1c9-Screen_Shot_2019-01-18_at_1.21.11_PM.png",
        "Screen Shot 2019-01-18 at 1.21.11 PM.png",
        370,
        272,
        "#f7f7f8"
      ]
    }
  ]
}
[/block]
Below are the possible attribution fields that can be displayed. Keep in mind that RevenueCat itself is not an attribution network, and will only display the information that available from the network you're using (e.g. Appsflyer, Adjust, etc.).
[block:parameters]
{
  "data": {
    "h-0": "Name",
    "h-1": "Description",
    "0-0": "Network",
    "4-0": "Creative",
    "1-0": "Campaign",
    "2-0": "Ad Group",
    "3-0": "Keywords",
    "0-1": "The ad network, such as Apple Search Ads or Facebook.",
    "1-1": "The campaign name from the network.",
    "2-1": "The ad group or ad set name from the network.",
    "3-1": "The keyword(s) from the network.",
    "4-1": "The individual ad/creative name or id from the network."
  },
  "cols": 2,
  "rows": 5
}
[/block]
See our [attribution integrations](doc:attribution) to start sending this information.
[block:api-header]
{
  "title": "Next Steps"
}
[/block]
* [Aliases :fa-arrow-right:](doc:aliases-card)
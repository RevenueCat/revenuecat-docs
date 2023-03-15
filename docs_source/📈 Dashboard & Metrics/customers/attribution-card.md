---
title: Attribution
slug: attribution-card
hidden: false
metadata:
  title: In-app purchase attribution – RevenueCat
  description: If you're sending attribution information to RevenueCat through the
    Purchases SDK, we will display the latest information in the 'Attribution' card
    for the customer.
  image:
    0: https://files.readme.io/d40e6e3-RevenueCat_Docs_OG.png
    1: RevenueCat Docs OG.png
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: '2020-04-06T21:46:08.734Z'
updatedAt: '2021-12-06T00:49:52.638Z'
category: 640a7bf126512c00308b2f8d
---
If you're sending attribution information to RevenueCat through the Purchases SDK, we will display the latest information from the network in the **Attribution** card for the customer. 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/85524ac-Screen_Shot_2020-09-17_at_11.38.26_AM.png",
        "Screen Shot 2020-09-17 at 11.38.26 AM.png",
        357,
        647,
        "#f8f8f8"
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
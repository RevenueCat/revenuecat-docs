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
updatedAt: '2023-04-04T20:53:23.472Z'
---
If you're sending attribution information to RevenueCat through the Purchases SDK, we will display the latest information from the network in the **Attribution** card for the customer. 

![](https://files.readme.io/818535d-app.revenuecat.com_customers_aec1bada_15343510_5.png)



Below are the possible attribution fields that can be displayed. Keep in mind that RevenueCat itself is not an attribution network, and will only display the information that available from the network you're using (e.g. Appsflyer, Adjust, etc.).

| Name     | Description                                             |
| :------- | :------------------------------------------------------ |
| Network  | The ad network, such as Apple Search Ads or Facebook.   |
| Campaign | The campaign name from the network.                     |
| Ad Group | The ad group or ad set name from the network.           |
| Keywords | The keyword(s) from the network.                        |
| Creative | The individual ad/creative name or id from the network. |

See our [attribution integrations](doc:attribution) to start sending this information.

## Next Steps

- [Aliases ](doc:aliases-card)
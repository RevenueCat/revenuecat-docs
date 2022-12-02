---
title: "Customer Details"
slug: "basic-information"
hidden: false
metadata: 
  title: "Customer Details – RevenueCat"
  description: "Basic customer information, including their total amount spent in your app, is presented at the top of the page."
  image: 
    0: "https://files.readme.io/f1c0ff6-60993e3c40039b67596bcc8c_slack-preview.png"
    1: "60993e3c40039b67596bcc8c_slack-preview.png"
    2: 1200
    3: 627
    4: "#f45476"
createdAt: "2020-04-06T21:46:10.813Z"
updatedAt: "2022-01-29T02:58:09.905Z"
---
Basic customer information, including their total amount spent in your app, is presented at the top of the page.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/0c9be2c-Screen_Shot_2020-06-01_at_7.30.07_AM.png",
        "Screen Shot 2020-06-01 at 7.30.07 AM.png",
        1896,
        506,
        "#fbfbfb"
      ]
    }
  ]
}
[/block]
* **Country:** displays the last seen IP address country for the user. Note that IP address is not persisted in RevenueCat - after the country is determined the IP address is dropped.
* **Total Spent:** displays the total USD equivalent of all purchases for this user and any aliases.
* **Last Opened** displays the last time this user or any aliases made a connection to RevenueCat servers.
* **User Since:** displays the time this App User ID was first created in RevenueCat.
[block:callout]
{
  "type": "info",
  "title": "Total Spent counts production purchases only",
  "body": "If a customer has only sandbox purchases, their Total Spent will be 0."
}
[/block]

[block:api-header]
{
  "title": "Next Steps"
}
[/block]
* [Customer History :fa-arrow-right:](doc:customer-history)
const paymentDiscount = await Purchases.getPaymentDiscount(product, product.discounts[0]);
if (paymentDiscount) {
  	// Payment discount fetched
}
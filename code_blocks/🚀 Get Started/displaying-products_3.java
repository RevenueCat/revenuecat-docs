// Accessing the monthly product

Purchases.getSharedInstance().getOfferings(new ReceiveOfferingsListener() {
  @Override
  public void onReceived(@NonNull Offerings offerings) {
    if (offerings.getCurrent() != null and offerings.getCurrent().monthly != null) {
      SkuDetails product = offerings.getCurrent().monthly.product;
      // Get the price and introductory period from the SkuDetails
    }
  }
  
  @Override
  public void onError(@NonNull PurchasesError error) {
    // An error occurred
  }
});
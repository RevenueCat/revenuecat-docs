Purchases.getSharedInstance().getOfferings(new ReceiveOfferingsListener() {
  @Override
  public void onReceived(@NonNull Offerings offerings) {
    if (offerings.get("experiment_group") != null) {
      List<Package> availablePackages = offerings.get("experiment_group").getAvailablePackages();
      // Display packages for sale
    }
  }
  
  @Override
  public void onError(@NonNull PurchasesError error) {
    // An error occurred
  }
});
Purchases.getSharedInstance().restorePurchases(new ReceiveCustomerInfoCallback() {
	@Override
	public void onReceived(@android.support.annotation.Nullable CustomerInfo customerInfo, @android.support.annotation.Nullable PurchasesError error) {
    //... check customerInfo to see if entitlement is now active 	
  }
});
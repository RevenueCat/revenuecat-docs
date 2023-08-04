Purchases.shared.purchase(package: package) { (transaction, customerInfo, error, userCancelled)
	if let customerInfo = customerInfo, error == nil {
		// validate the purchase with your server, and display content
	}
}

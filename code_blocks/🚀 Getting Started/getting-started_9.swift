// Using completion blocks
Purchases.shared.getOfferings { (offerings, error) in
	if let offerings = offerings {
	  // Display current offering with offerings.current
  }
}
// Using Swift Concurrency
do {
    let offerings = try await Purchases.shared.offerings()
    // Display current offering with offerings.current
} catch let error { 
    // handle error
}

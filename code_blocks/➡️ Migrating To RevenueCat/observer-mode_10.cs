// Called any time a purchase or restore 
// is successful in your existing code
var purchases = GetComponent<Purchases>();
purchases.SyncPurchases();
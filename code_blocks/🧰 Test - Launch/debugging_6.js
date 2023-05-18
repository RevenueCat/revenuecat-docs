await Purchases.setDebugLogsEnabled(true);
PurchasesConfiguration pc = PurchasesConfiguration(<public_sdk_key>);
await Purchases.configure(pc);
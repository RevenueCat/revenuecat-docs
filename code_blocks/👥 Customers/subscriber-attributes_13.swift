func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    Purchases.shared.setPushToken(deviceToken)
}
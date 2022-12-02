---
title: "iOS"
slug: "ios"
excerpt: "Instructions for integrating Purchases for iOS"
hidden: false
createdAt: "2018-06-11T03:48:40.275Z"
updatedAt: "2018-12-11T00:42:48.265Z"
---
[block:api-header]
{
  "title": "Installation"
}
[/block]
Purchases for iOS can be installed either via [CocoaPods](https://cocoapods.org/pods/Purchases) or [Carthage](https://github.com/Carthage/Carthage). 
[block:api-header]
{
  "title": "Install via CocoaPods"
}
[/block]
Add the following to your Podfile
[block:code]
{
  "codes": [
    {
      "code": "pod 'Purchases'",
      "language": "ruby",
      "name": "Podfile"
    }
  ]
}
[/block]
And then run:
[block:code]
{
  "codes": [
    {
      "code": "pod install",
      "language": "shell",
      "name": "Install the Pod"
    }
  ]
}
[/block]
This will add Purchases.framework to your workspace.
[block:api-header]
{
  "title": "Install via Carthage"
}
[/block]
Add the following to your Cartfile
[block:code]
{
  "codes": [
    {
      "code": "github \"revenuecat/purchases-ios\"",
      "language": "text",
      "name": "Cartfile"
    }
  ]
}
[/block]
The run carthage update
[block:code]
{
  "codes": [
    {
      "code": "carthage update --no-use-binaries",
      "language": "shell"
    }
  ]
}
[/block]
Make sure to include the `--no-use-binaries` to work around a bug in the most recent Carthage release.
[block:api-header]
{
  "title": "Setting up RCPurchases"
}
[/block]
`RCPurchases` should be created as soon as you have an App User ID. If you do not have your own user IDs provided by an account system, omit the `appUserID` parameter from the constructor and we'll create and cache one on the device for you. See  [User IDs](doc:user-ids) for more info.

You can get your API key from app settings in the [dashboard](https://app.revenuecat.com/apps/).
[block:code]
{
  "codes": [
    {
      "code": "import UIKit\n\nimport StoreKit\nimport Purchases\n\n\n@UIApplicationMain\nclass AppDelegate: UIResponder, UIApplicationDelegate {\n    var purchases: RCPurchases?\n    \n    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {\n        purchases = RCPurchases(apiKey: \"my_app_api_key\")\n        purchases!.delegate = self\n        return true\n    }\n}\n\nextension AppDelegate: RCPurchasesDelegate {\n    func purchases(_ purchases: RCPurchases, completedTransaction transaction: SKPaymentTransaction, withUpdatedInfo purchaserInfo: RCPurchaserInfo) {\n        // handlePurchaserInfo(purchaserInfo)\n    }\n    \n    func purchases(_ purchases: RCPurchases, receivedUpdatedPurchaserInfo purchaserInfo: RCPurchaserInfo) {\n        // handlePurchaserInfo(purchaserInfo)\n    }\n    \n    func purchases(_ purchases: RCPurchases, failedToUpdatePurchaserInfoWithError error: Error) {\n        // showError(error)\n    }\n    \n    func purchases(_ purchases: RCPurchases, failedTransaction transaction: SKPaymentTransaction, withReason failureReason: Error) {\n        // showError(failureReason)\n    }\n    \n    func purchases(_ purchases: RCPurchases, restoredTransactionsWith purchaserInfo: RCPurchaserInfo) {\n        // handlePurchaserInfo(purchaserInfo)\n    }\n    \n    func purchases(_ purchases: RCPurchases, failedToRestoreTransactionsWithError failureReason: Error) {\n        // showError(failureReason)\n    }\n}",
      "language": "swift"
    },
    {
      "code": "@import Purchases;\n\n@interface AppDelegate () <RCPurchasesDelegate>\n\n@property (nonatomic, readwrite) RCPurchases *purchases;\n\n@end\n\n@implementation AppDelegate\n\n\n- (BOOL)application:(UIApplication *)application\ndidFinishLaunchingWithOptions:(NSDictionary *)launchOptions {\n    \n    self.purchases = [[RCPurchases alloc] initWithAPIKey:@\"my_app_api_key\"];\n    self.purchases.delegate = self;\n    \n    return YES;\n}\n- (void)purchases:(RCPurchases *)purchases\ncompletedTransaction:(SKPaymentTransaction *)transaction\n  withUpdatedInfo:(RCPurchaserInfo *)purchaserInfo\n{\n    [self handleNewPurchaserInfo:purchaserInfo];\n}\n\n- (void)purchases:(RCPurchases *)purchases\nfailedTransaction:(SKPaymentTransaction *)transaction\n       withReason:(NSError *)failureReason\n{\n    [self showError];\n}\n\n- (void)purchases:(RCPurchases *)purchases\nreceivedUpdatedPurchaserInfo:(RCPurchaserInfo *)purchaserInfo\n{\n    // This method will be called on launch and when returning after a while\n    [self handleNewPurchaserInfo:purchaserInfo];\n}\n\n- (void)purchases:(nonnull RCPurchases *)purchases failedToUpdatePurchaserInfoWithError:(nonnull NSError *)error {\n    // Optionally handle error, usually when there is no connection\n}\n\n- (void)purchases:(RCPurchases *)purchases restoredTransactionsWithPurchaserInfo:(RCPurchaserInfo *)purchaserInfo {\n    [self handleNewPurchaserInfo:purchaserInfo];\n}\n\n- (void)purchases:(nonnull RCPurchases *)purchases failedToRestoreTransactionsWithError:(nonnull NSError *)error {\n    \n}\n\n@end\n",
      "language": "objectivec"
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "Displaying Available Products"
}
[/block]
Use entitlements to power your purchasing UI.
[block:code]
{
  "codes": [
    {
      "code": "func displayUpsellScreen() {\n    purchases?.entitlements({ (ents) in\n        let vc = UpsellController()\n        vc.entitlements = ents\n        presentViewController(vc, animated: true, completion: nil)\n    })\n}\n",
      "language": "swift"
    },
    {
      "code": "[self.purchases entitlements:^(NSDictionary<NSString *, RCEntitlement *> *entitlements) {\n  UpsellViewController *vc = [[UpsellViewController alloc] init];\n  vc.entitlements = entitlements;\n  [self presentViewController:vc animated:YES completion:nil];\n}];",
      "language": "objectivec"
    }
  ]
}
[/block]
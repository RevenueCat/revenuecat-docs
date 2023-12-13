import UIKit

import RevenueCat
import RevenueCatUI

class ViewController: UIViewController {

    @IBAction func presentPaywall() {
        let controller = PaywallViewController()
        controller.delegate = self

        present(controller, animated: true, completion: nil)
    }

}

extension ViewController: PaywallViewControllerDelegate {

    func paywallViewController(_ controller: PaywallViewController,
                               didFinishPurchasingWith customerInfo: CustomerInfo) {
        // When presenting paywalls manually, it's also
        // your responsponsibility to dismiss it when desired,
        // like when a purchase is completed.
        [controller dismissViewControllerAnimated: true completion:nil];
    }

}

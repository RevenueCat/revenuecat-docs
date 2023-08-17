import UIKit

import RevenueCat
import RevenueCatUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let paywallView = PaywallView(mode: .condensedCard) // or .card
        paywall.delegate = self

        let hostingController = UIHostingController(rootView: paywallView)

        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
    }

}

extension ViewController: PaywallViewControllerDelegate {

    func paywallViewController(_ controller: PaywallViewController,
                               didFinishPurchasingWith customerInfo: CustomerInfo) {

    }

}

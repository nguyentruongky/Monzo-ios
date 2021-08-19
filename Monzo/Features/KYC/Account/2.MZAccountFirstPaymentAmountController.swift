//  Created by Ky Nguyen

import UIKit

class MZAccountFirstPaymentAmountController: MZTextKycController {
    override var step: KycRouter.Step { .accountHowMuchFirstPayment }

    override func setData() {
        sectionLabel.text = "YOUR FINANCES"
        titleLabel.text = "Roughly how much will that first payment be?"
    }
}

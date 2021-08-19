//  Created by Ky Nguyen

import UIKit

class MZAccountAmountMonthlyController: MZTextKycController {
    override var step: KycRouter.Step { .accountHowMuchDepositMonthly }

    override func setData() {
        sectionLabel.text = "YOUR FINANCES"
        titleLabel.text = "Roughly how much money will come into your account each month?"
    }
}

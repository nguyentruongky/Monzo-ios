//  Created by Ky Nguyen

import UIKit

class MZAccountFistPaymentController: MZBaseListKycController {
    override var step: KycRouter.Step { .accountFirstPaymentFrom }

    override func setData() {
        sectionLabel.text = "YOUR ACCOUNT"
        titleLabel.text = "Where will the first payment into your account come from?"
        let sources = [
            "Salary payment from employer",
            "Bank transfer from account I own",
            "Bank transfer from another person or organisation",
            "Cash deposit",
            "Cheque deposit",
        ]
        listView.setData(stringArrays: sources)
    }
}

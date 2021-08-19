//  Created by Ky Nguyen

import UIKit

class MZIdentityReasonNoTaxNumber: MZTextKycController {
    override func setData() {
        titleLabel.text = "Reason for not having a Tax Identification Number (TIN)"
        textField.setView(.left, space: 16)
        textField.placeholder = "Reason"
        textField.setPlaceholderColor(UIColor(r: 112, g: 123, b: 137))

        nextButton.setTitle("Submit")
    }
}

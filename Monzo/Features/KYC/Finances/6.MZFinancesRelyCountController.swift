//  Created by Ky Nguyen

import UIKit

class MZFinancesRelyCountController: MZTextKycController {
    override func setData() {
        sectionLabel.text = "YOUR FINANCES"
        titleLabel.text = "How many people rely on you financially?"
    }
    
    override func setupView() {
        super.setupView()
        textField.setView(.left, space: 16)
    }
}

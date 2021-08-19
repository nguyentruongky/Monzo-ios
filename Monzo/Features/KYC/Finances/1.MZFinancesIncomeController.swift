//  Created by Ky Nguyen

import UIKit

class MZFinancesIncomeController: MZTextKycController {
    override var step: KycRouter.Step { .financesAnnualIncome }

    override func setData() {
        sectionLabel.text = "YOUR FINANCES"
        titleLabel.text = "What's your annual income before tax?"
        titleDescritionLabel.text = "Include any salaries, bonuses, benefits or other forms of income you're getting. If you don't know the exact amount, enter an average of your best guess."
    }
}

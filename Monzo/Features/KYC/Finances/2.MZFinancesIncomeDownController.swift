//  Created by Ky Nguyen

import UIKit

class MZFinancesIncomeDownController: MZBaseListKycController {
    override var step: KycRouter.Step { .financesAnnualIncome }

    override func setData() {
        sectionLabel.text = "YOUR FINANCES"
        titleLabel.text = "Is your total annual income likely to go down in the near future?"
        listView.setData(stringArrays: ["Yes", "No"])
    }
}

//  Created by Ky Nguyen

import UIKit

class MZFinancesRentingSpendController: MZTextKycController {
    override var step: KycRouter.Step { .financesHouseSpendingMonthly }

    override func setData() {
        sectionLabel.text = "YOUR FINANCES"
        titleLabel.text = "How much do you spend on rent each month?"
        titleDescritionLabel.text = "If you split the cost of renting with anyone else, only include your share"
    }
}

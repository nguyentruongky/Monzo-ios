//  Created by Ky Nguyen

import UIKit

class MZFinancesHousingController: MZBaseListKycController {
    override func setData() {
        sectionLabel.text = "YOUR FINANCES"
        titleLabel.text = "What's your housing status?"
        let statuses = [
            "Homeowner (with mortgage)",
            "Homeowner (no mortgage)",
            "Renting",
            "Living with family",
            "Other",
        ]
        listView.setData(stringArrays: statuses)
    }
}

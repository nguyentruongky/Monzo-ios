//  Created by Ky Nguyen

import UIKit

class MZFinancesRelyController: MZBaseListKycController {
    override func setData() {
        sectionLabel.text = "YOUR FINANCES"
        titleLabel.text = "Does anyone rely on you financially?"
        titleDescritionLabel.text = "For example, a partner, children or relatives"
        listView.setData(stringArrays: ["Yes", "No"])
    }
}

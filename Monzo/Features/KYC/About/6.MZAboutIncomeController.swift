//  Created by Ky Nguyen

import UIKit

class MZAboutIncomeController: MZBaseListKycController {
    override func setData() {
        sectionLabel.text = "ABOUT YOU"
        titleLabel.text = "Do you earn an income from any employment?"
        listView.setData(stringArrays: ["Yes", "No"])
    }
}

//  Created by Ky Nguyen

import UIKit

class MZAccountHowUseController: MZBaseListKycController {
    override func setData() {
        sectionLabel.text = "YOUR ACCOUNT"
        titleLabel.text = "How do you expect to use your Monzo account?"
        titleDescritionLabel.text = "Select all that apply"
        listView.isMultiChoice = true
        let purposes = [
            "Day-to-day spending",
            "Occasionally spending",
            "Paying bills",
            "Receiving a salary",
            "Saving",
            "Cryptocurrency",
        ]
        listView.setData(stringArrays: purposes)
    }
}

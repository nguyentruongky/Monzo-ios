//  Created by Ky Nguyen

import UIKit

class MZAboutRightController: MZBaseListKycController {
    override var step: KycRouter.Step { .aboutRightInUK }

    override func setData() {
        sectionLabel.text = "ABOUT YOU"
        titleLabel.text = "What rights do you have to live in the UK?"
        let rights = [
            "I have the right to live in the UK permanently",
            "I have the right to live in the UK temporarily",
            "I am in the UK on a visitor visa",
            "I don't have the right to live in the UK",
        ]
        listView.setData(stringArrays: rights)
    }    
}

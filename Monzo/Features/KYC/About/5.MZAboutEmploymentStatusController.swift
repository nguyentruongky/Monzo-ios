//  Created by Ky Nguyen

import UIKit

class MZAboutEmploymentStatusController: MZBaseListKycController {
    override var step: KycRouter.Step { .aboutEmploymentStatus }
    override func setData() {
        sectionLabel.text = "ABOUT YOU"
        titleLabel.text = "What's your employment status?"
        let statuses = [
            "Full-time",
            "Part-time",
            "Self-employed",
            "Unemployed",
            "Retired",
            "Student",
            "Not working due to illness/disabilityNot working due to illness/disability",
        ]
        listView.setData(stringArrays: statuses)
    }
    
    override func goNext() {
        guard let answer = answers.first?.title else { return }
        router.goNext(from: self, data: ["1": answer])
    }
}

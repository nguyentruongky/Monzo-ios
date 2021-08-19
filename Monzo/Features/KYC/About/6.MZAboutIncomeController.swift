//  Created by Ky Nguyen

import UIKit

class MZAboutIncomeController: MZBaseListKycController {
    override var step: KycRouter.Step { .aboutIncomeFromEmployment }
    
    override func setData() {
        sectionLabel.text = "ABOUT YOU"
        titleLabel.text = "Do you earn an income from any employment?"
        listView.setData(stringArrays: ["Yes", "No"])
    }
    
    override func goNext() {
        guard let answer = answers.first?.title.lowercased() else { return }
        let haveEmploymentIncome = answer == "yes"
        router.goNext(from: self, data: ["1": haveEmploymentIncome])
    }
}

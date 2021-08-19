//  Created by Ky Nguyen

import UIKit

class MZAccountTransferToCountryController: MZBaseListKycController {
    override var step: KycRouter.Step { .accountWhereTransfer }

    override func setData() {
        sectionLabel.text = "YOUR ACCOUNT"
        titleLabel.text = "Where will your international transfers come from and go to?"
        titleDescritionLabel.text = "Select all that apply"
        listView.isMultiChoice = true
        listView.setData(stringArrays: ["Austria",
                                        "Belgium",
                                        "Bulgaria",
                                        "Croatia",
                                        "Republic of Cyprus",
                                        "Czech Republic",
                                        "Denmark",
                                        "Estonia",
                                        "Finland",
                                        "France",
                                        "Germany",
                                        "Greece",
                                        "Hungary",
                                        "Ireland",
                                        "Italy",
                                        "Latvia",
                                        "Lithuania",
                                        "Luxembourg",
                                        "Malta",
                                        "Netherlands",
                                        "Poland",
                                        "Portugal",
                                        "Romania",
                                        "Slovakia",
                                        "Slovenia",
                                        "Spain",
                                        "Sweden"])
    }
}

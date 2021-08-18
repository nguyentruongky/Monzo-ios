//  Created by Ky Nguyen

import UIKit

class MZAboutPrimaryCitizenshipController: MZBaseListKycController {
    override func setData() {
        sectionLabel.text = "ABOUT YOU"
        titleLabel.text = "What's your primary citizenship?"
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

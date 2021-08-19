//  Created by Ky Nguyen

import UIKit

class MZIdentityCountryListController: MZBaseListKycController {
    override func setData() {
        title = "ID country or region"
        headerView.removeFromSuperview()
        footerView.removeFromSuperview()
        listView.removeFromSuperview()
        view.addSubviews(views: listView)
        listView.fillSuperviewSafeArea()
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

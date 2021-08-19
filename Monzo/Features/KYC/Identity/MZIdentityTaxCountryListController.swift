//  Created by Ky Nguyen

import UIKit

class MZIdentityTaxCountryListController: MZBaseListKycController {
    override func setData() {
        title = "Tax Residency"
        headerView.removeFromSuperview()
        listView.removeFromSuperview()
        
        view.addSubviews(views: titleDescritionLabel)
        titleDescritionLabel.text = "Please select all the countries that you're a tax resident in."
        titleDescritionLabel.textColor = .color999999
        titleDescritionLabel.textAlignment = .center
        titleDescritionLabel.horizontalSuperview(space: 16)
        titleDescritionLabel.topToSuperviewSafeArea(space: 24)
        
        view.addSubviews(views: listView)
        listView.isMultiChoice = true
        listView.horizontalSuperview()
        listView.verticalSpacing(toView: titleDescritionLabel, space: 32)
        listView.verticalSpacingDown(toView: footerView, space: -32)
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

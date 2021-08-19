//  Created by Ky Nguyen

import UIKit

class MZIdentityCountryListController: MZBaseListKycController {
    override var step: KycRouter.Step { .identityIdCountry }
    override func setData() {
        title = "ID country or region"
        headerView.removeFromSuperview()
        footerView.removeFromSuperview()
        listView.removeFromSuperview()
        listView.selectAction = { [weak self] items in
            self?.didSelectItems(items)
        }
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

    private func didSelectItems(_ items: [MZKycListItemModel]) {
        nextButton.isEnabled = items.isEmpty == false
        answers = items
        goNext()
    }

}

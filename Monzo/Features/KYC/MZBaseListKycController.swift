//  Created by Ky Nguyen

import UIKit

class MZBaseListKycController: MZBaseKycController {
    override func setupView() {
        super.setupView()
        let listView = MZKycListView()
        view.addSubviews(views: listView)
        listView.horizontalSuperview()
        listView.verticalSpacing(toView: headerView, space: 32)
        listView.verticalSpacingDown(toView: footerView, space: -32)
        
        
        
        
        
        listView.setData(stringArrays: ["United",
                                        "Brazil",
                                        "Mexico",
                                        "Colombia",
                                        "Argentina",
                                        "Canada",
                                        "Peru",
                                        "Venezuela",
                                        "Chile",
                                        "Ecuador",
                                        "Guatemala",
                                        "Bolivia",
                                        "Haiti",
                                        "Cuba",
                                        "Dominican",
                                        "Honduras",
                                        "Paraguay",
                                        "El",
                                        "Nicaragua",
                                        "Costa",
        ])
    }
}

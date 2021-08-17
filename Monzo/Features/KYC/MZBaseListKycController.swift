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
    }
}

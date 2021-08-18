//  Created by Ky Nguyen

import UIKit

class MZBaseListKycController: MZBaseKycController {
    let listView = MZKycListView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
    }
    override func setupView() {
        nextButton.isEnabled = false
        listView.selectAction = { [weak self] items in
            self?.didSelectItems(items)
        }
        super.setupView()
        nextButton.addTarget(self, action: #selector(goNext))
        
        view.addSubviews(views: listView)
        listView.horizontalSuperview()
        listView.verticalSpacing(toView: headerView, space: 32)
        listView.verticalSpacingDown(toView: footerView, space: -32)
    }
    
    @objc func goNext() { }
    func didSelectItems(_ items: [MZKycListItemModel]) {
        nextButton.isEnabled = items.isEmpty == false
    }
}

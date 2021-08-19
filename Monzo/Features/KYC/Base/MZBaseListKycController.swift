//  Created by Ky Nguyen

import UIKit

class MZBaseListKycController: MZBaseKycController {
    let listView = MZKycListView()
    var answers = [MZKycListItemModel]()
    
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
        
        view.addSubviews(views: listView)
        listView.horizontalSuperview()
        listView.verticalSpacing(toView: headerView, space: 32)
        listView.verticalSpacingDown(toView: footerView, space: -32)
    }
    
    private func didSelectItems(_ items: [MZKycListItemModel]) {
        nextButton.isEnabled = items.isEmpty == false
        answers = items
    }
    
    override func goNext() {
        if listView.isMultiChoice {
            router.goNext(from: self, data: answers.map { $0.title })
        } else {
            guard let answer = answers.first?.title else { return }
            router.goNext(from: self, data: answer)
        }
    }
}

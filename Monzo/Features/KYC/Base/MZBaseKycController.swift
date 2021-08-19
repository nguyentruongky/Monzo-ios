//  Created by Ky Nguyen

import UIKit

class MZBaseKycController: KNController {
    var step: KycRouter.Step {
        return .unknowned
    }
    let router = KycRouter.shared

    override var preferredStatusBarStyle: UIStatusBarStyle { .darkContent }
    let nextButton = UIButton(mainButtonWithTitle: "Next",
                              bgColor: .buttonBg,
                              titleColor: .white,
                              font: .boldSystemFont(ofSize: 18),
                              height: 48)
    let headerView = UIStackView(axis: .vertical, distributon: .fill, alignment: .fill, space: 8)
    let footerView = UIView(background: .secondaryBg)
    let sectionLabel = UILabel(font: .main(size: 15),
                               color: .color999999)
    let titleLabel = UILabel(font: .main(.bold, size: 28),
                             color: .white,
                             numberOfLines: 0)
    let titleDescritionLabel = UILabel(font: .main(size: 16),
                                       color: .color999999,
                                       numberOfLines: 0)
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.backButtonTitle = ""
    }

    override func setupView() {
        view.backgroundColor = .bg
        formatNavigationBar()
        addTitleToHeader()
        addFooterWithButton()
        nextButton.addTarget(self, action: #selector(goNext))
    }
    
    @objc func goNext() {
        router.goNext(from: self, data: [:])
    }
    func setData() {}
}

// MARK: - Component Builders
extension MZBaseKycController {
    func addFooterWithButton() {
        let bottomSpace = (UIScreen.bottomSpace > 0 ? UIScreen.bottomSpace : 0) + 16

        footerView.addSubviews(views: nextButton)
        nextButton.horizontalSuperview(space: 16)
        nextButton.topToSuperview(space: 16)
        nextButton.bottomToSuperview(space: -bottomSpace)

        view.addSubviews(views: footerView)
        footerView.horizontalSuperview()
        footerView.bottomToSuperview()
    }

    func addTitleToHeader() {
        headerView.addArrangeViews(views: sectionLabel, titleLabel, titleDescritionLabel)
        view.addSubviews(views: headerView)
        headerView.horizontalSuperview(space: 16)
        headerView.topToSuperviewSafeArea(space: 16)
    }

    func formatNavigationBar() {
        navigationController?.navigationBar.barTintColor = .bg
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }

}

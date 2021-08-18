//  Created by Ky Nguyen

import UIKit

class MZSectionListController: MZBaseKycController {
    var descriptionText: String {
        "Each section should only take a couple of minutes to complete"
    }
    
    var finishSteps: [String: Bool] {
        [:]
    }

    let sectionStackView = UIStackView(axis: .vertical, distributon: .fill, alignment: .fill, space: 16)
    override func setupView() {
        super.setupView()
        
        // Header
        headerView.removeFromSuperview()
        let descriptionLabel = UILabel(text: descriptionText,
                                       font: .main(size: 14),
                                       color: .white,
                                       numberOfLines: 0,
                                       alignment: .center)
        view.addSubviews(views: descriptionLabel)
        descriptionLabel.horizontalSuperview(space: 16)
        descriptionLabel.topToSuperviewSafeArea()
        
        // Body
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.addSubviews(views: sectionStackView)
        sectionStackView.fillSuperView()
        sectionStackView.centerXToSuperview()
        sectionStackView.width(toView: scrollView)
        
        view.addSubviews(views: scrollView)
        scrollView.horizontalSuperview(space: 16)
        scrollView.verticalSpacing(toView: descriptionLabel, space: 32)
        scrollView.verticalSpacingDown(toView: footerView, space: -88)
        
        setSectionData()
        
        // Footer
        nextButton.setTitle("Get started")
        
        let additionFooterView = UIView(background: .secondaryBg)
        let line = UIView(background: UIColor.color_88_192_85)
        additionFooterView.addSubviews(views: line)
        line.horizontalSuperview()
        line.topToSuperview()
        line.height(1)
        
        let privacyView = UIView(background: .color_58_68_86)
        privacyView.setCorner(radius: 10)
        additionFooterView.addSubviews(views: privacyView)
        privacyView.horizontalSuperview(space: 16)
        privacyView.topToSuperview(space: 16)
        privacyView.bottomToSuperview()
        
        let lockIcon = UIImageView(imageName: "lock")
        privacyView.addSubviews(views: lockIcon)
        lockIcon.leftToSuperview(space: 16)
        lockIcon.centerYToSuperview()
        lockIcon.square(edge: 16)
        
        let privacyText = "This won't affect your credit score, and we'll keep your information secure and confidential."
        let privacyLabel = UILabel(text: privacyText, font: .main(size: 13), color: .white, numberOfLines: 0)
        privacyView.addSubviews(views: privacyLabel)
        privacyLabel.leftHorizontalSpacing(toView: lockIcon, space: 16)
        privacyLabel.rightToSuperview(space: -16)
        privacyLabel.verticalSuperview(space: 16)
        
        view.addSubviews(views: additionFooterView)
        additionFooterView.horizontalSuperview()
        additionFooterView.verticalSpacingDown(toView: footerView, space: 0)
    }
    
    func setSectionData() {
        let about = SectionModel(
            iconName: "about_you_section",
            title: "About you",
            description: "Your citizenship and employment status",
            isChecked: finishSteps["about"] ?? false)
        let aboutSection = SectionView(section: about)
        sectionStackView.addArrangeViews(views: aboutSection)
        
        let finances = SectionModel(
            iconName: "finance_section",
            title: "Your finances",
            description: "Your income and committed spending",
            isChecked: finishSteps["finances"] ?? false)
        let financeSection = SectionView(section: finances)
        sectionStackView.addArrangeViews(views: financeSection)
        
        let account = SectionModel(
            iconName: "account_section",
            title: "Your account",
            description: "How you plan to use your Monzo account",
            isChecked: finishSteps["account"] ?? false)
        let accountSection = SectionView(section: account)
        sectionStackView.addArrangeViews(views: accountSection)
        
        let identity = SectionModel(
            iconName: "identity_section",
            title: "Your identity",
            description: "Checking to make sure you and your ID match",
            isChecked: finishSteps["identity"] ?? false)
        let identitySection = SectionView(section: identity)
        sectionStackView.addArrangeViews(views: identitySection)
    }
}

extension MZSectionListController {
    struct SectionModel {
        let iconName: String
        let title: String
        let description: String
        var isChecked: Bool = false
    }
    class SectionView: KNView {
        let imageView = UIImageView()
        let nameLabel = UILabel(font: .main(.semiBold, size: 20),
                                color: .white)
        let descriptionLabel = UILabel(font: .main(),
                                       color: .color_198_205_208,
                                       numberOfLines: 0)
        let checkIcon = UIImageView(imageName: "section_check", contentMode: .scaleAspectFit)
        
        override func setupView() {
            backgroundColor = .color_35_46_65
            setCorner(radius: 10)
            
            addSubviews(views: imageView)
            imageView.leftToSuperview(space: 16)
            imageView.centerYToSuperview()
            imageView.square(edge: 72)
            
            let stackView = UIStackView(axis: .vertical, distributon: .fill, alignment: .fill, space: 4)
            stackView.addArrangeViews(views: nameLabel, descriptionLabel)
            
            addSubviews(views: stackView)
            stackView.leftHorizontalSpacing(toView: imageView, space: 16)
            stackView.rightToSuperview(space: -52)
            stackView.centerYToSuperview()
            
            checkIcon.isHidden = true
            addSubviews(views: checkIcon)
            checkIcon.rightToSuperview(space: -16)
            checkIcon.square(edge: 20)
            checkIcon.centerYToSuperview()
            
            height(108)
        }
        
        convenience init(section: SectionModel) {
            self.init(frame: .zero)
            setData(section)
        }
        func setData(_ data: SectionModel) {
            imageView.image = UIImage(named: data.iconName)
            nameLabel.text = data.title
            descriptionLabel.text = data.description
            
            if data.isChecked {
                setBorder(width: 1, color: .color_88_192_85)
                checkIcon.isHidden = false
            }
        }
    }
}

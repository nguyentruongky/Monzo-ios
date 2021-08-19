//  Created by Ky Nguyen

import UIKit

class MZIdentityInstructionController: MZBaseKycController {
    override var step: KycRouter.Step { .identityInstruction }
    override func setupView() {
        super.setupView()
        setupBodyView()
        setupAdditionalFooterView()
        nextButton.setTitle("Get started")
    }
    
    func setupBodyView() {
        let contentView = UIView()
        view.addSubviews(views: contentView)
        contentView.horizontalSuperview()
        contentView.centerYToSuperview(space: -100)
        
        let bigImageView = UIImageView(imageName: "identity_instruction", contentMode: .scaleAspectFit)
        contentView.addSubviews(views: bigImageView)
        bigImageView.horizontalSuperview(space: 16)
        bigImageView.topToSuperview()
        bigImageView.height(150)
        
        let titleLabel = UILabel(
            text: "Verifying your identity",
            font: .main(.bold, size: 26),
            color: .white,
            alignment: .center)
        contentView.addSubviews(views: titleLabel)
        titleLabel.horizontalSuperview(space: 16)
        titleLabel.verticalSpacing(toView: bigImageView, space: 24)
        
        let description = "We need to check that you are who you say you are. Here's how it works."
        let descriptionLabel = UILabel(text: description,
                                       font: .main(size: 17),
                                       color: .white,
                                       numberOfLines: 0,
                                       alignment: .center)
        contentView.addSubviews(views: descriptionLabel)
        descriptionLabel.horizontal(toView: titleLabel)
        descriptionLabel.verticalSpacing(toView: titleLabel, space: 16)
        
        let idStep = createStepView(iconName: "profile", boldText: "Take a picture of a valid photo ID", text: "To check your personal information is correct")
        contentView.addSubviews(views: idStep)
        idStep.horizontalSuperview(space: 24)
        idStep.verticalSpacing(toView: descriptionLabel, space: 32)
        
        let videoStep = createStepView(iconName: "camera", boldText: "Record a short video of yourself", text: "To match your face to your ID photo.")
        contentView.addSubviews(views: videoStep)
        videoStep.horizontal(toView: idStep)
        videoStep.verticalSpacing(toView: idStep, space: 16)
        videoStep.bottomToSuperview()

    }
    
    func createStepView(iconName: String, boldText: String, text: String) -> UIView {
        let contentView = UIView()
        let iconImageView = UIImageView(imageName: iconName)
        contentView.addSubviews(views: iconImageView)
        iconImageView.leftToSuperview()
        iconImageView.topToSuperview()
        iconImageView.square(edge: 24)
        
        let stackView = UIStackView(axis: .vertical, distributon: .fillProportionally, alignment: .fill, space: 4)
        let boldLabel = UILabel(text: boldText, font: .main(.bold, size: 16), color: .white, numberOfLines: 1)
        stackView.addArrangeViews(views: boldLabel)
        
        let textLabel = UILabel(text: text, font: .main(size: 15), color: .white, numberOfLines: 0)
        stackView.addArrangeViews(views: textLabel)
        
        contentView.addSubviews(views: stackView)
        stackView.leftHorizontalSpacing(toView: iconImageView, space: 12)
        stackView.rightToSuperview()
        stackView.verticalSuperview()
        
        return contentView
    }
    
    func setupAdditionalFooterView() {
        let additionalFooterView = UIView(background: .secondaryBg)
        let line = UIView(background: UIColor.color_88_192_85)
        additionalFooterView.addSubviews(views: line)
        line.horizontalSuperview()
        line.topToSuperview()
        line.height(1)
        
        let privacyView = UIView(background: .color_35_46_65)
        privacyView.setCorner(radius: 10)
        additionalFooterView.addSubviews(views: privacyView)
        privacyView.horizontalSuperview(space: 16)
        privacyView.topToSuperview(space: 16)
        privacyView.bottomToSuperview()
        
        let lockIcon = UIImageView(imageName: "lock")
        privacyView.addSubviews(views: lockIcon)
        lockIcon.leftToSuperview(space: 16)
        lockIcon.centerYToSuperview()
        lockIcon.square(edge: 16)
        
        let privacyText = "Your info will be encrypted, stored securely, and only ever used to verify your identity"
        let privacyLabel = UILabel(text: privacyText, font: .main(size: 13), color: .white, numberOfLines: 0)
        privacyView.addSubviews(views: privacyLabel)
        privacyLabel.leftHorizontalSpacing(toView: lockIcon, space: 16)
        privacyLabel.rightToSuperview(space: -16)
        privacyLabel.verticalSuperview(space: 16)
        
        view.addSubviews(views: additionalFooterView)
        additionalFooterView.horizontalSuperview()
        additionalFooterView.verticalSpacingDown(toView: footerView, space: 0)

    }
}

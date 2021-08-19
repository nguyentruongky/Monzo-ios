//  Created by Ky Nguyen

import UIKit

class MZIdentityPhotoIdInstructionController: MZBaseKycController {
    override var step: KycRouter.Step { .identityTakePhotoInstruction }
    override func setupView() {
        super.setupView()
        title = "Verify your identity"
        setupBodyView()
        setupAdditionalFooterView()
        nextButton.setTitle("I'm ready")
    }
    
    func setupBodyView() {
        let contentView = UIView()
        view.addSubviews(views: contentView)
        contentView.horizontalSuperview()
        contentView.centerYToSuperview(space: -120)
        
        let bigImageView = UIImageView(imageName: "photo_id", contentMode: .scaleAspectFit)
        contentView.addSubviews(views: bigImageView)
        bigImageView.horizontalSuperview(space: 16)
        bigImageView.topToSuperview()
        bigImageView.height(150)
        
        let titleLabel = UILabel(
            text: "Take a picture of a valid photo ID",
            font: .main(.bold, size: 26),
            color: .white,
            numberOfLines: 2,
            alignment: .center)
        contentView.addSubviews(views: titleLabel)
        titleLabel.horizontalSuperview(space: 16)
        titleLabel.verticalSpacing(toView: bigImageView, space: 24)
        
        let description = "Like your passport, national ID, full or provisional drving license, checking that: "
        let descriptionLabel = UILabel(text: description,
                                       font: .main(size: 17),
                                       color: .color_198_205_208,
                                       numberOfLines: 0,
                                       alignment: .center)
        contentView.addSubviews(views: descriptionLabel)
        descriptionLabel.horizontal(toView: titleLabel)
        descriptionLabel.verticalSpacing(toView: titleLabel, space: 16)
        
        let stackView = UIStackView(axis: .vertical, distributon: .fill, alignment: .fill, space: 16)
        contentView.addSubviews(views: stackView)
        stackView.horizontal(toView: descriptionLabel, space: 24)
        stackView.verticalSpacing(toView: descriptionLabel, space: 32)
        stackView.bottomToSuperview()
        
        let expiredView = createStepView(text: "it hasn't expired")
        stackView.addViews(expiredView)
        
        let clearView = createStepView(text: "it's clear and easy to read")
        stackView.addViews(clearView)
        
        let fullPictureView = createStepView(text: "the whole ID is in the picture")
        stackView.addViews(fullPictureView)
    }
    
    func createStepView(text: String) -> UIView {
        let contentView = UIView()
        let iconImageView = UIImageView(imageName: "photo_id_check")
        contentView.addSubviews(views: iconImageView)
        iconImageView.leftToSuperview()
        iconImageView.topToSuperview()
        iconImageView.square(edge: 24)
        
        let textLabel = UILabel(text: text, font: .main(size: 15), color: .color_198_205_208, numberOfLines: 0)
        contentView.addSubviews(views: textLabel)
        textLabel.leftHorizontalSpacing(toView: iconImageView, space: 12)
        textLabel.rightToSuperview()
        textLabel.verticalSuperview()
        
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
    
    var selectedIDType: String? {
        didSet {
            if let type = selectedIDType {
                router.goNext(from: self, data: ["1": type])
            }
        }
    }
    
    override func goNext() {
        let vc = UIAlertController(title: nil, message: "What kind of ID would you like to use?", preferredStyle: .actionSheet)
    
        let actionNames = [
            "Passport",
            "Driving licence",
            "National identity card",
            "UK biometric residence permit"
        ]
        actionNames.forEach { title in
            vc.addAction(UIAlertAction(title: title, style: .default, handler: { [weak self] _ in
                self?.selectedIDType = title
            }))
        }
        
        vc.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(vc, animated: true)
    }
}

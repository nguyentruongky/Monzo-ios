//  Created by Ky Nguyen

import UIKit

class MZIdentityRecordInstructionController: MZBaseKycController {
    override var step: KycRouter.Step { .identityVideoInstruction }

    let muteButton = UIButton()
    
    override func setupView() {
        super.setupView()
        setupBodyView()
        setupAdditionalFooterView()
        nextButton.setTitle("I'm ready")
    }
    
    func setupBodyView() {
        let contentView = UIView()
        view.addSubviews(views: contentView)
        contentView.horizontalSuperview()
        contentView.centerYToSuperview(space: -120)
        
        let imageWidth = UIScreen.main.bounds.width - 32
        let bigImageView = UIImageView(imageName: "sample_video_screenshot", contentMode: .scaleAspectFit)
        contentView.addSubviews(views: bigImageView)
        bigImageView.square(edge: imageWidth)
        bigImageView.centerXToSuperview()
        bigImageView.topToSuperviewSafeArea()
        
        let titleLabel = UILabel(
            text: "Record a short video of yourself",
            font: .main(.bold, size: 26),
            color: .white,
            numberOfLines: 2,
            alignment: .center)
        contentView.addSubviews(views: titleLabel)
        titleLabel.horizontalSuperview(space: 16)
        titleLabel.verticalSpacing(toView: bigImageView, space: 24)
        
        let description = "Make sure we can see you clearly, then say the words that appear to camera, so we can match you to your photo ID.\n\nA member of our team may review your video."
        let descriptionLabel = UILabel(text: description,
                                       font: .main(size: 17),
                                       color: .color_198_205_208,
                                       numberOfLines: 0,
                                       alignment: .center)
        contentView.addSubviews(views: descriptionLabel)
        descriptionLabel.horizontal(toView: titleLabel)
        descriptionLabel.verticalSpacing(toView: titleLabel, space: 16)
        descriptionLabel.bottomToSuperview()
        
        addExampleTag(containerView: bigImageView)
    }
    
    func addExampleTag(containerView: UIView) {
        let exampleTag = UIButton(mainButtonWithTitle: "EXAMPLE", bgColor: .bg, titleColor: .white, font: .main(.semiBold, size: 15))
        exampleTag.contentEdgeInsets = UIEdgeInsets(left: 16, right: 16)
        exampleTag.setCorner(radius: 14)
        containerView.addSubviews(views: exampleTag)
        exampleTag.topLeft(toView: containerView, topSpace: 16, leftSpace: 16)
        exampleTag.height(28)
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
        
        let privacyText = "The video will be encrypted, stored securely, and only ever used to verify your identity"
        let privacyLabel = UILabel(text: privacyText, font: .main(size: 13), color: .white, numberOfLines: 0)
        privacyView.addSubviews(views: privacyLabel)
        privacyLabel.leftHorizontalSpacing(toView: lockIcon, space: 16)
        privacyLabel.rightToSuperview(space: -16)
        privacyLabel.verticalSuperview(space: 16)
        
        view.addSubviews(views: additionalFooterView)
        additionalFooterView.horizontalSuperview()
        additionalFooterView.verticalSpacingDown(toView: footerView, space: 0)
        
    }
    
    var selectedIDType: String?
}

//  Created by Ky Nguyen

import UIKit

class MZIdentityTaxUSController: MZBaseKycController {
    override func setupView() {
        super.setupView()
        headerView.removeFromSuperview()

        title = "Tax Residency"
        setupBodyView()
        setupFooter()
    }
    
    func setupBodyView() {
        let contentView = UIView()
        view.addSubviews(views: contentView)
        contentView.horizontalSuperview()
        contentView.centerYToSuperview(space: -120)
        
        let bigImageView = UIImageView(imageName: "us", contentMode: .scaleAspectFit)
        contentView.addSubviews(views: bigImageView)
        bigImageView.height(250)
        bigImageView.horizontalSuperview(space: 16)
        bigImageView.topToSuperview()
        
        let titleLabel = UILabel(
            text: "United States",
            font: .main(.bold, size: 26),
            color: .white,
            numberOfLines: 2,
            alignment: .center)
        contentView.addSubviews(views: titleLabel)
        titleLabel.horizontalSuperview(space: 16)
        titleLabel.verticalSpacing(toView: bigImageView, space: 24)
        
        let description = "Are you a citizen of the United States?"
        let descriptionLabel = UILabel(text: description,
                                       font: .main(size: 17),
                                       color: .color_198_205_208,
                                       numberOfLines: 0,
                                       alignment: .center)
        contentView.addSubviews(views: descriptionLabel)
        descriptionLabel.horizontal(toView: titleLabel)
        descriptionLabel.verticalSpacing(toView: titleLabel, space: 16)
        descriptionLabel.bottomToSuperview()
    }

    func setupFooter() {
        footerView.backgroundColor = .bg
        footerView.subviews.forEach { $0.removeFromSuperview() }
        footerView.height(200)
        
        nextButton.setTitle("I'm a US Citizen")
        footerView.addSubviews(views: nextButton)
        nextButton.horizontalSuperview(space: 16)
        nextButton.bottom(toAnchor: footerView.centerYAnchor, space: 4)
        
        let notButton = UIButton(title: "I'm Not a US Citizen", titleColor: .color_78_157_207, font: .main(size: 15))
        footerView.addSubviews(views: notButton)
        notButton.centerXToSuperview()
        notButton.verticalSpacing(toView: nextButton, space: 16)
    }
}

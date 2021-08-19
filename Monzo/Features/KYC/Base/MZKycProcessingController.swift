//  Created by Ky Nguyen

import UIKit

class MZKycProcessingController: MZBaseKycController {
    override func setupView() {
        super.setupView()
        footerView.removeFromSuperview()
        
        let contentView = UIView()
        view.addSubviews(views: contentView)
        contentView.horizontalSuperview()
        contentView.centerYToSuperview(space: -32)
        
        let bigImageView = UIImageView(imageName: "verifying", contentMode: .scaleAspectFit)
        contentView.addSubviews(views: bigImageView)
        bigImageView.horizontalSuperview(space: 16)
        bigImageView.topToSuperview()
        bigImageView.height(150)
        
        let titleLabel = UILabel(
            text: "We're verifying your account information",
            font: .main(.bold, size: 26),
            color: .white,
            numberOfLines: 2,
            alignment: .center)
        contentView.addSubviews(views: titleLabel)
        titleLabel.horizontalSuperview(space: 16)
        titleLabel.verticalSpacing(toView: bigImageView, space: 24)
        
        let description = "This usually takes between 5 minutes and an hour, but can sometimes take up to 48 hours. \nPlease check back later."
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
    }
}

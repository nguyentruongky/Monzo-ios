//  Created by Ky Nguyen

import UIKit

class MZKycLandingController: MZBaseKycController {
    override func setupView() {
        super.setupView()
        
        headerView.removeFromSuperview()
        
        let imageView = UIImageView(imageName: "kyc_landing")
        let introductionLabel = UILabel(text: "We need to know a bit more about you",
                                        font: .main(.bold, size: 22),
                                        color: .white,
                                        numberOfLines: 0,
                                        alignment: .center)
        
        let descriptionText1 = "As a regulated bank, we need to get to know you a bit before you can open an account."
        let descriptionLabel1 = UILabel(text: descriptionText1,
                                        font: .main(size: 14),
                                        color: .color_198_205_208,
                                        numberOfLines: 0,
                                        alignment: .center)
        
        let descriptionText2 = "It should take around 5 minutes to answer the questions, and we'll save your progress after each section so you can come back to it."
        let descriptionLabel2 = UILabel(text: descriptionText2,
                                        font: .main(size: 14),
                                        color: .color_198_205_208,
                                        numberOfLines: 0,
                                        alignment: .center)
        
        imageView.square(edge: 180)
        let stackView = UIStackView(axis: .vertical, distributon: .fill, alignment: .center, space: 24)
        stackView.addArrangeViews(views: imageView, introductionLabel, descriptionLabel1, descriptionLabel2)
        
        view.addSubviews(views: stackView)
        stackView.horizontalSuperview(space: 16)
        stackView.centerYToSuperview(space: -44)
        
        footerView.backgroundColor = .clear
    }
}

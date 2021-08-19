//  Created by Ky Nguyen

import UIKit

class MZIdentityTaxSelectedCountryController: MZBaseKycController {
    let flagTextField = UITextField()
    let numberTextField = UITextField(placeholder: "NRIC Numbe/FIN", font: .main(), color: .white)
    override func setupView() {
        super.setupView()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
        title = "Tax Residency"
        titleDescritionLabel.text = "We need a final bit of information to understand your Singapore tax residency"
        titleDescritionLabel.textAlignment = .center
        titleDescritionLabel.textColor = .color_198_205_208
        
        setupBodyView()
        setupFooterView()
    }
    
    func setupBodyView() {
        addHelpButtonToNumberTextField()
        
        let textStackView = UIStackView(axis: .vertical, distributon: .fillProportionally, alignment: .fill, space: 6)
        textStackView.addArrangeViews(views: numberTextField)
        
        let line = UIView(background: UIColor(r: 93, g: 98, b: 117))
        line.height(1)
        textStackView.addArrangeViews(views: line)
        
        let useTaxNumberButton = UIButton(title: "Use my Tax Reference Number", titleColor: .color_58_124_164, font: .main())
        useTaxNumberButton.contentHorizontalAlignment = .left
        textStackView.addArrangeViews(views: useTaxNumberButton)
        
        flagTextField.isEnabled = false
        flagTextField.text = "🇨🇦"
        flagTextField.font = .main(size: 24)
        
        let bodyView = UIView()
        bodyView.addSubviews(views: flagTextField, textStackView)
        bodyView.stackHorizontally(views: [flagTextField, textStackView], viewSpaces: 16, leftSpace: 16, rightSpace: 0)
        flagTextField.topToSuperview()
        flagTextField.width(32)
        textStackView.verticalSuperview()
        
        view.addSubviews(views: bodyView)
        bodyView.leftToSuperview()
        bodyView.rightToSuperview()
        bodyView.verticalSpacing(toView: headerView, space: 48)
    }
    
    func addHelpButtonToNumberTextField() {
        numberTextField.setPlaceholderColor(UIColor(r: 112, g: 123, b: 137))
        let helpButton = UIImageView(imageName: "help")
        numberTextField.addSubviews(views: helpButton)
        helpButton.square(edge: 40)
        helpButton.rightToSuperview(space: -16)
        helpButton.bottomToSuperview(space: 2)
        helpButton.isUserInteractionEnabled = true
        helpButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showInformation)))
    }
    
    func setupFooterView() {
        footerView.backgroundColor = .bg
        let additionalFooterView = UIView(background: .bg)
        
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
        
        let privacyText = "We'll encrypt your NRIC Numbe / FIN and store it securely"
        let privacyLabel = UILabel(text: privacyText, font: .main(size: 13), color: .white, numberOfLines: 0)
        privacyView.addSubviews(views: privacyLabel)
        privacyLabel.leftHorizontalSpacing(toView: lockIcon, space: 16)
        privacyLabel.rightToSuperview(space: -16)
        privacyLabel.verticalSuperview(space: 16)

        view.addSubviews(views: additionalFooterView)
        additionalFooterView.horizontalSuperview()
        additionalFooterView.verticalSpacingDown(toView: footerView, space: 0)
        
        nextButton.removeFromSuperview()
        footerView.addSubviews(views: nextButton)
        nextButton.horizontalSuperview(space: 16)
        nextButton.topToSuperview(space: 16)
        
        let notButton = UIButton(title: "I don't have either", titleColor: .color_58_124_164, font: .main(size: 18))
        footerView.addSubviews(views: notButton)
        notButton.centerXToSuperview()
        notButton.verticalSpacing(toView: nextButton, space: 12)
        notButton.bottomToSuperviewSafeArea(space: -16)
        notButton.addTarget(self, action: #selector(showReasonNotHavingNumber))
    }

    @objc func showInformation() {
        let vc = UIAlertController(title: "NRIC Numbe / FIN", message: "Enter a valid NRIC Number / FIN, e.g. S1234567A", preferredStyle: .alert)
        vc.addAction(UIAlertAction(title: "OK", style: .default))
        present(vc, animated: true)
    }
    
    @objc func showReasonNotHavingNumber() {
        let vc = UIAlertController(title: nil, message: "Reason for not having a Tax Identification Number", preferredStyle: .actionSheet)
        let reasons = [
            "It hasn't been issued yet",
            "Other"
        ]
        
        reasons.forEach { reason in
            vc.addAction(UIAlertAction(title: reason, style: .default,
                                       handler: { [weak self] _ in self?.didSelectReasonNotHavingANumber(reason: reason)
                                       })
            )
        }
        
        vc.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(vc, animated: true)
    }
    
    func didSelectReasonNotHavingANumber(reason: String) {
        print(reason)
    }
}

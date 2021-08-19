//  Created by Ky Nguyen

import UIKit

class MZTextKycController: MZBaseKycController {
    let textField = UITextField(font: .main(size: 15), color: .white)
    
    override func setupView() {
        super.setupView()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
        addCurrencyTextField()
    }
    
    func addCurrencyTextField() {
        textField.backgroundColor = .secondaryBg
        textField.setCorner(radius: 5)
        view.addSubviews(views: textField)
        textField.horizontalSuperview(space: 16)
        textField.verticalSpacing(toView: headerView, space: 32)
        textField.height(48)
        textField.inputAccessoryView = inputAccessoryView
        textField.setView(.left, title: "£", space: 16)
        textField.delegate = self
    }
    
    lazy var accessoryView: UIView = { [weak self] in
        guard let self = self else { return UIView() }
        
        let bottomSpace = (UIScreen.bottomSpace > 0 ? UIScreen.bottomSpace : 0) + 16
        let viewHeight = 48 + 16 + bottomSpace
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: viewHeight))
        view.addSubviews(views: self.footerView)
        self.footerView.fillSuperView()
        return view
    }()

    override var canBecomeFirstResponder: Bool { true }
    
    override func hideKeyboard() {
        if isFirstResponder { return }
        super.hideKeyboard()
    }
    
    override var inputAccessoryView: UIView? { accessoryView }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
        nextButton.isEnabled = textField.text?.isEmpty == false
    }
    
    override func goNext() {
        guard let answer = textField.text else { return }
        router.goNext(from: self, data: ["1": answer])
    }
}

extension MZTextKycController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string)
        nextButton.isEnabled = newText?.isEmpty == false
        return true
    }
}

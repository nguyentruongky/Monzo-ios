//  Created by Ky Nguyen

import UIKit

class MZAboutRightExpirationController: MZBaseKycController {
    let datePicker = UIDatePicker()
    override func setupView() {
        super.setupView()
        sectionLabel.text = "ABOUT YOU"
        titleLabel.text = "When does your right to live in the UK end?"
        titleDescritionLabel.text = "If you don't know the exact date, use the first of the month"
        
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        datePicker.setValue(false, forKeyPath: "highlightsToday")
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
        datePicker.tintAdjustmentMode = .normal
        datePicker.backgroundColor = .color_35_46_65
        datePicker.setCorner(radius: 10)
        view.addSubviews(views: datePicker)
        datePicker.horizontalSuperview(space: 16)
        datePicker.verticalSpacing(toView: headerView, space: 32)
        datePicker.height(200)
    }
}

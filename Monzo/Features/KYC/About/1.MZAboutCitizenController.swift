//  Created by Ky Nguyen

import UIKit

class MZAboutCitizenController: MZBaseListKycController {
    override func setData() {
        sectionLabel.text = "ABOUT YOU"
        titleLabel.text = "Are you a British citizen?"
        titleDescritionLabel.text = "You usually are if you or your parents were born in the UK, or you moved to the UK and successfully applied for citizenship"
        listView.setData(stringArrays: ["Yes", "No"])
    }
    
    override func goNext() {
        let vc = MZAboutPrimaryCitizenshipController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

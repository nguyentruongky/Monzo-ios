//  Created by Ky Nguyen

import UIKit

class MZAccountInternationTransferController: MZBaseListKycController {
    override var step: KycRouter.Step { .accountDoesInternationalTransfer }

    override func setData() {
        sectionLabel.text = "YOUR ACCOUNT"
        titleLabel.text = "Will you be making international bank transfers?"
        listView.setData(stringArrays: ["Yes", "No"])
    }
}

//  Created by Ky Nguyen
import UIKit

class MZIdentityLandinController: MZSectionListController {
    override var descriptionText: String {
        "Almost done, last section now..."
    }
    override var finishSteps: [String : Bool] {
        ["about": true,
         "finances": true,
         "account": true]
    }
}

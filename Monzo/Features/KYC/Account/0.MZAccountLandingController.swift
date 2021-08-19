//  Created by Ky Nguyen
import UIKit

class MZAccountLandingController: MZSectionListController {
    override var step: KycRouter.Step { .accountLanding }

    override var descriptionText: String {
        "You're halfway there..."
    }
    override var finishSteps: [String : Bool] {
        ["about": true,
         "finances": true]
    }
}

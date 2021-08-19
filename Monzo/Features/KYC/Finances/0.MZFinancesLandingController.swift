//  Created by Ky Nguyen
import UIKit

class MZFinancesLandingController: MZSectionListController {
    override var step: KycRouter.Step { .financesLanding }
    
    override var descriptionText: String {
        "That's 1 section down, 3 to go..."
    }
    override var finishSteps: [String : Bool] {
        ["about": true]
    }
}

//  Created by Ky Nguyen

import UIKit

class KycRouter {
    
    private init() { }
    
    static let shared = KycRouter()
    
    var kycData = [String: Any]()
    
    func goNext(from source: MZBaseKycController, data: [String: Any] = [:]) {
        switch source.step {
            case .kycLanding:
                let vc = MZAboutLandingController()
                source.navigationController?.setViewControllers([vc], animated: true)
                
            // ABOUT SECTION
            case .aboutLanding:
                let vc = MZAboutCitizenController()
                source.navigationController?.setViewControllers([vc], animated: true)
                
            case .aboutBritishCitizen:
                let isBritish = data["1"] as? Bool ?? false
                if isBritish {
                    kycData["citizen"] = "British"
                    let vc = MZAboutEmploymentStatusController()
                    source.navigationController?.pushViewController(vc, animated: true)
                } else {
                    let vc = MZAboutPrimaryCitizenshipController()
                    source.navigationController?.pushViewController(vc, animated: true)
                }
                
            case .aboutPrimaryCitizenship:
                kycData["citizen"] = data["1"]
                let vc = MZAboutRightController()
                source.navigationController?.pushViewController(vc, animated: true)
                
            case .aboutRightInUK:
                kycData["rights"] = data["1"]
                let vc = MZAboutRightExpirationController()
                source.navigationController?.pushViewController(vc, animated: true)
                
            case .aboutRightExpiration:
                kycData["rightExpiration"] = data["1"] as? Date
                let vc = MZAboutEmploymentStatusController()
                source.navigationController?.pushViewController(vc, animated: true)
                
            case .aboutEmploymentStatus:
                kycData["employmentStatus"] = data["1"]
                let vc = MZAboutIncomeController()
                source.navigationController?.pushViewController(vc, animated: true)
                
            case .aboutIncomeFromEmployment:
                kycData["haveEmploymentIncome"] = data["1"]
                let vc = MZFinancesLandingController()
                source.navigationController?.setViewControllers([vc], animated: true)
                
                
                // FINANCES SECTION
            case .financesLanding:
                let vc = MZFinancesIncomeController()
                source.navigationController?.setViewControllers([vc], animated: true)
                
            case .financesAnnualIncome:
                kycData["annualIncome"] = data["1"]
                let vc = MZFinancesIncomeDownController()
                source.navigationController?.pushViewController(vc, animated: true)
                
            case .financesIncomeDown:
                kycData["annualIncomeDown"] = data["1"]
                let vc = MZFinancesHousingController()
                source.navigationController?.pushViewController(vc, animated: true)
                
            case .financesHousingStatus:
                kycData["housingStatus"] = data["1"]
                let vc = MZFinancesRentingSpendController()
                source.navigationController?.pushViewController(vc, animated: true)
                
            case .financesHouseSpendingMonthly:
                kycData["houseSpending"] = data["1"]
                let vc = MZFinancesRelyController()
                source.navigationController?.pushViewController(vc, animated: true)

            case .financesHaveReliedPeople:
                kycData["haveRelyFinancially"] = data["1"]
                let vc = MZFinancesRelyCountController()
                source.navigationController?.pushViewController(vc, animated: true)
                
            case .financesReliedPeopleCount:
                kycData["relyFinanciallyCount"] = data["1"]
                let vc = MZAccountLandingController()
                source.navigationController?.setViewControllers([vc], animated: true)
                

            // ACCOUNT SECTION
//            case .accountLanding:
                
//            case accountLanding
//            case accountFirstPaymentFrom
//            case accountHowMuchFirstPayment
//            case accountHowUseMonzo
//            case accountHowMuchDepositMonthly
//            case accountDoesInternationalTransfer
//            case accountWhereTransfer

            default:
                break
        }
    }
    
    func start(from root: UIViewController) {
        let vc = MZKycLandingController()
        root.present(vc, animated: true)
    }
}

extension KycRouter {
    enum Step: Int {
        case unknowned
        case kycLanding
        
        case aboutLanding
        case aboutBritishCitizen
        case aboutPrimaryCitizenship
        case aboutRightInUK
        case aboutRightExpiration
        case aboutEmploymentStatus
        case aboutIncomeFromEmployment
        
        case financesLanding
        case financesAnnualIncome
        case financesIncomeDown
        case financesHousingStatus
        case financesHouseSpendingMonthly
        case financesHaveReliedPeople
        case financesReliedPeopleCount
        
        case accountLanding
        case accountFirstPaymentFrom
        case accountHowMuchFirstPayment
        case accountHowUseMonzo
        case accountHowMuchDepositMonthly
        case accountDoesInternationalTransfer
        case accountWhereTransfer
        
        case identityLanding
        case identityInstruction
        case identityTakePhotInstruction
        case identityIdCountry
        case identityTakingFrontCard
        case identityTakingBackCard
        case identityVideoInstruction
        case identityRecordVideo
        case identityUsCitizen
        case identityTaxCountry
        case identityNricNumber
        
        case finish
    }
    
}

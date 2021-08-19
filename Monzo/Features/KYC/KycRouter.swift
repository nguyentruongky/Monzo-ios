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
                nextSection(vc, from: source)
                
            case .aboutBritishCitizen:
                let answer = data["1"] as? String
                if answer?.lowercased() == "yes" {
                    kycData["citizen"] = "British"
                    let vc = MZAboutEmploymentStatusController()
                    push(vc, from: source)
                } else {
                    let vc = MZAboutPrimaryCitizenshipController()
                    push(vc, from: source)
                }
                
            case .aboutPrimaryCitizenship:
                kycData["citizen"] = data["1"]
                let vc = MZAboutRightController()
                push(vc, from: source)
                
            case .aboutRightInUK:
                let answer = data["1"] as? String
                kycData["rights"] = answer
                if answer?.lowercased().contains("permanently") == true {
                    let vc = MZAboutEmploymentStatusController()
                    push(vc, from: source)
                } else {
                    let vc = MZAboutRightExpirationController()
                    push(vc, from: source)
                }
                
            case .aboutRightExpiration:
                kycData["rightExpiration"] = data["1"] as? Date
                let vc = MZAboutEmploymentStatusController()
                push(vc, from: source)
                
            case .aboutEmploymentStatus:
                kycData["employmentStatus"] = data["1"]
                let vc = MZAboutIncomeController()
                push(vc, from: source)
                
            case .aboutIncomeFromEmployment:
                kycData["haveEmploymentIncome"] = data["1"]
                let vc = MZFinancesLandingController()
                nextSection(vc, from: source)
                
                
                // FINANCES SECTION
            case .financesLanding:
                let vc = MZFinancesIncomeController()
                nextSection(vc, from: source)
                
            case .financesAnnualIncome:
                kycData["annualIncome"] = data["1"]
                let vc = MZFinancesIncomeDownController()
                push(vc, from: source)
                
            case .financesIncomeDown:
                let answer = data["1"] as? String
                kycData["annualIncomeDown"] = answer?.lowercased() == "yes"
                let vc = MZFinancesHousingController()
                push(vc, from: source)
                
            case .financesHousingStatus:
                let answer = data["1"] as? String
                kycData["housingStatus"] = answer
                if answer?.lowercased() == "renting" {
                    let vc = MZFinancesRentingSpendController()
                    push(vc, from: source)
                } else {
                    let vc = MZFinancesRelyController()
                    push(vc, from: source)
                }
                
            case .financesHouseSpendingMonthly:
                kycData["houseSpending"] = data["1"]
                let vc = MZFinancesRelyController()
                push(vc, from: source)

            case .financesHaveReliedPeople:
                if let answer = data["1"] as? String {
                    if answer.lowercased() == "yes" {
                        kycData["haveRelyFinancially"] = true
                        let vc = MZFinancesRelyCountController()
                        push(vc, from: source)
                        return
                    }
                }
                
                kycData["haveRelyFinancially"] = false
                let vc = MZAccountLandingController()
                nextSection(vc, from: source)
                
            case .financesReliedPeopleCount:
                kycData["relyFinanciallyCount"] = data["1"]
                let vc = MZAccountLandingController()
                nextSection(vc, from: source)
                

            // ACCOUNT SECTION
            case .accountLanding:
                let vc = MZAccountFistPaymentController()
                nextSection(vc, from: source)
                
            case .accountFirstPaymentFrom:
                kycData["firstPaymentFrom"] = data["1"]
                let vc = MZAccountFirstPaymentAmountController()
                push(vc, from: source)
                
            case .accountHowMuchFirstPayment:
                kycData["firstPaymentAmount"] = data["1"]
                let vc = MZAccountHowUseController()
                push(vc, from: source)
                
            case .accountHowUseMonzo:
                kycData["usagePurpose"] = data["1"]
                let vc = MZAccountAmountMonthlyController()
                push(vc, from: source)
                
            case .accountHowMuchDepositMonthly:
                kycData["depositMonthly"] = data["1"]
                let vc = MZAccountInternationTransferController()
                push(vc, from: source)
                
            case .accountDoesInternationalTransfer:
                if let answer = data["1"] as? String {
                    let yes = answer.lowercased() == "yes"
                    if yes {
                        kycData["internationalTransfer"] = true
                        let vc = MZAccountTransferToCountryController()
                        push(vc, from: source)
                        return
                    }
                }
                
                kycData["internationalTransfer"] = false
                let vc = MZIdentityLandingController()
                nextSection(vc, from: source)
                
            case .accountWhereTransfer:
                kycData["internationalTransferDestination"] = data["1"]
                let vc = MZIdentityLandingController()
                nextSection(vc, from: source)

            default:
                break
        }
    }
    
    private func push(_ vc: UIViewController, from source: UIViewController) {
        source.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func nextSection(_ section: UIViewController, from source: UIViewController) {
        source.navigationController?.setViewControllers([section], animated: true)
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

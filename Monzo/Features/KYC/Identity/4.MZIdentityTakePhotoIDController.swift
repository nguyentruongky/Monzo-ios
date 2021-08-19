//  Created by Ky Nguyen

import UIKit

class MZIdentityTakePhotoIDFrontController: MZBaseKycController {
    override var step: KycRouter.Step { .identityTakingFrontCard }
    let exampleButton = UIButton(title: "Show an example", titleColor: .color_78_157_207, font: .main(size: 15))
    let takePhotoButton = UIButton(imageName: "take_photo")
    let cameraView = UIView(background: .black)
    let frameView = UIView(background: .clear)
    let takenImageView = UIImageView()
    var image: UIImage? {
        didSet {
            takenImageView.image = image
        }
    }
    let retakeButton = UIButton(title: "Retake picture", titleColor: .color_78_157_207, font: .main(size: 15))
    var idType: String?
    var instruction: String {
        "Make sure the front of your \(idType ?? "card") is in the frame"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = idType
        titleDescritionLabel.text = instruction
    }
    
    enum Status {
        case taking, taken
    }
    
    var status = Status.taking {
        didSet {
            switch status {
                case .taking:
                    cameraView.backgroundColor = .black
                    takenImageView.isHidden = true
                    takePhotoButton.isHidden = false
                    nextButton.isHidden = true
                    retakeButton.isHidden = true
                    
                case .taken:
                    cameraView.backgroundColor = .clear
                    takenImageView.isHidden = false
                    takePhotoButton.isHidden = true
                    nextButton.isHidden = false
                    retakeButton.isHidden = false
            }
        }
    }
    
    override func setupView() {
        super.setupView()
        
        headerView.removeFromSuperview()
        
        setupHeader()
        setupBodyView()
        setupFooter()
    }
    
    func setupHeader() {
        title = "Driving licence"
        titleDescritionLabel.font = .main(size: 15)
        titleDescritionLabel.text = "Make sure the front of your driving licence is in the frame"
        titleDescritionLabel.textColor = .white
        titleDescritionLabel.textAlignment = .center
        view.addSubviews(views: titleDescritionLabel)
        titleDescritionLabel.horizontalSuperview(space: 24)
        titleDescritionLabel.topToSuperviewSafeArea(space: 24)
        
        view.addSubviews(views: exampleButton)
        exampleButton.centerXToSuperview()
        exampleButton.verticalSpacing(toView: titleDescritionLabel, space: 24)
    }
    
    func setupBodyView() {
        view.addSubviews(views: cameraView)
        cameraView.horizontalSuperview()
        cameraView.verticalSpacing(toView: exampleButton, space: 48)
        cameraView.verticalSpacingDown(toView: footerView)
        
        frameView.setCorner(radius: 10)
        frameView.setBorder(width: 1, color: .white)
        cameraView.addSubviews(views: frameView)
        let width = UIScreen.main.bounds.width - 32
        frameView.size(width: width, height: width / 1.37)
        frameView.centerSuperview()
        
        takenImageView.isHidden = true
        takenImageView.setCorner(radius: 10)
        takenImageView.setBorder(width: 1, color: .white)
        takenImageView.image = UIImage(named: "sample_card_front")
        view.addSubviews(views: takenImageView)
        takenImageView.fill(toView: frameView)
    }
    
    func setupFooter() {
        footerView.backgroundColor = .bg
        footerView.subviews.forEach { $0.removeFromSuperview() }
        footerView.height(200)
        
        takePhotoButton.addTarget(self, action: #selector(takePhoto))
        footerView.addSubviews(views: takePhotoButton)
        takePhotoButton.square(edge: 88)
        takePhotoButton.centerSuperview()
        
        nextButton.isHidden = true
        nextButton.setTitle("Use this picture")
        footerView.addSubviews(views: nextButton)
        nextButton.horizontalSuperview(space: 16)
        nextButton.bottom(toAnchor: footerView.centerYAnchor, space: 4)
        
        retakeButton.isHidden = true
        retakeButton.addTarget(self, action: #selector(retake))
        footerView.addSubviews(views: retakeButton)
        retakeButton.centerXToSuperview()
        retakeButton.verticalSpacing(toView: nextButton, space: 16)
    }
    
    @objc func takePhoto() {
        status = .taken
        image = UIImage(named: "sample_card_front")
    }
    
    @objc func retake() {
        status = .taking
    }
    
    override func goNext() {
        guard let image = image else { return }
        router.goNext(from: self, data: ["1": image])
    }
    
}

class MZIdentityTakePhotoIDBackController: MZIdentityTakePhotoIDFrontController {
    override var step: KycRouter.Step { .identityTakingBackCard }
    override var instruction: String {
        "Make sure the back of your \(idType ?? "card") is in the frame"
    }
    
    @objc override func takePhoto() {
        status = .taken
        image = UIImage(named: "sample_card_back")
    }
}

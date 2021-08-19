//  Created by Ky Nguyen

import UIKit

class MZIdentityRecordingController: MZBaseKycController {
    override var step: KycRouter.Step { .identityRecordVideo }

    let recordButton = UIButton(imageName: "record")
    let stopButton = UIButton(imageName: "stop")
    let cameraView = UIView(background: .black)
    let takenImageView = UIImageView(contentMode: .scaleAspectFill)
    let retakeButton = UIButton(title: "Retake video", titleColor: .color_78_157_207, font: .main(size: 15))
    let yellowLabel = UILabel(text: "Hi, my name is Jovin and I want a Monzo account", font: .main(.bold, size: 26), color: .yellow, numberOfLines: 0, alignment: .center)
    
    private let readyTitle = "Record a short video of yourself"
    private let readyDescription = "Please press record, then say (or sign) the yellow text and press stop when you're done.\n\nA member of the team may review your video."
    private let doneTitle = "Selfie Video"
    private let doneDescription = "Beautiful! Check your video is easy to see and hear before you press send."
    
    
    enum Status {
        case ready, recording, done
    }
    
    var status = Status.ready {
        didSet {
            switch status {
                case .ready:
                    title = readyTitle
                    titleDescritionLabel.text = readyDescription

                    cameraView.backgroundColor = .black
                    takenImageView.isHidden = true
                    recordButton.isHidden = false
                    stopButton.isHidden = true
                    nextButton.isHidden = true
                    retakeButton.isHidden = true
                   
                case .recording:
                    cameraView.backgroundColor = .black
                    takenImageView.isHidden = true
                    recordButton.isHidden = true
                    stopButton.isHidden = false
                    nextButton.isHidden = true
                    retakeButton.isHidden = true
                    
                case .done:
                    title = doneTitle
                    titleDescritionLabel.text = doneDescription

                    cameraView.backgroundColor = .clear
                    takenImageView.isHidden = false
                    recordButton.isHidden = true
                    stopButton.isHidden = true
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
        title = readyTitle
        titleDescritionLabel.text = readyDescription
        titleDescritionLabel.font = .main(size: 15)
        titleDescritionLabel.textColor = .white
        titleDescritionLabel.textAlignment = .center
        view.addSubviews(views: titleDescritionLabel)
        titleDescritionLabel.horizontalSuperview(space: 24)
        titleDescritionLabel.topToSuperviewSafeArea(space: 24)
    }
    
    func setupBodyView() {
        view.addSubviews(views: cameraView)
        cameraView.horizontalSuperview()
        cameraView.verticalSpacing(toView: titleDescritionLabel, space: 48)
        cameraView.verticalSpacingDown(toView: footerView)
        cameraView.addSubviews(views: yellowLabel)
        yellowLabel.horizontalSuperview()
        yellowLabel.centerYToSuperview()
        
        takenImageView.isHidden = true
        takenImageView.setCorner(radius: 10)
        takenImageView.setBorder(width: 1, color: .white)
        takenImageView.image = UIImage(named: "sample_video_screenshot")
        view.addSubviews(views: takenImageView)
        takenImageView.fill(toView: cameraView)
    }
    
    func setupFooter() {
        footerView.backgroundColor = .bg
        footerView.subviews.forEach { $0.removeFromSuperview() }
        footerView.height(200)
        
        recordButton.addTarget(self, action: #selector(startRecording))
        footerView.addSubviews(views: recordButton)
        recordButton.square(edge: 88)
        recordButton.centerSuperview()
        
        stopButton.isHidden = true
        stopButton.addTarget(self, action: #selector(stopRecording))
        footerView.addSubviews(views: stopButton)
        stopButton.fill(toView: recordButton)
        
        nextButton.isHidden = true
        nextButton.setTitle("Submit video")
        footerView.addSubviews(views: nextButton)
        nextButton.horizontalSuperview(space: 16)
        nextButton.bottom(toAnchor: footerView.centerYAnchor, space: 4)
        
        retakeButton.isHidden = true
        retakeButton.addTarget(self, action: #selector(retake))
        footerView.addSubviews(views: retakeButton)
        retakeButton.centerXToSuperview()
        retakeButton.verticalSpacing(toView: nextButton, space: 16)
    }
    
    @objc func startRecording() {
        status = .recording
    }
    
    @objc func retake() {
        status = .ready
    }
    
    @objc func stopRecording() {
        status = .done
    }
    
    override func goNext() {
        let vc = UIAlertController(title: "We're about to verify your documents", message: "Please remember that submitting forged documents is a crime and will be reported", preferredStyle: .alert)
        vc.addAction(UIAlertAction(title: "Submit", style: .default, handler: { [weak self] _ in
            self?.submitVideo()
        }))
        vc.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(vc, animated: true)
    }
    
    func submitVideo() {
        router.goNext(from: self)
    }
}

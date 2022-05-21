//
//  ImageVC.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 09/12/2021.
//

import Foundation
import UIKit
import MessageUI

enum gradientState {
    case on
    case off
}

class ImageVC : UIViewController {
    
    let contenToShare = UIView()
    let quoteContainer = UIView()
    
    let backgroundIMG = CostumBackground(placehodler: randomPhotoName!)
    let quoteLabel = CostumQuoteLabel()
    let quoteLogo = UIImageView()
    
    var logonIsOn = false
    var dragIsOn = false
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    override func viewDidLayoutSubviews() {
        
    }
    
    private func setupView() {
        configureContentToSgare()
        configureBackgroundIMG()
        configureQuoteLabelContainer()
        configureQuoteLabel()
        configureQuoteLogo()
        configureObservers()
    }
    
    //    MARK: - Notification&Observers
    
    // IMG
    @objc func handleImageObserver(notification : NSNotification) {
        let imgName = notification.userInfo?["imgURL"] as? String
        guard let imgName = imgName else {return}
        NetworkManager.shered.dowloadImage(from: imgName) { imgage in
            self.backgroundIMG.image = imgage
        }
    }
    @objc func handleImgPickerObserver(notification: NSNotification) {
        let imgPicker = notification.userInfo?["imgPicker"] as? UIImage
        guard let imgPicker = imgPicker else {return}
        backgroundIMG.image = imgPicker
    }
    @objc func handleChooseImgObserver(notification: NSNotification) {
        dismiss(animated: true, completion: nil)
    }
    // Font Size Color
    @objc func handleFontQuoteObserver(notification : NSNotification) {
        let fontQuoteName = notification.userInfo?["font"] as? String
        guard let fontQuoteName = fontQuoteName else {return}
        quoteLabel.font = UIFont(name: fontQuoteName, size: 36)
    }
    @objc func handleFontSizeObserver(notification : NSNotification) {
        let fontSize = notification.userInfo?["size"]
        guard let fontSize = fontSize else {return}
        quoteLabel.font = quoteLabel.font.withSize(fontSize as! CGFloat)
    }
    @objc func handleFontColorObserver(notification: NSNotification) {
        let fontColor = notification.userInfo?["color"] as? String
        guard let fontColor = fontColor else {return}
        quoteLabel.textColor = UIColor(named: fontColor)
    }
    @objc func handleTextAligmentObserver(notification: NSNotification) {
        let quoteTextAligment = notification.userInfo?["quoteTextAligment"]  as? NSTextAlignment
        guard let quoteTextAligment = quoteTextAligment else {return}
        quoteLabel.textAlignment = quoteTextAligment
    }
    
    // Gradient
    @objc func handleGradientObserver(notification: NSNotification) { gradientState(state: .on)}
    @objc func handleRemoveGradientObserver(notification: NSNotification) { gradientState(state: .off)}
    @objc func handleShadowQuoteLabel(notification: NSNotification) {
        quoteLabel.shadowColor = .black
        quoteLabel.shadowOffset = .init(width: 2, height: 1)
        
    }
    @objc func handleRemoveShadowQuoteLabel(notification: NSNotification) { quoteLabel.shadowColor = .clear }
    
    // Drag
    @objc func handleDragLabel(notification: NSNotification) {
        dragIsOn = !dragIsOn
        if dragIsOn == true {
            quoteLabel.layer.borderColor = UIColor.red.cgColor
            quoteLabel.layer.borderWidth = 2
            configurePanGestureRevognizareToMoveQuoteLabel()
            
        } else {
            quoteLabel.layer.borderColor = UIColor.clear.cgColor
            quoteLabel.layer.borderWidth = 0.0
            quoteContainer.gestureRecognizers?.forEach(quoteContainer.removeGestureRecognizer)
        }
    }
    
    // Logo
    @objc func handleLogoObserver(notification: NSNotification) {
        logonIsOn = !logonIsOn
        quoteLogo.isHidden = logonIsOn
    }
    @objc func handleLogoImgObserver(notification: NSNotification) {
        logonIsOn = false
        quoteLogo.isHidden = logonIsOn
        let logoIMG = notification.userInfo?["logoImg"]  as? UIImage
        guard let logoIMG = logoIMG else {return}
        quoteLogo.image = logoIMG
    }
    
    // Share
    
    @objc func handleMessageObserver(notification: NSNotification) {
        sendMessage(contenToShare: contenToShare)
    }
    @objc func handleShareObserver(notification: NSNotification) {
        let image = contenToShare.asImage()
        guard let image = image else {return}
        
        if dragIsOn == true {
            quoteLabel.layer.borderColor = UIColor.clear.cgColor
            quoteLabel.layer.borderWidth = 0.0
            quoteContainer.gestureRecognizers?.forEach(quoteContainer.removeGestureRecognizer)
            dragIsOn = false
        }
        
        let shareVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        shareVC.excludedActivityTypes = [.addToReadingList,.assignToContact,.copyToPasteboard,.markupAsPDF,.saveToCameraRoll, .message]
        present(shareVC,animated: true)
    }
    @objc func handleCopyTextObserver(notification: NSNotification) {
        UIPasteboard.general.string = quoteLabel.text
        presentAlertOnMainThred(title: "Sucess!", message: shareMessage.sucesffulyCopy.rawValue)
    }
    
    //    MARK: - addObserver
    
    private func configureObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleImageObserver(notification:)),
                                               name: .imgObserver, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleFontQuoteObserver(notification:)),
                                               name: .fontQuote, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleFontColorObserver(notification:)),
                                               name: .fontColor, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleFontSizeObserver(notification:)),
                                               name: .sizeFontObserver, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleLogoObserver(notification:)),
                                               name: .logoObserver, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleLogoImgObserver(notification:)),
                                               name: .logoImgObserver, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleDragLabel(notification:)),
                                               name: .dragLabelObserver, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleGradientObserver(notification:)),
                                               name: .gradientObserver, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleRemoveGradientObserver(notification:)),
                                               name: .removeGradientObserver, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleShadowQuoteLabel(notification:)),
                                               name: .shadowQuoteLabel, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleRemoveShadowQuoteLabel(notification:)),
                                               name: .removeShadowQuoteLabel, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleTextAligmentObserver(notification:)),
                                               name: .textAlignmentObserver, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleImgPickerObserver(notification:)),
                                               name: .imgPickerObserver, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleChooseImgObserver(notification:)),
                                               name: .chooseImgObserver, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(handleMessageObserver(notification:)),
                                               name: .iMessageObserver, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleShareObserver(notification:)),
                                               name: .shareObserver, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleCopyTextObserver(notification:)),
                                               name: .copyTextObserver, object: nil)
    }
    //  MARK: - GestureRecogizare
    private func configurePanGestureRevognizareToMoveQuoteLabel() {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePanGestureRecToMoveQuoteLabel(sender:)))
        quoteContainer.addGestureRecognizer(pan)
    }
    
    @objc func handlePanGestureRecToMoveQuoteLabel(sender: UIPanGestureRecognizer) {
        let fileView = sender.view!
        let translation = sender.translation(in: view)
        
        switch sender.state {
        case .began, .changed:
            fileView.center = CGPoint(x: fileView.center.x + translation.x,
                                      y: fileView.center.y + translation.y)
            sender.setTranslation(CGPoint.zero, in: view)
        default:
            break
        }
    }
    //    func dragQuoteLabel() {
    //        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(sender:)))
    //        quoteContainer.addGestureRecognizer(pan)
    //    }
    //    @objc func handlePanGesture(sender: UIPanGestureRecognizer) {
    //        switch sender.state {
    //        case .began, .changed:
    //            let translation = sender.translation(in: quoteContainer)
    //            quoteContainer.transform = CGAffineTransform(translationX: translation.x, y: translation.y)
    //        case .ended:
    //            if !quoteContainer.frame.intersects(backgroundIMG.frame) {
    //                UIView.animate(withDuration: 0.3, animations: { self.quoteContainer.transform = .identity })
    //            }
    //        default:
    //            break
    //        }
    //    }
    
    //    MARK: - Constraints
    
    private func configureContentToSgare() {
        view.addSubview(contenToShare)
        contenToShare.translatesAutoresizingMaskIntoConstraints = false
        contenToShare.layer.cornerRadius = 15
        
        NSLayoutConstraint.activate([
            contenToShare.topAnchor.constraint(equalTo: view.topAnchor),
            contenToShare.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contenToShare.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contenToShare.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    private func configureBackgroundIMG() {
        contenToShare.addSubview(backgroundIMG)
        backgroundIMG.translatesAutoresizingMaskIntoConstraints = false
        // przekazuje
        
        NSLayoutConstraint.activate([
            backgroundIMG.topAnchor.constraint(equalTo: contenToShare.topAnchor),
            backgroundIMG.leadingAnchor.constraint(equalTo: contenToShare.leadingAnchor),
            backgroundIMG.trailingAnchor.constraint(equalTo: contenToShare.trailingAnchor),
            backgroundIMG.bottomAnchor.constraint(equalTo: contenToShare.bottomAnchor)
        ])
    }
    private func configureQuoteLabelContainer() {
        contenToShare.addSubview(quoteContainer)
        quoteContainer.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            quoteContainer.topAnchor.constraint(equalTo: contenToShare.topAnchor),
            quoteContainer.leadingAnchor.constraint(equalTo: contenToShare.leadingAnchor),
            quoteContainer.trailingAnchor.constraint(equalTo: contenToShare.trailingAnchor),
            quoteContainer.bottomAnchor.constraint(equalTo: contenToShare.bottomAnchor)
        ])
    }
    
    private func configureQuoteLabel() {
        quoteContainer.addSubview(quoteLabel)
        quoteLabel.translatesAutoresizingMaskIntoConstraints = false
        
        quoteLabel.numberOfLines = 0
        quoteLabel.text =  quoteTextToShare
        quoteLabel.font = UIFont(name: fontQuoteToShare!, size: 32)
        
        NSLayoutConstraint.activate([
            quoteLabel.centerYAnchor.constraint(equalTo: quoteContainer.centerYAnchor),
            quoteLabel.centerXAnchor.constraint(equalTo: quoteContainer.centerXAnchor),
            quoteLabel.widthAnchor.constraint(equalTo: quoteContainer.widthAnchor, multiplier: 0.8),
            quoteLabel.heightAnchor.constraint(equalTo: quoteContainer.heightAnchor, multiplier: 0.8)
        ])
    }
    private func configureQuoteLogo() {
        backgroundIMG.addSubview(quoteLogo)
        quoteLogo.translatesAutoresizingMaskIntoConstraints = false
        
        quoteLogo.image = UIImage(named: Icons.LogoForBackground)
        quoteLogo.isHidden = logonIsOn
        
        NSLayoutConstraint.activate([
            quoteLogo.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            quoteLogo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            quoteLogo.widthAnchor.constraint(equalToConstant: 37),
            quoteLogo.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    //    MARK: - Helpers
    
    func gradientState(state: gradientState) {
        switch state {
        case .on:
            backgroundIMG.setGradien(colorOne: .clear, colorTwo: .black)
        case .off:
            backgroundIMG.removeSublayer(backgroundIMG, layerIndex: 1)
        }
    }
}

//
//  ImageVC.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 09/12/2021.
//

import Foundation
import UIKit
import Social

class ImageVC : UIViewController {
    
    let contenToShare = UIView()
    let quoteContainer = UIView()
    
    let backgroundIMG = CostumBackground(placehodler: "BackgroundImage")
    let quoteLabel = CostumQuoteLabel()
    let quoteLogo = UIImageView()
    
    var logonIsOn = false
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configurePanGestureRevognizareToMoveQuoteLabel()
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
    
    @objc func handleImageObserver(notification : NSNotification) {
        let imgName = notification.userInfo?["imgURL"] as? String
        guard let imgName = imgName else {return}
        NetworkManager.shered.dowloadImage(from: imgName) { imgage in
            self.backgroundIMG.image = imgage
        }
    }
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
    @objc func handleLogoObserver(notification: NSNotification) {
        logonIsOn = !logonIsOn
        quoteLogo.isHidden = logonIsOn
    }
    @objc func handleGradientObserver(notification: NSNotification) {
        backgroundIMG.setGradien(colorOne: .clear, colorTwo: .black)
    }
    @objc func handleImgPickerObserver(notification: NSNotification) {
        let imgPicker = notification.userInfo?["imgPicker"] as? UIImage
        guard let imgPicker = imgPicker else {return}
        backgroundIMG.image = imgPicker
    }
    @objc func handleChooseImgObserver(notification: NSNotification) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handleInstagramObserver(notification: NSNotification) {
        print("dziala")
        let image = contenToShare.asImage()
        guard let image = image else {return}
        
        InstagramManager.shered.shareToInstagramStories(image: image)
    }
    @objc func handleFacebookObserver(notification: NSNotification) {
        dismiss(animated: true, completion: nil)
        if let vc = SLComposeViewController(forServiceType: SLServiceTypeFacebook) {
            vc.add(contenToShare.asImage())
            present(vc, animated: true, completion: nil)
        }
    }
    @objc func handleTwiterObserver(notification: NSNotification) {
        dismiss(animated: true, completion: nil)
        
        if let vc = SLComposeViewController(forServiceType: SLServiceTypeTwitter) {
            vc.add(contenToShare.asImage())
            present(vc, animated: true, completion: nil)
        }
    }
    @objc func handleLinkedInObserver(notification: NSNotification) {
        dismiss(animated: true, completion: nil)
        
        if let vc = SLComposeViewController(forServiceType: SLServiceTypeLinkedIn) {
            vc.add(contenToShare.asImage())
            present(vc, animated: true, completion: nil)
        }
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
        NotificationCenter.default.addObserver(self, selector: #selector(handleGradientObserver(notification:)),
                                               name: .gradientObserver, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleImgPickerObserver(notification:)),
                                               name: .imgPickerObserver, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleChooseImgObserver(notification:)),
                                               name: .chooseImgObserver, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleInstagramObserver(notification:)),
                                               name: .instagramObserver, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleFacebookObserver(notification:)),
                                               name: .facebookObserver, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleTwiterObserver(notification:)),
                                               name: .twiterObserver, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleLinkedInObserver(notification:)),
                                               name: .linkedinObserver, object: nil)
        
    }
    //    MARK: - GestureRecogizare
    
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
    private func configurePanGestureRevognizareToMoveQuoteLabel() {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePanGestureRecToMoveQuoteLabel(sender:)))
        quoteContainer.addGestureRecognizer(pan)
    }
    
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
        
        NSLayoutConstraint.activate([
            quoteLabel.centerYAnchor.constraint(equalTo: quoteContainer.centerYAnchor),
            quoteLabel.centerXAnchor.constraint(equalTo: quoteContainer.centerXAnchor),
            quoteLabel.widthAnchor.constraint(equalTo: quoteContainer.widthAnchor, multiplier: 0.8)
        ])
    }
    private func configureQuoteLogo() {
        backgroundIMG.addSubview(quoteLogo)
        quoteLogo.translatesAutoresizingMaskIntoConstraints = false
        
        quoteLogo.image = UIImage(named: "LogoForBackground")
        quoteLogo.isHidden = logonIsOn
        
        NSLayoutConstraint.activate([
            quoteLogo.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            quoteLogo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            quoteLogo.widthAnchor.constraint(equalToConstant: 35),
            quoteLogo.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}



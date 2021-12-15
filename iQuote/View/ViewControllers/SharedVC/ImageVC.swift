//
//  ImageVC.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 09/12/2021.
//

import Foundation
import UIKit


class ImageVC : UIViewController {
    
    let contenToShare = UIView()
    
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
        configureContentToSgare()
        configureBackgroundIMG()
        configureQuoteLabel()
        configureQuoteLogo()
        configureObservers()
    }
    
    private func setupView() {
//        view.backgroundColor = .clear
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
    @objc func handleInstagramObserver(notification: NSNotification) {
        let image = contenToShare.asImage()
        guard let image = image else {return}
        shareToInstagram(image: image)
    }
    
    
    private func configureObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleImageObserver(notification:)), name: .imgObserver, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleFontQuoteObserver(notification:)), name: .fontQuote, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleFontColorObserver(notification:)), name: .fontColor, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleFontSizeObserver(notification:)), name: .sizeFontObserver, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleLogoObserver(notification:)), name: .logoObserver, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleGradientObserver(notification:)), name: .gradientObserver, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleInstagramObserver(notification:)), name: .instagramObserver, object: nil)
    
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
    
    private func configureQuoteLabel() {
        backgroundIMG.addSubview(quoteLabel)
        quoteLabel.translatesAutoresizingMaskIntoConstraints = false
        quoteLabel.numberOfLines = 0
        quoteLabel.text =  quoteTextToShare
        
        NSLayoutConstraint.activate([
            quoteLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            quoteLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            quoteLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            quoteLabel.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 0.5)
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
    //    MARK : - Hellpers func
    
    func shareToInstagram(image: UIImage) {
        
        if let urlScheme = URL(string: "instagram-stories://share") {
            if UIApplication.shared.canOpenURL(urlScheme) {
                
                let imageData: Data = image.pngData()!
                
                let items = [[
                    "com.instagram.sharedSticker.backgroundImage": imageData,
                    //"com.instagram.sharedSticker.backgroundTopColor": "#EA2F3F",
                    //"com.instagram.sharedSticker.backgroundBottomColor": "#8845B9",
                ]]
                let pasteboardOptions = [UIPasteboard.OptionsKey.expirationDate: Date().addingTimeInterval(60*5)]
                UIPasteboard.general.setItems(items, options: pasteboardOptions)
                UIApplication.shared.open(urlScheme, options: [:], completionHandler: nil)
            } else {
                presentAlertOnMainThred(title: "Upsss", message: "You dont have instagram app on your device")
            }
        }
    }
}

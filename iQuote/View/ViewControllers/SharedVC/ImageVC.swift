//
//  ImageVC.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 09/12/2021.
//

import Foundation
import UIKit


class ImageVC : UIViewController {
    
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
        configureBackgroundIMG()
        configureQuoteLabel()
        configureQuoteLogo()
        configureObservers()
    }
    
    private func setupView() {
        view.backgroundColor = .black
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
        print("fontSize: \(fontSize)")

        quoteLabel.font = quoteLabel.font.withSize(fontSize as! CGFloat)
    }
    
    @objc func handleLogoObserver(notification: NSNotification) {
        logonIsOn = !logonIsOn
        quoteLogo.isHidden = logonIsOn
    }
    
    
    private func configureObservers() {
        let imgObserver = Notification.Name("imgObserver")
        NotificationCenter.default.addObserver(self, selector: #selector(handleImageObserver(notification:)), name: imgObserver, object: nil)
        
        let fontObserver = Notification.Name("fontQuote")
        NotificationCenter.default.addObserver(self, selector: #selector(handleFontQuoteObserver(notification:)), name: fontObserver, object: nil)
        
        let sizeFontObserver = Notification.Name("sizeFontObserver") 
        NotificationCenter.default.addObserver(self, selector: #selector(handleFontSizeObserver(notification:)), name: sizeFontObserver, object: nil)
        
        let logoObserver = Notification.Name(rawValue: "logoObserver")
        NotificationCenter.default.addObserver(self, selector: #selector(handleLogoObserver(notification:)), name: logoObserver, object: nil)
    }
    
    
    //    MARK: - Constraints
    private func configureBackgroundIMG() {
        view.addSubview(backgroundIMG)
        backgroundIMG.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundIMG.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundIMG.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundIMG.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundIMG.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func configureQuoteLabel() {
        view.addSubview(quoteLabel)
        quoteLabel.translatesAutoresizingMaskIntoConstraints = false
        quoteLabel.numberOfLines = 0
        quoteLabel.text = Constants.exampleQute
        
        NSLayoutConstraint.activate([
            quoteLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            quoteLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            quoteLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            quoteLabel.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 0.5)
        ])
    }
    private func configureQuoteLogo() {
        view.addSubview(quoteLogo)
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

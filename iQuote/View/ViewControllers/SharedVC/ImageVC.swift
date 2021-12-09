//
//  ImageVC.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 09/12/2021.
//

import Foundation
import UIKit


class ImageVC : UIViewController {
    
    var backgroundIMG = CostumBackground(placehodler: "BackgroundImage")
    var quoteLabel = CostumQuoteLabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureBackgroundIMG()
        configureQuoteLabel()
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
    
    private func configureObservers() {
        let imgObserver = Notification.Name("imgObserver")
        NotificationCenter.default.addObserver(self, selector: #selector(handleImageObserver(notification:)), name: imgObserver, object: nil)
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
        quoteLabel.numberOfLines = 3
        quoteLabel.text = Constants.exampleQute
        
        NSLayoutConstraint.activate([
            quoteLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            quoteLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 50),
            quoteLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -50),
            quoteLabel.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 0.5)
        ])
    }
    
}

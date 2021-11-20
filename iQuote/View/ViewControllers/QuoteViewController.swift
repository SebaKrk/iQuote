//
//  QuoteViewController.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 18/11/2021.
//

import Foundation
import UIKit

class QuoteViewController : UIViewController {
    
    
    let backgroundImage = CostumBackground(placehodler: "BackgroundImage")
    let quoteImage = CostumBackground(placehodler: "halfQuote")
    let quoteLabel = CostumQuoteLabel()
    
    let padding : CGFloat = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        backgroundImage.setGradien(colorOne: UIColor.clear, colorTwo: UIColor.black)
    }
    //    MARK: - View
    
    private func setupView() {
        configureBackgroundImage()
        configureQuoteImage()
        configureQuoteLabel()
    }
    
    //    MARK: - Constraints
    
    private func configureBackgroundImage() {
        view.addSubview(backgroundImage)
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    private func configureQuoteImage() {
        view.addSubview(quoteImage)
        quoteImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            quoteImage.topAnchor.constraint(equalTo: view.topAnchor),
            quoteImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            quoteImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            quoteImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35)
        ])
    }
    private func configureQuoteLabel () {
        view.addSubview(quoteLabel)
        quoteLabel.translatesAutoresizingMaskIntoConstraints = false
        quoteLabel.text = Constants.exampleQute
        
        NSLayoutConstraint.activate([
            quoteLabel.topAnchor.constraint(equalTo: quoteImage.bottomAnchor,constant: padding),
            quoteLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: padding),
            quoteLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -padding),
            quoteLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }
}

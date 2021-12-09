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
    }
    private func setupView() {
        view.backgroundColor = .black
    }
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

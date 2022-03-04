//
//  ExpandQuoteVC.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 27/02/2022.
//

import Foundation
import UIKit

class ExpandQuoteVC : UIViewController {
    
    let visualEfectView : UIVisualEffectView = {
        let blureEffect = UIBlurEffect(style: .dark)
        let view = UIVisualEffectView(effect: blureEffect)
        return view
    }()
    
    let container = UIView()
    let quoteLabel = CostumQuoteLabel()
    let padding : CGFloat = 30
    
    var quote = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        tapGestureRecognizerToDissmisView()
    }
    private func setupView() {
        configureBlureEfect()
        configureQuoteLabel()
    }
    
    private func configureBlureEfect() {
        view.addSubview(visualEfectView)
        visualEfectView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            visualEfectView.topAnchor.constraint(equalTo: view.topAnchor),
            visualEfectView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            visualEfectView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            visualEfectView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func configureQuoteLabel() {
        view.addSubview(quoteLabel)
        quoteLabel.translatesAutoresizingMaskIntoConstraints = false
        
        quoteLabel.text = quote
        
        NSLayoutConstraint.activate([
            quoteLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            quoteLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            quoteLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: padding),
            quoteLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -padding),
        ])
    }
}

//
//  NavigationViewController.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 21/11/2021.
//

import Foundation
import UIKit

class NavigationViewController : UIViewController {
    
    var mainQuoteButton = CostumeQuoteButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        configureMainButton()
    }
    @objc func handleMainButton() {
        mainQuoteButton.flipLikeState()
    }
    
    private func configureMainButton() {
        view.addSubview(mainQuoteButton)
        mainQuoteButton.translatesAutoresizingMaskIntoConstraints = false
        mainQuoteButton.addTarget(self, action: #selector(handleMainButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            mainQuoteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainQuoteButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
}


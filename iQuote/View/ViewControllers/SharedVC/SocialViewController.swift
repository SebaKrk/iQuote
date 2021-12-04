//
//  SocialViewController.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 04/12/2021.
//

import Foundation
import UIKit

class SocialViewController : UIViewController {
    
    var stackView = UIStackView()
    
    let instagramButton = CostumeSocialButton(name: "instagram")
    let facebookButton = CostumeSocialButton(name: "facebook")
    let twiterButton = CostumeSocialButton(name: "twiter")
    let linkedInButton = CostumeSocialButton(name: "linkedIn")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStackView()
        configureStackView()
    }
    private func setupStackView() {
        stackView = UIStackView(arrangedSubviews: [instagramButton,facebookButton,twiterButton,linkedInButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
    }
    private func configureStackView() {
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
}

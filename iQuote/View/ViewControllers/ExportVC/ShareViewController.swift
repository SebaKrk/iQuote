//
//  ShreViewController.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 08/01/2022.
//

import Foundation
import UIKit

class ShareViewController : UIViewController {
    
    var stackView = UIStackView()
    
    let iMessageButton  = CostumTransButton(imageOne: "iMessageIcon1", imageTwo: "iMessageIcon2")
    let shareButton  = CostumTransButton(imageOne: "exportIcon1", imageTwo: "exportIcon2")
    let copyTextButton  = CostumTransButton(imageOne: "copyTextIcon1", imageTwo: "copyTextIcon2")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStackView()
        configureStackView()
        configureButtons()
    }
    
    @objc func handleMessageButton() {
        print("DEBUG: handleMessageButton")
    }
    @objc func handleShareButton() {
        print("DEBUG: handleShareButton")
    }
    @objc func handleCopyTextButton() {
        print("DEBUG: handleCopyTextButton")
    }
    
    private func setupStackView() {
        stackView = UIStackView(arrangedSubviews: [iMessageButton,shareButton,copyTextButton])
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
    
    private func configureButtons() {
        iMessageButton.addTarget(self, action: #selector(handleMessageButton), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(handleShareButton), for: .touchUpInside)
        copyTextButton.addTarget(self, action: #selector(handleCopyTextButton), for: .touchUpInside)
    }
    
    
    


}

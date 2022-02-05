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
    
    let iMessageButton  = CostumTransButton(imageOne: Icons.iMessageButton, imageTwo: Icons.iMessageButton)
    let shareButton  = CostumTransButton(imageOne: Icons.shareButton, imageTwo: Icons.shareButton)
    let copyTextButton  = CostumTransButton(imageOne: Icons.copyTextButton, imageTwo:  Icons.copyTextButton)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStackView()
        configureStackView()
        configureButtons()
    }
    
    @objc func handleMessageButton() {
        iMessageButton.flipLikeState()
        NotificationCenter.default.post(name: .iMessageObserver, object: nil)
    }
    @objc func handleShareButton() {
        shareButton.flipLikeState()
        NotificationCenter.default.post(name: .shareObserver, object: nil)
    }
    @objc func handleCopyTextButton() {
        copyTextButton.flipLikeState()
        NotificationCenter.default.post(name: .copyTextObserver, object: nil)
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

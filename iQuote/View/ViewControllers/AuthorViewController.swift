//
//  AuthorViewController.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 21/11/2021.
//

import Foundation
import UIKit

class AuthorViewController : UIViewController {
    
    let authorButton = UIButton() // button or pinGesture ?
    let authorImage = AuthorImageView(frame: .zero)
    let authorLabel = CostumAuthorLabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAuthorButton()
        configureAuthorImage()
        configureAuthorLabel()
    }
    
//    MARK: - OBJC
    
    @objc func handleAuthorButton() {
        print("DEBUG: AuthorButton pressed")
    }       
    
//    MARK: - Constraints & Configuration
    
    private func configureAuthorButton() {
        view.addSubview(authorButton)
        authorButton.translatesAutoresizingMaskIntoConstraints = false
    
        authorButton.addTarget(self, action: #selector(handleAuthorButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            authorButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 25),
            authorButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            authorButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            authorButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.8)
        ])
    }
    private func configureAuthorImage() {
        authorButton.addSubview(authorImage)
        authorImage.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([
            authorImage.centerYAnchor.constraint(equalTo: authorButton.centerYAnchor),
            authorImage.leadingAnchor.constraint(equalTo: authorButton.leadingAnchor),
            authorImage.widthAnchor.constraint(equalToConstant: 85),
            authorImage.heightAnchor.constraint(equalToConstant: 85)
        ])
    }
    private func configureAuthorLabel() {
        authorButton.addSubview(authorLabel)
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.text = Constants.exampleAuthor
        
        NSLayoutConstraint.activate([
            authorLabel.centerYAnchor.constraint(equalTo: authorButton.centerYAnchor),
            authorLabel.leadingAnchor.constraint(equalTo: authorImage.trailingAnchor,constant: 25),
            authorLabel.trailingAnchor.constraint(equalTo: authorButton.trailingAnchor,constant: -10),
            authorLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}

//
//  ImageConfigurationVC.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 04/12/2021.
//

import Foundation
import UIKit

class ImageConfigurationVC : UIViewController {
    
    var stackView = UIStackView()
    
    let backgroundImageButton  = CostumTransButton(imageOne: "BackgroundIcon", imageTwo: "BackgroundIcon2")
    let textButton  = CostumTransButton(imageOne: "TextIcon", imageTwo: "TextIcon2")
    let gradienButton = CostumTransButton(imageOne: "GradienIcon", imageTwo: "GradienIcon2")
    let authorButton = CostumTransButton(imageOne: "AuthorIcon", imageTwo: "AuthorIcon2")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStackView()
        configureStackView()
        configureButton()
    }
    
    @objc func handleBackgroundButton() {print("DEBUG: handleBackgroundButton")}
    @objc func handleTextButton() { print("DEBUG: handleTextButton") }
    @objc func handleGradienButton() { print("DEBUG: handleGradienButton ")}
    @objc func handleAuthorButton() { print("DEBUG: handleAuthorButton")}
    
    private func setupStackView() {
        stackView = UIStackView(arrangedSubviews: [backgroundImageButton,textButton,gradienButton,authorButton])
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
    private func configureButton() {
        backgroundImageButton.addTarget(self, action: #selector(handleBackgroundButton), for: .touchUpInside)
        textButton.addTarget(self, action: #selector(handleTextButton), for: .touchUpInside)
        gradienButton.addTarget(self, action: #selector(handleGradienButton), for: .touchUpInside)
        authorButton.addTarget(self, action: #selector(handleAuthorButton), for: .touchUpInside)
    }
    
}

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
    let logoButton = CostumTransButton(imageOne: "AuthorIcon", imageTwo: "AuthorIcon2")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStackView()
        configureStackView()
        configureButton()
    }
    
    
    @objc func handleBackgroundButton() {
        let desVC = UnsplashCollectionVC()
        present(desVC, animated: true, completion: nil)
    }
    
    @objc func handleTextButton() {
        let desVC = TextConfigurationVC()
        desVC.modalPresentationStyle = .overFullScreen
        present(desVC,animated: true,completion: nil)
    }
    
    @objc func handleGradienButton() {
        
        let desVC = GradientConfigurationVC()
        desVC.modalPresentationStyle = .overFullScreen
        present(desVC,animated: true,completion: nil)
    }
    
    @objc func handleLogoButton() {
        logoButton.flipLikeState()
        NotificationCenter.default.post(name: .logoObserver, object: nil)
    }
    
    private func setupStackView() {
        stackView = UIStackView(arrangedSubviews: [backgroundImageButton,textButton,gradienButton,logoButton])
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
        logoButton.addTarget(self, action: #selector(handleLogoButton), for: .touchUpInside)
    }
    
}

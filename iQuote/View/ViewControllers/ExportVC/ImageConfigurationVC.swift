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
    
    let backgroundImageButton  = CostumTransButton(imageOne: Icons.photoButton, imageTwo:  Icons.photoButton)
    let textButton  = CostumTransButton(imageOne: Icons.textButton, imageTwo: Icons.textButton)
    let gradienButton = CostumTransButton(imageOne: Icons.gradientButton, imageTwo: Icons.gradientButton)
    let logoButton = CostumTransButton(imageOne: Icons.quoteIconButton, imageTwo: Icons.quoteIconButton )
    let dragLabelButton  = CostumTransButton(imageOne: Icons.dragTextButton,imageTwo: Icons.dragTextButton)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupStackView()
        configureStackView()
        configureButton()
    }
    
    @objc func handleBackgroundButton() {
        backgroundImageButton.flipLikeState()
        let desVC = PhotoViewController() //PhotoLabViewController()
        desVC.modalPresentationStyle = .overFullScreen
        present(desVC,animated: true,completion: nil)
    }
    
    @objc func handleTextButton() {
        textButton.flipLikeState()
        let desVC = TextConfigurationVC()
        desVC.modalPresentationStyle = .overFullScreen
        present(desVC,animated: true,completion: nil)
    }

    @objc func handleGradienButton() {
        gradienButton.flipLikeState()
        let desVC = GradientConfigurationVC()
        desVC.modalPresentationStyle = .overFullScreen
        present(desVC,animated: true,completion: nil)
    }
    @objc func handleDragLabelButton() {
        dragLabelButton.flipLikeState()
        NotificationCenter.default.post(name: .dragLabelObserver, object: nil)
    }
    
    @objc func handleLogoButton() {
        logoButton.flipLikeState()
        let desVC = LogoForBackground()
        desVC.modalPresentationStyle = .overFullScreen
        present(desVC,animated: true,completion: nil)
    }
    
    private func setupStackView() {
        stackView = UIStackView(arrangedSubviews: [backgroundImageButton,textButton,gradienButton,dragLabelButton,logoButton])
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
        dragLabelButton.addTarget(self, action: #selector(handleDragLabelButton), for: .touchUpInside)
        logoButton.addTarget(self, action: #selector(handleLogoButton), for: .touchUpInside)
    }
    
}

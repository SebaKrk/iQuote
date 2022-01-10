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
    
    let backgroundImageButton  = CostumTransButton(imageOne: "PhotoButton1", imageTwo: "PhotoButton1")
    let textButton  = CostumTransButton(imageOne: "TextButton1", imageTwo: "TextButton1")
    let gradienButton = CostumTransButton(imageOne: "GradientButton1", imageTwo: "GradientButton1")
    let logoButton = CostumTransButton(imageOne: "QuoteIconButton1", imageTwo: "QuoteIconButton1")
    let dragLabelButton  = CostumTransButton(imageOne: "DragTextButton1",imageTwo: "DragTextButton1")

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
        NotificationCenter.default.post(name: .logoObserver, object: nil)
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

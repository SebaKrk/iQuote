//
//  ShareAlertViewController.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 31/01/2022.
//

import Foundation
import UIKit

class ShateAlertViewController: UIViewController {
    
    let container = UIView()
    let titleLabel = UILabel()
    let messageLabel = UILabel()
    let trueButton = CostumTransButton(imageOne: "trueButton", imageTwo: "trueButton")
    let falseButton =  CostumTransButton(imageOne: "falseButton", imageTwo: "falseButton")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.7)
        configureButtons()
        configureContainer()
        configureTitleLabel()
        configureMessageLabel()
        configureTrueButton()
        configureFalseButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        container.layer.cornerRadius = 15
    }
    
    @objc func handleTrueButton() {
        
    }
    @objc func handleFalseButton() {
        dismiss(animated: true, completion: nil)
    }
    
    private func configureContainer() {
        view.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .costumDarkGray()
        container.layer.borderColor = UIColor.white.cgColor
        container.layer.borderWidth = 0.5
        
        NSLayoutConstraint.activate([
            container.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            container.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            container.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.68),
            container.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35)
        ])
    }
    private func configureTitleLabel() {
        container.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = "Did you do It?"
        titleLabel.textColor = .primaryOrange()
        titleLabel.font = UIFont(name: fontText.popupTitle, size: 34)
        titleLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    private func configureTrueButton(){
        container.addSubview(trueButton)
        trueButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            trueButton.centerXAnchor.constraint(equalTo: container.centerXAnchor, constant: -50),
            trueButton.bottomAnchor.constraint(equalTo: container.bottomAnchor,constant: -30)
        ])
    }
    private func configureFalseButton(){
        container.addSubview(falseButton)
        falseButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            falseButton.centerXAnchor.constraint(equalTo: container.centerXAnchor,constant: 50),
            falseButton.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -30)
        ])
    }
    private func configureMessageLabel() {
        container.addSubview(messageLabel)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        messageLabel.text = "Did you post your favorite quote on platorm you desire?"
        messageLabel.font = UIFont(name: fontText.popupMessage, size: 18)
        messageLabel.textColor = .white
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            messageLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            messageLabel.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            messageLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor,constant: 10),
            messageLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor,constant: -10)
        ])
    }
    private func configureButtons() {
        trueButton.addTarget(self, action: #selector(handleTrueButton), for: .touchUpInside)
        falseButton.addTarget(self, action: #selector(handleFalseButton), for: .touchUpInside)
    }
    
}

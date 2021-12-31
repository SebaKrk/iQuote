//
//  AlertViewController.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 29/11/2021.
//

import Foundation
import UIKit

class AlertViewController : UIViewController {
    
    let container = UIView()
    let titleLabel = UILabel()
    let messageLabel = UILabel()
    let dissmisButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        container.layer.cornerRadius = 15
    }
    
    init(title : String, message: String) {
        super.init(nibName: nil, bundle: nil)
        titleLabel.text = title
        messageLabel.text = message
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: -  SetupView
    
    private func setupView() {
        view.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.7)
        configureContainer()
        configureTitleLabel()
        configureButton()
        configureMessageLabel()
        tapGestureRecognizerToDissmisView()
    }
//    MARK: - OBJC Func
    @objc func handleDissmisButton() {
        dismiss(animated: true, completion: nil)
    }
    
//    MARK: - Constraints&Constraints
    
    private func configureContainer() {
        view.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .darkGray()
        container.layer.borderColor = UIColor.white.cgColor //UIColor.primaryOrange().cgColor
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
        titleLabel.textColor = .primaryOrange()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 34)
        titleLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    private func configureButton(){
        container.addSubview(dissmisButton)
        dissmisButton.translatesAutoresizingMaskIntoConstraints = false
        
        dissmisButton.setImage(UIImage(named: "QuoteButton2"), for: .normal)
        dissmisButton.layer.masksToBounds = true
        dissmisButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        dissmisButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        dissmisButton.addTarget(self, action: #selector(handleDissmisButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            dissmisButton.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            dissmisButton.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -20)
        ])
    }
    private func configureMessageLabel() {
        container.addSubview(messageLabel)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        messageLabel.font = UIFont(name: "Baskerville", size: 24)
        messageLabel.textColor = .white
        messageLabel.numberOfLines = 4
        messageLabel.textAlignment = .center
        
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            messageLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            messageLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor,constant: -20),
            messageLabel.bottomAnchor.constraint(equalTo: dissmisButton.topAnchor,constant: -20)
        ])
    }
}


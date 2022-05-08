//
//  MultipleAppIconsViewController.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 29/01/2022.
//

import Foundation
import UIKit

class MultipleAppIconsViewController : UIViewController {
    
    private let container = UIView()
    private let swipeLine = SwipeLine()
    private var stackView = UIStackView()
    private let titleLabel = CostumTitleLabel(textAligment: .center, fontSize: 20)
    
    private let purpleIcon = CostumeIconsButton(name: "iconPurple-60")
    private let blueIcon = CostumeIconsButton(name: "iconBlue-60")
    private let redIcon = CostumeIconsButton(name: "iconRed-60")
    private let blackleIcon = CostumeIconsButton(name: "iconBlack-60")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupStackView()
        configureContainer()
        configureSwipeLinie()
        configureStackView()
        configureTitleLabel()
        configureButtons()
    }

    override func viewDidLayoutSubviews() {
        cardOriginYext = container.frame.origin.y
        panGestureRecognizerToHandleDragAndDissmisView(inCardView: container, cardOriginY: cardOriginYext)
        
    }
    
    func setupView() {
        view.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.3)
        tapGestureRecognizerToDissmisView()
        swipeDownGestureRecognizerToDissmisView(container: container)
    }
    
    private func setupStackView() {
        stackView = UIStackView(arrangedSubviews: [purpleIcon,blueIcon,redIcon,blackleIcon])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
    }
    
    @objc func handlePurpleIcon() { changeAppIcon(name: "PurpleAppIcon") }
    @objc func handleBlueIcon() { changeAppIcon(name: "BlueAppIcon") }
    @objc func handleRedIcon() { changeAppIcon(name: "RedAppIcon") }
    @objc func handleBlackIcon() { UIApplication.shared.setAlternateIconName(nil) }
    
    private func changeAppIcon(name: String) {
        UIApplication.shared.setAlternateIconName(name) { error in
            guard let error = error else {return}
            print(error)
            self.presentAlertOnMainThred(title: "Uppsss", message: "Something goes wrong:\n\(error.localizedDescription)")
        }
    }
    
    func configureContainer() {
        view.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .darkGray
        container.layer.cornerRadius = 25
        
        NSLayoutConstraint.activate([
            container.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            container.leftAnchor.constraint(equalTo: view.leftAnchor),
            container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            container.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)
        ])
    }
    private func configureSwipeLinie() {
        container.addSubview(swipeLine)
        swipeLine.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            swipeLine.topAnchor.constraint(equalTo: container.topAnchor, constant: 15),
            swipeLine.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            swipeLine.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.2)
        ])
    }
    func configureTitleLabel() {
        container.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.textColor = .white
        titleLabel.text = "Costum App Icon"
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: swipeLine.bottomAnchor, constant: 5),
            titleLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    private func configureStackView() {
        container.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            
        ])
    }
    private func configureButtons() {
        purpleIcon.addTarget(self, action: #selector(handlePurpleIcon), for: .touchUpInside)
        blueIcon.addTarget(self, action: #selector(handleBlueIcon), for: .touchUpInside)
        redIcon.addTarget(self, action: #selector(handleRedIcon), for: .touchUpInside)
        blackleIcon.addTarget(self, action: #selector(handleBlackIcon), for: .touchUpInside)
    }

}

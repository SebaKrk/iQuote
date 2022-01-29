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
    private let buttonIcon = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureContainer()
        configureSwipeLinie()
        configureButtonIcon()
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
    
    @objc func handleButtonIcon() {
        UIApplication.shared.setAlternateIconName("iQuote.red") { error in
            guard error == nil else { return }
        }
        presentAlertOnMainThred(title: "Succes", message: "Icon updated")
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
    private func configureButtonIcon() {
        container.addSubview(buttonIcon)
        buttonIcon.translatesAutoresizingMaskIntoConstraints = false
        
        buttonIcon.setTitle("Icon", for: .normal)
        buttonIcon.addTarget(self, action: #selector(handleButtonIcon), for: .touchUpInside)
            
        NSLayoutConstraint.activate([
            buttonIcon.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            buttonIcon.centerYAnchor.constraint(equalTo: container.centerYAnchor)
        ])
    }
}

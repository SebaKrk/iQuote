//
//  GradientConfigurationVC.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 11/12/2021.
//

import Foundation
import UIKit

class GradientConfigurationVC : UIViewController {
    
    let container = UIView()
    let gradientButton = UIButton()
    
    private let swipeLine = SwipeLine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureContainer()
        configureSwipeLinie()
        configureGradientButton()
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.0)
        tapGestureRecognizerToDissmisView()
        swipeDownGestureRecognizerToDissmisView(container: container)
    }
    //    MARK: - OBJC Func
    
    @objc func handleGradientButton() {
        NotificationCenter.default.post(name: .gradientObserver, object: nil)
    }
    
    //    MARK: - Constraints
    
    private func configureContainer() {
        
        view.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .black
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
    
    private func configureGradientButton() {
        container.addSubview(gradientButton)
        gradientButton.translatesAutoresizingMaskIntoConstraints = false
        
        gradientButton.setTitle("gradient", for: .normal)
        gradientButton.setTitleColor(.white, for: .normal)
        gradientButton.addTarget(self, action: #selector(handleGradientButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            gradientButton.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            gradientButton.centerYAnchor.constraint(equalTo: container.centerYAnchor)
        ])
    }
}

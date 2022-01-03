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
    
    let gradientBackgraoundLabel = UILabel()
    let shadowQuoteLabel = UILabel()
    
    let gradientBackgraoundSwitch = UISwitch()
    let shadowQuoteSwitch = UISwitch()
    
    private let swipeLine = SwipeLine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureContainer()
        configureSwipeLinie()
        //configureGradientButton()
        configureGradientLabel()
        configureGradientSwitch()
        configureShadowQuoteLabel()
        configureShadoSwitch()
    }
    override func viewDidLayoutSubviews() {
        cardOriginYext = container.frame.origin.y
        panGestureRecognizerToHandleDragAndDissmisView(inCardView: container, cardOriginY: cardOriginYext)
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
    
    @objc func handleGradientSwitch(sender: UISwitch) {
        if sender.isOn {
            NotificationCenter.default.post(name: .gradientObserver, object: nil)
        } else {
            NotificationCenter.default.post(name: .removeGradientObserver, object: nil)
        }
    }
    
    @objc func handleShadowSwitch(sender: UISwitch) {
        if sender.isOn {
            container.backgroundColor = .blue
        } else {
            container.backgroundColor = .black
        }
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
    
    private func configureGradientLabel() {
        container.addSubview(gradientBackgraoundLabel)
        gradientBackgraoundLabel.translatesAutoresizingMaskIntoConstraints = false
        
        gradientBackgraoundLabel.text = "Gradient Background"
        
        NSLayoutConstraint.activate([
            gradientBackgraoundLabel.centerYAnchor.constraint(equalTo: container.centerYAnchor,constant: -30),
            gradientBackgraoundLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor,constant: 30)
        ])
    }

    private func configureGradientSwitch() {
        container.addSubview(gradientBackgraoundSwitch)
        gradientBackgraoundSwitch.translatesAutoresizingMaskIntoConstraints = false
        gradientBackgraoundSwitch.addTarget(self, action: #selector(handleGradientSwitch(sender:)), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            gradientBackgraoundSwitch.centerYAnchor.constraint(equalTo: gradientBackgraoundLabel.centerYAnchor),
            gradientBackgraoundSwitch.trailingAnchor.constraint(equalTo: container.trailingAnchor,constant: -30)
        ])
    }
    
    private func configureShadowQuoteLabel() {
        container.addSubview(shadowQuoteLabel)
        shadowQuoteLabel.translatesAutoresizingMaskIntoConstraints = false
        
        shadowQuoteLabel.text = "Shadow Label"
        
        NSLayoutConstraint.activate([
            shadowQuoteLabel.centerYAnchor.constraint(equalTo: container.centerYAnchor,constant: 30),
            shadowQuoteLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor,constant: 30)
        ])
    }
    private func configureShadoSwitch() {
        container.addSubview(shadowQuoteSwitch)
        shadowQuoteSwitch.translatesAutoresizingMaskIntoConstraints = false
        shadowQuoteSwitch.addTarget(self, action: #selector(handleShadowSwitch(sender:)), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            shadowQuoteSwitch.centerYAnchor.constraint(equalTo: shadowQuoteLabel.centerYAnchor),
            shadowQuoteSwitch.trailingAnchor.constraint(equalTo: container.trailingAnchor,constant: -30)
        ])
    }
}

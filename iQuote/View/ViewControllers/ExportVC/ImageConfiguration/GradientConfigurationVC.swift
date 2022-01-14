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
    var bottomStackView = UIStackView()
    
    let gradientBackgraoundLabel = UILabel()
    let shadowQuoteLabel = UILabel()
    
    let gradientBackgraoundSwitch = UISwitch()
    let shadowQuoteSwitch = UISwitch()
    
    let cancleButton = CostumeActionButton(name: "CANCEL")
    let doneButton = CostumeActionButton(name: "DONE")
    
    private let swipeLine = SwipeLine()
    private let bottomLine = BottomLine()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupBottomStackView()
        configureButtons()
        configureContainer()
        configureSwipeLinie()
        configureGradientLabel()
        configureGradientSwitch()
        configureShadowQuoteLabel()
        configureShadoSwitch()
        configureBottomStackView()
        configureBottomLinie()
        
    }
    override func viewDidLayoutSubviews() {
        cardOriginYext = container.frame.origin.y
        panGestureRecognizerToHandleDragAndDissmisView(inCardView: container, cardOriginY: cardOriginYext)
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.0)
        tapGestureRecognizerToDissmisView()
        swipeDownGestureRecognizerToDissmisView(container: container)
        checkGradienSwitch()
    }
    //    MARK: - OBJC Func
    
    @objc func handleGradientSwitch(sender: UISwitch) {
        if sender.isOn {
            UserDefManager().gradientIsON = true
            NotificationCenter.default.post(name: .gradientObserver, object: nil)
        } else {
            UserDefManager().gradientIsON = false
            NotificationCenter.default.post(name: .removeGradientObserver, object: nil)
        }
    }
    
    @objc func handleShadowSwitch(sender: UISwitch) {
        if sender.isOn {
            UserDefManager().shadowIsON = true
            NotificationCenter.default.post(name: .shadowQuoteLabel, object: nil)
        } else {
            UserDefManager().shadowIsON = false
            NotificationCenter.default.post(name: .removeShadowQuoteLabel, object: nil)
        }
    }
    @objc func handleCancleButton() {
        print("handleCancleButton")
    }
    @objc func handleDoneButton() {
        print("handleDoneButton")
        dismiss(animated: true)
    }
    //    MARK: - StackViews
    
    
    private func setupBottomStackView() {
        bottomStackView = UIStackView(arrangedSubviews: [cancleButton,doneButton])
        bottomStackView.axis = .horizontal
        bottomStackView.distribution = .fillEqually
    }
    //    MARK: ConfigureButtons
    
    private func configureButtons() {
        cancleButton.addTarget(self, action: #selector(handleCancleButton), for: .touchUpInside)
        doneButton.addTarget(self, action: #selector(handleDoneButton), for: .touchUpInside)
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
    
    private func configureGradientLabel() {
        container.addSubview(gradientBackgraoundLabel)
        gradientBackgraoundLabel.translatesAutoresizingMaskIntoConstraints = false
        
        gradientBackgraoundLabel.text = "Gradient Background"
        gradientBackgraoundLabel.font = UIFont(name: fontText.fontLabel, size: 16)
        
        NSLayoutConstraint.activate([
            gradientBackgraoundLabel.topAnchor.constraint(equalTo: swipeLine.bottomAnchor, constant: 50),
            gradientBackgraoundLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor,constant: 30)
        ])
    }
    
    private func configureGradientSwitch() {
        container.addSubview(gradientBackgraoundSwitch)
        gradientBackgraoundSwitch.translatesAutoresizingMaskIntoConstraints = false
        gradientBackgraoundSwitch.addTarget(self, action: #selector(handleGradientSwitch(sender:)), for: .touchUpInside)
        gradientBackgraoundSwitch.onTintColor = .primaryOrange()
        
        NSLayoutConstraint.activate([
            gradientBackgraoundSwitch.centerYAnchor.constraint(equalTo: gradientBackgraoundLabel.centerYAnchor),
            gradientBackgraoundSwitch.trailingAnchor.constraint(equalTo: container.trailingAnchor,constant: -30)
        ])
    }
    
    private func configureShadowQuoteLabel() {
        container.addSubview(shadowQuoteLabel)
        shadowQuoteLabel.translatesAutoresizingMaskIntoConstraints = false
        
        shadowQuoteLabel.text = "Shadow Label"
        shadowQuoteLabel.font = UIFont(name: fontText.fontLabel, size: 16)
        
        NSLayoutConstraint.activate([
            shadowQuoteLabel.topAnchor.constraint(equalTo: gradientBackgraoundLabel.bottomAnchor, constant: 40),
            shadowQuoteLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor,constant: 30)
        ])
    }
    private func configureShadoSwitch() {
        container.addSubview(shadowQuoteSwitch)
        shadowQuoteSwitch.translatesAutoresizingMaskIntoConstraints = false
        shadowQuoteSwitch.addTarget(self, action: #selector(handleShadowSwitch(sender:)), for: .touchUpInside)
        shadowQuoteSwitch.onTintColor = .primaryOrange()
        
        NSLayoutConstraint.activate([
            shadowQuoteSwitch.centerYAnchor.constraint(equalTo: shadowQuoteLabel.centerYAnchor),
            shadowQuoteSwitch.trailingAnchor.constraint(equalTo: container.trailingAnchor,constant: -30)
        ])
    }
    
    private func configureBottomStackView() {
        container.addSubview(bottomStackView)
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bottomStackView.bottomAnchor.constraint(equalTo: container.safeAreaLayoutGuide.bottomAnchor),
            bottomStackView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            bottomStackView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            bottomStackView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    private func configureBottomLinie() {
        container.addSubview(bottomLine)
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bottomLine.bottomAnchor.constraint(equalTo: bottomStackView.topAnchor),
            bottomLine.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            bottomLine.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.9)
        ])
    }
    //    MARK: - HELPERS
    private func checkGradienSwitch() {
        if UserDefManager().gradientIsON {
            gradientBackgraoundSwitch.setOn(true, animated: true)
        } else {
            gradientBackgraoundSwitch.setOn(false, animated: true)
        }
        
        if UserDefManager().shadowIsON {
            shadowQuoteSwitch.setOn(true, animated: true)
        } else {
            shadowQuoteSwitch.setOn(false, animated: true)
        }
    }
}

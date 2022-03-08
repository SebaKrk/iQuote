//
//  PrivacyPolicyVC.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 07/03/2022.
//

import Foundation
import UIKit

class PrivacyPolicyViewController : UIViewController {
    
    private let container = UIView()
    private let swipeLine = SwipeLine()
    private let containerTitle = UILabel()
    
    private var stackView = UIStackView()
    private var leftStackView = UIStackView()
    private var rightStackView = UIStackView()
    
    private let iQuoteButton = UIButton()
    private let zenQuoteButton = UIButton()
    private let wikipediaButton = UIButton()
    private let unsplashButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupButtonTarget()
        configureContainer()
        configureSwipeLinie()
        configureContainerTitle()
        configureStackView()
    }
    override func viewDidLayoutSubviews() {
        cardOriginYext = container.frame.origin.y
        panGestureRecognizerToHandleDragAndDissmisView(inCardView: container, cardOriginY: cardOriginYext)
    }
    
    func setupView() {
        view.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.3)
        setupStackView()
        tapGestureRecognizerToDissmisView()
        swipeDownGestureRecognizerToDissmisView(container: container)
    }
    
    @objc func handleiQuoteButton () {
        showSafariService(with: SettingsURL.iQuotePrivacyPolicy.rawValue)
    }
    @objc func handleZenQuoteButton () {
        showSafariService(with: SettingsURL.zenQuotePrivacyPolicy.rawValue)
    }
    @objc func handleWikipediaButton() {
        showSafariService(with: SettingsURL.wikipediaPrivacyPolicy.rawValue)
    }
    @objc func handleUnsplashButton () {
        showSafariService(with: SettingsURL.unsplashPrivacyPolicy.rawValue)
    }
    
    private func setupStackView() {
    
        leftStackView = UIStackView(arrangedSubviews: [iQuoteButton,zenQuoteButton])
        leftStackView.axis = .vertical
        leftStackView.distribution = .fillEqually
        
        rightStackView = UIStackView(arrangedSubviews: [wikipediaButton,unsplashButton])
        rightStackView.axis = .vertical
        rightStackView.distribution = .fillEqually
        
        stackView = UIStackView(arrangedSubviews: [leftStackView,rightStackView])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
            
//        stackView.addArrangedSubview(leftStackView)
//        stackView.addArrangedSubview(rightStackView)
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
    
    private func configureContainerTitle() {
        container.addSubview(containerTitle)
        containerTitle.translatesAutoresizingMaskIntoConstraints = false
        
        containerTitle.text = "Privacy Policy"
        containerTitle.font = UIFont(name: "Roboto-Black", size: 28)
        
        NSLayoutConstraint.activate([
            containerTitle.topAnchor.constraint(equalTo: swipeLine.bottomAnchor, constant: 20),
            containerTitle.centerXAnchor.constraint(equalTo: container.centerXAnchor)
        ])
    }
    
    private func configureStackView() {
        container.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    private func setupButtonTarget() {
        iQuoteButton.setTitle("iQuote", for: .normal)
        zenQuoteButton.setTitle("ZenQuote", for: .normal)
        wikipediaButton.setTitle("Wikipedia", for: .normal)
        unsplashButton.setTitle("Unsplash", for: .normal)
        
        iQuoteButton.addTarget(self, action: #selector(handleiQuoteButton), for: .touchUpInside)
        zenQuoteButton.addTarget(self, action: #selector(handleZenQuoteButton), for: .touchUpInside)
        wikipediaButton.addTarget(self, action: #selector(handleWikipediaButton), for: .touchUpInside)
        unsplashButton.addTarget(self, action: #selector(handleUnsplashButton), for: .touchUpInside)
    }
    
    
}

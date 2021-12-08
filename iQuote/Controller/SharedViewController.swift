//
//  SharedViewController.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 03/12/2021.
//

import Foundation
import UIKit

class SharedViewController : UIViewController {
    
    let container = UIView()
    
    let socialContainer = UIView()
    let optionContainer = UIView()
    let imageContainer = UIView()
    
    var backgroundIMG = CostumBackground(placehodler: "BackgroundImage")
    var quoteLabel = CostumQuoteLabel()
    
    
    private let breakLine = SwipeLine()
    
    let padding : CGFloat = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        add(childVC: SocialViewController(), to: socialContainer)
        add(childVC: ImageConfigurationVC(), to: optionContainer)
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.3)
        configureContainer()
        configureSocialContainer()
        configureBreakLine()
        configureOptionsContainer()
        configureImageContainer()
        swpieDownGestureRecognizer()
        configureQuoteBackground()
        configureQuoteLabebel()
        
    }
    //    MARK: - GestureRecognizer
    
    @objc func handleSwipeDown() {
        dismiss(animated: true, completion: nil)
    }
    
    private func swpieDownGestureRecognizer() {
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeDown))
        swipeDown.direction = .down
        container.addGestureRecognizer(swipeDown)
    }
    
    
    //    MARK: - Constraints
    
    private func configureContainer() {
        view.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .darkGray
        container.layer.cornerRadius = 25
        
        NSLayoutConstraint.activate([
            container.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            container.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.75)
        ])
    }
    private func configureSocialContainer() {
        container.addSubview(socialContainer)
        socialContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            socialContainer.bottomAnchor.constraint(equalTo: container.safeAreaLayoutGuide.bottomAnchor),
            socialContainer.leadingAnchor.constraint(equalTo: container.leadingAnchor,constant: padding),
            socialContainer.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -padding),
            socialContainer.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.15)
        ])
    }
    
    private func configureBreakLine() {
        container.addSubview(breakLine)
        breakLine.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            breakLine.bottomAnchor.constraint(equalTo: socialContainer.topAnchor, constant: -10),
            breakLine.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            breakLine.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.75)
        ])
    }
    
    private func configureOptionsContainer() {
        container.addSubview(optionContainer)
        optionContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            optionContainer.bottomAnchor.constraint(equalTo: breakLine.topAnchor,constant: -10),
            optionContainer.leadingAnchor.constraint(equalTo: container.leadingAnchor,constant: padding),
            optionContainer.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -padding),
            optionContainer.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.1)
        ])
    }
    
    private func configureImageContainer() {
        container.addSubview(imageContainer)
        imageContainer.translatesAutoresizingMaskIntoConstraints = false
        
        
        imageContainer.layer.cornerRadius = 5
        imageContainer.layer.masksToBounds = true
        
        NSLayoutConstraint.activate([
            imageContainer.topAnchor.constraint(equalTo: container.topAnchor,constant: padding * 3),
            imageContainer.leadingAnchor.constraint(equalTo: container.leadingAnchor,constant: padding),
            imageContainer.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -padding),
            imageContainer.bottomAnchor.constraint(equalTo: optionContainer.topAnchor, constant: -padding)
        ])
    }
    
    private func configureQuoteBackground() {
        imageContainer.addSubview(backgroundIMG)
        backgroundIMG.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundIMG.topAnchor.constraint(equalTo: imageContainer.topAnchor),
            backgroundIMG.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor),
            backgroundIMG.trailingAnchor.constraint(equalTo: imageContainer.trailingAnchor),
            backgroundIMG.bottomAnchor.constraint(equalTo: imageContainer.bottomAnchor)
        ])
    }
    private func configureQuoteLabebel() {
        imageContainer.addSubview(quoteLabel)
        quoteLabel.translatesAutoresizingMaskIntoConstraints = false
        quoteLabel.text = Constants.exampleQute
        quoteLabel.numberOfLines = 3
        
        NSLayoutConstraint.activate([
            quoteLabel.topAnchor.constraint(equalTo: imageContainer.topAnchor),
            quoteLabel.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor),
            quoteLabel.trailingAnchor.constraint(equalTo: imageContainer.trailingAnchor),
            quoteLabel.bottomAnchor.constraint(equalTo: imageContainer.bottomAnchor)
        ])
    }
    // MARK: - Helpers
    
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
}

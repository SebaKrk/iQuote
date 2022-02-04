//
//  SharedViewController.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 03/12/2021.
//

import Foundation
import UIKit

class ExportViewController : UIViewController {
    
    let container = UIView()
    
    let shareContainer = UIView()
    let optionContainer = UIView()
    let imageContainer = UIView()
    
    var backgroundIMG = CostumBackground(placehodler: Constants.backgroundIMG)
    var quoteLabel = CostumQuoteLabel()
    
    private let breakLine = SwipeLine()
    private let swipeLine = SwipeLine()
    
    let padding : CGFloat = 20
    var cardViewOrigin: CGFloat!
    
    override func viewDidLayoutSubviews() {
        
        cardOriginYext = container.frame.origin.y
        panGestureRecognizerToHandleDragAndDissmisView2(inCardView: container, cardOriginY: cardOriginYext)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        add(childVC: ShareViewController(), to: shareContainer)
        add(childVC: ImageConfigurationVC(), to: optionContainer)
        add(childVC: ImageVC(), to: imageContainer)
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.0)
        configureContainer()
        configureShareContainer()
        configureBreakLine()
        configureOptionsContainer()
        configureImageContainer()
        configureSwipeLinie()
        //tapGestureRecognizerToDissmisView()
        swipeDownGestureRecognizerToDissmisView(container: container)
    }
    
    //    MARK: - Constraints
    
    private func configureContainer() {
        view.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .costumDarkGray() // .costumeGray()
        container.layer.cornerRadius = 25
        
        NSLayoutConstraint.activate([
            container.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            container.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.75)
        ])
    }
    private func configureShareContainer() {
        container.addSubview(shareContainer)
        shareContainer.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            shareContainer.bottomAnchor.constraint(equalTo: container.safeAreaLayoutGuide.bottomAnchor),
            shareContainer.leadingAnchor.constraint(equalTo: container.leadingAnchor,constant: padding*2),
            shareContainer.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -padding*2),
            shareContainer.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.15)
        ])
    }
    
    private func configureBreakLine() {
        container.addSubview(breakLine)
        breakLine.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            breakLine.bottomAnchor.constraint(equalTo: shareContainer.topAnchor, constant: -10),
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
            imageContainer.topAnchor.constraint(equalTo: container.topAnchor,constant: 60),
            imageContainer.leadingAnchor.constraint(equalTo: container.leadingAnchor,constant: padding),
            imageContainer.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -padding),
            imageContainer.bottomAnchor.constraint(equalTo: optionContainer.topAnchor, constant: -padding)
        ])
    }
    
    private func configureSwipeLinie() {
        container.addSubview(swipeLine)
        swipeLine.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            swipeLine.topAnchor.constraint(equalTo: container.topAnchor, constant: 15),
            swipeLine.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            swipeLine.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.4)
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

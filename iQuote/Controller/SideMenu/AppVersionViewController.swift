//
//  AppVersionViewController.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 17/12/2021.
//

import UIKit

class AppVersionViewController : UIViewController {
    
    private let appVersionLabel = CostumTitleLabel(textAligment: .center, fontSize: 20)
    private let appAuthorsLabel = CostumTitleLabel(textAligment: .center, fontSize: 16)
    private let container = UIView()
    private let swipeLine = SwipeLine()
    
    private let appVersion = Secrets.appVersion
    private let appAuthors = Secrets.appAuthors
    private let padding : CGFloat = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureContainer()
        configureSwipeLinie()
        configureAppVersionLabel()
        configureAppAuthorsLabel()
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
    
    func configureAppVersionLabel() {
        container.addSubview(appVersionLabel)
        appVersionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        appVersionLabel.textColor = .white
        appVersionLabel.text = "App Version \(appVersion)"
        
        NSLayoutConstraint.activate([
            appVersionLabel.topAnchor.constraint(equalTo: swipeLine.bottomAnchor, constant: padding * 2),
            appVersionLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor),
        ])
    }
    
    func configureAppAuthorsLabel() {
        container.addSubview(appAuthorsLabel)
        appAuthorsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        appAuthorsLabel.textColor = .white
        appAuthorsLabel.text = "Author: \(appAuthors)"
        
        NSLayoutConstraint.activate([
            appAuthorsLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -padding * 2),
            appAuthorsLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor)
        ])
    }
    
}

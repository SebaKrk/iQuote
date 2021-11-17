//
//  MainViewController.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 17/11/2021.
//

import Foundation
import UIKit

class MainViewController : UIViewController {
    
    let quoteContainer = UIView()
    let authorContainer = UIView()
    let navigationContainer = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        view.backgroundColor = .white
    }
    
    //    MARK: - Constraints
    
    private func setupConstraints() {
        view.addSubview(quoteContainer)
        view.addSubview(authorContainer)
        view.addSubview(navigationContainer)
        
        quoteContainer.translatesAutoresizingMaskIntoConstraints = false
        authorContainer.translatesAutoresizingMaskIntoConstraints = false
        navigationContainer.translatesAutoresizingMaskIntoConstraints = false
        
        quoteContainer.backgroundColor = .blue
        authorContainer.backgroundColor = .green
        navigationContainer.backgroundColor = .red
        
        NSLayoutConstraint.activate([
            quoteContainer.topAnchor.constraint(equalTo: view.topAnchor),
            quoteContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            quoteContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            quoteContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.55),
            
            authorContainer.topAnchor.constraint(equalTo: quoteContainer.bottomAnchor),
            authorContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            authorContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            authorContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15),
            
            navigationContainer.topAnchor.constraint(equalTo: authorContainer.bottomAnchor),
            navigationContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
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


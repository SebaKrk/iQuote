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
//        view.backgroundColor = .white
        configureNavigationItem()
        add(childVC: QuoteViewController(), to: quoteContainer)
        add(childVC: AuthorViewController(), to: authorContainer)
    }
    //    MARK: - OBJC Func
    
    @objc func handleLeftBarButton() {
        print("DEBUG: Menu button pressed")
    }
    
    //    MARK: - Navigation Item
    
    private func configureNavigationItem() {
        
        let configuration = UIImage.SymbolConfiguration(paletteColors: [.white])
        let leftImage = UIImage(systemName: "text.justify", withConfiguration: configuration)
        leftImage?.withTintColor(.white)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: leftImage, style: .done, target: self, action: #selector(handleLeftBarButton))
    }
    
    //    MARK: - Constraints
    
    private func setupConstraints() {
        view.addSubview(quoteContainer)
        view.addSubview(authorContainer)
        view.addSubview(navigationContainer)
        
        quoteContainer.translatesAutoresizingMaskIntoConstraints = false
        authorContainer.translatesAutoresizingMaskIntoConstraints = false
        navigationContainer.translatesAutoresizingMaskIntoConstraints = false
        
//        quoteContainer.backgroundColor = .red
        authorContainer.backgroundColor = .green
        navigationContainer.backgroundColor = .blue
        
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



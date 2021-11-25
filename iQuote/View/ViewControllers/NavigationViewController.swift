//
//  NavigationViewController.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 21/11/2021.
//

import Foundation
import UIKit

class NavigationViewController : UIViewController {
    
    let quoteMenuContainer = UIView()
    
    var mainQuoteButton = CostumeQuoteButton()
    
    var heartButton = CostumTransButton(imageOne: "heartButton", imageTwo: "heartButton2")
    var listButton = CostumTransButton(imageOne: "listButton", imageTwo: "listButton2")
    var nextButton = CostumTransButton(imageOne: "nextButton", imageTwo: "nextButton2")
    var exportButton = CostumTransButton(imageOne: "exportButton", imageTwo: "exportButton2")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureQuoteMenuContainer()
        configureMainButton()
        configureMenuButtons()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        closeMenu()
    }
    //    MARK: - OBJC Func
    
    @objc func handleMainButton() {
        
        UIView.animate(withDuration: 0.3) {
            if self.quoteMenuContainer.transform == .identity {
                self.mainQuoteButton.flipLikeState()
                self.closeMenu()
            } else {
                self.mainQuoteButton.flipLikeState()
                self.quoteMenuContainer.transform = .identity
            }
        }
        UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            if self.quoteMenuContainer.transform == .identity {
                self.heartButton.transform = .identity
                self.nextButton.transform = .identity
                self.exportButton.transform = .identity
                self.listButton.transform = .identity
            }
        })
        
        
    }
    @objc func handleHeartButton() {
        heartButton.flipLikeState()
    }
    
    @objc func handleListButton() {
        listButton.flipLikeState()
    }
    
    @objc func handleExportButton() {
        exportButton.flipLikeState()
    }
    
    @objc func handleNextButton() {
        nextButton.flipLikeState()
    }
    
    //   MARK: - Close Menu
    
    private func closeMenu() {
        quoteMenuContainer.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        nextButton.transform = CGAffineTransform(translationX: 30, y: 0)
        exportButton.transform = CGAffineTransform(translationX: -30, y: 0)
        heartButton.transform = CGAffineTransform(translationX: 0, y: 30)
        listButton.transform = CGAffineTransform(translationX: 0, y: -30)
    }
    
    
    //    MARK: - Constraints
    
    private func configureQuoteMenuContainer(){
        view.addSubview(quoteMenuContainer)
        quoteMenuContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            quoteMenuContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            quoteMenuContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            quoteMenuContainer.widthAnchor.constraint(equalToConstant: 200),
            quoteMenuContainer.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func configureMainButton() {
        view.addSubview(mainQuoteButton)
        mainQuoteButton.translatesAutoresizingMaskIntoConstraints = false
        mainQuoteButton.addTarget(self, action: #selector(handleMainButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            mainQuoteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainQuoteButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    private func configureMenuButtons() {
        quoteMenuContainer.addSubview(heartButton)
        quoteMenuContainer.addSubview(nextButton)
        quoteMenuContainer.addSubview(exportButton)
        quoteMenuContainer.addSubview(listButton)
        
        listButton.addTarget(self, action: #selector(handleListButton), for: .touchUpInside)
        heartButton.addTarget(self, action: #selector(handleHeartButton), for: .touchUpInside)
        exportButton.addTarget(self, action: #selector(handleExportButton), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(handleNextButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            
            nextButton.leadingAnchor.constraint(equalTo: mainQuoteButton.trailingAnchor,constant: 10),
            nextButton.centerYAnchor.constraint(equalTo: mainQuoteButton.centerYAnchor),
            
            exportButton.trailingAnchor.constraint(equalTo: mainQuoteButton.leadingAnchor,constant: -10),
            exportButton.centerYAnchor.constraint(equalTo: mainQuoteButton.centerYAnchor),
            
            heartButton.bottomAnchor.constraint(equalTo: mainQuoteButton.topAnchor,constant: -10),
            heartButton.centerXAnchor.constraint(equalTo: mainQuoteButton.centerXAnchor),
            
            listButton.topAnchor.constraint(equalTo: mainQuoteButton.bottomAnchor,constant: 10),
            listButton.centerXAnchor.constraint(equalTo: mainQuoteButton.centerXAnchor)
        ])
    }
    
}


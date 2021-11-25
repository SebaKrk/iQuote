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
//    MARK: - OBJC Func
    
    @objc func handleMainButton() {
        mainQuoteButton.flipLikeState()
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
    
//    MARK: - Constraints
    
    private func configureQuoteMenuContainer(){
        view.addSubview(quoteMenuContainer)
        quoteMenuContainer.translatesAutoresizingMaskIntoConstraints = false
//        quoteMenuContainer.backgroundColor = .white

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


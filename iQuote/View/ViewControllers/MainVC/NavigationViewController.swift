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
    var quoteButtonIsOpen = false
    
    var heartButton = CostumTransButton(imageOne: "heartButton", imageTwo: "heartButton2")
    var listButton = CostumTransButton(imageOne: "listButton", imageTwo: "listButton2")
    var nextButton = CostumTransButton(imageOne: "nextButton", imageTwo: "nextButton2")
    var exportButton = CostumTransButton(imageOne: "exportButton", imageTwo: "exportButton2")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureQuoteMenuContainer()
        configureMainButton()
        configureMenuButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        closeMenu()
    }
    private func setupView() {
        view.backgroundColor = .black
    }
    
    //    MARK: - OBJC Func
    
    @objc func handleMainButton() {
        
        UIView.animate(withDuration: 0.3) {
            if self.quoteMenuContainer.transform == .identity {
                self.quoteButtonIsOpen = false
                self.mainQuoteButton.flipLikeState()
                self.closeMenu()
                
            } else {
                self.quoteButtonIsOpen = true
                self.mainQuoteButton.flipLikeState()
                self.swipeGestureRecognizer()
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
        //heartButton.flipLikeState()
        
        let favorite = Quote(q: quoteToFavorites, a: authorToFavorites)
        PersistenceManager.uppdateWith(favorite: favorite, actionType: .add) { error in
            guard let error = error else {
                self.presentAlertOnMainThred(title: "Succes!", message: Messages.sucesffulyFavorited.rawValue)
                return
            }
            self.presentAlertOnMainThred(title: "Upss", message: error.rawValue)
        }
    }
    
    @objc func handleListButton() {
        // listButton.flipLikeState()
        
        let desVC = FavoritesListViewController()
        desVC.modalPresentationStyle = .overFullScreen
        desVC.modalTransitionStyle = .flipHorizontal //.coverVertical //.crossDissolve
        present(desVC, animated: true, completion: nil)
    }
    
    @objc func handleExportButton() {
        // exportButton.flipLikeState()
        
        let desVC = ExportViewController()
        desVC.modalPresentationStyle = .overFullScreen
        desVC.modalTransitionStyle = .coverVertical
        present(desVC, animated: true, completion: nil)
    }
    @objc func handleNextButton() {
        //nextButton.flipLikeState()
        NotificationCenter.default.post(name: .nextQuote, object: nil)
    }
    
    //   MARK: - Close Menu
    
    private func closeMenu() {
        quoteMenuContainer.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        nextButton.transform = CGAffineTransform(translationX: 30, y: 0)
        exportButton.transform = CGAffineTransform(translationX: -30, y: 0)
        heartButton.transform = CGAffineTransform(translationX: 0, y: 30)
        listButton.transform = CGAffineTransform(translationX: 0, y: -30)
    }
    //    MARK: - SwipeGestureRecognizer
    
    @objc func handleSwipeUp() {
        quoteButtonIsOpen == true ?  heartButton.flipLikeState() : nil
    }
    @objc func handleSwipeDown() {
        quoteButtonIsOpen == true ?  listButton.flipLikeState() : nil
    }
    @objc func handleSwipeLeft() {
        quoteButtonIsOpen == true ?  exportButton.flipLikeState() : nil
    }
    @objc func handleSwipeRight() {
        quoteButtonIsOpen == true ?  nextButton.flipLikeState() : nil
    }
    
    private func swipeGestureRecognizer() {
        let swipeUpGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeUp))
        swipeUpGesture.direction = .up
        view.addGestureRecognizer(swipeUpGesture)
        
        let swipeDownGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeDown))
        swipeDownGesture.direction = .down
        view.addGestureRecognizer(swipeDownGesture)
        
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeLeft))
        swipeLeftGesture.direction = .left
        view.addGestureRecognizer(swipeLeftGesture)
        
        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeRight))
        swipeRightGesture.direction = .right
        view.addGestureRecognizer(swipeRightGesture)
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
        
        heartButton.backgroundColor = .black
        nextButton.backgroundColor = .black
        exportButton.backgroundColor = .black
        listButton.backgroundColor = .black
    
        listButton.addTarget(self, action: #selector(handleListButton), for: .touchUpInside)
        heartButton.addTarget(self, action: #selector(handleHeartButton), for: .touchUpInside)
        exportButton.addTarget(self, action: #selector(handleExportButton), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(handleNextButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            nextButton.leadingAnchor.constraint(equalTo: mainQuoteButton.trailingAnchor,constant: 10),
            nextButton.centerYAnchor.constraint(equalTo: mainQuoteButton.centerYAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 50),
            nextButton.heightAnchor.constraint(equalToConstant: 50),
            
            exportButton.trailingAnchor.constraint(equalTo: mainQuoteButton.leadingAnchor,constant: -10),
            exportButton.centerYAnchor.constraint(equalTo: mainQuoteButton.centerYAnchor),
            exportButton.widthAnchor.constraint(equalToConstant: 50),
            exportButton.heightAnchor.constraint(equalToConstant: 50),
            
            heartButton.bottomAnchor.constraint(equalTo: mainQuoteButton.topAnchor,constant: -10),
            heartButton.centerXAnchor.constraint(equalTo: mainQuoteButton.centerXAnchor),
            heartButton.widthAnchor.constraint(equalToConstant: 50),
            heartButton.heightAnchor.constraint(equalToConstant: 50),
            
            listButton.topAnchor.constraint(equalTo: mainQuoteButton.bottomAnchor,constant: 10),
            listButton.centerXAnchor.constraint(equalTo: mainQuoteButton.centerXAnchor),
            listButton.widthAnchor.constraint(equalToConstant: 50),
            listButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

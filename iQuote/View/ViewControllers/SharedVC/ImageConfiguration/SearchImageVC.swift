//
//  SearchImageVC.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 14/12/2021.
//

import Foundation
import UIKit

class SearchImageVC : UIViewController {
    
    
    let container = UIView()
    let swipeLine = SwipeLine()
    let searchText = ImageSearchTF()
    let searchButton = CostumeQuoteButton()
    
    var isSearchTextFieldIsEmpty : Bool { return !searchText.text!.isEmpty }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        configureContainer()
        configureSwipeLinie()
        configureSearchTextField()
        configureSearchButton()
        swpieDownGestureRecognizer()
        createDissmisKeybordTapgesture()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        searchText.text = ""
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.0)
    }
    //    MARK: - OBJC Func
    
    @objc func handleSearchButton() {
        
        guard isSearchTextFieldIsEmpty else {
            self.presentAlertOnMainThred(title: "Upss", message: "Please enter text. We need to know what to look for")
            return
        }
        searchButton.flipLikeState()
        
        let desVC = UnsplashCollectionVC()
        desVC.category = searchText.text ?? "landscapes"
        present(desVC, animated: true, completion: nil)
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
    func createDissmisKeybordTapgesture() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
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
    private func configureSearchTextField() {
        view.addSubview(searchText)
        searchText.translatesAutoresizingMaskIntoConstraints = false
        
//        searchText.backgroundColor = .white
//        searchText.textColor = .black
//        searchText.textAlignment = .center
//        searchText.layer.cornerRadius = 15
        
        NSLayoutConstraint.activate([
            searchText.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            searchText.centerYAnchor.constraint(equalTo: container.centerYAnchor, constant: -50),
            searchText.heightAnchor.constraint(equalToConstant: 40),
            searchText.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.7)
        ])
    }
    private func  configureSearchButton() {
        container.addSubview(searchButton)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.addTarget(self, action: #selector(handleSearchButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            searchButton.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            searchButton.centerYAnchor.constraint(equalTo: container.centerYAnchor, constant: 25)
        ])
    }
    
    
    
}

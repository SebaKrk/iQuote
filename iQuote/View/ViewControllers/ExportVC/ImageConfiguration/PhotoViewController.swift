//
//  PhotoViewController.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 10/01/2022.
//

import Foundation
import UIKit

class PhotoViewController : UIViewController {
    
    let container = UIView()
    let swipeLine = SwipeLine()
    
    var stackView = UIStackView()
    
    let unsplashButton = CostumTransButton(imageOne: "UnsplashImage1", imageTwo: "UnsplashImage2")
    let photoLibryButton = CostumTransButton(imageOne: "GalleryButton1", imageTwo: "GalleryButton2")
    
    let searchText = ImageSearchTF()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupStackView()
        configureContainer()
        configureSwipeLinie()
        configureStackView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //searchText.text = ""
    }
    override func viewDidLayoutSubviews() {
        cardOriginYext = container.frame.origin.y
        panGestureRecognizerToHandleDragAndDissmisView(inCardView: container, cardOriginY: cardOriginYext)
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.0)
        //createDissmisKeybordTapgesture()
        tapGestureRecognizerToDissmisView()
        swipeDownGestureRecognizerToDissmisView(container: container)
    }
    
    // MARK: - OBJC Func
    
    @objc func handlePhotoLibryButton() {
        print("photoLibryButton")
    }
    
    @objc func handleUnsplashButton() {
       print("unsplashButton")
    }
    
 
    //    MARK: - StackView
    
    private func setupStackView() {
        stackView = UIStackView(arrangedSubviews: [photoLibryButton, unsplashButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
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
    private func configureStackView() {
        container.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    private func configureButtons() {
        unsplashButton.addTarget(self, action: #selector(handleUnsplashButton), for: .touchUpInside)
        photoLibryButton.addTarget(self, action: #selector(handlePhotoLibryButton), for: .touchUpInside)
    }
}

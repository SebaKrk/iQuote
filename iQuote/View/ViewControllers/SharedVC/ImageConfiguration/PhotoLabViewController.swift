//
//  PhotoLabViewController.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 24/12/2021.
//

import Foundation
import UIKit

class PhotoLabViewController : UIViewController {
    
    let container = UIView()
    let swipeLine = SwipeLine()
    
    var stackView = UIStackView()
    
    let unsplashButton = CostumTransButton(imageOne: "BackgroundIcon", imageTwo: "BackgroundIcon")
    let photoLibryButton = CostumTransButton(imageOne: "BackgroundIcon", imageTwo: "BackgroundIcon2")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        configureContainer()
        configureSwipeLinie()
        setupStackView()
        configureStackView()
        configureButtons()
    }
    override func viewDidLayoutSubviews() {
        cardOriginYext = container.frame.origin.y
        panGestureRecognizerToHandleDragAndDissmisView(inCardView: container, cardOriginY: cardOriginYext)
    }
    
    
    private func setupView() {
        view.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.1)
        tapGestureRecognizerToDissmisView()
        swipeDownGestureRecognizerToDissmisView(container: container)
    }
    // MARK: - OBJC Func
    
    @objc func handleUnsplashButton() {
        print("handleUnsplashButton")
        let desVC = SearchImageVC()
        desVC.modalPresentationStyle = .overFullScreen
        present(desVC,animated: true,completion: nil)
    }
    @objc func handlePhotoLibryButton() {
        print("handlePhotoLibryButton")
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.modalPresentationStyle = .popover
        
        
        if let popover = imagePicker.popoverPresentationController {
            let sheet = popover.adaptiveSheetPresentationController
            sheet.detents = [.medium(), .large()]
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersEdgeAttachedInCompactHeight = true
            sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
        }
        present(imagePicker, animated: true, completion: nil)
    }
    
    //    MARK: - StackView
    
    private func setupStackView() {
        stackView = UIStackView(arrangedSubviews: [unsplashButton,photoLibryButton])
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

extension PhotoLabViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage {
            NotificationCenter.default.post(name: .imgPickerObserver, object: nil, userInfo: ["imgPicker" : image])
        }
  
        dismiss(animated: true, completion: nil)
    }
}

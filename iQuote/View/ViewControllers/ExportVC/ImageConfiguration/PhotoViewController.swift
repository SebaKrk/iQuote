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
    
    let unsplashButton = CostumTransButton(imageOne: "UnsplashImage1", imageTwo: "UnsplashImage1")
    let photoLibryButton = CostumTransButton(imageOne: "GalleryButton1", imageTwo: "GalleryButton1")
    
    let searchText = ImageSearchTF()
    var isSearchTextFieldIsEmpty : Bool { return !searchText.text!.isEmpty }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupStackView()
        configureContainer()
        configureSwipeLinie()
        configureStackView()
        configureButtons()
        configureSearchTextField()
        self.searchText.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        searchText.isHidden = true
        searchText.text = ""
    }
    override func viewDidLayoutSubviews() {
        cardOriginYext = container.frame.origin.y
        panGestureRecognizerToHandleDragAndDissmisView(inCardView: container, cardOriginY: cardOriginYext)
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.0)
        createDissmisKeybordTapgesture()
        tapGestureRecognizerToDissmisView()
        swipeDownGestureRecognizerToDissmisView(container: container)
    }
    
    // MARK: - OBJC Func
    
    @objc func handlePhotoLibryButton() {
        photoLibryButton.flipLikeState()
        
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
    
    @objc func handleUnsplashButton() {
        unsplashButton.flipLikeState()
        
        searchText.isHidden = false
        
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: searchText.center.x - 10, y: searchText.center.y))
        animation.fromValue = NSValue(cgPoint: CGPoint(x: searchText.center.x + 10, y: searchText.center.y))
        
        searchText.layer.add(animation, forKey: "position")
        
    }
    func unsplashSearch() {
        guard isSearchTextFieldIsEmpty else {
            self.presentAlertOnMainThred(title: "Upss", message: "Please enter text. We need to know what to look for")
            return
        }
        
        let desVC = UnsplashCollectionVC()
        desVC.category = searchText.text ?? "landscapes"
        present(desVC, animated: true, completion: nil)
    }
    
    //    MARK: - GestureRecognizer
    
    private func createDissmisKeybordTapgesture() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        container.addGestureRecognizer(tap)
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
        
        container.roundCorners(with: [.layerMinXMinYCorner, .layerMaxXMinYCorner], radius: 25)

        
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
            stackView.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    private func configureSearchTextField() {
        container.addSubview(searchText)
        searchText.translatesAutoresizingMaskIntoConstraints = false
        searchText.returnKeyType = UIReturnKeyType.go
        
        NSLayoutConstraint.activate([
            searchText.topAnchor.constraint(equalTo: stackView.bottomAnchor),
            searchText.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            searchText.heightAnchor.constraint(equalToConstant: 40),
            searchText.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.7)
        ])
        
    }
    private func configureButtons() {
        unsplashButton.addTarget(self, action: #selector(handleUnsplashButton), for: .touchUpInside)
        photoLibryButton.addTarget(self, action: #selector(handlePhotoLibryButton), for: .touchUpInside)
    }

}

//  MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate

extension PhotoViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage {
            NotificationCenter.default.post(name: .imgPickerObserver, object: nil, userInfo: ["imgPicker" : image])
        }
        NotificationCenter.default.post(name: .chooseImgObserver, object: nil)
    }
}
// MARK: - UITextFieldDelegate

extension PhotoViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        unsplashSearch()
        return true
    }
}

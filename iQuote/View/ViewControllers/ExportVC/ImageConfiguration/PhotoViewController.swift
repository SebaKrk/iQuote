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
    let bottomLine = BottomLine()
    
    var bottomStackView = UIStackView()
    
    let unsplashButton = CostumTransButton(imageOne: Icons.unsplashIcon, imageTwo: Icons.unsplashIcon2)
    let photoLibryButton = CostumTransButton(imageOne: Icons.galleryButton, imageTwo: Icons.galleryButton)
    
    let cancleButton = CancleButton()
    let doneButton = ActionButton()
    
    var unsplashButtonIsON = false
    
    let searchText = ImageSearchTF()
    var isSearchTextFieldIsEmpty : Bool { return !searchText.text!.isEmpty }
    
    //    MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupBottomStackView()
        configureContainer()
        configureSwipeLinie()
        configurePhotoLibryButton()
        configureUnsplashButton()
        configureButtons()
        configureSearchTextField()
        configureBottomStackView()
        configureBottomLinie()
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
//        tapGestureRecognizerToDissmisView()
        swipeDownGestureRecognizerToDissmisView(container: container)
        tapGestureToDissmis()
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
        unsplashButtonIsON = !unsplashButtonIsON
        
        if unsplashButtonIsON == true {
            unsplashButton.flipLikeState()
            searchText.isHidden = false
            //animateTextField()
            searchText.becomeFirstResponder()
        } else {
            unsplashButton.flipLikeState()
            searchText.isHidden = true
        }
    }
    
    func unsplashSearch() {
        guard isSearchTextFieldIsEmpty else {
            self.presentAlertOnMainThred(title: "Upss", message: ErrorMassage.invalidText.rawValue)
            return
        }
        unsplashButton.flipLikeState()
        
        let desVC = UnsplashCollectionVC()
        desVC.category = searchText.text ?? "landscapes"
        desVC.delegate = self
        present(desVC, animated: true, completion: nil)
    }
    
    @objc func handleCancleButton() {
        dismiss(animated: true)
    }
    @objc func handleDoneButton() {
        dismiss(animated: true)
    }
    
    @objc func handleTapGesture() {
        dismiss(animated: true, completion: nil)
    }
    //    MARK: - ConfigureButtons
    
    private func configureButtons() {
        unsplashButton.addTarget(self, action: #selector(handleUnsplashButton), for: .touchUpInside)
        photoLibryButton.addTarget(self, action: #selector(handlePhotoLibryButton), for: .touchUpInside)
        cancleButton.addTarget(self, action: #selector(handleCancleButton), for: .touchUpInside)
        doneButton.addTarget(self, action: #selector(handleDoneButton), for: .touchUpInside)
    }
    
    //    MARK: - GestureRecognizer
    
    private func createDissmisKeybordTapgesture() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        container.addGestureRecognizer(tap)
    }
    private func tapGestureToDissmis() {
        let tap = UITapGestureRecognizer()
        tap.addTarget(self, action: #selector(handleTapGesture))
        tap.delegate = self
        view.addGestureRecognizer(tap)
    }
    //    MARK: - StackView
    
    private func setupBottomStackView() {
        bottomStackView = UIStackView(arrangedSubviews: [cancleButton,doneButton])
        bottomStackView.axis = .horizontal
        bottomStackView.distribution = .fillEqually
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
    
    private func configurePhotoLibryButton() {
        container.addSubview(photoLibryButton)
        photoLibryButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            photoLibryButton.centerXAnchor.constraint(equalTo: container.centerXAnchor, constant: -50),
            photoLibryButton.centerYAnchor.constraint(equalTo: container.centerYAnchor,constant: -30)
        ])
    }
    private func configureUnsplashButton() {
        container.addSubview(unsplashButton)
        unsplashButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            unsplashButton.centerXAnchor.constraint(equalTo: container.centerXAnchor,constant: 50),
            unsplashButton.centerYAnchor.constraint(equalTo: container.centerYAnchor,constant: -30)
        ])
    }
    
    private func configureSearchTextField() {
        container.addSubview(searchText)
        searchText.translatesAutoresizingMaskIntoConstraints = false
        searchText.returnKeyType = UIReturnKeyType.go
        
        NSLayoutConstraint.activate([
            searchText.topAnchor.constraint(equalTo: photoLibryButton.bottomAnchor, constant: 20),
            searchText.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            searchText.heightAnchor.constraint(equalToConstant: 40),
            searchText.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.7)
        ])
    }
    
    private func configureBottomStackView() {
        container.addSubview(bottomStackView)
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bottomStackView.bottomAnchor.constraint(equalTo: container.safeAreaLayoutGuide.bottomAnchor),
            bottomStackView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            bottomStackView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            bottomStackView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    private func configureBottomLinie() {
        container.addSubview(bottomLine)
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bottomLine.bottomAnchor.constraint(equalTo: bottomStackView.topAnchor),
            bottomLine.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            bottomLine.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.9)
        ])
    }
    //    MARK: - Animation
    
    private func animateTextField() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: searchText.center.x - 10, y: searchText.center.y))
        animation.fromValue = NSValue(cgPoint: CGPoint(x: searchText.center.x + 10, y: searchText.center.y))
        
        searchText.layer.add(animation, forKey: "position")
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
// MARK: -  UnsplashIsEmptyDelegate

extension PhotoViewController : UnsplashIsEmptyDelegate {
    func arrayIsEmpty() {
        DispatchQueue.main.async {
            self.dismiss(animated: true) {
                self.presentAlertOnMainThred(title: "Upsss", message: ErrorMassage.wrongString.rawValue)
            }
        }
    }
}
// MARK: - UIGestureRecognizerDelegate
extension PhotoViewController : UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        
        if touch.view?.isDescendant(of: container) == true {
            return false
        }
        return true
    }
}

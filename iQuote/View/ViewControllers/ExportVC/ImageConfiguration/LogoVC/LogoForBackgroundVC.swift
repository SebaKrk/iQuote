//
//  LogoForBackgraoundVC.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 13/01/2022.
//

import UIKit

class LogoForBackground : UIViewController {
        
    let container = UIView()
    var stackView = UIStackView()
    var bottomStackView = UIStackView()
    
    let mainLogoButton = CostumTransButton(imageOne: Icons.LogoButton1, imageTwo: Icons.LogoButton1)
    let whiteLogoButton = CostumTransButton(imageOne: Icons.LogoButton2, imageTwo: Icons.LogoButton2)
    let emptyLogoButton = CostumTransButton(imageOne: Icons.LogoButton3, imageTwo: Icons.LogoButton3)
    
    let cancleButton = CancleButton()
    let doneButton = ActionButton()
    
    private let swipeLine = SwipeLine()
    private let bottomLine = BottomLine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupStackView()
        setupBottomStackView()
        configureButtons()
        configureContainer()
        configureSwipeLinie()
        configureStackView()
        configureBottomStackView()
        configureBottomLinie()
        
    }
    override func viewDidLayoutSubviews() {
        cardOriginYext = container.frame.origin.y
        panGestureRecognizerToHandleDragAndDissmisView(inCardView: container, cardOriginY: cardOriginYext)
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.0)
        //tapGestureRecognizerToDissmisView()
        swipeDownGestureRecognizerToDissmisView(container: container)
        tapGestureToDissmis()
    }
//    MARK: - StackView
    private func setupStackView() {
        stackView = UIStackView(arrangedSubviews: [mainLogoButton,whiteLogoButton,emptyLogoButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
    }
    
    private func setupBottomStackView() {
        bottomStackView = UIStackView(arrangedSubviews: [cancleButton,doneButton])
        bottomStackView.axis = .horizontal
        bottomStackView.distribution = .fillEqually
    }
//  MARK: - OBJC Func
    
    @objc func handleMainLogoButton() {
        mainLogoButton.flipLikeState()
        let logoIMG = UIImage(named: Icons.LogoForBackground)
        NotificationCenter.default.post(name: .logoImgObserver, object: nil, userInfo: ["logoImg" : logoIMG!])
    }
    @objc func handleWhiteLogoButton() {
        whiteLogoButton.flipLikeState()
        let logoIMG  = UIImage(named: Icons.LogoForBackgroundWhite)
        NotificationCenter.default.post(name: .logoImgObserver, object: nil, userInfo: ["logoImg" : logoIMG!])
    }
    @objc func handleEmptyLogoButton() {
        emptyLogoButton.flipLikeState()
        NotificationCenter.default.post(name: .logoObserver, object: nil)
    }
    
    @objc func handleCancleButton() {
        dismiss(animated: true)
    }
    @objc func handleDoneButton() {
        dismiss(animated: true)
    }
    //    MARK: - ConfigureButtons
    
    private func configureButtons() {
        mainLogoButton.addTarget(self, action: #selector(handleMainLogoButton), for: .touchUpInside)
        whiteLogoButton.addTarget(self, action: #selector(handleWhiteLogoButton), for: .touchUpInside)
        emptyLogoButton.addTarget(self, action: #selector(handleEmptyLogoButton), for: .touchUpInside)
        cancleButton.addTarget(self, action: #selector(handleCancleButton), for: .touchUpInside)
        doneButton.addTarget(self, action: #selector(handleDoneButton), for: .touchUpInside)
    }
    //    MARK: - GestureRecognizer
    
    @objc func handleTapGesture() {
        dismiss(animated: true, completion: nil)
    }

    private func tapGestureToDissmis() {
        let tap = UITapGestureRecognizer()
        tap.addTarget(self, action: #selector(handleTapGesture))
        tap.delegate = self
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
    
    private func configureStackView() {
        container.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 50)
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
}
// MARK: - UIGestureRecognizerDelegate
extension LogoForBackground : UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {

        if touch.view?.isDescendant(of: container) == true {
            return false
        }
        return true
    }
}

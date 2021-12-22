//
//  FacebookViewController.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 16/12/2021.
//


import UIKit
import FBSDKShareKit

class FacebookViewController : UIViewController {
    
    let container = UIView()
    var stackView = UIStackView()
    
    let storiesButton = UIButton()
    let feedButton = UIButton()
    let linkButton = UIButton()
    
    private let swipeLine = SwipeLine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureContainer()
        configureSwipeLinie()
        setupStackView()
        configureStackView()
        configureButtons()
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.0)
        
        tapGestureRecognizerToDissmisView()
        swipeDownGestureRecognizerToDissmisView(container: container)
        panGestureRecognizerToHandleDragAndDissmisView(inCardView: container)
    }
    //    MARK: - OBJC Func
    
    @objc func handleStoriestButton() {
        print("handleStoriestButton")
        NotificationCenter.default.post(name: .facebookObserver, object: nil)
    }
    @objc func handleFeedButton() {
        print("handleFeedButton")
    }
    @objc func handleLinkButton() {
        print("handleLinkButton")
        shareLink()
        
    }
    // MARK: -
    func shareLink() {
        guard let url = URL(string: "https://www.apple.com") else {return}
        
        let content = ShareLinkContent()
        content.contentURL = url
        content.quote = "zajebsita aplikacja , polecam wszystkim warta tej jednej złotowki"
        
        let dialog = ShareDialog(
            viewController: self,
            content: content,
            delegate: self
        )
        dialog.show()
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
    private func setupStackView() {
        stackView = UIStackView(arrangedSubviews: [storiesButton,feedButton,linkButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
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
        storiesButton.backgroundColor = .red
        feedButton.backgroundColor = .blue
        linkButton.backgroundColor = .green
        
        storiesButton.addTarget(self, action: #selector(handleStoriestButton), for: .touchUpInside)
        feedButton.addTarget(self, action: #selector(handleFeedButton), for: .touchUpInside)
        linkButton.addTarget(self, action: #selector(handleLinkButton), for: .touchUpInside)
        
        storiesButton.setTitle("stories", for: .normal)
        storiesButton.setTitleColor(.white, for: .normal)
        
        feedButton.setTitle("feed", for: .normal)
        feedButton.setTitleColor(.white, for: .normal)
        
        linkButton.setTitle("link", for: .normal)
        linkButton.setTitleColor(.white, for: .normal)
    }
}

extension FacebookViewController : SharingDelegate {
    func sharer(_ sharer: Sharing, didCompleteWithResults results: [String : Any]) {}
    func sharer(_ sharer: Sharing, didFailWithError error: Error) {}
    func sharerDidCancel(_ sharer: Sharing) {}
}

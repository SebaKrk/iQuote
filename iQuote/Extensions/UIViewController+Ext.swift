//
//  UIViewController+Ext.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 29/11/2021.
//

import Foundation
import UIKit
import SafariServices
import MessageUI

public var cardOriginYext : CGFloat!
fileprivate var containerView : UIView!

extension UIViewController {
    
    func showEmptyStateAuthor(with authorName: String, in view: UIView) {
        DispatchQueue.main.async {
            let emptyStateView = EmptyAuthorView(name: authorName)
            emptyStateView.frame = view.bounds
            view.addSubview(emptyStateView)
        }
    }
    
    func presentAlertOnMainThred(title: String, message: String) {
        DispatchQueue.main.async {
            let alertVC = AlertViewController(title: title, message: message)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true, completion: nil)
        }
    }
    //    MARK: - UITapGestureRecognizer
    
    @objc func handleDissmisView() {
        dismiss(animated: true, completion: nil)
    }
    func tapGestureRecognizerToDissmisView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleDissmisView))
        view.addGestureRecognizer(tap)
    }
    func swipeDownGestureRecognizerToDissmisView(container : UIView) {
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleDissmisView))
        swipeDown.direction = .down
        container.addGestureRecognizer(swipeDown)
    }
    
    //   MARK: - UIPanGestureRecognizer
        
    func panGestureRecognizerToHandleDragAndDissmisView(inCardView : UIView,cardOriginY : CGFloat) {
        cardOriginYext = cardOriginY
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGestExt(sender:)))
        inCardView.addGestureRecognizer(panGesture)
    }
    
    @objc func handlePanGestExt(sender: UIPanGestureRecognizer) {
        let fileView = sender.view!
        let cardOriginY = cardOriginYext!
        
        switch sender.state {
        case .began, .changed:
            moveViewWithPan(view: fileView, sender: sender)
        case .ended:
            let dragVelocity = sender.velocity(in: view)
            if dragVelocity.y >= 1300 {
                dismiss(animated: false, completion: nil)
            } else {
                returnViewToOrigin(view: fileView, cardOriginY: cardOriginY)
            }
        default:
            break
        }
    }
    func moveViewWithPan(view: UIView, sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        guard translation.y >= 0 else { return }
        view.center = CGPoint(x:view.center.x, y: view.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: view)
    }
    func returnViewToOrigin(view: UIView, cardOriginY : CGFloat) {
        UIView.animate(withDuration: 0.3) {
            view.frame.origin = CGPoint(x: 0.0 , y: cardOriginY) //fileViewOrign
        }
    }
    //    MARK: - Acitviti Indicator
    
    func showLoadingView() {
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0
        UIView.animate(withDuration: 0.25) {
            containerView.alpha = 0.8
        }
        let activityIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        activityIndicator.startAnimating()
    }
    
    func dissmisLoadingView() {
        DispatchQueue.main.async {
            containerView.removeFromSuperview()
            containerView = nil
        }
    }
    
    //    MARK: - SafariService
    
    func showSafariService(with urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let safariVC = SFSafariViewController(url: url)
        //        safariVC.preferredBarTintColor = .black
        safariVC.preferredControlTintColor = .black
        present(safariVC, animated: true, completion: nil)
    }
    //    MARK: - MessageUI
    
    func showMailMassageUI (subject: String, message: String, url: String) {
        if MFMailComposeViewController.canSendMail() {
            let mailVC = MFMailComposeViewController()
            mailVC.mailComposeDelegate = self
            mailVC.setSubject(subject)
            mailVC.setToRecipients(["s.sciuba@icloud.com","mateuszhalczak@gmail.com"])
            mailVC.setMessageBody(message, isHTML: false)
            present(mailVC, animated: true, completion: nil)
        } else {
            showSafariService(with: url)
        }
    }
}
// MARK: - MFMailComposeViewControllerDelegate

extension UIViewController : MFMailComposeViewControllerDelegate {
    public func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        // handle error and action mesage when create alert vc
        if let _ = error {
            controller.dismiss(animated: true, completion: nil)
            return
        }
        switch result {
        case .cancelled:
            break
        case .failed:
            break
        case .saved:
            break
        case .sent:
            break
        @unknown default:
            fatalError()
        }
        controller.dismiss(animated: true, completion: nil)
    }
}


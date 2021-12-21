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
        
        func panGestureRecognizerToHandleDragAndDissmisView(inCardView : UIView) {
            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGestureExt(sender:)))
            inCardView.addGestureRecognizer(panGesture)
        }
        @objc func handlePanGestureExt(sender: UIPanGestureRecognizer) {
            
            let translation = sender.translation(in: view)
            let fileView = sender.view!
            
            guard translation.y >= 0 else { return }
            
            switch sender.state {
            case .began, .changed:
                fileView.center = CGPoint(x:fileView.center.x, y: fileView.center.y + translation.y)
                sender.setTranslation(CGPoint.zero, in: view)
                
            case .ended:
                let dragVelocity = sender.velocity(in: view)
                if dragVelocity.y >= 1300 {
                        dismiss(animated: false, completion: nil)
                } else {
                    UIView.animate(withDuration: 0.3) {
                        self.view.frame.origin = CGPoint(x: 0.0, y: 646.0)
                    }
                }
            default:
                break
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


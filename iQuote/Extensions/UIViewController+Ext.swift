//
//  UIViewController+Ext.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 29/11/2021.
//

import Foundation
import UIKit

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
}

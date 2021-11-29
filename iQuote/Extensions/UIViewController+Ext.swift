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
}

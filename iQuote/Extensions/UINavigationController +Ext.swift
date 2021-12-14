//
//  UINavigationController +Ext.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 14/12/2021.
//

import UIKit

extension UINavigationController {
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    open override var shouldAutorotate: Bool {
        return false
    }
}

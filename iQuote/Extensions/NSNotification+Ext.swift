//
//  NSNotification+Ext.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 14/12/2021.
//

import Foundation


extension NSNotification.Name {
    static let imgObserver = Notification.Name("imgObserver")
    static let fontQuote = Notification.Name("fontQuote")
    static let sizeFontObserver = Notification.Name("sizeFontObserver")
    static let logoObserver = Notification.Name("logoObserver")
    static let gradientObserver = Notification.Name("gradientObserver")
    
    
    static let quoteToShare = Notification.Name("quoteToShare")
    
}

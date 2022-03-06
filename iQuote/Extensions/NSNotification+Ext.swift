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
    static let logoImgObserver = Notification.Name("logoImgObserver")
    static let dragLabelObserver = Notification.Name("dragLabelObserver")
    static let gradientObserver = Notification.Name("gradientObserver")
    static let removeGradientObserver = Notification.Name("removeGradientObserver")
    static let shadowQuoteLabel = Notification.Name("shadowQuoteLabel")
    static let removeShadowQuoteLabel = Notification.Name("removeShadowQuoteLabel")
    static let fontColor = Notification.Name("fontColor")
    static let textAlignmentObserver = Notification.Name("textAlignmentObserver")
    
    static let imgPickerObserver = Notification.Name("imgPickerObserver")
    static let chooseImgObserver = Notification.Name("chooseImgObserver")
    static let backgroundImgObserver = Notification.Name("backgroundImg")
    
    static let iMessageObserver = Notification.Name("iMessageObserver")
    static let shareObserver = Notification.Name("shareObserver")
    static let copyTextObserver = Notification.Name("copyTextObserver")
   
    static let quoteToShare = Notification.Name("quoteToShare")
    static let nextQuote = Notification.Name("nextQuote")
}

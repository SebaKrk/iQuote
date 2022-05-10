//
//  ConstantsSettings.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 17/12/2021.
//

import Foundation

struct SettingsTitle {
    
    static let share = "Share".localized
    static let review = "Write a Review".localized
    // static let icon = "Change Icon".localized
    static let website = "Website".localized
    static let sugest = "Sugest a Feature".localized
    static let bug = "Report a Bug".localized
    static let privacyPolicy = "Privacy Policy".localized
    static let appSettings = "App Settings".localized
    static let appVersion = "App Version".localized
    
}

enum SettingsMessage : String {
    
    case share = "Hi, this is super Quote App , I want to shere with you ..."
    case sugest = "Hi Sebastian,\nI just want to sugest ..."
    case bug =  "Hi Sebastian,\nI just want to report the bug ..."
}

enum SettingsURL : String {
    case share = "https://testflight.apple.com/join/mC1o9G14"
    case review = "https://github.com"
    case website = "https://github.com/SebaKrk/iQuote"
    case safai = "https://sebakrk.github.io/iQuote/"
    
    case privacyPolicy = "https://premium.zenquotes.io/privacy-policy"
    
    case iQuotePrivacyPolicy = "https://github.com/SebaKrk/"
    
    case zenQuotePrivacyPolicy = "https://premium.zenquotes.io/privacy-policy/"
    case wikipediaPrivacyPolicy = "https://www.mediawiki.org/wiki/MediaWiki"
    case unsplashPrivacyPolicy = "https://api.unsplash.com"
}

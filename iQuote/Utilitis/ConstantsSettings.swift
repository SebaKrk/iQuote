//
//  ConstantsSettings.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 17/12/2021.
//

import Foundation

struct SettingsTitle {
    
    static let share = "Share"
    static let review = "Write a Review"
    static let icon = "Change Icon"
    static let website = "Website"
    static let sugest = "Sugest a Feature"
    static let bug = "Report a Bug"
    static let privacyPolicy = "Privacy Policy"
    static let appSettings = "App Settings"
    static let appVersion = "App Version"
    
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
    case safai = "https://www.google.com"
    
    case privacyPolicy = "https://premium.zenquotes.io/privacy-policy"
    
    case iQuotePrivacyPolicy = "https://github.com/SebaKrk/"
    
    case zenQuotePrivacyPolicy = "https://premium.zenquotes.io/privacy-policy/"
    case wikipediaPrivacyPolicy = "https://www.mediawiki.org/wiki/MediaWiki"
    case unsplashPrivacyPolicy = "https://api.unsplash.com"
}

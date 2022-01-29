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
    case sugest = "Hi Sebastian and Mati,\nI just want to sugest ..."
    case bug =  "Hi Sebastian and Mati,\nI just want to report the bug ..."
}

enum SettingsURL : String {
    case share = "https://github.com/SebaKrk/iQuote"
    case review = "https://github.com"
    case website = "https://github.com/SebaKrk"
    case privacyPolicy = "https://premium.zenquotes.io/privacy-policy/"
    case safai = "https://www.google.com"
}

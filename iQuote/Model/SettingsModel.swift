//
//  SettingsModel.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 17/12/2021.
//

import Foundation
import UIKit

struct SettingsModel {
    let title : String
    let option : [Options]
}

struct Options {
    let icon: UIImage?
    let title: String
}


struct IconImages {
    static let share = UIImage(systemName: "square.and.arrow.up", withConfiguration: UIImage.SymbolConfiguration(weight: .regular))
    static let review = UIImage(systemName: "pencil.and.outline", withConfiguration: UIImage.SymbolConfiguration(weight: .regular))
    // static let icons = UIImage(systemName: "plus.circle", withConfiguration: UIImage.SymbolConfiguration(weight: .regular))
    static let website = UIImage(systemName: "network", withConfiguration: UIImage.SymbolConfiguration(weight: .regular))
    static let sugestFeature = UIImage(systemName: "star.circle",withConfiguration: UIImage.SymbolConfiguration(weight: .regular))
    static let bug = UIImage(systemName: "ladybug.fill",withConfiguration: UIImage.SymbolConfiguration(weight: .regular))
    static let privacyPolicy = UIImage(systemName: "doc.text",withConfiguration: UIImage.SymbolConfiguration(weight: .regular))
    static let appSettings = UIImage(systemName: "gear",withConfiguration: UIImage.SymbolConfiguration(weight: .regular))
    static let appVersion = UIImage(systemName: "info.circle",withConfiguration: UIImage.SymbolConfiguration(weight: .regular))
}

func configureSettings() -> [SettingsModel] {
    
    let modelOne = SettingsModel(title: "", option: [
        Options(icon: IconImages.share, title: "Share"),
        Options(icon: IconImages.review , title: "Write a Review")])
        // Options(icon: IconImages.icons , title: "Change Icon")])
    
    let modelTwo = SettingsModel(title: "SOURCE", option: [
        Options(icon: IconImages.website, title:  "Website" ),
        Options(icon:IconImages.sugestFeature,title: "Sugest a Feature"),
        Options(icon: IconImages.bug , title: "Report a Bug")])
    
    let modelThree = SettingsModel(title: "INFO", option: [
        Options(icon: IconImages.privacyPolicy , title: "Privacy Policy"),
        Options(icon: IconImages.appSettings, title: "App Settings"),
        Options(icon: IconImages.appVersion, title: "App Version")])
    
    return [modelOne, modelTwo, modelThree]
}

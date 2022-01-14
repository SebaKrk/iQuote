//
//  ImageSearchTF.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 14/12/2021.
//

import UIKit

class ImageSearchTF : UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        overrideUserInterfaceStyle = .light
        
        layer.cornerRadius = 15
        layer.borderWidth  = 1
        layer.borderColor = UIColor.darkGray.cgColor
        
        textColor = .black
        textAlignment = .center
        font = UIFont(name: fontText.fontLabel , size: 16)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        
        backgroundColor = .white
        autocorrectionType = .no
        keyboardType = .default
        returnKeyType = .go
        keyboardAppearance = .dark
    
        clearButtonMode = .whileEditing
        placeholder = "enter name view"
        
    }
}

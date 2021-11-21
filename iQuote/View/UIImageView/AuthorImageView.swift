//
//  AuthorImageView.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 21/11/2021.
//

import Foundation
import UIKit

class AuthorImageView : UIImageView {
    
    let placeholder = UIImage(named: "person")?.withRenderingMode(.alwaysOriginal)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure() {
        image = placeholder
        
        layer.cornerRadius = 50
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1
        layer.masksToBounds = true
        
        contentMode = .scaleAspectFill
    }
}

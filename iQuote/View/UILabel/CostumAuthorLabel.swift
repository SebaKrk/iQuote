//
//  CostumAuthorLabel.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 21/11/2021.
//

import Foundation
import UIKit

class CostumAuthorLabel : UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure() {
        font = UIFont(name: fontText.mainAuthorQuote, size: 30)
        textColor = .white
        textAlignment = .left
        numberOfLines = 1
        minimumScaleFactor = 0.5
        adjustsFontSizeToFitWidth = true
        
        lineBreakMode = .byTruncatingTail
        
        
    }
}

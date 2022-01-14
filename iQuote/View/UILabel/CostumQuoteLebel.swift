//
//  CostumQuoteLebel.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 20/11/2021.
//

import Foundation
import UIKit

class CostumQuoteLabel : UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure() {
        font = UIFont(name: fontText.mainQuote, size: 36)
        textColor = .white
        textAlignment = .center
        numberOfLines = 0
//        minimumScaleFactor = 0.5
        adjustsFontSizeToFitWidth = true
        lineBreakMode = .byTruncatingTail
     
        // Baskerville URW
    }
}

//Baskerville
//Baskerville-Bold
//Baskerville-BoldItalic
//Baskerville-Italic
//Baskerville-SemiBold
//Baskerville-SemiBoldItalic

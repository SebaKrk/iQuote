//
//  CostumQuoteLebel.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 20/11/2021.
//

import Foundation
import UIKit

class CostumQuoteLabel : UILabel {
    
    let fontArray = ["AmericanTypewriter-Bold", "Baskerville-BoldItalic", "BradleyHandITCTT-Bold",
                     "Copperplate", "Georgia-BoldItalic", "Marion-Bold", "SnellRoundhand-Black",
                     "TrebuchetMS-Italic"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure() {
        if let randomElement = fontArray.randomElement() {
            font = UIFont(name: randomElement, size: 36)
        }
        textColor = .white
        textAlignment = .center
        numberOfLines = 0
        adjustsFontSizeToFitWidth = true
        lineBreakMode = .byTruncatingTail
    }
}

//NAZWA: Bely Display - regular
//NAZWA: Bayon - regular
//NAZWA: Beth Ellen - regular
//NAZWA: Black Ops One - regular
//NAZWA: Calistoga - regular
//NAZWA: Chauncy Pro - bold

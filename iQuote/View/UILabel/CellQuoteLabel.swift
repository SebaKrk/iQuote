//
//  CellQuoteLabel.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 01/12/2021.
//

import Foundation
import UIKit

class CellQuoteLabel : UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure() {
        font = UIFont(name: fontText.listQuote, size: 20)
        textColor = .black
        textAlignment = .left
        numberOfLines = 1
        lineBreakMode = .byTruncatingTail
    }
}

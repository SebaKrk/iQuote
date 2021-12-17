//
//  CostumTitleLabel.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 17/12/2021.
//


import UIKit

class CostumTitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAligment: NSTextAlignment, fontSize: CGFloat)  {
        super.init(frame: .zero)
        self.textAlignment = textAligment
        font = UIFont.boldSystemFont(ofSize: fontSize)
        configure()
        
    }
    
    func configure() {
        textColor = .white
        numberOfLines = 1
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
    }
    
}

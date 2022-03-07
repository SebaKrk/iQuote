//
//  MainQuoteLabel.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 07/03/2022.
//

import UIKit

class MainQuoteLabel : UILabel {
    
    let fontArray = ["Bayon-Regular", "BethEllen-Regular", "BlackOpsOne-Regular","Roboto-Medium",
                     "Calistoga-Regular","Roboto-Black"]
    
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
            NotificationCenter.default.post(name: .fontQuoteObserver, object: nil, userInfo: ["fontName" : randomElement])
        }
        textColor = .white
        textAlignment = .center
        numberOfLines = 0
        adjustsFontSizeToFitWidth = true
        lineBreakMode = .byTruncatingTail
    }
}

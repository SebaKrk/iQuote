//
//  MainBackgroundIMG.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 05/03/2022.
//

import UIKit

class MainBackgroundIMG : UIImageView {
    
    var backgroundImageArry = ["BGImg001","BGImg002","BGImg003","BGImg004","BGImg005","BGImg006",
                               "BGImg007","BGImg008","BGImg009","BGImg010","BGImg011","BGImg012"]
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        if let randomElement = backgroundImageArry.randomElement() {
            let image = UIImage(named: randomElement)
            guard let image = image else {return}
            self.image = image
            contentMode = .scaleAspectFill
        }
    }
}

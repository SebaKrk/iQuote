//
//  CostumeIconsButton.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 30/01/2022.
//

import Foundation
import UIKit

class CostumeIconsButton : UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(name: String) {
        super.init(frame: .zero)
        setImage(UIImage(named: name), for: .normal)
        configure()
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        imageView?.layer.cornerRadius = 15
        clipsToBounds = true
    }
    
}

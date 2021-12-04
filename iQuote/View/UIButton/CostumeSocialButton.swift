//
//  CostumeSocialButton.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 04/12/2021.
//

import Foundation
import UIKit

class CostumeSocialButton : UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    init(name: String ) {
        super.init(frame: .zero)
        setImage(UIImage(named: name), for: .normal)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        tintColor = .white
        layer.masksToBounds = true
    }
}

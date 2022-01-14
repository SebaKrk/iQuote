//
//  CostumeCancleButton.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 14/01/2022.
//

import UIKit

class CancleButton : UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .black
        setTitleColor(.white, for: .normal)
        setTitle("CANCLE", for: .normal)
        titleLabel?.font = UIFont(name: fontText.cancleButton, size: 14)
    }
}


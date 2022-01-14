//
//  CostumeActionButton.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 13/01/2022.
//


import UIKit

class CostumeActionButton : UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    init(name: String ) {
        super.init(frame: .zero)
        setTitle(name, for: .normal)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .black
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont(name: fontText.doneButton, size: 14)
    }
}

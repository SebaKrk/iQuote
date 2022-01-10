
//
//  EmptyAuthorView2.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 29/11/2021.
//

import Foundation
import UIKit

class EmptyAuthorView2 : UIView {
    
    private let authorLabel = CostumAuthorLabel()

    private let padding : CGFloat = 25
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(name : String) {
        super.init(frame: .zero)
        authorLabel.text = name
        configure()
        configureAuthoreTextLabel()
    }

    func configure() {
        backgroundColor = .black
    }
    
    func configureAuthoreTextLabel() {
        addSubview(authorLabel)
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            authorLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            authorLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            authorLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
}


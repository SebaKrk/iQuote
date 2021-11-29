//
//  EmptyAuthorView.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 29/11/2021.
//

import Foundation
import UIKit

class EmptyAuthorView : UIView {
    
    private let authorImage = AuthorImageView(frame: .zero)
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
        configureAuthorImage()
        configureAuthoreTextLabel()
    }

    func configure() {
        authorImage.image = UIImage(named: "EmptyPerson")?.withRenderingMode(.alwaysOriginal)
        authorImage.backgroundColor = .white
    }
    func configureAuthorImage() {
        addSubview(authorImage)
        authorImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            authorImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            authorImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            authorImage.widthAnchor.constraint(equalToConstant: 85),
            authorImage.heightAnchor.constraint(equalToConstant: 85)
        ])
    }
    func configureAuthoreTextLabel() {
        addSubview(authorLabel)
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            authorLabel.centerYAnchor.constraint(equalTo: authorImage.centerYAnchor),
            authorLabel.leadingAnchor.constraint(equalTo: authorImage.trailingAnchor, constant: padding),
            authorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            authorLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
}

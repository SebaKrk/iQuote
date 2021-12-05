//
//  CollectionCell.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 05/12/2021.
//

import Foundation
import UIKit

class CollectionCell : UICollectionViewCell {
    
    
    private let backgroundIMG =  CollectionCellmageView(frame: .zero)
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        configureBackgroundIMG()
    }
    
    func set(data: Results) {
        backgroundIMG.dowloadImage(from: data.urls.small) 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureBackgroundIMG() {
        contentView.addSubview(backgroundIMG)
        backgroundIMG.translatesAutoresizingMaskIntoConstraints = false
        backgroundIMG.contentMode = .scaleAspectFill
        backgroundIMG.clipsToBounds = true
        backgroundIMG.layer.cornerRadius = 5
        
        NSLayoutConstraint.activate([
            backgroundIMG.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),
            backgroundIMG.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2),
            backgroundIMG.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2),
            backgroundIMG.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2)
        ])
    }
}

//
//  FavoritesTableViewCell.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 01/12/2021.
//

import Foundation
import UIKit



class FavoritesTableViewCell : UITableViewCell {
    
    static let identifier = "FavoritesTableViewCell"
    
    let quoteLabel = CellQuoteLabel()
    let authorLabel = CellAuthorLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureQuoteLabel()
        configureAuthorLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(quoteData: Quote) {
        quoteLabel.text = quoteData.q
        authorLabel.text = quoteData.a
    }
    
    private func configureQuoteLabel() {
        addSubview(quoteLabel)
        quoteLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            quoteLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            quoteLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            quoteLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            quoteLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func configureAuthorLabel() {
        addSubview(authorLabel)
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: quoteLabel.bottomAnchor),
            authorLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            authorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            authorLabel.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -10)
        ])
    }
}

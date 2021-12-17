//
//  SettingsTableViewCell.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 17/12/2021.
//

import Foundation
import UIKit

class SettingsTableViewCell : UITableViewCell {
    
    static let identifier = "SettingsTableViewCell"
    
    private let titleLabel = CostumTitleLabel(textAligment: .left, fontSize: 20)
    
    private let iconImage : UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return  imageView
    }()
    
    private let padding : CGFloat = 10
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupImageView()
        setupTiteLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func set(with model: Options) {
        iconImage.image = model.icon
        titleLabel.text = model.title
    }
    
    func setupView() {
        backgroundColor = .darkGray
    }

    
    func setupImageView() {
        addSubview(iconImage)
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            iconImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            iconImage.widthAnchor.constraint(equalToConstant: 25),
            iconImage.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    func setupTiteLabel() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

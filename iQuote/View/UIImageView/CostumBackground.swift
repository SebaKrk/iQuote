//
//  CostumBackground.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 18/11/2021.
//

import Foundation
import UIKit

class CostumBackground : UIImageView {
 
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(placehodler : String) {
        self.init(frame: .zero)
        let image = UIImage(named: placehodler)
        guard let image = image else {return}
        self.image = image
    }
    
}

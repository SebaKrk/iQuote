//
//  CollectionCellmageView.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 05/12/2021.
//

import Foundation
import UIKit

class CollectionCellmageView : UIImageView {
    
    let placeholderImage = UIImage(named: Constants.backgroundIMG)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 15
        clipsToBounds = true
        contentMode = .scaleAspectFill //*
        clipsToBounds = true //*
        image = placeholderImage
    }
    func dowloadImage(from urlString: String){
      
        guard let url = URL(string: urlString) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {return}
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {return}
            guard let data = data else {return}
            guard let image = UIImage(data: data) else {return}
        
            DispatchQueue.main.async {
                self.image = image
            }
        }
        task.resume()
    }
}

//
//  AuthorImageView.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 21/11/2021.
//

import Foundation
import UIKit

class AuthorImageView : UIImageView {
    
    let placeholder = UIImage(named: "UnknowAuthorImage2")?.withRenderingMode(.alwaysOriginal)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure() {
        image = placeholder
        
        layer.cornerRadius = 40
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1
        layer.masksToBounds = true
        
        contentMode = .scaleAspectFill
    }
    
    func dowloadImage(from urlString: String) {
        guard let url = URL(string: urlString) else {return}
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
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

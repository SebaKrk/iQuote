//
//  UIView+Ext.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 18/11/2021.
//

import Foundation
import UIKit

extension UIView {
    public func setGradien(colorOne: UIColor, colorTwo: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors =  [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.5, 1.0]
        layer.insertSublayer(gradientLayer, at: 1)
    }
    
    func asImage() -> UIImage? {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { graphicsImageRendererContext in
            layer.render(in: graphicsImageRendererContext.cgContext)
        }
    }
}

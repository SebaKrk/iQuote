//
//  UIColor+Ext.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 18/11/2021.
//

import UIKit

extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat , blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    static func primaryOrange() -> UIColor {
        return rgb(red: 248, green: 165, blue: 42)
    }
    static func costumDarkGray() -> UIColor {
        return rgb(red: 37, green: 37, blue: 37)
    }
    static func costumeGray() -> UIColor {
        return rgb(red: 85, green: 85, blue: 85)
    }
}

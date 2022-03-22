//
//  String+Ext.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 22/03/2022.
//

import Foundation

extension String {
    var localized : String {
        return NSLocalizedString(self, tableName: "Localized", bundle: .main, value: self, comment: self)
    }
}

//
//  Quote.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 28/11/2021.
//

import Foundation


struct Quote : Codable,Hashable {
    let q : String
    let a : String
    var s : Bool?
}


//q = quote text
//a = author name
//https://premium.zenquotes.io/zenquotes-documentation/#api-structure

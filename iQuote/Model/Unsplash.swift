//
//  Unsplash.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 05/12/2021.
//

import Foundation

struct DataModel : Codable {
    let total : Int
    let total_pages : Int
    let results : [Results]
}

struct Results : Codable {
    let id: String
    let urls : Urls
}

struct Urls : Codable {
    let small : String
}

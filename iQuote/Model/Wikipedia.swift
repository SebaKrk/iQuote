//
//  Wikipedia.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 28/11/2021.
//

import Foundation

struct Wikipedia : Codable {
    let batchcomplete : Bool
    let query : Query
}
struct Query : Codable {
    let pages : [Pages]
}
struct Pages : Codable {
    let title : String
    let thumbnail : Thumbnail
}
struct Thumbnail : Codable {
    let source : String
}

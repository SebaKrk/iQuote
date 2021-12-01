//
//  ErrorMasasge.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 28/11/2021.
//

import Foundation

enum ZenQuoteError : String,Error {
    
    case unableToCompleted = "Unable to completed your request. Please check your internet connection"
    case inavlidResponse = "Invalid response from server. Please try again."
    case incalidData = "The data received from the server was invalid. Please try again."
    case unableToFavorite = "There was an error favoriting this Quote. Please try again."
    case alleredyInFavorites = "You've allredy favorited this Quote. You must very like it!"
}

enum WikiError : String, Error {
    case unableToCompleted = "Unable to completed your request. Please check your internet connection"
    case inavlidResponse = "Invalid response from server. Please try again."
    case incalidData = "The data received from the server was invalid. Please try again."
}

enum Messages : String {
    case sucesffulyFavorited = "You've sucesffuly favorited this Quote"
    case alleredyInFavorites = "You've allredy favorited this Quote. You must very like it!"
}

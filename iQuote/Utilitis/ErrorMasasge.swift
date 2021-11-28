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
}

enum WikiError : String, Error {
    case unableToCompleted = "Unable to completed your request. Please check your internet connection"
    case inavlidResponse = "Invalid response from server. Please try again."
    case incalidData = "The data received from the server was invalid. Please try again."
}

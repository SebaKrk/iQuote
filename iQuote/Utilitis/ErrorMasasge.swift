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
    case sucesffulyFavorited = "You've successfully favorited this Quote"
    case alleredyInFavorites = "You've allredy favorited this Quote. You must very like it!"
    case emptyList = "Your List is empty.\nYou haven't added anything yet"
}

enum ErrorMassage : String,Error {
    case unableToCompleted = "Unable to completed your request. Please check your internet connection"
    case inavlidResponse = "Invalid response from server. Please try again."
    case incalidData = "The data received from the server was invalid. Please try again."
}

enum iMessage : String {
    case unableToCompleted = "Unable to completed your request. Please check your internet connection"
    case cantSendTextMessage = "Something goes wrong. We can't send iMessage"
    case sucesffulySend = "You've successfully send this Quote"
}

enum shareMessage : String {
    case sucesffulyCopy = "You've successfully copy this Quote"
}

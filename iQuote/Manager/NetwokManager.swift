//
//  NetwokManager.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 28/11/2021.
//

import Foundation
import UIKit

class NetworkManager {
    
    static let shered = NetworkManager()
    
    private let baseURL = "https://zenquotes.io/api/random/"
    
    private init() {}
    
    func getRandomQuote(completed: @escaping (Result<[Quote],ZenQuoteError>) -> Void ) {
        let endpoint = baseURL + Constants.apiKey
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.unableToCompleted))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToCompleted))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.inavlidResponse))
                return
            }
            guard let data = data else {
                completed(.failure(.incalidData))
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let quote = try decoder.decode([Quote].self, from: data)
                
                completed(.success(quote))
            } catch {
                completed(.failure(.incalidData))
            }
        }
        task.resume()
    }
    
}


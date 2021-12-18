//
//  NetwokManager.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 28/11/2021.
//

import Foundation
import UIKit


fileprivate struct APIResponse : Codable {
    let results : [Results]
}

class NetworkManager {
    
    static let shered = NetworkManager()
    
    private let baseURL = "https://zenquotes.io/api/random/"
    private let wikiURL =  "https://en.wikipedia.org/w/api.php?action=query&format=json&formatversion=2&prop=pageimages&pithumbsize=600&&titles="
    private let unsplashURL = "https://api.unsplash.com/search/photos?query="
    
    private init() {}
    
//    MARK: - ZenQuote API
    
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
    
//    MARK: - Wkipedia API
    
    func getAuthorImage(name: String, completed: @escaping  (Result<Wikipedia,WikiError>) -> Void) {
        let authorName = name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let endPoint = wikiURL + authorName
        
        guard let url = URL(string: endPoint) else {
            completed(.failure(.unableToCompleted))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToCompleted))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.incalidData))
                return
            }
            guard let data = data else {
                completed(.failure(.incalidData))
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let authorImage = try decoder.decode(Wikipedia.self, from: data)
                
                completed(.success(authorImage))
            } catch {
                completed(.failure(.incalidData))
            }
        }
        task.resume()
    }
    
//    MARK: - Unsplash API
    
    func getUnsplashImages(category: String, completed: @escaping (Result<[Results],ErrorMassage>) -> Void) {
        let endpoint = unsplashURL + category + "&client_id=" + Constants.accessKey
        
        print("DEBUG: \(endpoint)")
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
                let dataImage = try decoder.decode(APIResponse.self, from: data)
                
                completed(.success(dataImage.results))
            } catch {
                completed(.failure(.incalidData))
            }

        }
        task.resume()
    }
    
//    MARK: Download Image
    func dowloadImage(from urlString: String, completed: @escaping (UIImage) -> Void) {

        guard let url = URL(string: urlString) else {return}

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {return}
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {return}
            guard let data = data else {return}
            guard let image = UIImage(data: data) else {return}

            DispatchQueue.main.async {
                completed(image)
            }
        }
        task.resume()
    }
}


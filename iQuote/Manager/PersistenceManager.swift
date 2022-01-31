//
//  PersistenceManager.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 01/12/2021.
//

import Foundation

enum PersistenceAcatinType {
    case add, remove, save
}
enum PersistenceManager {
    
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        static let favorites = "favorites"
    }
    
    static func uppdateWith(favorite: Quote, actionType: PersistenceAcatinType , completed: @escaping(ZenQuoteError?)->Void) {
        retrieveFavorites { result in
            switch result {
            case .success(let favorites):
                var retrivedFavorites = favorites
                
                switch actionType {
                case .add:
                    guard  !retrivedFavorites.contains(favorite) else {
                        completed(.alleredyInFavorites)
                        return
                    }
                    retrivedFavorites.append(favorite)
                case .save:
                    retrivedFavorites.removeAll {$0.q == favorite.q }
                    retrivedFavorites.append(favorite)
                case .remove:
                    retrivedFavorites.removeAll {$0.q == favorite.q }
                }
            
                completed(save(favorites: retrivedFavorites))
            case .failure(let error):
                completed(error)
            }
        }
    }
    
    
    static func retrieveFavorites(completed: @escaping (Result<[Quote],ZenQuoteError>) -> Void) {
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            completed(.success([]))
            return
        }
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Quote].self, from: favoritesData)
            completed(.success(favorites))
            
        } catch {
            completed(.failure(.unableToFavorite))
        }
    }
    
    static func save(favorites: [Quote]) -> ZenQuoteError? {
        do {
            let encoder = JSONEncoder()
            let encoderFavories = try encoder.encode(favorites)
            defaults.set(encoderFavories, forKey: Keys.favorites)
            return nil
        } catch {
            return .unableToFavorite
        }
    }
}

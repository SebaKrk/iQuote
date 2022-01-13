//
//  UserDefManager.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 12/01/2022.
//

import Foundation

class UserDefManager {
    
    let defaults = UserDefaults.standard
    
    static let gradienViewIsON = "GRADIEN-IS-ON"
    static let shadowViewIsON = "SHADOW-IS-ON"
    
    var gradientIsON : Bool {
        get { return defaults.bool(forKey: UserDefManager.gradienViewIsON) }
        set { defaults.set(newValue, forKey: UserDefManager.gradienViewIsON) }
    }
    
    var shadowIsON : Bool {
        get { return defaults.bool(forKey: UserDefManager.shadowViewIsON) }
        set { defaults.set(newValue, forKey: UserDefManager.shadowViewIsON)}
    }
    
    static func clearUserData(){
        UserDefManager().defaults.removeObject(forKey: UserDefManager.gradienViewIsON)
        UserDefManager().defaults.removeObject(forKey: UserDefManager.shadowViewIsON)
    }
}

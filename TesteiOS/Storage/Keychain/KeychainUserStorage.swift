//
//  KeychainUserStorage.swift
//  TesteiOS
//
//  Created by José Rafael Ferraz Pacheco on 12/12/19.
//  Copyright © 2019 José Rafael Ferraz Pacheco. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper

class KeychainUserStorage: KeychainStorage {
    let key = "user"
    
    func save(data: User) -> Bool {
        var saveSuccessful: Bool = false
        
        if let userData = try? JSONEncoder().encode(data) {
             saveSuccessful = KeychainWrapper.standard.set(userData, forKey: key)
        }
        
        return saveSuccessful
    }
    
    func get() -> User? {
        if let userData = KeychainWrapper.standard.data(forKey: key), let user = try? JSONDecoder().decode(User.self, from: userData) {
            return user
        }
        
        return nil
    }
    
}

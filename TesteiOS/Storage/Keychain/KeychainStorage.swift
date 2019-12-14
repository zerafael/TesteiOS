//
//  KeychainStorage.swift
//  TesteiOS
//
//  Created by José Rafael Ferraz Pacheco on 12/12/19.
//  Copyright © 2019 José Rafael Ferraz Pacheco. All rights reserved.
//

import Foundation

protocol KeychainStorage {
    associatedtype T
    
    var key: String { get }
    func save(data: T) -> Bool
    func get() -> T?
}

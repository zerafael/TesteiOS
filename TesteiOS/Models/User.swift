//
//  User.swift
//  TesteiOS
//
//  Created by José Rafael Ferraz Pacheco on 11/12/19.
//  Copyright © 2019 José Rafael Ferraz Pacheco. All rights reserved.
//

import Foundation

struct User: Codable {
    var id: Int
    var name: String
    var bankAccount: String
    var agency: String
    var balance: Float
}

extension User {
    init?(json: [String: AnyObject]) {
        guard let id = json["userId"] as? Int else {
            return nil
        }
        
        self.id = id
        self.name = json["name"] as! String
        self.bankAccount = json["bankAccount"] as! String
        self.agency = json["agency"] as! String
        self.balance = Float(truncating: json["balance"] as! NSNumber)
    }
}

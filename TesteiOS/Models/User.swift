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
        id = json["userId"] as! Int
        name = json["name"] as! String
        bankAccount = json["bankAccount"] as! String
        agency = json["agency"] as! String
        balance = Float(truncating: json["balance"] as! NSNumber)
    }
}

//
//  Statements.swift
//  TesteiOS
//
//  Created by José Rafael Ferraz Pacheco on 15/12/19.
//  Copyright © 2019 José Rafael Ferraz Pacheco. All rights reserved.
//

import Foundation

struct Statement {
    var title: String
    var desc: String
    var date: String
    var value: Float
}

extension Statement {
    init?(json: [String: AnyObject]) {
        title = json["title"] as! String
        desc = json["desc"] as! String
        value = Float(truncating: json["value"] as! NSNumber)
        date = ""
        date = formatDate(date: json["date"] as! String)
    }
    
    mutating func formatDate(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let tmpDate = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: tmpDate!)
    }
}

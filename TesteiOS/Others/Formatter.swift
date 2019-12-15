//
//  Formatter.swift
//  TesteiOS
//
//  Created by José Rafael Ferraz Pacheco on 15/12/19.
//  Copyright © 2019 José Rafael Ferraz Pacheco. All rights reserved.
//

import Foundation

class Formatter {
    func formatCurrency(value: Float) -> String {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = Locale.init(identifier: "pt_BR")
        
        return formatter.string(from: NSNumber(value: value))!
    }
}

//
//  String+Extension.swift
//  TesteiOS
//
//  Created by José Rafael Ferraz Pacheco on 15/12/19.
//  Copyright © 2019 José Rafael Ferraz Pacheco. All rights reserved.
//

import Foundation

extension String {
    func isPasswordValid() -> Bool {
        let format = "SELF MATCHES %@"
        let regex = "^(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{3,}$"
        
        return NSPredicate(format: format, regex).evaluate(with: self)
    }
}

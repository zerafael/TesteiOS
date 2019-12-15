//
//  AccountDelegate.swift
//  TesteiOS
//
//  Created by José Rafael Ferraz Pacheco on 14/12/19.
//  Copyright © 2019 José Rafael Ferraz Pacheco. All rights reserved.
//

import Foundation

protocol AccountDelegate {
    func setAccountInfo(user: User)
    func setStatements(statements: [Statement])
    func logoutSucceed()
}

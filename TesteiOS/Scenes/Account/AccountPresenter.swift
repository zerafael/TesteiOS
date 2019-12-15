//
//  AccountPresenter.swift
//  TesteiOS
//
//  Created by José Rafael Ferraz Pacheco on 14/12/19.
//  Copyright © 2019 José Rafael Ferraz Pacheco. All rights reserved.
//

import Foundation

class AccountPresenter {
    var user: User!
    
    let delegate: AccountDelegate
    let api = ApiClient()
    
    init(delegate: AccountDelegate) {
        self.delegate = delegate
        
        configureUser()
    }
    
    private func configureUser() {
        user = KeychainUserStorage().get()!
        delegate.setAccountInfo(user: user)
        
        loadStatements()
    }
    
    private func loadStatements() {
        api.loadUserStatements(userId: user.id) { (statements) in
            self.delegate.setStatements(statements: statements)
        }
    }
    
    func handleLogout() {
        UserDefaults.standard.removeObject(forKey: "logged")
        checkLogged()
    }
    
    func checkLogged() {
        if (!UserDefaults.standard.bool(forKey: "logged")) {
            self.delegate.logoutSucceed()
        }
    }
}

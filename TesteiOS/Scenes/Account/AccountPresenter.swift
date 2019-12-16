//
//  AccountPresenter.swift
//  TesteiOS
//
//  Created by José Rafael Ferraz Pacheco on 14/12/19.
//  Copyright © 2019 José Rafael Ferraz Pacheco. All rights reserved.
//

import Foundation
import PKHUD

class AccountPresenter {
    var user: User!
    
    let delegate: AccountDelegate
    let api = ApiClient()
    
    init(delegate: AccountDelegate) {
        self.delegate = delegate
        
        checkLogged()
        configureUser()
    }
    
    private func configureUser() {
        if let user = KeychainUserStorage().get() {
            delegate.setAccountInfo(user: user)
            self.user = user
            
            loadStatements()
        }
    }
    
    private func loadStatements() {
        PKHUD.sharedHUD.show()
        api.loadUserStatements(userId: user.id) { (statements) in
            self.delegate.setStatements(statements: statements)
        }
    }
    
    func handleLogout() {
        UserDefaults.standard.set(false, forKey: "logged")
        checkLogged()
    }
    
    func checkLogged() {
        if (!UserDefaults.standard.bool(forKey: "logged")) {
            self.delegate.logoutSucceed()
        }
    }
}

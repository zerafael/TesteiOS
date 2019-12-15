//
//  LoginPresenter.swift
//  TesteiOS
//
//  Created by José Rafael Ferraz Pacheco on 11/12/19.
//  Copyright © 2019 José Rafael Ferraz Pacheco. All rights reserved.
//

import Foundation

class LoginPresenter {
    let delegate: LoginDelegate
    let api: ApiClient
    
    init(delegate: LoginDelegate) {
        self.delegate = delegate
        
        api = ApiClient()
    }
    
    func handleLogin(user: String, password: String) {
        if(checkCredentials(user, password)) {
            api.login(user: user, password: password, completion: { (data) in
                if (KeychainUserStorage().save(data: data)) {
                    UserDefaults.standard.set(true, forKey: "logged")
                    
                    self.delegate.loginSucceed()
                }
            })
        }
    }
    
    private func checkCredentials(_ user: String, _ password: String) -> Bool {
        if user.isEmpty || user == ""{
            // Alerta campos vazios
            return false
        }
        
        if password.isEmpty || password == ""{
            // Alerta campos vazios
            return false
        }
        
        
        
        return true
    }
}

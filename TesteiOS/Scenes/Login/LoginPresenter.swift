//
//  LoginPresenter.swift
//  TesteiOS
//
//  Created by José Rafael Ferraz Pacheco on 11/12/19.
//  Copyright © 2019 José Rafael Ferraz Pacheco. All rights reserved.
//

import Foundation
import PKHUD

class LoginPresenter {
    let delegate: LoginDelegate
    let api: ApiClient
    
    init(delegate: LoginDelegate) {
        self.delegate = delegate
        
        api = ApiClient()
    }
    
    func handleLogin(user: String, password: String) {
        if(checkCredentials(user, password)) {
            PKHUD.sharedHUD.show()
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
            self.delegate.loginFailed(message: "Campo de usuário vazio")
            return false
        }
        
        if password.isEmpty || password == ""{
            self.delegate.loginFailed(message: "Campo de senha vazio")
            return false
        }
        
        if !password.isPasswordValid() {
            self.delegate.loginFailed(message: "Senha inválida. A senha deve conter uma letra maiúscula, um caracter especial e um número")
            return false
        }
        
        return true
    }
}

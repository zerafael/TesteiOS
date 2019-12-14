//
//  ApiClient.swift
//  TesteiOS
//
//  Created by José Rafael Ferraz Pacheco on 12/12/19.
//  Copyright © 2019 José Rafael Ferraz Pacheco. All rights reserved.
//

import Foundation
import Alamofire
import SwiftKeychainWrapper

class ApiClient {
    
    private let baseUrl: String
    
    init() {
        baseUrl = Contants.API.baseUrl
    }
    
    func login(user: String, password: String, completion: @escaping (User) -> Void) {
        let urlRequest = baseUrl + Contants.API.loginUrl
        
        let data: [ String: Any] = ["user": user, "password": password]
        
        Alamofire.request(urlRequest, method: .post, parameters: data, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            if response.result.isSuccess {
                print("Success")
                
                let parsedResult: [String: AnyObject]!
                
                do {
                    // Separar parser da API?
                    parsedResult = try JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as? [String: AnyObject]
                    let user = (parsedResult["userAccount"] as? [String: AnyObject]).flatMap(User.init)!

                    completion(user)
                    
                } catch {
                    print("Erro ao parsear JSON")
                }
            } else {
                print("Failure")
            }
        }
        
        
    }
    
    func loadUserData() {
        
    }
}

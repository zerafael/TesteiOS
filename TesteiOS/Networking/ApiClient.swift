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
import PKHUD

class ApiClient {
    
    private let baseUrl: String
    
    init() {
        baseUrl = Contants.API.baseUrl
    }
    
    func login(user: String, password: String, completion: @escaping (User) -> Void) {
        let urlRequest = baseUrl + Contants.API.loginUrl
        
        let data: [ String: Any] = ["user": user, "password": password]
        
        Alamofire.request(urlRequest, method: .post, parameters: data, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            PKHUD.sharedHUD.hide()
            if response.result.isSuccess {
                if let user = Parser().parseUser(data: response.data!) {
                    completion(user)
                }
            } else {
                print("Failure")
            }
        }
    }
    
    func loadUserStatements(userId: Int, completion: @escaping ([Statement]) -> Void) {
        let urlRequest = baseUrl + Contants.API.statementsUrl + "/\(userId)"
        
        Alamofire.request(urlRequest, method: .get).responseJSON { (response) in
            PKHUD.sharedHUD.hide()
            if response.result.isSuccess {
                if let statements = Parser().parseStatements(data: response.data!) {
                    completion(statements)
                }
            } else {
                print("Failure")
            }
        }
    }
}

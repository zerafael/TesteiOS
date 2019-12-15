//
//  Parser.swift
//  TesteiOS
//
//  Created by José Rafael Ferraz Pacheco on 15/12/19.
//  Copyright © 2019 José Rafael Ferraz Pacheco. All rights reserved.
//

import Foundation

class Parser {
    func parseUser(data: Data) -> User? {
        let parsedResult: [String: AnyObject]!
        
        do {
            parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: AnyObject]
            let user = (parsedResult["userAccount"] as? [String: AnyObject]).flatMap(User.init)!

            return user
            
        } catch {
            print("Erro ao parsear JSON")
            return nil
        }
    }
    
    func parseStatements(data: Data) -> [Statement]? {
        let parsedResult: [String: AnyObject]!
                        
        do {
            parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: AnyObject]
            let statements = (parsedResult["statementList"] as? [[String: AnyObject]])!
                            
            var s = [Statement]()
                            
            for statement in statements {
                s.append(Statement(json: statement)!)
            }
                            
            return s
                            
        } catch {
            print("Erro ao parsear JSON")
            return nil
        }
    }
}

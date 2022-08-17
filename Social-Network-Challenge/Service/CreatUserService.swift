//
//  CreatUserService.swift
//  Social-Network-Challenge
//
//  Created by Yara Vitoria on 17/08/22.
//

import Foundation

func createUser(name: String, email: String, password: String) async -> Session?{
        let link = "http://adaspace.local/users"
        var request = URLRequest(url: URL(string: link)!)
        
        let body: [String:Any] = ["name": name,
                                  "email": email,
                                  "password": password
        ]
        
        request.httpMethod = "POST"
        let jsonBody = try? JSONSerialization.data(withJSONObject: body)
        
        request.httpBody = jsonBody
        request.allHTTPHeaderFields = [
            "Content-Type": "application/json"
        ]
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let userData = try JSONDecoder().decode(Session.self, from: data)
            return userData
        }catch {
            print(error)
        }
        return nil
        
    }

//
//  LoginService.swift
//  Social-Network-Challenge
//
//  Created by Yara Vitoria on 17/08/22.
//

import Foundation

class LoginService {
    func login(username: String, password: String) async -> Session? {
            let login: String = "\(username):\(password)"
            let logindata = login.data(using: String.Encoding.utf8)!
            let base64 = logindata.base64EncodedString()
            print(base64)
            
            var request = URLRequest (url: URL(string: "http://adaspace.local/users/login")!)
            request.httpMethod = "POST"
    //        request.allHTTPHeaderFields = ["accept": "application/json"]
            request.setValue("Basic \(base64)", forHTTPHeaderField: "Authorization")
            
            do {
                let (data, response) = try await URLSession.shared.data(for: request)
                print((response as! HTTPURLResponse).statusCode)
                print(data)
                let session = try JSONDecoder().decode(Session.self, from: data)
                print(session.token)
                return session
                
            }
            catch {
                print(error)
                
            }
            return nil
        }
}
